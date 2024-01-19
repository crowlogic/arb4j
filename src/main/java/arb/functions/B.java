package arb.functions;

import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class B implements
               RealFunction
{
  public Integer              _c0 = new Integer("1");
  public Real                 α;
  public Real                 β;
  public Real                 r1  = new Real();
  public Real                 r2  = new Real();
  public Real                 r3  = new Real();
  public Real                 r4  = new Real();
  public Real                 r5  = new Real();
  public Real                 r6  = new Real();
  public Function<Real, Real> C   = new C();

  public Real evaluate(Real in, int order, int bits, Real result)
  {
    return ((Real) in).add(this.α, bits, this.r1)
                      .sub(this._c0, bits, this.r2)
                      .mul(((Real) in).add(this.β, bits, this.r3).sub(this._c0, bits, this.r4), bits, this.r5)
                      .mul((Real) this.C.evaluate((Real) in, order, bits, this.r6), bits, (Real) result);
  }

  public void close()
  {
    this._c0.close();
    this.r1.close();
    this.r2.close();
    this.r3.close();
    this.r4.close();
    this.r5.close();
    this.r6.close();
  }
}