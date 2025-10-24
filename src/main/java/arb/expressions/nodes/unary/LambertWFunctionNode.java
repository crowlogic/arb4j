package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static java.lang.String.format;

import java.util.List;
import java.util.Objects;

import org.objectweb.asm.MethodVisitor;

import arb.*;
import arb.Integer;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * Implements the {@link RealLambertWFunction} by generating calls directly to
 * {@link arblib#arb_lambertw(Real, Real, int, int)}.
 * 
 * Computes the Lambert W function, which solves the equation
 * 
 * .
 * 
 * The Lambert W function has infinitely many complex branches , two of which
 * are real on a part of the real line. The principal branch is selected by
 * setting flags to 0, and the branch is selected by setting flags to 1. The
 * principal branch is real-valued for (taking values in ) and the branch is
 * real-valued for and takes values in
 * 
 * . Elsewhere, the Lambert W function is complex and acb_lambertw() should be
 * used.
 * 
 * The implementation first computes a floating-point approximation
 * heuristically and then computes a rigorously certified enclosure around this
 * approximation. Some asymptotic cases are handled specially. The algorithm
 * used to compute the Lambert W function is described in [Joh2017b], which
 * follows the main ideas in [CGHJK1996].
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class LambertWFunctionNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                 FunctionNode<D, R, F>
{

  @Override
  public int hashCode()
  {
    final int prime  = 31337;
    int       result = super.hashCode();
    result = prime * result + Objects.hash(order);
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
    LambertWFunctionNode<?, ?, ?> other = (LambertWFunctionNode<?, ?, ?>) obj;
    return Objects.equals(order, other.order);
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return order.dependsOn(variable) || arg.dependsOn(variable);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new LambertWFunctionNode<>(newExpression,
                                      order.spliceInto(newExpression),
                                      arg.spliceInto(newExpression));
  }

  @Override
  public List<Node<D, R, F>> getBranches()
  {
    return List.of(order, arg);

  }

  @Override
  public String toString()
  {
    return String.format("W(%s,%s)", order, arg);
  }

  Node<D, R, F>  order;

  public boolean scalar;

  public LambertWFunctionNode(Expression<D, R, F> expression,
                              Node<D, R, F> flags,
                              Node<D, R, F> arg)
  {
    super("W",
          null,
          expression);
    this.order  = flags;
    this.arg    = arg;
    this.scalar = expression.hasScalarCodomain();
  }

  public LambertWFunctionNode(Expression<D, R, F> expression)
  {
    this(expression,
         expression.resolve(),
         expression.require(',').resolve());
    expression.require(')');
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (Expression.trace)
    {
      logger.debug(String.format("W.generate(order=%s, resultType=%s\n)\n", order, resultType));
    }

    var scalarType = scalarType(resultType);
    loadOutputVariableOntoStack(mv, scalarType);
    duplicateTopOfTheStack(mv);
    arg.generate(mv, scalarType);

    order.generate(mv, Integer.class);

    Compiler.generateCallToGetUnsignedIntValue(mv);

    loadBitsParameterOntoStack(mv);
    invokeStaticEvaluationMethod(mv, scalarType);
    generatedType = scalarType;
    return mv;
  }

  public MethodVisitor invokeStaticEvaluationMethod(MethodVisitor mv, Class<?> scalarType)
  {
    return invokeStaticMethod(mv,
                              arblib.class,
                              Complex.class.equals(scalarType) ? "acb_lambertw" : "arb_lambertw",
                              Void.class,
                              scalarType,
                              scalarType,
                              int.class,
                              int.class);
  }

  @Override
  public String typeset()
  {
    return format("\\W_%s (%s)", order.typeset(), arg == null ? "" : arg.typeset());
  }

}
