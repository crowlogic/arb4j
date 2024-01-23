package arb.functions.generated;

import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class C implements
               RealFunction
{
  Integer     const1 = new Integer("2");
  public Real α;
  public Real β;
  public Real ℝ1     = new Real();
  public Real ℝ2     = new Real();

  public Real evaluate(Real in, int order, int bits, Real result)
  {
    if (this.α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      return this.const1.mul(in, bits, this.ℝ1).add(this.α, bits, this.ℝ2).add(this.β, bits, result);
    }
  }

  public void close()
  {
    this.const1.close();
    this.ℝ1.close();
    this.ℝ2.close();
  }
}
