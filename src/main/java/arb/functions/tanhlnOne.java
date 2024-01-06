package arb.functions;

import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class tanhlnOne implements
                       RealFunction
{
  public Integer c0 = new Integer("1");
  public Real l0 = new Real();

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