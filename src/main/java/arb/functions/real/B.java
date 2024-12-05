package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;
import arb.functions.integer.RealSequence;

public class B implements
               RealSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ1;
  public Real          iℝ15;
  public Real          iℝ16;
  public Real          iℝ17;
  public Real          iℝ12;
  public Real          iℝ13;
  public Real          iℝ14;
  public C             C = new C();
  public Real          α;
  public Real          β;

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Integer n, int order, int bits, Real result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    return n.add(this.α, bits, this.iℝ12)
            .sub(this.cℤ1, bits, this.iℝ13)
            .mul(n.add(this.β, bits, this.iℝ14).sub(this.cℤ1, bits, this.iℝ15), bits, this.iℝ16)
            .mul((Real) this.C.evaluate(n, order, bits, this.iℝ17), bits, result);
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (this.α == null)
    {
      throw new AssertionError("B.α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("B.β is null");
    }
    else
    {
      this.C.α           = this.α;
      this.C.β           = this.β;
      this.isInitialized = true;
    }
  }

  public B()
  {
    this.cℤ1  = new Integer("1");
    this.iℝ15 = new Real();
    this.iℝ16 = new Real();
    this.iℝ17 = new Real();
    this.iℝ12 = new Real();
    this.iℝ13 = new Real();
    this.iℝ14 = new Real();
  }

  @Override
  public void close()
  {
    this.cℤ1.close();
    this.iℝ15.close();
    this.iℝ16.close();
    this.iℝ17.close();
    this.iℝ12.close();
    this.iℝ13.close();
    this.iℝ14.close();
    this.C.close();
  }

  @Override
  public String toString()
  {
    return "B:n➔(n+α-1)*(n+β-1)*C(n)";
  }

  @Override
  public String typeset()
  {
    return "\\left(n + α-1\\right) \\cdot \\left(n + β-1\\right) \\cdot \\C(n)";
  }
}