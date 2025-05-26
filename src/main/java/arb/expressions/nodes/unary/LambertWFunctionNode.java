package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.*;
import static java.lang.String.format;
import static java.lang.System.err;

import java.util.List;
import java.util.Objects;

import org.objectweb.asm.MethodVisitor;

import arb.*;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * Implements the {@link RealLambertWFunction} by generating calls directly to
 * {@link arblib#arb_lambertw(Real, Real, int, int)}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
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

  public LambertWFunctionNode(Expression<D, R, F> expression, Node<D, R, F> flags, Node<D, R, F> arg)
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
      err.printf("W.generate(order=%s, resultType=%s\n)\n", order, resultType);
    }

    var scalarType = scalarType(resultType);
    loadOutputVariableOntoStack(mv, scalarType);
    duplicateTopOfTheStack(mv);
    order.generate(mv, order.type() );

    if (!order.generatedType.equals(Integer.class))
    {
      order.generateCastTo(mv, Integer.class);
    }

    arg.generate(mv, resultType);
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
