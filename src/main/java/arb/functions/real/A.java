package arb.functions.real;

import arb.Integer;
import arb.Real;

/**
 * n->C(n-1)*C(n)
 */
public class A
{
  public Integer      c0 = new Integer("1");
  public Real         l0 = new Real();
  public Integer      l1 = new Integer();
  public Real         l2 = new Real();
  public Real         l3 = new Real();
  public Real         l4 = new Real();
  public Real         α;
  public Real         β;
  public RealFunction C  = new RealFunction()
                         {

                           public Integer c0 = new Integer("2");

                           public Real    l0 = new Real();
                           public Real    l1 = new Real();

                           public Real evaluate(Real in, int order, int bits, Real result)
                           {
                             return c0.mul(in, bits, l0).add(α, bits, l1).add(β, bits, result);
                           }

                           public void close()
                           {
                             c0.close();
                             l0.close();
                             l1.close();
                           }
                         };

  public Real evaluate(Integer in, int order, int bits, Real result)
  {
    in.sub(c0, bits, l1);
    C.evaluate(l0.set(l1), order, bits, l2);
    C.evaluate(l3.set(in), order, bits, l4);
    return l2.mul(l4, bits, result);
  }

  public void close()
  {
    c0.close();
    l0.close();
    l1.close();
    l2.close();
    l3.close();
    l4.close();
  }
}
