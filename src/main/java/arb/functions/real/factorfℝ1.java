package arb.functions.real;

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
    if (!this.isInitialized)
    {
      this.initialize();
    }

    RationalFunction var10000 = this.cℤ1.div(this.cℤ2, bits, this.f1)
                                        .sub(this.fℝ1.identity().div(this.cℤ2, bits, this.fℝ2), bits, this.fℝ3)
                                        .pow(n, bits, this.fℝ4);
    this.factorfℝ2.n = n;
    this.prodfℝ1.multiplicativeIdentity();
    this.k.set(this.cℤ1);
    Integer var10001 = this.k;
    this.endIndexℤ2.set(this.p);

    while (var10001.compareTo(this.endIndexℤ2) <= 0)
    {
      this.prodfℝ1.mul((RationalFunction) this.factorfℝ2.evaluate(this.k, bits, this.valuefℝ2), bits);
      var10001 = this.k.increment();
    }

    var10000         = var10000.mul(this.prodfℝ1, bits, this.fℝ5);
    var10001         = n.factorial(bits, this.ℤ1);
    this.factorfℝ3.n = n;
    this.prodfℝ2.multiplicativeIdentity();
    this.k.set(this.cℤ1);
    Integer var10002 = this.k;
    this.endIndexℤ3.set(this.q);

    while (var10002.compareTo(this.endIndexℤ3) <= 0)
    {
      this.prodfℝ2.mul((RationalFunction) this.factorfℝ3.evaluate(this.k, bits, this.valuefℝ3), bits);
      var10002 = this.k.increment();
    }

    return var10000.div(var10001.mul(this.prodfℝ2, bits, this.fℝ6), bits, result);
  }

  public factorfℝ1()
  {
    this.cℤ2        = new Integer("2");
    this.cℤ1        = new Integer("1");
    this.endIndexℤ3 = new Integer();
    this.endIndexℤ2 = new Integer();
    this.ℤ1         = new Integer();
    this.f1         = new Fraction();
    this.k          = new Integer();
    this.prodfℝ1    = new RationalFunction();
    this.prodfℝ2    = new RationalFunction();
    this.fℝ4        = new RationalFunction();
    this.fℝ3        = new RationalFunction();
    this.fℝ6        = new RationalFunction();
    this.fℝ5        = new RationalFunction();
    this.valuefℝ2   = new RationalFunction();
    this.valuefℝ3   = new RationalFunction();
    this.fℝ2        = new RationalFunction();
    this.fℝ1        = new RationalFunction();
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (this.p == null)
    {
      throw new AssertionError("p shan't be null");
    }
    else if (this.q == null)
    {
      throw new AssertionError("q shan't be null");
    }
    else if (this.α == null)
    {
      throw new AssertionError("α shan't be null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("β shan't be null");
    }
    else if (this.N == null)
    {
      throw new AssertionError("N shan't be null");
    }
    else
    {
      this.factorfℝ2.p   = this.p;
      this.factorfℝ2.q   = this.q;
      this.factorfℝ2.α   = this.α;
      this.factorfℝ2.β   = this.β;
      this.factorfℝ2.N   = this.N;
      this.factorfℝ3.p   = this.p;
      this.factorfℝ3.q   = this.q;
      this.factorfℝ3.α   = this.α;
      this.factorfℝ3.β   = this.β;
      this.factorfℝ3.N   = this.N;
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ2.close();
    this.cℤ1.close();
    this.endIndexℤ3.close();
    this.endIndexℤ2.close();
    this.ℤ1.close();
    this.f1.close();
    this.k.close();
    this.prodfℝ1.close();
    this.prodfℝ2.close();
    this.fℝ4.close();
    this.fℝ3.close();
    this.fℝ6.close();
    this.fℝ5.close();
    this.valuefℝ2.close();
    this.valuefℝ3.close();
    this.fℝ2.close();
    this.fℝ1.close();
    this.factorfℝ2.close();
    this.factorfℝ3.close();
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