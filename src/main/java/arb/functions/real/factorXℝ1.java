package arb.functions.real;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.Typesettable;
import arb.functions.Function;

public class factorXℝ1 implements Function<Integer, RealPolynomial>, Typesettable, AutoCloseable, Initializable
{
  public boolean        isInitialized;
  Integer               cℤ2;
  Integer               cℤ1;
  public Integer        p;
  public Integer        q;
  public Real           α;
  public Real           β;
  public Integer        N;
  public Integer        endIndexℤ3;
  public Integer        endIndexℤ2;
  public RealPolynomial prodXℝ1;
  public RealPolynomial prodXℝ2;
  public RealPolynomial Xℝ2;
  public RealPolynomial Xℝ1;
  public Integer        ℤ1;
  public RealPolynomial valueXℝ2;
  public RealPolynomial Xℝ4;
  public RealPolynomial valueXℝ3;
  public Fraction       f1;
  public RealPolynomial Xℝ3;
  public Integer        k;
  public RealPolynomial Xℝ6;
  public RealPolynomial Xℝ5;
  public factorXℝ2      factorXℝ2 = new factorXℝ2();
  public factorXℝ3      factorXℝ3 = new factorXℝ3();

  @Override
  public Class<RealPolynomial> coDomainType()
  {
    return RealPolynomial.class;
  }

  @Override
  public RealPolynomial evaluate(Integer n, int order, int bits, RealPolynomial result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    RealPolynomial var10000 = cℤ1.div(cℤ2, bits, f1)
                                 .sub(Xℝ1.identity().div(cℤ2, bits, Xℝ2), bits, Xℝ3)
                                 .pow(n, bits, Xℝ4);
    factorXℝ2.n = n;
    prodXℝ1.multiplicativeIdentity();
    k.set(cℤ1);
    Integer var10001 = k;
    endIndexℤ2.set(p);

    while (var10001.compareTo(endIndexℤ2) <= 0)
    {
      prodXℝ1.mul((RealPolynomial) factorXℝ2.evaluate(k, bits, valueXℝ2), bits);
      var10001 = k.increment();
    }

    var10000    = var10000.mul(prodXℝ1, bits, Xℝ5);
    var10001    = n.factorial(bits, ℤ1);
    factorXℝ3.n = n;
    prodXℝ2.multiplicativeIdentity();
    k.set(cℤ1);
    Integer var10002 = k;
    endIndexℤ3.set(q);

    while (var10002.compareTo(endIndexℤ3) <= 0)
    {
      prodXℝ2.mul((RealPolynomial) factorXℝ3.evaluate(k, bits, valueXℝ3), bits);
      var10002 = k.increment();
    }

    return var10000.div(var10001.mul(prodXℝ2, bits, Xℝ6), bits, result);
  }

  public factorXℝ1()
  {
    cℤ2        = new Integer("2");
    cℤ1        = new Integer("1");
    endIndexℤ3 = new Integer();
    endIndexℤ2 = new Integer();
    prodXℝ1    = new RealPolynomial();
    prodXℝ2    = new RealPolynomial();
    Xℝ2        = new RealPolynomial();
    Xℝ1        = new RealPolynomial();
    ℤ1         = new Integer();
    valueXℝ2   = new RealPolynomial();
    Xℝ4        = new RealPolynomial();
    valueXℝ3   = new RealPolynomial();
    f1         = new Fraction();
    Xℝ3        = new RealPolynomial();
    k          = new Integer();
    Xℝ6        = new RealPolynomial();
    Xℝ5        = new RealPolynomial();
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
      factorXℝ2.p   = p;
      factorXℝ2.q   = q;
      factorXℝ2.α   = α;
      factorXℝ2.β   = β;
      factorXℝ2.N   = N;
      factorXℝ3.p   = p;
      factorXℝ3.q   = q;
      factorXℝ3.α   = α;
      factorXℝ3.β   = β;
      factorXℝ3.N   = N;
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
    prodXℝ1.close();
    prodXℝ2.close();
    Xℝ2.close();
    Xℝ1.close();
    ℤ1.close();
    valueXℝ2.close();
    Xℝ4.close();
    valueXℝ3.close();
    f1.close();
    Xℝ3.close();
    k.close();
    Xℝ6.close();
    Xℝ5.close();
    factorXℝ2.close();
    factorXℝ3.close();
  }

  @Override
  public String toString()
  {
    return "factorXℝ1:n➔((((1/2)-(z/2))^n)*Πk➔α[k]⋰n{k=1…p})/((n!)*Πk➔β[k]⋰n{k=1…q})";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left((\\left(\\frac{1}{2}-\\frac{z}{2}\\right))^{(n)} \\cdot \\prod_{k = 1}^{p}{(α_{k})_{n}}\\right)}{\\left(n! \\cdot \\prod_{k = 1}^{q}{(β_{k})_{n}}\\right)}";
  }
}
