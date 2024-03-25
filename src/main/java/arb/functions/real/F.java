package arb.functions.real;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;

public class F implements
               RealPolynomialNullaryFunction
{
  private boolean       isInitialized;
  Integer               c1;
  public Integer        p;
  public Integer        q;
  public Real           α;
  public Real           β;
  public Integer        N;
  public RealPolynomial valueP1;
  public Integer        n;
  public RealPolynomial sumP1;
  public Integer        endIndexℤ3;
  public final factorP1 factorP1 = new factorP1();

  public RealPolynomial evaluate(Void in, int order, int bits, RealPolynomial result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    sumP1.additiveIdentity();
    n.set(c1);
    endIndexℤ3.set(N);

    do
    {
      sumP1.add(factorP1.evaluate(n, bits, valueP1), bits);
    }
    while (n.increment().compareTo(endIndexℤ3) <= 0);

    return (result).set(sumP1);
  }

  public F()
  {
    c1         = new Integer("0");
    valueP1    = new RealPolynomial();
    n          = new Integer();
    sumP1      = new RealPolynomial();
    endIndexℤ3 = new Integer();
  }

  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (N == null)
    {
      throw new AssertionError("N is null");
    }
    else
    {
      factorP1.p    = p;
      factorP1.q    = q;
      factorP1.α    = α;
      factorP1.β    = β;
      factorP1.N    = N;
      isInitialized = true;
    }
  }

  public void close()
  {
    c1.close();
    valueP1.close();
    n.close();
    sumP1.close();
    endIndexℤ3.close();
  }

  public String toString()
  {
    return "F:Σn➔z^n*∏k➔α[k]₍ₙ₎{k=1…p}/(n!*∏k➔β[k]₍ₙ₎{k=1…q}){n=0…N}";
  }
}
