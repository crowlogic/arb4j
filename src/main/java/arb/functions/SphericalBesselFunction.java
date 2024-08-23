package arb.functions;

import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.real.RealFunction;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SphericalBesselFunction implements
                                     RealFunction
{

  static
  {
    Context prototypeContext = new Context(Integer.named("n"));
    prototype = RealFunction.compile("(R(n,½;x)*sin(x) - R(n-1,3⁄2;x)*cos(x))/x", prototypeContext);
  }

  public static Expression<Real, Real, RealFunction> prototype;

  @SuppressWarnings("resource")

  public Integer                                     n       = Integer.named("n");

  public final Context                               context = new Context(n);

  private RealFunction                               element;

  public SphericalBesselFunction(int index)
  {
    element = prototype.instantiate();
    n.set(index);
    context.injectReferences(element);
  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    return element.evaluate(t, order, bits, res);
  }

}
