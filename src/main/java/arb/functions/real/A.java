package arb.functions.real;

import arb.Real;

/**
 * n->n*C(n/2)*C(n-1)
 */
public class A
{

  public Real         l0 = new Real();
  public Real         l1 = new Real();
  public Real         l2 = new Real();
  public Real         l3 = new Real();
  public RealFunction C  = null;

  public Real evaluate(Real in, int order, int bits, Real result)
  {
    return in.mul(C.evaluate(in.div(2, bits, result), order, bits, l0), bits, l1)
             .mul(C.evaluate(in.sub(1, bits, l2), order, bits, l3), bits, result);
  }

  public void close()
  {
    this.l0.close();
    this.l1.close();
    this.l2.close();
    this.l3.close();
  }
}
