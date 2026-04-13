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
 * Jet node for the Gamma function Γ(t). Replaces
 * {@link GammaFunctionSeriesNode}.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class GammaJetNode<D, C, F extends Function<? extends D, ? extends C>> extends
                         JetNode<D, C, F>
{
  public GammaJetNode(Expression<D, C, F> expression)
  {
    super("Γ",
          expression);
  }

  protected GammaJetNode(Expression<D, C, F> expression, Node<D, C, F> arg, int coefficientIndex,
                          JetState sharedState)
  {
    super("Γ",
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
                       isComplex ? "acb_poly_gamma_series" : "arb_poly_gamma_series",
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
    return new GammaJetNode<>(expression, arg, coefficientIndex, sharedState);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new GammaJetNode<>(newExpression, arg.spliceInto(newExpression), coefficientIndex, sharedState);
  }

  @Override
  public String toString()
  {
    return String.format("Γ(%s)", arg);
  }

  @Override
  public String typeset()
  {
    return String.format("\\Gamma(%s)", arg == null ? "" : arg.typeset());
  }
}
