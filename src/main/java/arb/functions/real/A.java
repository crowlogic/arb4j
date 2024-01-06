package arb.functions.real;

import arb.Integer;
import arb.Real;

public class A implements
               RealFunction
{
  public Integer c0 = new Integer("1");
  public Integer l0 = new Integer();

  public Real evaluate(Real in, int order, int bits, Real result)
  {
    return this.c0.log(bits, this.l0).tanh(bits, (Real) result);
  }

  public void close()
  {
    this.c0.close();
    this.l0.close();
  }
}