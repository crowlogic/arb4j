package arb.functions.generated;

import arb.Real;
import arb.functions.Function;

public class G implements
               Function<Void, Real>
{
  public Real α;
  public Real β;
  public Real ℝ1     = new Real();
  public Real ℝ2     = new Real();

  public Real evaluate(Void in, int order, int bits, Real result)
  {
    if (α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      return α.pow(2, bits, ℝ1).sub(β.pow(2, bits, ℝ2), bits, result);
    }
  }

  public void close()
  {
    ℝ1.close();
    ℝ2.close();
  }
}
