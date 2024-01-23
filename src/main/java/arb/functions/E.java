package arb.functions;

import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class E implements
               RealFunction
{
  private boolean isInitialized;
  public Integer  const1 = new Integer("2");
  public Integer  const2 = new Integer("1");
  public Real     α;
  public Real     β;
  public Real     r1     = new Real();
  public Real     r2     = new Real();
  public Real     r3     = new Real();
  public Real     r4     = new Real();
  public Real     r5     = new Real();
  public A        A;
  public C        C;
  public E        E;
  public wtf        F;
  public G        G;

  public Real evaluate(Real in, int order, int bits, Real result)
  {
    if (!isInitialized)
    {
      initializeContext();
    }

    return in.mul(C.evaluate(in.div(const1, bits, r1), order, bits, r2), bits, r3)
             .mul(C.evaluate(in.sub(const2, bits, r4), order, bits, r5), bits, result);
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
    const2.close();
    r1.close();
    r2.close();
    r3.close();
    r4.close();
    r5.close();
  }
}
