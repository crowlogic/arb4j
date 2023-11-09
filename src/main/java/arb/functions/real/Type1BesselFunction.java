package arb.functions.real;

import arb.Real;
import arb.arblib;

/**
 * todo: add some sort of root enumeration interface that this implements
 * 
 */
public class Type1BesselFunction implements
                                 RealFunction,
                                 AutoCloseable
{

  /**
   * Copy constructor
   * 
   * @param ν
   */
  public Type1BesselFunction(Real ν)
  {
    this.ν.set(ν);
  }

  public Type1BesselFunction(int ν)
  {
    this.ν.set(ν);
  }

  final Real ν = new Real();

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
