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
 * Jet node for the Riemann-Siegel theta function ϑ(t).
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RiemannSiegelThetaJetNode<D, C, F extends Function<? extends D, ? extends C>> extends
                                      JetNode<D, C, F>
{
  public RiemannSiegelThetaJetNode(Expression<D, C, F> expression)
  {
    super("ϑ",
          expression);
  }

  protected RiemannSiegelThetaJetNode(Expression<D, C, F> expression, Node<D, C, F> arg, int coefficientIndex,
                                      JetState sharedState)
  {
    super("ϑ",
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
                       isComplex ? "acb_poly_riemann_siegel_theta_series"
                                 : "arb_poly_riemann_siegel_theta_series",
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
    return new RiemannSiegelThetaJetNode<>(expression, arg, coefficientIndex, sharedState);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new RiemannSiegelThetaJetNode<>(newExpression,
                                           arg.spliceInto(newExpression),
                                           coefficientIndex,
                                           sharedState);
  }

  @Override
  public String toString()
  {
    return coefficientIndex == 0 ? "ϑ(" + arg + ")" : "ϑ^(" + coefficientIndex + ")(" + arg + ')';
  }

  @Override
  public String typeset()
  {
    return String.format("\\vartheta(%s)", arg == null ? "" : arg.typeset());
  }
}
