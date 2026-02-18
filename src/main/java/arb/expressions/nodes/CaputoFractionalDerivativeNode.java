package arb.expressions.nodes;

import static arb.expressions.Compiler.scalarType;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Field;
import arb.Fraction;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.RealFunctional;
import arb.functions.real.RealFunction;

/**
 * Caputo fractional derivative: Đ^(α)f(x)
 *
 * Implements:
 *
 * <pre>
 * D^α f(x) = (1/Γ(n-α)) * ∫₀ˣ (x-t)^(n-α-1) * f^(n)(t) dt
 * </pre>
 *
 * where n = ⌈α⌉.
 *
 * Construction delegates immediately to {@link Node#fractionalDerivative(Node)}
 * on the operand — each Node subclass owns its own closed-form rule:
 * <ul>
 * <li>{@link LiteralConstantNode} → 0</li>
 * <li>{@link VariableNode} → Γ(2)/Γ(2-α) · t^(1-α)</li>
 * <li>{@link arb.expressions.nodes.binary.ExponentiationNode} → Γ(k+1)/Γ(k+1-α) · t^(k-α)</li>
 * <li>{@link arb.expressions.nodes.binary.MultiplicationNode} → linearity over constant factor</li>
 * <li>{@link arb.expressions.nodes.binary.AdditionNode} → linearity</li>
 * <li>{@link arb.expressions.nodes.binary.SubtractionNode} → linearity</li>
 * <li>{@link arb.expressions.nodes.binary.DivisionNode} → linearity when divisor is constant</li>
 * <li>All other nodes → integral form via {@link Node#fractionalDerivative(Node)}</li>
 * </ul>
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class CaputoFractionalDerivativeNode<D, R, F extends Function<? extends D, ? extends R>>
                                           extends
                                           Node<D, R, F>
{
  @Override
  public boolean isZero()
  {
    return integralNode != null ? integralNode.isZero() : operand.isZero();
  }

  public static final Logger logger = LoggerFactory.getLogger(CaputoFractionalDerivativeNode.class);

  @Override
  public Logger getLogger()
  {
    return logger;
  }

  Node<D, R, F>                                          exponent;

  Node<D, R, F>                                          operand;

  /**
   * The rewritten form — either a closed-form AST (from
   * {@link Node#fractionalDerivative(Node)}) or the integral representation.
   */
  Node<D, R, F>                                          integralNode;

  Expression<D, R, F>                                    integralExpression;

  private Context                                        context;

  /**
   * The integer derivative order n = ⌈α⌉ resolved at compile time from bounds.
   * Only set when the integral path is taken.
   */
  private int                                            derivativeOrder;

  private Expression<Real, RealFunction, RealFunctional> integrandExpression;

  public CaputoFractionalDerivativeNode(Expression<D, R, F> expression)
  {
    this(expression,
         expression.require('^').require('(').resolve(),
         expression.require(')').resolveOperand());
  }

  public CaputoFractionalDerivativeNode(Expression<D, R, F> expression,
                                        Node<D, R, F> power,
                                        Node<D, R, F> operand)
  {
    super(expression);
    this.exponent = power;
    this.operand  = operand;
    this.context  = expression.getContext();

    // Polymorphic dispatch: each Node subclass owns its fractionalDerivative rule.
    // If the operand returns something other than a new CaputoFractionalDerivativeNode
    // it produced a closed form and we store it directly.
    Node<D, R, F> result = operand.fractionalDerivative(power);

    if (!(result instanceof CaputoFractionalDerivativeNode))
    {
      // Closed form was produced — no integral needed.
      this.integralNode = result;
      return;
    }

    // Fallback: integral form.
    this.derivativeOrder = resolveDerivativeOrder(power, context);

    if (derivativeOrder > 1)
    {
      throw new UnsupportedOperationException(String.format("Caputo fractional derivative with n = ⌈α⌉ = %d > 1 "
                                                            + "is not yet supported. Only α ∈ (0, 1] (n = 1) is currently implemented.",
                                                            derivativeOrder));
    }

    context.registerVariable(Integer.named("n").set(derivativeOrder));
    context.registerFunctionMapping("f",
                                    expression.domainType,
                                    expression.coDomainType,
                                    expression.functionClass);
    Class<?> scalarType = scalarType(expression.domainType);
    if (scalarType == Real.class)
    {
      assert derivativeOrder == 1 : "only n=1 is implemented";

      this.integrandExpression = Function.parse(Real.class,
                                                RealFunction.class,
                                                RealFunctional.class,
                                                "g:x\u27a4t\u27a4(x-t)^(-\u03b1)*\u2202f(t)/\u2202t",
                                                context,
                                                expression,
                                                false);
    }
    else
    {
      throw new UnsupportedOperationException("todo: support  " + scalarType);
    }

    this.integralExpression = Function.parse(expression.domainType,
                                             expression.coDomainType,
                                             expression.functionClass,
                                             "x\u27a4\u222ft\u27a4g(x)(t)dt\u2208(0,x)/\u0393(1-\u03b1)",
                                             context,
                                             expression);
    this.integralExpression.substitute("f", integralExpression.rootNode);

    this.integralNode = integralExpression.rootNode;
  }

  /**
   * Resolve n = ⌈α⌉ at compile time from the bounds on the exponent variable.
   */
  private static <D, R, F extends Function<? extends D, ? extends R>>
          int
          resolveDerivativeOrder(Node<D, R, F> power, Context context)
  {
    if (power instanceof VariableNode)
    {
      String varName = power.toString();
      Object varObj  = context.variables.get(varName);
      if (varObj instanceof Real αReal)
      {
        if (αReal.isBounded())
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
          Fraction frac = power.evaluate(Fraction.class);
          realVal.set(frac);
        }
        else if (powerType.equals(Real.class))
        {
          Real r = power.evaluate(Real.class);
          realVal.set(r);
        }
        else if (powerType.equals(Integer.class))
        {
          Integer intVal = power.evaluate(Integer.class);
          realVal.set(intVal);
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
    return java.lang.Integer.MIN_VALUE;
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
    exponent = exponent.substitute(variable, arg);
    operand  = operand.substitute(variable, arg);
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
    exponent.accept(t);
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
                                : exponent.dependsOn(variable) || operand.dependsOn(variable);
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    return new CaputoFractionalDerivativeNode<>(expression,
                                                exponent.add(expression.newLiteralConstant("1")),
                                                operand);
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(exponent, operand);
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    return new CaputoFractionalDerivativeNode<>(expression,
                                                exponent.sub(expression.newLiteralConstant("1")),
                                                operand);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new CaputoFractionalDerivativeNode<>(newExpression,
                                                exponent.spliceInto(newExpression),
                                                operand.spliceInto(newExpression));
  }

  @Override
  public Class<?> type()
  {
    return integralNode != null ? integralNode.type() : expression.coDomainType;
  }

  @Override
  public String typeset()
  {
    return String.format("{}^{C}D^{%s}\\left[%s\\right]", exponent.typeset(), operand.typeset());
  }

  @Override
  public String toString()
  {
    return String.format("Đ^(%s)%s", exponent, operand);
  }
}
