package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;

public class factorq1 implements
                      Function<Integer, RationalFunction>,
                      Typesettable,
                      AutoCloseable,
                      Initializable
{
  public boolean          isInitialized;
  Integer                 cℤ2;
  Integer                 cℤ1;
  public factorq2         factorq2 = new factorq2();
  public factorq3         factorq3 = new factorq3();
  public Integer          N;
  public Integer          p;
  public Integer          q;
  public Real             α;
  public Real             β;
  public RationalFunction q1;
  public RationalFunction q2;
  public RationalFunction prodq2;
  public Integer          endIndexℤ3;
  public RationalFunction q3;
  public Integer          endIndexℤ2;
  public RationalFunction q4;
  public RationalFunction q5;
  public RationalFunction q6;
  public Integer          ℤ1;
  public Integer          k;
  public RationalFunction prodq1;
  public RationalFunction valueq2;
  public RationalFunction valueq3;

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  @Override
  public RationalFunction evaluate(Integer n, int order, int bits, RationalFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    RationalFunction var10000 = q1.identity().pow(cℤ2, bits, q2).neg(bits, q3).pow(n, bits, q4);
    factorq2.n = n;
    prodq1.multiplicativeIdentity();
    k.set(cℤ1);
    Integer var10001 = k;
    endIndexℤ2.set(p);

    while (var10001.compareTo(endIndexℤ2) <= 0)
    {
      prodq1.mul((RationalFunction) factorq2.evaluate(k, bits, valueq2), bits);
      var10001 = k.increment();
    }

    var10000   = var10000.mul(prodq1, bits, q5);
    var10001   = n.factorial(bits, ℤ1);
    factorq3.n = n;
    prodq2.multiplicativeIdentity();
    k.set(cℤ1);
    Integer var10002 = k;
    endIndexℤ3.set(q);

    while (var10002.compareTo(endIndexℤ3) <= 0)
    {
      prodq2.mul((RationalFunction) factorq3.evaluate(k, bits, valueq3), bits);
      var10002 = k.increment();
    }
    var10001.mul(prodq2, bits, q6);
    assert !q6.isZero();
    return var10000.div(q6, bits, result);
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

  public factorq1()
  {
    cℤ2        = new Integer("2");
    cℤ1        = new Integer("1");
    q1         = new RationalFunction();
    q2         = new RationalFunction();
    prodq2     = new RationalFunction();
    endIndexℤ3 = new Integer();
    q3         = new RationalFunction();
    endIndexℤ2 = new Integer();
    q4         = new RationalFunction();
    q5         = new RationalFunction();
    q6         = new RationalFunction();
    ℤ1         = new Integer();
    k          = new Integer();
    prodq1     = new RationalFunction();
    valueq2    = new RationalFunction();
    valueq3    = new RationalFunction();
  }

  @Override
  public void close()
  {
    cℤ2.close();
    cℤ1.close();
    q1.close();
    q2.close();
    prodq2.close();
    endIndexℤ3.close();
    q3.close();
    endIndexℤ2.close();
    q4.close();
    q5.close();
    q6.close();
    ℤ1.close();
    k.close();
    prodq1.close();
    valueq2.close();
    valueq3.close();
    factorq2.close();
    factorq3.close();
  }

  @Override
  public String toString()
  {
    return "factorq1:n➔(((neg(z^2))^n)*Πk➔α[k]⋰n{k=1…p})/((n!)*Πk➔β[k]⋰n{k=1…q})";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left((\\neg{(z)^{(2)}})^{(n)} \\cdot \\prod_{k = 1}^{p}{(α_{k})_{n}}\\right)}{\\left(n! \\cdot \\prod_{k = 1}^{q}{(β_{k})_{n}}\\right)}";
  }
}
