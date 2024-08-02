package arb.functions.real;

import static java.lang.System.out;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Typesettable;
import arb.functions.Function;

public class factorfℝ1 implements Function<Integer, RationalFunction>, Typesettable, AutoCloseable, Initializable
{
  public boolean          isInitialized;
  Integer                 cℤ2;
  Integer                 cℤ1;
  public Integer          p;
  public Integer          q;
  public Fraction         α;
  public Fraction         β;
  public Integer          N;
  public Integer          endIndexℤ3;
  public Integer          endIndexℤ2;
  public Integer          ℤ1;
  public Fraction         f1;
  public Integer          k;
  public RationalFunction prodfℝ1;
  public RationalFunction prodfℝ2;
  public RationalFunction fℝ4;
  public RationalFunction fℝ3;
  public RationalFunction fℝ6;
  public RationalFunction fℝ5;
  public RationalFunction valuefℝ2;
  public RationalFunction valuefℝ3;
  public RationalFunction fℝ2;
  public RationalFunction fℝ1;
  public factorfℝ2        factorfℝ2 = new factorfℝ2();
  public factorfℝ3        factorfℝ3 = new factorfℝ3();

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

    RationalFunction var10000 = cℤ1.div(cℤ2, bits, f1)
                                   .sub(fℝ1.identity().div(cℤ2, bits, fℝ2), bits, fℝ3)
                                   .pow(n, bits, fℝ4);

    out.format("arg=%s\n", var10000);
    factorfℝ2.n = n;
    prodfℝ1.multiplicativeIdentity();
    k.set(cℤ1);
    Integer var10001 = k;
    endIndexℤ2.set(p);

    while (var10001.compareTo(endIndexℤ2) <= 0)
    {
      factorfℝ2.evaluate(k, bits, valuefℝ2);
      out.format("prodfℝ1=%s factorfℝ2[%s]=%s\n", prodfℝ1, k, valuefℝ2 );
      prodfℝ1.mul(valuefℝ2, bits);
      var10001 = k.increment();
    }

    var10000    = var10000.mul(prodfℝ1, bits, fℝ5);
    var10001    = n.factorial(bits, ℤ1);
    factorfℝ3.n = n;
    prodfℝ2.multiplicativeIdentity();
    k.set(cℤ1);
    Integer var10002 = k;
    endIndexℤ3.set(q);

    while (var10002.compareTo(endIndexℤ3) <= 0)
    {
      factorfℝ3.evaluate(k, bits, valuefℝ3);
      out.format("prodfℝ2=%s factorfℝ3[%s]=%s\n", prodfℝ1, k, valuefℝ2 );
      prodfℝ2.mul(valuefℝ3, bits);
      var10002 = k.increment();
    }
    RationalFunction denom = var10001.mul(prodfℝ2, bits, fℝ6);

    System.out.format("\nnumer=%s denom=%s var10001=%s\n\n", var10000, denom, var10001);

    return var10000.div(denom, bits, result);
  }

  public factorfℝ1()
  {
    cℤ2        = new Integer("2");
    cℤ1        = new Integer("1");
    endIndexℤ3 = new Integer();
    endIndexℤ2 = new Integer();
    ℤ1         = new Integer();
    f1         = new Fraction();
    k          = new Integer();
    prodfℝ1    = new RationalFunction();
    prodfℝ2    = new RationalFunction();
    fℝ4        = new RationalFunction();
    fℝ3        = new RationalFunction();
    fℝ6        = new RationalFunction();
    fℝ5        = new RationalFunction();
    valuefℝ2   = new RationalFunction();
    valuefℝ3   = new RationalFunction();
    fℝ2        = new RationalFunction();
    fℝ1        = new RationalFunction();
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
      factorfℝ2.p   = p;
      factorfℝ2.q   = q;
      factorfℝ2.α   = α;
      factorfℝ2.β   = β;
      factorfℝ2.N   = N;
      factorfℝ3.p   = p;
      factorfℝ3.q   = q;
      factorfℝ3.α   = α;
      factorfℝ3.β   = β;
      factorfℝ3.N   = N;
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ2.close();
    cℤ1.close();
    endIndexℤ3.close();
    endIndexℤ2.close();
    ℤ1.close();
    f1.close();
    k.close();
    prodfℝ1.close();
    prodfℝ2.close();
    fℝ4.close();
    fℝ3.close();
    fℝ6.close();
    fℝ5.close();
    valuefℝ2.close();
    valuefℝ3.close();
    fℝ2.close();
    fℝ1.close();
    factorfℝ2.close();
    factorfℝ3.close();
  }

  @Override
  public String toString()
  {
    return "factorfℝ1:n➔((((1/2)-(z/2))^n)*Πk➔α[k]⋰n{k=1…p})/((n!)*Πk➔β[k]⋰n{k=1…q})";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left((\\left(\\frac{1}{2}-\\frac{z}{2}\\right))^{(n)} \\cdot \\prod_{k = 1}^{p}{(α_{k})_{n}}\\right)}{\\left(n! \\cdot \\prod_{k = 1}^{q}{(β_{k})_{n}}\\right)}";
  }
}