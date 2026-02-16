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
 * Implements the Mittag-Leffler function E_{α,β}(z) by generating calls to
 * {@link arblib#acb_mittag_leffler_E(Complex, Complex, Real, Real, double, int)}
 * 
 * Syntax: E(α,β,z)
 * 
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class MittagLefflerFunctionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                      FunctionNode<D, R, F>
{

  private static final double DEFAULT_EPSILON = 1e-30;

  @Override
  public int hashCode()
  {
    final int prime  = 31337;
    int       result = super.hashCode();
    result = prime * result + Objects.hash(alpha, beta);
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
    return Objects.equals(alpha, other.alpha) && Objects.equals(beta, other.beta);
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return alpha.dependsOn(variable) || beta.dependsOn(variable) || arg.dependsOn(variable);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new MittagLefflerFunctionNode<>(newExpression,
                                           alpha.spliceInto(newExpression),
                                           beta.spliceInto(newExpression),
                                           arg.spliceInto(newExpression));
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(alpha, beta, arg);
  }

  @Override
  public String toString()
  {
    return String.format("E(%s,%s,%s)", alpha, beta, arg);
  }

  Node<D, R, F>  alpha;
  Node<D, R, F>  beta;
  public boolean scalar;

  public MittagLefflerFunctionNode(Expression<D, R, F> expression,
                                   Node<D, R, F> alpha,
                                   Node<D, R, F> beta,
                                   Node<D, R, F> arg)
  {
    super("E",
          null,
          expression);
    this.alpha  = alpha;
    this.beta   = beta;
    this.arg    = arg;
    this.scalar = expression.hasScalarCodomain();
  }

  public MittagLefflerFunctionNode(Expression<D, R, F> expression)
  {
    this(expression,
         expression.resolve(),
         expression.require(',').resolve(),
         expression.require(',').resolve());
    expression.require(')');
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (Expression.trace)
    {
      logger.debug(String.format("E.generate(α=%s, β=%s, resultType=%s)\n",
                                 alpha,
                                 beta,
                                 resultType));
    }

    var scalarType = scalarType(resultType);
    loadOutputVariableOntoStack(mv, scalarType);
    duplicateTopOfTheStack(mv);

    // Generate z (the argument)
    arg.generate(mv, scalarType);
    if (!arg.generatedType.equals(scalarType))
    {
      arg.generateCastTo(mv, scalarType);
    }

    // Generate alpha
    alpha.generate(mv, Real.class);
    if (!alpha.generatedType.equals(Real.class))
    {
      alpha.generateCastTo(mv, Real.class);
    }

    // Generate beta
    beta.generate(mv, Real.class);
    if (!beta.generatedType.equals(Real.class))
    {
      beta.generateCastTo(mv, Real.class);
    }

    // Push epsilon constant (double)
    mv.visitLdcInsn(DEFAULT_EPSILON);

    // Push bits parameter
    loadBitsParameterOntoStack(mv);

    invokeStaticEvaluationMethod(mv, scalarType);
    generatedType = scalarType;
    return mv;
  }

  public MethodVisitor invokeStaticEvaluationMethod(MethodVisitor mv, Class<?> scalarType)
  {
    return invokeStaticMethod(mv,
                              arblib.class,
                              "acb_mittag_leffler_E",
                              Void.class,
                              scalarType,
                              scalarType,
                              Real.class,
                              Real.class,
                              double.class,
                              int.class);
  }

  @Override
  public String typeset()
  {
    return format("E_{%s,%s}(%s)",
                  alpha.typeset(),
                  beta.typeset(),
                  arg == null ? "" : arg.typeset());
  }
}
