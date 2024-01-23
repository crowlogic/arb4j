package arb.functions;

import arb.Integer;
import arb.Real;

public class wtf implements
               Function<Integer, Real>
{
  private boolean isInitialized;
  public Integer  const1 = new Integer("1");
  public Real     α;
  public Real     β;
  public Real     r1     = new Real();
  public Integer  i1     = new Integer();
  public Real     r2     = new Real();
  public Real     r3     = new Real();
  public Real     r4     = new Real();
  public C        C;
  public wtf        F;

  public Real evaluate(Integer in, int order, int bits, Real result)
  {
    if (!isInitialized)
    {
      initializeContext();
    }

    return C.evaluate(r1.set(in.sub(const1, bits, i1)), order, bits, r2)
            .mul(C.evaluate(r3.set(in), order, bits, r4), bits, result);
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
      C var10001 = C = new C();
      C.α = α;
      C.β = β;
      C.initializeContext();
      C             = var10001;
      isInitialized = true;
    }
  }

  public void close()
  {
    const1.close();
    r1.close();
    i1.close();
    r2.close();
    r3.close();
    r4.close();
  }
}
