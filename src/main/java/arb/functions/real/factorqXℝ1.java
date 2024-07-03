package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealQuasiPolynomial;
import arb.Typesettable;
import arb.functions.Function;

public class factorqXℝ1 implements Function<Integer, RealQuasiPolynomial>, Typesettable, AutoCloseable, Initializable
{
  public boolean             isInitialized;
  Integer                    cℤ2;
  Integer                    cℤ1;
  public Integer             p;
  public Integer             q;
  public Real                α;
  public Real                β;
  public Integer             N;
  public RealQuasiPolynomial valueqXℝ2;
  public Integer             endIndexℤ3;
  public Integer             endIndexℤ2;
  public RealQuasiPolynomial valueqXℝ3;
  public RealQuasiPolynomial qXℝ1;
  public RealQuasiPolynomial qXℝ2;
  public RealQuasiPolynomial qXℝ3;
  public RealQuasiPolynomial qXℝ4;
  public RealQuasiPolynomial qXℝ5;
  public Integer             ℤ1;
  public Integer             k;
  public RealQuasiPolynomial prodqXℝ2;
  public RealQuasiPolynomial prodqXℝ1;
  public factorqXℝ2          factorqXℝ2 = new factorqXℝ2();
  public factorqXℝ3          factorqXℝ3 = new factorqXℝ3();

  @Override
  public Class<RealQuasiPolynomial> coDomainType()
  {
    return RealQuasiPolynomial.class;
  }

  @Override
  public RealQuasiPolynomial evaluate(Integer n, int order, int bits, RealQuasiPolynomial result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    RealQuasiPolynomial var10000 = result.identity().pow(cℤ2, bits, qXℝ1).neg(bits, qXℝ2).pow(n, bits, qXℝ3);
    factorqXℝ2.n = n;
    prodqXℝ1.multiplicativeIdentity();
    k.set(cℤ1);
    Integer index = k;
    endIndexℤ2.set(p);

    while (index.compareTo(endIndexℤ2) <= 0)
    {
      prodqXℝ1.mul(factorqXℝ2.evaluate(k, bits, valueqXℝ2), bits);
      index = k.increment();
    }

    var10000     = var10000.mul(prodqXℝ1, bits, qXℝ4);
    index     = n.factorial(bits, ℤ1);
    factorqXℝ3.n = n;
    prodqXℝ2.multiplicativeIdentity();
    k.set(cℤ1);
    Integer var10002 = k;
    endIndexℤ3.set(q);

    while (var10002.compareTo(endIndexℤ3) <= 0)
    {
      prodqXℝ2.mul( factorqXℝ3.evaluate(k, bits, valueqXℝ3), bits);
      var10002 = k.increment();
    }

    return var10000.div(index.mul(prodqXℝ2, bits, qXℝ5), bits, result);
  }

  public factorqXℝ1()
  {
    cℤ2        = new Integer("2");
    cℤ1        = new Integer("1");
    valueqXℝ2  = new RealQuasiPolynomial();
    endIndexℤ3 = new Integer();
    endIndexℤ2 = new Integer();
    valueqXℝ3  = new RealQuasiPolynomial();
    qXℝ1       = new RealQuasiPolynomial();
    qXℝ2       = new RealQuasiPolynomial();
    qXℝ3       = new RealQuasiPolynomial();
    qXℝ4       = new RealQuasiPolynomial();
    qXℝ5       = new RealQuasiPolynomial();
    ℤ1         = new Integer();
    k          = new Integer();
    prodqXℝ2   = new RealQuasiPolynomial();
    prodqXℝ1   = new RealQuasiPolynomial();
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
      factorqXℝ2.p  = p;
      factorqXℝ2.q  = q;
      factorqXℝ2.α  = α;
      factorqXℝ2.β  = β;
      factorqXℝ2.N  = N;
      factorqXℝ3.p  = p;
      factorqXℝ3.q  = q;
      factorqXℝ3.α  = α;
      factorqXℝ3.β  = β;
      factorqXℝ3.N  = N;
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ2.close();
    cℤ1.close();
    valueqXℝ2.close();
    endIndexℤ3.close();
    endIndexℤ2.close();
    valueqXℝ3.close();
    qXℝ1.close();
    qXℝ2.close();
    qXℝ3.close();
    qXℝ4.close();
    qXℝ5.close();
    ℤ1.close();
    k.close();
    prodqXℝ2.close();
    prodqXℝ1.close();
    factorqXℝ2.close();
    factorqXℝ3.close();
  }

  @Override
  public String toString()
  {
    return "factorqXℝ1:n➔(((neg(z^2))^n)*Πk➔α[k]⋰n{k=1…p})/((n!)*Πk➔β[k]⋰n{k=1…q})";
  }

  @Override
  public String typeset()
  {
    return "\\frac{((\\neg{(z)^{(2)}})^{(n)} \\cdot \\prod_{k = 1}^{p}{(α_{k})_{n}})}{(n! \\cdot \\prod_{k = 1}^{q}{(β_{k})_{n}})}";
  }
}
