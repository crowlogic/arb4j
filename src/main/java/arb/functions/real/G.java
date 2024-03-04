package arb.functions.real;

import arb.Integer;
import arb.Real;

public class G implements
               RealNullaryFunction
{
  private boolean isInitialized;
  Integer         c1 = new Integer("2");
  public Real     α;
  public Real     β;
  public Real     ℝ1 = new Real();
  public Real     ℝ2 = new Real();

  public Real evaluate(Void in, int order, int bits, Real result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return α.pow(c1, bits, ℝ1).sub(β.pow(c1, bits, ℝ2), bits, result);
  }

  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      isInitialized = true;
    }
  }

  public void close()
  {
    c1.close();
    ℝ1.close();
    ℝ2.close();
  }
}
