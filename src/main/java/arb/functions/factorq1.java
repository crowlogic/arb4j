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
    if (!this.isInitialized)
    {
      this.initialize();
    }

    RationalFunction var10000 = this.q1.identity()
                                       .pow(this.cℤ2, bits, this.q2)
                                       .neg(bits, this.q3)
                                       .pow(n, bits, this.q4);
    this.factorq2.n = n;
    this.prodq1.multiplicativeIdentity();
    this.k.set(this.cℤ1);
    Integer var10001 = this.k;
    this.endIndexℤ2.set(this.p);

    while (var10001.compareTo(this.endIndexℤ2) <= 0)
    {
      this.prodq1.mul((RationalFunction) this.factorq2.evaluate(this.k, bits, this.valueq2), bits);
      var10001 = this.k.increment();
    }

    var10000        = var10000.mul(this.prodq1, bits, this.q5);
    var10001        = n.factorial(bits, this.ℤ1);
    this.factorq3.n = n;
    this.prodq2.multiplicativeIdentity();
    this.k.set(this.cℤ1);
    Integer var10002 = this.k;
    this.endIndexℤ3.set(this.q);

    while (var10002.compareTo(this.endIndexℤ3) <= 0)
    {
      this.prodq2.mul((RationalFunction) this.factorq3.evaluate(this.k, bits, this.valueq3), bits);
      var10002 = this.k.increment();
    }
    var10001.mul(this.prodq2, bits, this.q6);
    assert !q6.isZero();
    return var10000.div(q6, bits, result);
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
      this.isInitialized = true;
    }
  }

  public factorq1()
  {
    this.cℤ2        = new Integer("2");
    this.cℤ1        = new Integer("1");
    this.q1         = new RationalFunction();
    this.q2         = new RationalFunction();
    this.prodq2     = new RationalFunction();
    this.endIndexℤ3 = new Integer();
    this.q3         = new RationalFunction();
    this.endIndexℤ2 = new Integer();
    this.q4         = new RationalFunction();
    this.q5         = new RationalFunction();
    this.q6         = new RationalFunction();
    this.ℤ1         = new Integer();
    this.k          = new Integer();
    this.prodq1     = new RationalFunction();
    this.valueq2    = new RationalFunction();
    this.valueq3    = new RationalFunction();
  }

  @Override
  public void close()
  {
    this.cℤ2.close();
    this.cℤ1.close();
    this.q1.close();
    this.q2.close();
    this.prodq2.close();
    this.endIndexℤ3.close();
    this.q3.close();
    this.endIndexℤ2.close();
    this.q4.close();
    this.q5.close();
    this.q6.close();
    this.ℤ1.close();
    this.k.close();
    this.prodq1.close();
    this.valueq2.close();
    this.valueq3.close();
    this.factorq2.close();
    this.factorq3.close();
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
