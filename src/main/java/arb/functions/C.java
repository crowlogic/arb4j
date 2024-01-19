package arb.functions;

import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class C implements
               RealFunction
{
  public Integer _c0 = new Integer("2");
  public Real    α;
  public Real    β;
  public Real    r1  = new Real();
  public Real    r2  = new Real();

  public Real evaluate(Real in, int order, int bits, Real result)
  {
    return this._c0.mul((Real) in, bits, this.r1).add(this.α, bits, this.r2).add(this.β, bits, (Real) result);
  }

  public void close()
  {
    this._c0.close();
    this.r1.close();
    this.r2.close();
  }
}