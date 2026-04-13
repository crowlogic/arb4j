package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.invokeStaticMethod;

import org.objectweb.asm.MethodVisitor;

import arb.ComplexPolynomial;
import arb.RealPolynomial;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * Jet node for the sine integral si(t). Replaces {@link SineIntegralNode}.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SineIntegralJetNode<D, C, F extends Function<? extends D, ? extends C>> extends
                                JetNode<D, C, F>
{
  public SineIntegralJetNode(Expression<D, C, F> expression)
  {
    super("si",
          expression);
  }

  protected SineIntegralJetNode(Expression<D, C, F> expression, Node<D, C, F> arg, int coefficientIndex,
                                 JetState sharedState)
  {
    super("si",
          expression,
          arg,
          coefficientIndex,
          sharedState);
  }

  @Override
  protected void emitSeriesCall(MethodVisitor mv, Class<?> scalarType, boolean isComplex)
  {
    Class<?> polyClass = isComplex ? ComplexPolynomial.class : RealPolynomial.class;
    invokeStaticMethod(mv,
                       arblib.class,
                       isComplex ? "acb_hypgeom_si_series" : "arb_hypgeom_si_series",
                       Void.class,
                       polyClass,
                       polyClass,
                       int.class,
                       int.class);
  }

  @Override
  protected JetNode<D, C, F> newInstance(Expression<D, C, F> expression, Node<D, C, F> arg, int coefficientIndex,
                                         JetState sharedState)
  {
    return new SineIntegralJetNode<>(expression, arg, coefficientIndex, sharedState);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new SineIntegralJetNode<>(newExpression, arg.spliceInto(newExpression), coefficientIndex, sharedState);
  }

  @Override
  public String toString()
  {
    return String.format("si(%s)", arg);
  }

  @Override
  public String typeset()
  {
    return String.format("\\mathrm{Si}(%s)", arg == null ? "" : arg.typeset());
  }
}
