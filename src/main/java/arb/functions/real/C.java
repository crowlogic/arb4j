package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;
import arb.functions.integer.RealSequence;

public class C implements
               RealSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ1 = new Integer("2");
  public Integer       iℤ1 = new Integer();
  public Real          iℝ1 = new Real();
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

    return this.cℤ1.mul(n, bits, this.iℤ1).add(this.α, bits, this.iℝ1).add(this.β, bits, result);
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
      throw new AssertionError("C.α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("C.β is null");
    }
    else
    {
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ1.close();
    this.iℤ1.close();
    this.iℝ1.close();
  }

  @Override
  public String toString()
  {
    return "C:n➔2*n+α+β";
  }

  @Override
  public String typeset()
  {
    return "2 \\cdot n + α + β";
  }
}
