package arb.functions;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;

public abstract class A implements
                        Function<Integer, RealPolynomial>
{
  public Integer c0 = new Integer("42");
  public Integer c1 = new Integer("6");
  public Integer l0 = new Integer();

  public Real evaluate(Real in, int order, int bits, Real result)
  {
    return (result).set(this.c0.div(this.c1, bits, this.l0));
  }

  public void close()
  {
    this.c0.close();
    this.c1.close();
    this.l0.close();
  }
}