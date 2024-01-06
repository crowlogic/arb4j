package arb.functions.real;

import arb.Integer;
import arb.Real;

public class A implements
               RealFunction
{
  public Integer c0 = new Integer("1");
  public Integer c1 = new Integer("2");
  public Integer c2 = new Integer("3");
  public Integer l0 = new Integer();
  public Integer l1 = new Integer();

  public Real evaluate(Real in, int order, int bits, Real result)
  {
    return result.set(c0.add(c1, bits, l0).add(c2, bits, l1));
  }

  public void close()
  {
    this.c0.close();
    this.c1.close();
    this.c2.close();
    this.l0.close();
  }
}