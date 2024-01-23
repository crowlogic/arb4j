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
    if (!this.isInitialized)
    {
      this.initializeVariableReferences();
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
      return in.add(this.α, bits, this.ℝ1)
               .sub(this.const1, bits, this.ℝ2)
               .mul(in.add(this.β, bits, this.ℝ3).sub(this.const1, bits, this.ℝ4), bits, this.ℝ5)
               .mul((Real) this.C.evaluate(in, order, bits, this.ℝ6), bits, result);
    }
  }

  public B()
  {
    this.const1 = new Integer("1");
    this.ℝ1     = new Real();
    this.ℝ2     = new Real();
    this.ℝ3     = new Real();
    this.ℝ4     = new Real();
    this.ℝ5     = new Real();
    this.ℝ6     = new Real();
  }

  public void initializeVariableReferences()
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
      this.C.α           = this.α;
      this.C.β           = this.β;
      this.isInitialized = true;
    }
  }

  public void close()
  {
    this.const1.close();
    this.ℝ1.close();
    this.ℝ2.close();
    this.ℝ3.close();
    this.ℝ4.close();
    this.ℝ5.close();
    this.ℝ6.close();
  }
}
