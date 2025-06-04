package arb.functions.real;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.arblib;

/**
 * todo: add some sort of root enumeration interface that this implements
 * 
 * @see BusinessSourceLicenseVersionOnePointOne copyright terms governing the
 *      {@link TheArb4jLibrary}
 * 
 */
public class RealBesselFunctionOfTheFirstKind implements
                                          AutoCloseable,
                                          RealFunction
{


  /**
   * Copy constructor
   * 
   * @param ν
   */
  public RealBesselFunctionOfTheFirstKind(Real ν)
  {
    this.ν.set(ν);
  }

  public RealBesselFunctionOfTheFirstKind(int ν)
  {
    this.ν.set(ν);
  }

  final Real ν = new Real();

  @Override
  public Real evaluate(Real point, int order, int bits, Real res)
  {
    assert order <= 1 && order >= 0 : "todo: derivatives, order=" + order;
    arblib.arb_hypgeom_bessel_j(res, ν, point, bits);
    return res;
  }

  @Override
  public void close()
  {
    ν.close();
  }

}
