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
 * Jet node for the digamma function ψ(t) = (lnΓ)'(t). Its coefficient index k
 * yields the k-th derivative ψ⁽ᵏ⁾(t); in particular index 1 is the trigamma
 * ψ₁(t), so the derivative of digamma is exact via {@code arb_poly_digamma_series}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class DigammaJetNode<D, C, F extends Function<? extends D, ? extends C>> extends
                           JetNode<D, C, F>
{
  public DigammaJetNode(Expression<D, C, F> expression)
  {
    super("digamma",
          expression);
  }

  protected DigammaJetNode(Expression<D, C, F> expression, Node<D, C, F> arg, int coefficientIndex,
                            JetState sharedState)
  {
    super("digamma",
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
                       isComplex ? "acb_poly_digamma_series" : "arb_poly_digamma_series",
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
    return new DigammaJetNode<>(expression, arg, coefficientIndex, sharedState);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return new DigammaJetNode<>(newExpression, arg.spliceInto(newExpression), coefficientIndex, sharedState);
  }

  @Override
  public String toString()
  {
    return String.format("digamma(%s)", arg);
  }

  @Override
  public String typeset()
  {
    return String.format("\\psi\\left(%s\\right)", arg == null ? "" : arg.typeset());
  }
}
