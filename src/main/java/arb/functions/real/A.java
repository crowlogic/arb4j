package arb.functions.real;

import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class A
{
  public Integer                 c0 = new Integer("1");
  public Real                    l0 = new Real();
  public Real                    l1 = new Real();
  public Integer                 l2 = new Integer();
  public Function<Integer, Real> C  = null;

  public Real evaluate(Integer in, int order, int bits, Real result)
  {
    return C.evaluate(in.sub(1, bits, l2), order, bits, l0).mul(C.evaluate(in, order, bits, l1), bits, result);
  }

  public void close()
  {
    c0.close();
    l0.close();
    l1.close();
    l2.close();
  }
}
