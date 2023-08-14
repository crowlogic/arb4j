package arb.functions.real;

import arb.Real;
import arb.arblib;

public class BesselFunctionOfTheFirstKind implements
                                          RealFunction
{

  /**
   * Copy constructor
   * 
   * @param ν
   */
  public BesselFunctionOfTheFirstKind(Real ν)
  {
    this.ν.set(ν);
  }

  public BesselFunctionOfTheFirstKind(int ν)
  {
    this.ν.set(ν);
  }

  Real ν = new Real();

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    assert order <= 1 && order >= 0 : "todo: derivatives, order=" + order;
    arblib.arb_hypgeom_bessel_j(res, ν, t, bits);
    return res;
  }

  @Override
  public void close()
  {
    ν.close();
  }

}
