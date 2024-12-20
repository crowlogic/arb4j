package arb.functions;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;
import arb.functions.integer.FractionSequence;

public class E implements
               FractionSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ0000 = new Integer("2");
  public final Integer cℤ0001 = new Integer("1");
  public Fraction      vf0011 = new Fraction();
  public Fraction      vf0012 = new Fraction();
  public Fraction      vf0013 = new Fraction();
  public Fraction      vf0014 = new Fraction();
  public Fraction      vf0015 = new Fraction();
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

    return n.mul(C.evaluate(n.div(cℤ0000, bits, vf0011), order, bits, vf0012), bits, vf0013)
            .mul(C.evaluate(n.sub(cℤ0001, bits, vf0014), order, bits, vf0015), bits, result);
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
      throw new AssertionError("E.α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("E.β is null");
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
    cℤ0001.close();
    vf0011.close();
    vf0012.close();
    vf0013.close();
    vf0014.close();
    vf0015.close();
    C.close();
  }

  @Override
  public String toString()
  {
    return "E:n➔n*C(n/2)*C(n-1)";
  }

  @Override
  public String typeset()
  {
    return "n \\cdot \\C(\\frac{n}{2}) \\cdot \\C(\\left(n-1\\right))";
  }
}
