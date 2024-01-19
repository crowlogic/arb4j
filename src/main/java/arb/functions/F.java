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
    return C.evaluate(r1.set(in.sub(_c0, bits, i1)), order, bits, r2)
            .mul(C.evaluate(r3.set(in), order, bits, r4), bits, result);
  }

  public void close()
  {
    _c0.close();
    r1.close();
    i1.close();
    r2.close();
    r3.close();
    r4.close();
  }
}
