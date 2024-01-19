package arb.functions;

import arb.Integer;
import arb.Real;

public class F implements
               Function<Integer, Real>
{
  public Integer              _c0 = new Integer("1");
  public Real                 r1  = new Real();
  public Integer              i1  = new Integer();
  public Real                 r2  = new Real();
  public Real                 r3  = new Real();
  public Real                 r4  = new Real();
  public Function<Real, Real> C   = new C();

  public Real evaluate(Integer in, int order, int bits, Real result)
  {
    return ((Real) this.C.evaluate(this.r1.set(((Integer) in).sub(this._c0, bits, this.i1)),
                                   order,
                                   bits,
                                   this.r2)).mul((Real) this.C.evaluate(this.r3.set((Integer) in),
                                                                        order,
                                                                        bits,
                                                                        this.r4),
                                                 bits,
                                                 (Real) result);
  }

  public void close()
  {
    this._c0.close();
    this.r1.close();
    this.i1.close();
    this.r2.close();
    this.r3.close();
    this.r4.close();
  }
}
