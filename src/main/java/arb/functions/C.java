package arb.functions;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;

public class C implements
               FractionFunction,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ0000 = new Integer("2");
  public Fraction      vf0001 = new Fraction();
  public Real          vℝ0001 = new Real();
  public Real          α;
  public Real          β;

  @Override
  public Class<Fraction> coDomainType()
  {
    return Fraction.class;
  }

  @Override
  public Fraction evaluate(Fraction n, int order, int bits, Fraction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return cℤ0000.mul(n, bits, vf0001).add(α, bits, vℝ0001).add(β, bits, result);
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
    cℤ0000.close();
    vf0001.close();
    vℝ0001.close();
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