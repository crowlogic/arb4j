package arb.functions.real;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;
import arb.functions.integer.FractionSequence;

public class F implements
               FractionSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ0001;
  public Fraction      f0001;
  public Fraction      f0002;
  public Integer       ℤ0002;
  public C             C = new C();
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

    return C.evaluate(n.sub(cℤ0001, bits, ℤ0002), order, bits, f0001)
            .mul(C.evaluate(n, order, bits, f0002), bits, result);
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
      throw new AssertionError("F.α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("F.β is null");
    }
    else
    {
      C.α           = α;
      C.β           = β;
      isInitialized = true;
    }
  }

  public F()
  {
    cℤ0001 = new Integer("1");
    f0001  = new Fraction();
    f0002  = new Fraction();
    ℤ0002  = new Integer();
  }

  @Override
  public void close()
  {
    cℤ0001.close();
    f0001.close();
    f0002.close();
    ℤ0002.close();
    C.close();
  }

  @Override
  public String toString()
  {
    return "F:n➔C(n-1)*C(n)";
  }

  @Override
  public String typeset()
  {
    return "\\C(\\left(n-1\\right)) \\cdot \\C(n)";
  }
}
