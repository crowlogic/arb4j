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
                             return this.c0.mul((Real) in, bits, this.l0)
                                           .add(α, bits, this.l1)
                                           .add(β, bits, (Real) result);
                           }

                           public void close()
                           {
                             this.c0.close();
                             this.l0.close();
                             this.l1.close();
                           }
                         };

  public Real evaluate(Integer in, int order, int bits, Real result)
  {
    return ((Real) this.C.evaluate(this.l0.set(((Integer) in).sub(this.c0, bits, this.l1)),
                                   order,
                                   bits,
                                   this.l2)).mul((Real) this.C.evaluate(this.l3.set((Integer) in),
                                                                        order,
                                                                        bits,
                                                                        this.l4),
                                                 bits,
                                                 (Real) result);
  }

  public void close()
  {
    this.c0.close();
    this.l0.close();
    this.l1.close();
    this.l2.close();
    this.l3.close();
    this.l4.close();
  }
}
