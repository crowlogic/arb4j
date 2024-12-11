package arb.functions.real;

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
  public final Integer cℤ0002;
  public final Integer cℤ0001;
  public Integer       ℤ0004;
  public Fraction      f0008;
  public Integer       ℤ0003;
  public Fraction      f0007;
  public Fraction      f0006;
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

    return n.mul(C.evaluate(n.div(cℤ0001, bits, ℤ0003), order, bits, f0006), bits, f0007)
            .mul(C.evaluate(n.sub(cℤ0002, bits, ℤ0004), order, bits, f0008), bits, result);
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
      C.α           = α;
      C.β           = β;
      isInitialized = true;
    }
  }

  public E()
  {
    cℤ0002 = new Integer("1");
    cℤ0001 = new Integer("2");
    ℤ0004  = new Integer();
    f0008  = new Fraction();
    ℤ0003  = new Integer();
    f0007  = new Fraction();
    f0006  = new Fraction();
  }

  @Override
  public void close()
  {
    cℤ0002.close();
    cℤ0001.close();
    ℤ0004.close();
    f0008.close();
    ℤ0003.close();
    f0007.close();
    f0006.close();
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
