package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;
import arb.functions.rational.RationalNullaryFunction;

public class F implements
               RationalNullaryFunction,
               Typesettable,
               AutoCloseable,
               Initializable
{
  @Override
  public String toString()
  {
    return String.format("F[isInitialized=%s, cℤ1=%s, factorq1=%s, N=%s, p=%s, q=%s, α=%s, β=%s, sumq1=%s, endIndexℤ1=%s, n=%s, valueq1=%s]",
                         isInitialized,
                         cℤ1,
                         factorq1,
                         N,
                         p,
                         q,
                         α,
                         β,
                         sumq1,
                         endIndexℤ1,
                         n,
                         valueq1);
  }

  public boolean          isInitialized;
  Integer                 cℤ1;
  public factorq1         factorq1 = new factorq1();
  public Integer          N;
  public Integer          p;
  public Integer          q;
  public Real             α;
  public Real             β;
  public RationalFunction sumq1;
  public Integer          endIndexℤ1;
  public Integer          n;
  public RationalFunction valueq1;

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  @Override
  public RationalFunction evaluate(Object in, int order, int bits, RationalFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    sumq1.additiveIdentity();
    n.set(cℤ1);
    Integer var10000 = n;
    endIndexℤ1.set(N);

    while (var10000.compareTo(endIndexℤ1) <= 0)
    {
      sumq1.add((RationalFunction) factorq1.evaluate(n, bits, valueq1), bits);
      var10000 = n.increment();
    }

    return result.set(sumq1);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (p == null)
    {
      throw new AssertionError("p shan't be null");
    }
    else if (q == null)
    {
      throw new AssertionError("q shan't be null");
    }
    else if (α == null)
    {
      throw new AssertionError("α shan't be null");
    }
    else if (β == null)
    {
      throw new AssertionError("β shan't be null");
    }
    else if (N == null)
    {
      throw new AssertionError("N shan't be null");
    }
    else
    {
      isInitialized = true;
    }
  }

  public F()
  {
    cℤ1        = new Integer("0");
    sumq1      = new RationalFunction();
    endIndexℤ1 = new Integer();
    n          = new Integer();
    valueq1    = new RationalFunction();
  }

  @Override
  public void close()
  {
    cℤ1.close();
    sumq1.close();
    endIndexℤ1.close();
    n.close();
    valueq1.close();
    factorq1.close();
  }

  @Override
  public String typeset()
  {
    return "\\add_{n = 0}^{N}{\\frac{\\left((\\neg{(z)^{(2)}})^{(n)} \\cdot \\prod_{k = 1}^{p}{(α_{k})_{n}}\\right)}{\\left(n! \\cdot \\prod_{k = 1}^{q}{(β_{k})_{n}}\\right)}}";
  }
}
