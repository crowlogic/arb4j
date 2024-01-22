package arb.functions;

import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class C implements
               RealFunction
{
  private boolean isInitialized;
  public Integer  const1 = new Integer("2");
  public Real     α;
  public Real     β;
  public Real     r1     = new Real();
  public Real     r2     = new Real();
  public C        C;

  public Real evaluate(Real in, int order, int bits, Real result)
  {
    if (!isInitialized)
    {
      initializeContext();
    }

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
      return const1.mul(in, bits, r1).add(α, bits, r2).add(β, bits, result);
    }
  }

  public void initializeContext()
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
    const1.close();
    r1.close();
    r2.close();
  }
}
