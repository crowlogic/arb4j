package arb.functions;

import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class E implements
               RealFunction
{
  public Integer              _c0 = new Integer("2");
  public Integer              _c1 = new Integer("1");
  public Real                 r1  = new Real();
  public Real                 r2  = new Real();
  public Real                 r3  = new Real();
  public Real                 r4  = new Real();
  public Real                 r5  = new Real();
  public Function<Real, Real> C   = new C();

  public Real evaluate(Real in, int order, int bits, Real result)
  {
    return ((Real) in).mul((Real) this.C.evaluate(((Real) in).div(this._c0, bits, this.r1), order, bits, this.r2),
                           bits,
                           this.r3)
                      .mul((Real) this.C.evaluate(((Real) in).sub(this._c1, bits, this.r4), order, bits, this.r5),
                           bits,
                           (Real) result);
  }

  public void close()
  {
    this._c0.close();
    this._c1.close();
    this.r1.close();
    this.r2.close();
    this.r3.close();
    this.r4.close();
    this.r5.close();
  }
}