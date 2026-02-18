package arb.expressions.nodes;

import static arb.expressions.Compiler.scalarType;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Field;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
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
 * At construction time, if the exponent variable (α) has bounds set via
 * {@link Field#upperBound()}, n is resolved at compile time by computing
 * ⌈upperBound⌉. For α ∈ (0, 1], n = 1 and only first derivatives are emitted.
 * Higher orders (n > 1) throw {@link UnsupportedOperationException}.
 * 
 * Rather than emitting custom bytecode, this node rewrites itself into an AST
 * composed of existing node types ({@link IntegralNode}, multiplication,
 * division, Γ, power, etc.) and delegates {@link #generate} entirely to the
 * rewritten tree.
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
    return operand.isZero();
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
   * (1/Γ(n-α)) * ∫₀ˣ (x-t)^(n-α-1) * f^(n)(t) dt
   */
  Node<D, R, F>                                          integralNode;

  Expression<D, R, F>                                    integralExpression;

  private Context                                        context;

  /**
   * The integer derivative order n = ⌈α⌉ resolved at compile time from bounds.
   */
  private final int                                            derivativeOrder;

  private Expression<Real, RealFunction, RealFunctional> integrandExpression;

  public CaputoFractionalDerivativeNode(Expression<D, R, F> expression)
  {
    this(expression,
         expression.require('^').require('(').resolve(),
         expression.require(')').resolve());
  }

  /**
   * Private constructor for spliceInto — does not parse.
   */
  public CaputoFractionalDerivativeNode(Expression<D, R, F> expression,
                                        Node<D, R, F> power,
                                        Node<D, R, F> operand)
  {
    super(expression);
    this.exponent        = power;
    this.operand         = operand;
    this.context         = expression.getContext();

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
      assert derivativeOrder == 1 : "only derivativeOrder=1 is implemented but derivativeOrder=" + derivativeOrder;

      // n=1: integrand is (x-t)^(-α) * f'(t)
      // since n-α-1 = 1-α-1 = -α and f^(1)(t) = ∂f(t)/∂t
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

    // x➔∫t➔g(x)(t)dt∈(0,x)/Γ(1-α)
    this.integralExpression = Function.parse(expression.domainType,
                                             expression.coDomainType,
                                             expression.functionClass,
                                             "x➔∫t➔g(x)(t)dt∈(0,x)/Γ(1-α)",
                                             context,
                                             expression);
    this.integralExpression.substitute("f", integralExpression.rootNode);

    this.integralNode = integralExpression.rootNode;
  }

  /**
   * Resolve n = ⌈α⌉ at compile time from the bounds on the exponent variable.
   * 
   * If the exponent is a variable reference whose value in the context has bounds
   * set, compute ⌈upperBound⌉. Otherwise, if the exponent is a literal constant,
   * compute ⌈literal⌉ directly.
   * 
   * @param power   the exponent node
   * @param context the expression context
   * @return the integer n = ⌈α⌉
   * @throws IllegalStateException if the derivative order cannot be determined
   */
  private static <D, R, F extends Function<? extends D, ? extends R>>
          int
          resolveDerivativeOrder(Node<D, R, F> power, Context context)
  {
    // Case 1: exponent is a variable reference — check its bounds
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
    else if (power.isConstant())
    {
      return power.ceil().evaluate(Integer.class).getSignedValue();
    }

    throw new IllegalStateException("only resolution of the Caputo derivative order n = ⌈α⌉ at compile time with "
                                    + "the exponent either bounded or constant is currently supported. TODO: support unbounded which isn't that hard considering we just "
                                    + "pass along the symbolic information to the generated class and then implement the appropriate conditional recursion so it would "
                                    + "work as intended given enough cpu time and memory"
                                    + power.getClass().getSimpleName()
                                    + " = "
                                    + power);

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
    // D^1(D^α f) = D^(α+1) f — semigroup property
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
    // ∫ D^α f dx = D^(α-1) f — fractional integration is the inverse
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
