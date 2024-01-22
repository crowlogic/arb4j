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
  public Real     r1     = new Real();
  public Real     r2     = new Real();
  public P        P;
  public A        A;
  public B        B;
  public C        C;
  public E        E;
  public F        F;
  public G        G;

  public Real evaluate(Void in, int order, int bits, Real result)
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
      return α.pow(const1, bits, r1).sub(β.pow(const1, bits, r2), bits, result);
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