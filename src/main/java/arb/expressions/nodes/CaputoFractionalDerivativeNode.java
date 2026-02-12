package arb.expressions.nodes;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.VariableReference;
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
 * Rather than emitting custom bytecode, this node rewrites itself into an AST
 * composed of existing node types ({@link IntegralNode}, multiplication,
 * division, Γ, power, etc.) and delegates {@link #generate} entirely to the
 * rewritten tree. The rewriting happens in {@link #rewrite()}.
 *
 * Parsing expects: Đ^(alpha)operand — the 'Đ' has already been consumed by
 * {@link Expression#evaluateOperand()}, which constructs this node.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class CaputoFractionalDerivativeNode<D, R, F extends Function<? extends D, ? extends R>>
                                           extends
                                           Node<D, R, F>
{
  public static final Logger logger = LoggerFactory.getLogger(CaputoFractionalDerivativeNode.class);

  @Override
  public Logger getLogger()
  {
    return logger;
  }

  /** The fractional order α */
  Node<D, R, F> power;

  /** The operand being fractionally differentiated */
  Node<D, R, F> operand;

  /**
   * The rewritten AST: (1/Γ(n-α)) * ∫₀ˣ (x-t)^(n-α-1) * f^(n)(t) dt All
   * generation is delegated to this node.
   */
  Node<D, R, F> rewrittenNode;

  public CaputoFractionalDerivativeNode(Expression<D, R, F> expression)
  {
    super(expression);
    power   = expression.require('^').require('(').resolve();
    operand = expression.require(')').resolve();
    rewrite();
  }

  /**
   * Private constructor for spliceInto — does not parse.
   */
  private CaputoFractionalDerivativeNode(Expression<D, R, F> expression,
                                         Node<D, R, F> power,
                                         Node<D, R, F> operand)
  {
    super(expression);
    this.power   = power;
    this.operand = operand;
    rewrite();
  }

  /**
   * Rewrites Đ^(α)[operand] into the Caputo integral definition using existing
   * AST node types.
   * 
   * For integer α (detected when power is a {@link LiteralConstantNode} whose
   * value is an integer), n = α and the Caputo derivative reduces to the ordinary
   * n-th derivative since Γ(n-α) = Γ(0) → the prefactor 1/Γ(0) kills everything
   * and the limit gives f^(n). So we just differentiate n times.
   * 
   * For non-integer α, we build:
   * 
   * <pre>
   *   (1 / Γ(n - α)) * ∫₀ˣ (x - t)^(n - α - 1) * f^(n)(t) dt
   * </pre>
   * 
   * where:
   * <ul>
   * <li>n = ⌈α⌉ (computed as a literal)</li>
   * <li>f^(n)(t) = the n-th ordinary derivative of the operand</li>
   * <li>t is a fresh integration variable</li>
   * <li>x is the independent variable of the containing expression</li>
   * <li>The integral is a definite {@link IntegralNode} from 0 to x</li>
   * </ul>
   */
  private void rewrite()
  {
    VariableNode<D, R, F> independentVar = expression.independentVariable;

    if (power instanceof LiteralConstantNode<D, R, F> lit)
    {
      double alphaVal = Double.parseDouble(lit.toString());
      int    n        = (int) Math.ceil(alphaVal);

      if (alphaVal == n)
      {
        // Integer order: just differentiate n times
        Node<D, R, F> result = operand;
        for (int i = 0; i < n; i++)
        {
          result = result.differentiate(independentVar);
        }
        rewrittenNode = result.simplify();
        return;
      }

      // Non-integer order: build the convolution integral
      Node<D, R, F> nNode         = expression.newLiteralConstant(String.valueOf(n));
      Node<D, R, F> nMinusAlpha   = nNode.sub(power);

      // Compute f^(n)(operand) — the n-th derivative of the operand
      Node<D, R, F> nthDerivative = operand;
      for (int i = 0; i < n; i++)
      {
        nthDerivative = nthDerivative.differentiate(independentVar);
      }
      nthDerivative = nthDerivative.simplify();

      // Create integration variable t
      String                     tName = freshVariableName("t");
      VariableReference<D, R, F> tRef  = new VariableReference<>(tName,
                                                                 null,
                                                                 expression.coDomainType);
      VariableNode<D, R, F>      tVar  = new VariableNode<>(expression,
                                                            tRef,
                                                            expression.position,
                                                            false);
      tVar.isIndeterminate = true;
      tVar.reference.type  = expression.domainType;

      // Substitute t for the independent variable in f^(n)
      Node<D, R, F>         fOfT      = nthDerivative.substitute(independentVar.getName(), tVar);

      // Build the kernel: (x - t)^(n - α - 1)
      Node<D, R, F>         kernel    =
                                   independentVar.sub(tVar)
                                                 .pow(nMinusAlpha.sub(expression.newLiteralConstant("1")));

      // Build the integrand: (x - t)^(n-α-1) * f^(n)(t)
      Node<D, R, F>         integrand = kernel.mul(fOfT);

      // Build the definite integral: ∫₀ˣ integrand dt
      IntegralNode<D, R, F> integral  = new IntegralNode<>(expression,
                                                           integrand,
                                                           tVar);
      integral.integrationVariableName = tName;
      integral.lowerLimitNode          = expression.newLiteralConstant("0");
      integral.upperLimitNode          = independentVar;

      // Build the prefactor: 1/Γ(n - α)
      Node<D, R, F> gammaNMinusAlpha = nMinusAlpha.Γ();
      Node<D, R, F> prefactor        = expression.newLiteralConstant("1").div(gammaNMinusAlpha);

      // Final rewritten node: (1/Γ(n-α)) * ∫₀ˣ (x-t)^(n-α-1) f^(n)(t) dt
      rewrittenNode = prefactor.mul(integral).simplify();
    }
    else
    {
      // α is not a literal constant — it's symbolic.
      // We still build the same structure but cannot determine n at parse time.
      // For now, require α to be a literal.
      throw new arb.exceptions.CompilerException("Caputo fractional derivative order α must be a literal constant, got: "
                                                 + power
                                                 + " of type "
                                                 + power.getClass().getSimpleName());
    }
  }

  /**
   * Generate a variable name that doesn't collide with anything in the current
   * expression.
   */
  private String freshVariableName(String base)
  {
    String candidate = base;
    int    suffix    = 0;
    while (expression.isVariableReferenced(candidate)
                  || (expression.independentVariable != null
                                && expression.independentVariable.getName().equals(candidate))
                  || (expression.context != null && expression.context.variables != null
                                && expression.context.variables.containsKey(candidate)))
    {
      candidate = base + (++suffix);
    }
    return candidate;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    rewrittenNode.isResult = isResult;
    return rewrittenNode.generate(mv, resultType);
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
    Node<D, R, F> newPower   = power.substitute(variable, arg);
    Node<D, R, F> newOperand = operand.substitute(variable, arg);
    if (newPower == power && newOperand == operand)
    {
      return this;
    }
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
    power.accept(t);
    operand.accept(t);
    if (rewrittenNode != null)
    {
      rewrittenNode.accept(t);
    }
    t.accept(this);
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return rewrittenNode != null ? rewrittenNode.dependsOn(variable)
                                 : power.dependsOn(variable) || operand.dependsOn(variable);
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    // D^1(D^α f) = D^(α+1) f — semigroup property
    return new CaputoFractionalDerivativeNode<>(expression,
                                                power.add(expression.newLiteralConstant("1")),
                                                operand);
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(power, operand);
  }

  @Override
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    // ∫ D^α f dx = D^(α-1) f — fractional integration is the inverse
    return new CaputoFractionalDerivativeNode<>(expression,
                                                power.sub(expression.newLiteralConstant("1")),
                                                operand);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new CaputoFractionalDerivativeNode<>(newExpression,
                                                power.spliceInto(newExpression),
                                                operand.spliceInto(newExpression));
  }

  @Override
  public Class<?> type()
  {
    return rewrittenNode != null ? rewrittenNode.type() : expression.coDomainType;
  }

  @Override
  public String typeset()
  {
    return String.format("{}^{C}D^{%s}\\left[%s\\right]", power.typeset(), operand.typeset());
  }

  @Override
  public String toString()
  {
    return String.format("Đ^(%s)%s", power, operand);
  }
}
