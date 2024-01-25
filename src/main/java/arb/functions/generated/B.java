package arb.functions.generated;

import arb.Integer;
import arb.Real;
import arb.functions.real.RealFunction;

public class B implements
               RealFunction
{
  private boolean isInitialized;
  Integer         const1;
  public Real     α;
  public Real     β;
  public Real     ℝ1;
  public Real     ℝ2;
  public Real     ℝ3;
  public Real     ℝ4;
  public Real     ℝ5;
  public Real     ℝ6;
  public final C  C = new C();

  public Real evaluate(Real in, int order, int bits, Real result)
  {
    if (!isInitialized)
    {
      initializeVariableReferences();
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
      return in.add(α, bits, ℝ1)
               .sub(const1, bits, ℝ2)
               .mul(in.add(β, bits, ℝ3).sub(const1, bits, ℝ4), bits, ℝ5)
               .mul(C.evaluate(in, order, bits, ℝ6), bits, result);
    }
  }

  public B()
  {
    const1 = new Integer("1");
    ℝ1     = new Real();
    ℝ2     = new Real();
    ℝ3     = new Real();
    ℝ4     = new Real();
    ℝ5     = new Real();
    ℝ6     = new Real();
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
    ℝ2.close();
    ℝ3.close();
    ℝ4.close();
    ℝ5.close();
    ℝ6.close();
  }
}
