package arb.functions;

import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class B implements
               RealFunction
{
  private boolean isInitialized;
  public Integer  const1 = new Integer("1");
  public Real     α;
  public Real     β;
  public Real     r1     = new Real();
  public Real     r2     = new Real();
  public Real     r3     = new Real();
  public Real     r4     = new Real();
  public Real     r5     = new Real();
  public Real     r6     = new Real();
  public A        A;
  public B        B;
  public C        C;
  public E        E;
  public F        F;
  public G        G;

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
      return in.add(α, bits, r1)
               .sub(const1, bits, r2)
               .mul(in.add(β, bits, r3).sub(const1, bits, r4), bits, r5)
               .mul(C.evaluate(in, order, bits, r6), bits, result);
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
    r2.close();
    r3.close();
    r4.close();
    r5.close();
    r6.close();
  }
}
