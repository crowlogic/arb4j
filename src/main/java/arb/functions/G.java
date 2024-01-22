package arb.functions;

import arb.Integer;
import arb.Real;

public class G implements
               Function<Void, Real>
{
  private boolean isInitialized;
  public Integer  const1 = new Integer("2");
  public Real     α;
  public Real     β;
  public Real     ℝ1     = new Real();
  public Real     ℝ2     = new Real();
  public C        C;
  public F        F;
  public G        G;

  public Real evaluate(Void in, int order, int bits, Real result)
  {
    if (!this.isInitialized)
    {
      this.initializeContext();
    }

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

  public void initializeContext()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (this.α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      this.isInitialized = true;
    }
  }

  public void close()
  {
    this.const1.close();
    this.ℝ1.close();
    this.ℝ2.close();
  }
}
