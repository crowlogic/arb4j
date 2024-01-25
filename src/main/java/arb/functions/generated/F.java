package arb.functions.generated;

import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class F implements
               Function<Integer, Real>
{
  private boolean isInitialized;
  Integer         const1;
  public Real     α;
  public Real     β;
  public Real     ℝ1;
  public Integer  ℤ1;
  public Real     ℝ2;
  public Real     ℝ3;
  public Real     ℝ4;
  public final C  C = new C();

  public Real evaluate(Integer in, int order, int bits, Real result)
  {
    if (!isInitialized)
    {
      initializeVariableReferences();
    }

    return C.evaluate(ℝ1.set(in.sub(const1, bits, ℤ1)), order, bits, ℝ2)
            .mul(C.evaluate(ℝ3.set(in), order, bits, ℝ4), bits, result);
  }

  public F()
  {
    const1 = new Integer("1");
    ℝ1     = new Real();
    ℤ1     = new Integer();
    ℝ2     = new Real();
    ℝ3     = new Real();
    ℝ4     = new Real();
  }

  public void initializeVariableReferences()
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
      C.α           = α;
      C.β           = β;
      isInitialized = true;
    }
  }

  public void close()
  {
    const1.close();
    ℝ1.close();
    ℤ1.close();
    ℝ2.close();
    ℝ3.close();
    ℝ4.close();
  }
}
