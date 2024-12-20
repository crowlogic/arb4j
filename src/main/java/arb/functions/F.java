package arb.functions;

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
  public final Integer cℤ0000 = new Integer("1");
  public Fraction      vf0002 = new Fraction();
  public Fraction      vf0003 = new Fraction();
  public Fraction      vf0004 = new Fraction();
  public Fraction      vf0005 = new Fraction();
  public C             C;
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

    return C.evaluate(n.sub(cℤ0000, bits, vf0002), order, bits, vf0003)
            .mul(C.evaluate(vf0004.set(n), order, bits, vf0005), bits, result);
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
      if (C == null)
      {
        C = new C();
      }

      C.α           = α;
      C.β           = β;
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    vf0002.close();
    vf0003.close();
    vf0004.close();
    vf0005.close();
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
