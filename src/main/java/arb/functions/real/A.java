package arb.functions.real;

import arb.Real;

/**
 * n->C(n-1)*C(n)
 */
public class A
{
  public Real         l0  = new Real();
  public Real         l1  = new Real();
  public RealFunction yay = null;

  public Real evaluate(Real in, int order, int bits, Real result)
  {
    return ((Real) this.yay.evaluate((Real) in, order, bits, this.l0)).log(bits, this.l1).tanh(bits, (Real) result);
  }

  public void close()
  {
    this.l0.close();
    this.l1.close();
  }
}
