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
    return in.add(α, bits, r1)
             .sub(_c0, bits, r2)
             .mul(in.add(β, bits, r3).sub(_c0, bits, r4), bits, r5)
             .mul(C.evaluate(in, order, bits, r6), bits, result);
  }

  public void close()
  {
    _c0.close();
    r1.close();
    r2.close();
    r3.close();
    r4.close();
    r5.close();
    r6.close();
  }
}