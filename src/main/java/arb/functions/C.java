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
    return _c0.mul(in, bits, r1).add(α, bits, r2).add(β, bits, result);
  }

  public void close()
  {
    _c0.close();
    r1.close();
    r2.close();
  }
}