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
                                     RealFunction,
                                     AutoCloseable
{

  private static Context                              prototypeContext =
                                                                       new Context(Integer.named("n"));

  private static Expression<Real, Real, RealFunction> prototype        =
                                                                RealFunction.compile("(R(n,½;x)*sin(x) - R(n-1,3⁄2;x)*cos(x))/x",
                                                                                     prototypeContext);

  public final Integer                                      n                = Integer.named("n");

  public final Context                                context          = new Context(n);

  private RealFunction                                element;

  public SphericalBesselFunction()
  {
  }

  boolean isInitialized = false;

  public void initialize()
  {

    isInitialized = true;

    element       = prototype.instantiate();
    context.injectReferences(element);

  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    if (!isInitialized)
    {
      initialize();
    }
    return element.evaluate(t, order, bits, res);
  }

  @Override
  public void close()
  {
    n.close();
  }

}
