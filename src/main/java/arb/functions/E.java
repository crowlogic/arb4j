package arb.functions;

import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class E implements
               RealFunction
{
  public Real                 α;
  public Real                 β;
  public Real                 G;
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
    return in.mul(C.evaluate(in.div(_c0, bits, r1), order, bits, r2), bits, r3)
             .mul(C.evaluate(in.sub(_c1, bits, r4), order, bits, r5), bits, result);
  }

  public void close()
  {
    _c0.close();
    _c1.close();
    r1.close();
    r2.close();
    r3.close();
    r4.close();
    r5.close();
  }

  public void initializeContextualFunctions()
  {
    // TODO Auto-generated method stub
    
  }
}