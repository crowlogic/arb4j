package arb.functions.generated;

import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class G implements
               Function<Void, Real>
{
  Integer     const1 = new Integer("2");
  public Real α;
  public Real β;
  public Real ℝ1     = new Real();
  public Real ℝ2     = new Real();

  public Real evaluate(Void in, int order, int bits, Real result)
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
      return this.α.pow(this.const1, bits, this.ℝ1).sub(this.β.pow(this.const1, bits, this.ℝ2), bits, result);
    }
  }

  public void close()
  {
    this.const1.close();
    this.ℝ1.close();
    this.ℝ2.close();
  }
}
