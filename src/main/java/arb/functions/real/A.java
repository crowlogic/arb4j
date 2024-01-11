package arb.functions.real;

import arb.Real;
import arb.Integer;

/**
 * n->n*C(n/2)*C(n-1)
 */
public class A
{
  public Integer      c0 = new Integer("1");
  public Integer      l0 = new Integer();
  public Real         l1 = new Real();
  public Integer      l2 = new Integer();
  public Real         l3 = new Real();
  public RealFunction C  = null;

  public Real evaluate(Integer in, int order, int bits, Real result)
  {
    return ((Real) this.C.evaluate(((Integer) in).sub(this.c0, bits, (Real) result),
                                   order,
                                   bits,
                                   this.l1)).mul((Real) this.C.evaluate((Integer) in,
                                                                                     order,
                                                                                     bits,
                                                                                     this.l3),
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
  }
}
