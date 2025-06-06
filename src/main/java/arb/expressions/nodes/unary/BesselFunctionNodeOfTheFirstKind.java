package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.duplicateTopOfTheStack;
import static arb.expressions.Compiler.invokeStaticMethod;
import static arb.expressions.Compiler.loadBitsParameterOntoStack;
import static arb.expressions.Compiler.scalarType;
import static java.lang.String.format;
import static java.lang.System.err;

import java.util.List;
import java.util.Objects;

import org.objectweb.asm.MethodVisitor;

import arb.Complex;
import arb.Real;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;
import arb.functions.real.RealBesselFunctionOfTheFirstKind;

/**
 * Implements the {@link RealBesselFunctionOfTheFirstKind} by generating calls
 * directly to {@link arblib#arb_hypgeom_bessel_j(Real, Real, Real, int)}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BesselFunctionNodeOfTheFirstKind<D, R, F extends Function<? extends D, ? extends R>> extends
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
    BesselFunctionNodeOfTheFirstKind<?, ?, ?> other = (BesselFunctionNodeOfTheFirstKind<?, ?, ?>) obj;
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
    return new BesselFunctionNodeOfTheFirstKind<>(newExpression,
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
    return String.format("J(%s,%s)", order, arg);
  }

  Node<D, R, F>  order;

  public boolean scalar;

  public BesselFunctionNodeOfTheFirstKind(Expression<D, R, F> expression, Node<D, R, F> order, Node<D, R, F> arg)
  {
    super("J",
          null,
          expression);
    this.order  = order;
    this.arg    = arg;
    this.scalar = expression.hasScalarCodomain();
  }

  public BesselFunctionNodeOfTheFirstKind(Expression<D, R, F> expression)
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
      err.printf("J.generate(ν=%s, resultType=%s\n)\n", order, resultType);
    }

    var scalarType = scalarType(resultType);
    loadOutputVariableOntoStack(mv, scalarType);
    duplicateTopOfTheStack(mv);
    order.generate(mv, scalarType);

    // Add cast if order's generated type doesn't match result type
    if (!order.generatedType.equals(resultType))
    {
      order.generateCastTo(mv, resultType);
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
                              Complex.class.equals(scalarType) ? "acb_hypgeom_bessel_j" : "arb_hypgeom_bessel_j",
                              Void.class,
                              scalarType,
                              scalarType,
                              scalarType,
                              int.class);
  }

  @Override
  public String typeset()
  {
    return format("J_{%s}(%s)", order.typeset(), arg == null ? "" : arg.typeset());
  }
}