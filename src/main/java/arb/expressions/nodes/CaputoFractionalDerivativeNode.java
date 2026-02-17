package arb.expressions.nodes;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;

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
 * {@link arb.Field#upperBound()}, n is resolved at compile time by computing
 * ⌈upperBound⌉. For α ∈ (0, 1], n = 1 and only first derivatives are emitted.
 * Higher orders (n > 1) throw {@link UnsupportedOperationException}.
 * 
 * Rather than emitting the raw integral form (which requires symbolic
 * integration of a convolution kernel that the integration engine cannot
 * evaluate), this node delegates to {@link Node#fractionalDerivative(Node)}
 * which produces the closed-form result for known operand types:
 * <ul>
 * <li>Constants: Đ^(α)(c) = 0</li>
 * <li>Variables: Đ^(α)(t) = Γ(2)/Γ(2-α) * t^(1-α)</li>
 * <li>Powers: Đ^(α)(t^k) = Γ(k+1)/Γ(k+1-α) * t^(k-α)</li>
 * <li>Sums: Đ^(α)(f+g) = Đ^(α)(f) + Đ^(α)(g)</li>
 * <li>Scalar multiples: Đ^(α)(c*f) = c * Đ^(α)(f)</li>
 * </ul>
 * The result node tree lives in the enclosing expression, so all variable slots
 * and field references are consistent — no separate sub-expression or function
 * mapping is needed.
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

  Node<D, R, F>   exponent;

  Node<D, R, F>   operand;

  /**
   * The closed-form result produced by {@link Node#fractionalDerivative(Node)}.
   * This node tree belongs to the enclosing {@link #expression} and can be
   * directly generated without creating separate sub-expressions.
   */
  Node<D, R, F>   resultNode;

  private Context context;

  /**
   * The integer derivative order n = ⌈α⌉ resolved at compile time from bounds.
   */
  private int     derivativeOrder;

  public CaputoFractionalDerivativeNode(Expression<D, R, F> expression)
  {
    this(expression,
         expression.require('^').require('(').resolve(),
         expression.require(')').resolve());
  }

  /**
   * Constructor used by parsing and by spliceInto/substitute.
   * 
   * Resolves n = ⌈α⌉ from variable bounds or literal value, then delegates to
   * {@link Node#fractionalDerivative(Node)} on the operand to obtain the
   * closed-form result node tree.
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
                                                            + "is not yet supported. "
                                                            + "Only α ∈ (0, 1] (n = 1) is currently implemented.",
                                                            derivativeOrder));
    }

    // Delegate to the operand's fractionalDerivative(α) method.
    // Each Node subclass implements the closed-form Caputo formula:
    // VariableNode: Γ(2)/Γ(2-α) * t^(1-α)
    // ExponentiationNode: Γ(k+1)/Γ(k+1-α) * t^(k-α)
    // AdditionNode: distributes via linearity
    // MultiplicationNode: factors out constants
    // LiteralConstantNode: 0
    this.resultNode = operand.fractionalDerivative(exponent);

    // Guard against circular delegation: if fractionalDerivative returned
    // another CaputoFractionalDerivativeNode, the operand type is not
    // reducible to a closed form.
    if (resultNode instanceof CaputoFractionalDerivativeNode)
    {
      throw new UnsupportedOperationException("No closed-form Caputo derivative available for: "
                                              + operand
                                              + " ("
                                              + operand.getClass().getSimpleName()
                                              + "). "
                                              + "The operand must be a polynomial, power function, constant, "
                                              + "or a linear combination thereof.");
    }

    if (logger.isDebugEnabled())
    {
      logger.debug("Caputo Đ^({})({}) = {}", exponent, operand, resultNode);
    }
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
                                                        + "Set bounds via setBounds() so that n = ⌈α⌉ can be "
                                                        + "resolved at compile time. "
                                                        + "Example: Real.named(\"α\").set(\"0.5\", 128)"
                                                        + ".setBounds(0, false, 1, true)",
                                                        varName));
        }
      }
    }

    if (power instanceof LiteralConstantNode)
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

    throw new IllegalStateException("Cannot resolve Caputo derivative order n = ⌈α⌉ at compile time. "
                                    + "The exponent must be either a bounded variable or a literal "
                                    + "constant. Got: "
                                    + power.getClass().getSimpleName()
                                    + " = "
                                    + power);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    resultNode.isResult = isResult;
    return resultNode.generate(mv, resultType);
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
    Node<D, R, F> newPower   = exponent.substitute(variable, arg);
    Node<D, R, F> newOperand = operand.substitute(variable, arg);
    return new CaputoFractionalDerivativeNode<>(expression,
                                                newPower,
                                                newOperand);
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
    if (resultNode != null)
    {
      resultNode.accept(t);
    }
    t.accept(this);
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return resultNode != null ? resultNode.dependsOn(variable)
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
    return resultNode != null ? resultNode.type() : expression.coDomainType;
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
