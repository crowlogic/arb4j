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
    if (!isInitialized)
    {
      initialize();
    }

    return cℤ1.mul(n, bits, iℤ1).add(α, bits, iℝ1).add(β, bits, result);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (α == null)
    {
      throw new AssertionError("C.α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("C.β is null");
    }
    else
    {
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ1.close();
    iℤ1.close();
    iℝ1.close();
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
