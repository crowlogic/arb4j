package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.Typesettable;

public class F implements RealPolynomialNullaryFunction, Typesettable, AutoCloseable, Initializable
{
  public boolean        isInitialized;
  Integer               cℤ1;
  public Integer        p;
  public Integer        q;
  public Real           α;
  public Real           β;
  public Integer        N;
  public Integer        endIndexℤ1;
  public RealPolynomial sumXℝ1;
  public RealPolynomial valueXℝ1;
  public Integer        n;
  public factorXℝ1      factorXℝ1 = new factorXℝ1();

  @Override
  public Class<RealPolynomial> coDomainType()
  {
    return RealPolynomial.class;
  }

  @Override
  public RealPolynomial evaluate(Object in, int order, int bits, RealPolynomial result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    sumXℝ1.additiveIdentity();
    n.set(cℤ1);
    Integer var10000 = n;
    endIndexℤ1.set(N);

    while (var10000.compareTo(endIndexℤ1) <= 0)
    {
      factorXℝ1.evaluate(n, bits, valueXℝ1);
      System.out.format("summand[%s]=%s\n", var10000, valueXℝ1 );
      sumXℝ1.add(valueXℝ1, bits);
      var10000 = n.increment();
    }

    return result.set(sumXℝ1);
  }

  public F()
  {
    cℤ1        = new Integer("0");
    endIndexℤ1 = new Integer();
    sumXℝ1     = new RealPolynomial();
    valueXℝ1   = new RealPolynomial();
    n          = new Integer();
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
      factorXℝ1.p   = p;
      factorXℝ1.q   = q;
      factorXℝ1.α   = α;
      factorXℝ1.β   = β;
      factorXℝ1.N   = N;
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ1.close();
    endIndexℤ1.close();
    sumXℝ1.close();
    valueXℝ1.close();
    n.close();
    factorXℝ1.close();
  }

  @Override
  public String toString()
  {
    return "F:Σn➔((((1/2)-(z/2))^n)*Πk➔α[k]⋰n{k=1…p})/((n!)*Πk➔β[k]⋰n{k=1…q}){n=0…N}";
  }

  @Override
  public String typeset()
  {
    return "\\add_{n = 0}^{N}{\\frac{\\left((\\left(\\frac{1}{2}-\\frac{z}{2}\\right))^{(n)} \\cdot \\prod_{k = 1}^{p}{(α_{k})_{n}}\\right)}{\\left(n! \\cdot \\prod_{k = 1}^{q}{(β_{k})_{n}}\\right)}}";
  }
}
