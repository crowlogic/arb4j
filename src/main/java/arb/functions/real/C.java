package arb.functions.real;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;
import arb.functions.integer.FractionSequence;

public class C implements
               FractionSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ0001 = new Integer("2");
  public Real          ℝ0001  = new Real();
  public Integer       ℤ0001  = new Integer();
  public Real          α;
  public Real          β;

  @Override
  public Class<Fraction> coDomainType()
  {
    return Fraction.class;
  }

  @Override
  public Fraction evaluate(Integer n, int order, int bits, Fraction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return cℤ0001.mul(n, bits, ℤ0001).add(α, bits, ℝ0001).add(β, bits, result);
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
    cℤ0001.close();
    ℝ0001.close();
    ℤ0001.close();
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
