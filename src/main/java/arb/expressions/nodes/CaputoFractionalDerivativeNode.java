package arb.expressions.nodes;

import static arb.expressions.Compiler.scalarType;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Fraction;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.exceptions.UnderConstructionException;
import arb.expressions.*;
import arb.expressions.nodes.binary.ExponentiationNode;
import arb.functions.Function;
import arb.functions.RealFunctional;
import arb.functions.real.RealFunction;

/**
 * Caputo fractional derivative integral form: ꟲD^(α)f(x)=ꟲDₓᵅf(x)
 * 
 * Implements:
 * 
 * <pre>
 * D^α f(x) = (1/Γ(n-α)) * ∫₀ˣ (x-t)^(n-α-1) * f^(n)(t) dt
 * </pre>
 * 
 * where n = ⌈α⌉.
 * 
 * This node is ONLY created when no closed-form fractional derivative exists.
 * Closed-form cases (monomials, polynomials, linear combinations) are handled
 * by {@link Node#fractionalDerivative(VariableNode, Node)} overrides in the
 * respective subclasses ({@link VariableNode},
 * {@link arb.expressions.nodes.binary.ExponentiationNode},
 * {@link arb.expressions.nodes.binary.AdditionNode}, etc.).
 * 
 * The static {@link #parse(Expression)} method is the entry point from the
 * parser for both Đ and ꟲD syntax. It dispatches to
 * {@code operand.fractionalDerivative(exponent)} which returns either a
 * closed-form node or falls back to creating this integral-form node via
 * {@link Node#fractionalDerivative(VariableNode, Node)}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class CaputoFractionalDerivativeNode<D, R, F extends Function<? extends D, ? extends R>>
                                           extends
                                           Node<D, R, F>
{
  public static final Logger                             logger =
                                                                LoggerFactory.getLogger(CaputoFractionalDerivativeNode.class);

  Node<D, R, F>                                          order;
  Node<D, R, F>                                          operand;
  Node<D, R, F>                                          integralNode;
  Expression<D, R, F>                                    integralExpression;
  private Context                                        context;
  private int                                            derivativeOrder;
  private Expression<Real, RealFunction, RealFunctional> integrandExpression;

  private VariableNode<D, R, F>                          variable;

  private FunctionMapping<D, R, ? extends F>             operandExpression;

  /**
   * Constructs the integral form. Only called from
   * {@link Node#fractionalDerivative(VariableNode, Node)} when no closed form
   * exists.
   * 
   * @param variable TODO
   */
  public CaputoFractionalDerivativeNode(Expression<D, R, F> expression,
                                        Node<D, R, F> operand,
                                        VariableNode<D, R, F> variable,
                                        Node<D, R, F> order)
  {
    super(expression);
    this.variable = variable;
    if (order == null)
    {
      order = variable.one();
    }
    this.order           = order;
    this.operand         = operand;
    this.context         = expression.getContext();

    this.derivativeOrder = resolveDerivativeOrder(order, context);

    if (derivativeOrder > 1)
    {
      throw new UnsupportedOperationException(String.format("Caputo fractional derivative with n = ⌈α⌉ = %d > 1 "
                                                            + "is not yet supported. Only α ∈ (0, 1] (n = 1) is currently implemented.",
                                                            derivativeOrder));
    }

    context.registerVariable(Integer.named("n").set(derivativeOrder));
    operandExpression = context.registerFunctionMapping("f",
                                                        expression.domainType,
                                                        expression.coDomainType,
                                                        expression.functionClass);

    Class<?> scalarType = scalarType(expression.domainType);
    if (scalarType == Real.class)
    {
      assert derivativeOrder == 1 : "only derivativeOrder=1 is implemented but got n="
                                    + derivativeOrder;
      this.integrandExpression = Function.parse(Real.class,
                                                RealFunction.class,
                                                RealFunctional.class,
                                                "g:x➔t➔(x-t)^(-α)*∂f(t)/∂t",
                                                context,
                                                expression,
                                                false);
    }
    else
    {
      throw new UnsupportedOperationException("todo: support  " + scalarType);
    }

    System.err.println("integrandExpression before "
                       + integrandExpression
                       + " substituting "
                       + operand
                       + " for f");
    integrandExpression.substitute("f", operand);
    System.err.println("integrandExpression after " + integrandExpression);

//    this.integralExpression = Function.parse(expression.domainType,
//                                             expression.coDomainType,
//                                             expression.functionClass,
//                                             "gint:x➔∫t➔g(x)(t)dt∈(0,x)/Γ(1-α)",
//                                             context,
//                                             expression);
//    this.integralExpression.substitute("f", integralExpression.rootNode);
//    this.integralNode = integralExpression.rootNode;
  }

  public CaputoFractionalDerivativeNode(Expression<D, R, F> expression)
  {
    super(expression);
    operand = expression.resolve();
    var variableNode = expression.require(",").resolve();
    if (variableNode instanceof VariableNode)
    {
      variable = variableNode.asVariable();
      order    = variableNode.one();
    }
    else if (variableNode instanceof ExponentiationNode<D, R, F> expNode)
    {
      if (!expNode.left.isVariable())
      {
        throwFunctionSyntaxError();
      }
      else
      {
        variable = expNode.left.asVariable();
        order    = expNode.right;
      }
    }
    else
    {
      throwFunctionSyntaxError();
    }

    expression.require(")");
  }

  protected void throwFunctionSyntaxError()
  {
    throw new CompilerException("the function syntax for Caputo fractional derivatives is fracdiff(f(t),t^a) where a is the order of differentiation");
  }

  @Override
  public boolean isZero()
  {
    return integralNode != null ? integralNode.isZero() : operand.isZero();
  }

  @Override
  public Logger getLogger()
  {
    return logger;
  }

  /**
   * Resolve n = ⌈α⌉ at compile time from bounds on the exponent variable, a
   * literal constant, or a constant expression.
   */
  private <D, R, F extends Function<? extends D, ? extends R>>
          int
          resolveDerivativeOrder(Node<D, R, F> power, Context context)
  {
    if (power instanceof VariableNode variableOrderNode)
    {
      String varName = variableOrderNode.getName();
      Object varObj  = context.variables.get(varName);
      if (varObj == null)
      {
        if (expression.anyAscendentIndependentVariableIsNamed(varName))
        {
          throw new UnderConstructionException("TODO: handle bounds on input (or ascendent/upstream input) variable "
                                               + varName + " of " + expression);
        }
      }
      assert varObj != null : varName
                              + " not found in "
                              + context
                              + " associated with "
                              + expression
                              + " thus unable to retrieve the bounds";
      if (varObj instanceof Real αReal && αReal.isBounded())
      {
        Real ub = αReal.upperBound();
        assert ub != null : "α is bounded but has null upperBound";
        try ( Integer ceil = new Integer())
        {
          ub.ceil(128, ceil);
          int n = ceil.getSignedValue();
          if (logger.isDebugEnabled())
          {
            logger.debug("resolved n = ⌈upperBound(α)⌉ = ⌈{}⌉ = {} from bounds on variable '{}'",
                         ub,
                         n,
                         varName);
          }
          return n;
        }
      }
      else
      {
        throw new IllegalStateException(String.format("Caputo derivative exponent variable '%s' has no bounds set. "
                                                      + "Set bounds via setBounds() so that n = ⌈α⌉ can be resolved at compile time. "
                                                      + "Example: Real.named(\"α\").set(\"0.5\", 128).setBounds(0, false, 1, true)",
                                                      varName));
      }
    }
    else if (power instanceof LiteralConstantNode)
    {
      String literalStr = power.toString();
      try ( Real literalVal = new Real(literalStr,
                                       128);
            Integer ceil = new Integer())
      {
        literalVal.ceil(128, ceil);
        int n = ceil.getSignedValue();
        if (logger.isDebugEnabled())
        {
          logger.debug("resolved n = ⌈{}⌉ = {} from literal exponent", literalStr, n);
        }
        return n;
      }
    }
    else if (power.isConstant())
    {

      Class<?> powerType = power.type();
      try ( Real realVal = new Real(); Integer ceil = new Integer())
      {
        if (powerType.equals(Fraction.class))
        {
          realVal.set(power.evaluate(Fraction.class));
        }
        else if (powerType.equals(Real.class))
        {
          realVal.set(power.evaluate(Real.class));
        }
        else if (powerType.equals(Integer.class))
        {
          realVal.set(power.evaluate(Integer.class));
        }
        else
        {
          throw new CompilerException("constant exponent of type "
                                      + powerType.getName()
                                      + " is not supported for Caputo derivative order resolution; got: "
                                      + power);
        }
        realVal.ceil(128, ceil);
        int n = ceil.getSignedValue();
        if (logger.isDebugEnabled())
        {
          logger.debug("resolved n = ⌈{}⌉ = {} from constant expression {} of type {}",
                       power,
                       n,
                       power.getClass().getSimpleName(),
                       powerType.getSimpleName());
        }
        return n;
      }
    }
    else
    {
      throw new IllegalStateException("Cannot resolve Caputo derivative order n = ⌈α⌉ at compile time. "
                                      + "The exponent must be either a bounded variable or a constant expression. Got: "
                                      + power.getClass().getSimpleName()
                                      + " = "
                                      + power);
    }
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    integralNode.isResult = isResult;
    return integralNode.generate(mv, resultType);
  }

  @Override
  public boolean isLeaf()
  {
    return false;
  }

  @Override
  public boolean isScalar()
  {
    return operand.isScalar();
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, R, F>
         substitute(String variable, Node<E, S, G> arg)
  {
    order   = order.substitute(variable, arg);
    operand = operand.substitute(variable, arg);
    return this;
  }

  @Override
  public char symbol()
  {
    return 'Đ';
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    order.accept(t);
    operand.accept(t);
    if (integralNode != null)
    {
      integralNode.accept(t);
    }
    t.accept(this);
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return integralNode != null ? integralNode.dependsOn(variable)
                                : order.dependsOn(variable) || operand.dependsOn(variable);
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    return operand.fractionalDerivative(null, order.add(expression.newLiteralConstant("1")));
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(order, operand);
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    return operand.fractionalDerivative(null, order.sub(expression.newLiteralConstant("1")));
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    CaputoFractionalDerivativeNode<E, S, G> splicedNode =
                                                        new CaputoFractionalDerivativeNode<E, S, G>(newExpression,
                                                                                                    operand.spliceInto(newExpression),
                                                                                                    variable.spliceInto(newExpression),
                                                                                                    order.spliceInto(newExpression));
    splicedNode.derivativeOrder = derivativeOrder;
    splicedNode.context         = newExpression.context;
    splicedNode.isResult        = isResult;
    return splicedNode;
  }

  @Override
  public Class<?> type()
  {
    return integralNode != null ? integralNode.type() : expression.coDomainType;
  }

  @Override
  public String typeset()
  {
    return String.format("{}^{C}D^{%s}\\\\left[%s\\\\right]", order.typeset(), operand.typeset());
  }

  @Override
  public String toString()
  {
    return String.format("Đ^(%s)%s", order, operand);
  }
}
