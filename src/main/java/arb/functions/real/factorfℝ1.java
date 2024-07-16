package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.RealRationalFunction;
import arb.Typesettable;
import arb.functions.Function;

public class factorfℝ1 implements Function<Integer, RealRationalFunction>, Typesettable, AutoCloseable, Initializable
{
  public boolean              isInitialized;
  Integer                     cℤ2;
  Integer                     cℤ1;
  public Integer              p;
  public Integer              q;
  public Real                 α;
  public Real                 β;
  public Integer              N;
  public Integer              endIndexℤ3;
  public Integer              endIndexℤ2;
  public Integer              ℤ1;
  public Integer              k;
  public RealRationalFunction prodfℝ1;
  public RealRationalFunction prodfℝ2;
  public RealRationalFunction fℝ4;
  public RealRationalFunction fℝ3;
  public RealRationalFunction fℝ5;
  public RealRationalFunction valuefℝ2;
  public RealRationalFunction valuefℝ3;
  public RealRationalFunction fℝ2;
  public RealRationalFunction fℝ1;
  public factorfℝ2            factorfℝ2 = new factorfℝ2();
  public factorfℝ3            factorfℝ3 = new factorfℝ3();

  @Override
  public Class<RealRationalFunction> coDomainType()
  {
    return RealRationalFunction.class;
  }

  @Override
  public RealRationalFunction evaluate(Integer n, int order, int bits, RealRationalFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    RealRationalFunction var10000 = RealConstants.half.sub(result.identity().div(cℤ2, bits, fℝ1), bits, fℝ2)
                                                      .pow(n, bits, fℝ3);
    factorfℝ2.n = n;
    prodfℝ1.multiplicativeIdentity();
    k.set(cℤ1);
    Integer var10001 = k;
    endIndexℤ2.set(p);

    while (var10001.compareTo(endIndexℤ2) <= 0)
    {
      prodfℝ1.mul(factorfℝ2.evaluate(k, bits, valuefℝ2), bits);
      var10001 = k.increment();
    }

    var10000    = var10000.mul(prodfℝ1, bits, fℝ4);
    var10001    = n.factorial(bits, ℤ1);
    factorfℝ3.n = n;
    prodfℝ2.multiplicativeIdentity();
    k.set(cℤ1);
    Integer var10002 = k;
    endIndexℤ3.set(q);

    while (var10002.compareTo(endIndexℤ3) <= 0)
    {
      prodfℝ2.mul(factorfℝ3.evaluate(k, bits, valuefℝ3), bits);
      var10002 = k.increment();
    }

    return var10000.div(var10001.mul(prodfℝ2, bits, fℝ5), bits, result);
  }

  public factorfℝ1()
  {
    cℤ2        = new Integer("2");
    cℤ1        = new Integer("1");
    endIndexℤ3 = new Integer();
    endIndexℤ2 = new Integer();
    ℤ1         = new Integer();
    k          = new Integer();
    prodfℝ1    = new RealRationalFunction();
    prodfℝ2    = new RealRationalFunction();
    fℝ4        = new RealRationalFunction();
    fℝ3        = new RealRationalFunction();
    fℝ5        = new RealRationalFunction();
    valuefℝ2   = new RealRationalFunction();
    valuefℝ3   = new RealRationalFunction();
    fℝ2        = new RealRationalFunction();
    fℝ1        = new RealRationalFunction();
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
    k.close();
    prodfℝ1.close();
    prodfℝ2.close();
    fℝ4.close();
    fℝ3.close();
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
    return "factorfℝ1:n➔(((½-(z/2))^n)*Πk➔α[k]⋰n{k=1…p})/((n!)*Πk➔β[k]⋰n{k=1…q})";
  }

  @Override
  public String typeset()
  {
    return "\\frac{(((\\frac{1}{2}-\\frac{z}{2}))^{(n)} \\cdot \\prod_{k = 1}^{p}{(α_{k})_{n}})}{(n! \\cdot \\prod_{k = 1}^{q}{(β_{k})_{n}})}";
  }
}
