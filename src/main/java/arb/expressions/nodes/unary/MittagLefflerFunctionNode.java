package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static java.lang.String.format;

import java.util.List;
import java.util.Objects;

import org.objectweb.asm.MethodVisitor;

import arb.*;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * Implements the Mittag-Leffler function E_{α,β}(z) via
 * {@link arblib#arb_hypgeom_pfq(Real, Real, Real, Real, int)} or an appropriate
 * series evaluation.
 *
 * <p>
 * The two-parameter Mittag-Leffler function is defined as: E_{α,β}(z) =
 * Σ_{k=0}^{∞} z^k / Γ(αk + β) When β=1 this reduces to the one-parameter form
 * E_{α}(z) = E_{α,1}(z).
 * </p>
 *
 * <p>
 * Supported input formats (all parsed from inside parentheses):
 * </p>
 * <ul>
 * <li>E(α, β, z) — three arguments</li>
 * <li>E(α, z) — two arguments, β defaults to 1</li>
 * <li>MittagLeffler(α, β, z) — verbose alias, three arguments</li>
 * <li>MittagLeffler(α, z) — verbose alias, two arguments</li>
 * </ul>
 *
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class MittagLefflerFunctionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                      FunctionNode<D, R, F>
{

  Node<D, R, F>  α;
  Node<D, R, F>  β;
  public boolean scalar;

  @Override
  public int hashCode()
  {
    final int prime  = 31337;
    int       result = super.hashCode();
    result = prime * result + Objects.hash(α, β);
    return result;
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (!super.equals(obj))
      return false;
    if (getClass() != obj.getClass())
      return false;
    MittagLefflerFunctionNode<?, ?, ?> other = (MittagLefflerFunctionNode<?, ?, ?>) obj;
    return Objects.equals(α, other.α) && Objects.equals(β, other.β);
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return α.dependsOn(variable) || β.dependsOn(variable) || arg.dependsOn(variable);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new MittagLefflerFunctionNode<>(newExpression,
                                           α.spliceInto(newExpression),
                                           β.spliceInto(newExpression),
                                           arg.spliceInto(newExpression));
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(α, β, arg);
  }

  @Override
  public String toString()
  {
    return format("E(%s,%s,%s)", α, β, arg);
  }

  /**
   * Direct construction when all three parameter nodes are already resolved.
   */
  public MittagLefflerFunctionNode(Expression<D, R, F> expression,
                                   Node<D, R, F> alpha,
                                   Node<D, R, F> beta,
                                   Node<D, R, F> arg)
  {
    super("E",
          null,
          expression);
    this.α      = alpha;
    this.β      = beta;
    this.arg    = arg;
    this.scalar = expression.hasScalarCodomain();
  }

  /**
   * Parser constructor. The opening '(' has already been consumed by
   * Expression.resolveFunction. Parses either: E(α, β, z) — three comma-separated
   * arguments E(α, z) — two comma-separated arguments, β defaults to 1
   */
  public MittagLefflerFunctionNode(Expression<D, R, F> expression)
  {
    super("E",
          null,
          expression);
    this.scalar = expression.hasScalarCodomain();

    Node<D, R, F> first = expression.resolve();
    expression.require(',');
    Node<D, R, F> second = expression.resolve();

    if (expression.nextCharacterIs(','))
    {
      // Three-argument form: E(α, β, z)
      this.α   = first;
      this.β   = second;
      this.arg = expression.resolve();
    }
    else
    {
      // Two-argument form: E(α, z) with β=1
      this.α   = first;
      this.β   = one();
      this.arg = second;
    }
    expression.require(')');
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (Expression.trace)
    {
      logger.debug(format("E.generate(α=%s, β=%s, z=%s, resultType=%s)\n", α, β, arg, resultType));
    }

    var scalarType = scalarType(resultType);
    loadOutputVariableOntoStack(mv, scalarType);
    duplicateTopOfTheStack(mv);

    arg.generate(mv, scalarType);
    if (!arg.generatedType.equals(scalarType))
    {
      arg.generateCastTo(mv, scalarType);
    }

    α.generate(mv, scalarType);
    if (!α.generatedType.equals(scalarType))
    {
      α.generateCastTo(mv, scalarType);
    }

    β.generate(mv, scalarType);
    if (!β.generatedType.equals(scalarType))
    {
      β.generateCastTo(mv, scalarType);
    }

    mv.visitLdcInsn(1e-30);

    loadBitsParameterOntoStack(mv);
    invokeStaticEvaluationMethod(mv, scalarType);
    generatedType = scalarType;
    return mv;
  }

  public MethodVisitor invokeStaticEvaluationMethod(MethodVisitor mv, Class<?> scalarType)
  {
    return invokeStaticMethod(mv,
                              arblib.class,
                              Complex.class.equals(scalarType) ? "acb_mittag_leffler_E"
                                                               : "arb_mittag_leffler_E",
                              Void.class,
                              scalarType,
                              scalarType,
                              scalarType,
                              scalarType,
                              double.class,
                              int.class);
  }

  @Override
  public String typeset()
  {
    return format("E_{%s,%s}(%s)", α.typeset(), β.typeset(), arg == null ? "" : arg.typeset());
  }
}
