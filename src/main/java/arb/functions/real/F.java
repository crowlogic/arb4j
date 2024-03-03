package arb.functions.real;

import static java.lang.System.out;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.Function;

public class F implements
               Function<Integer, RealPolynomial>
{
  public static void main(String args[])
  {
    try ( F F = new F())
    {
      F.p = new Integer(2);
      F.q = new Integer(1);
      F.α = Real.newVector(2);
      F.β = Real.newVector(1);
      F.β.set(-0.5);
      F.α.set(-3, 7.5);
      F.F = new F();
      F.initialize();

      try ( var index = new Integer())
      {
        for (int n = 0; n < 10; n++)
        {
          RealPolynomial fn = F.F.evaluate(index.set(n), 0, 128, new RealPolynomial());
          out.format("F(%d,x)=%s\n", n, fn);
        }
      }
    }
  }

  private boolean       isInitialized;
  Integer               c1;
  Integer               c2;
  public Integer        p;
  public Integer        q;
  public Real           α;
  public Real           β;
  public Integer        ℤ1;
  public RealPolynomial r̅1;
  public RealPolynomial r̅2;
  public Real           valueℝ1;
  public Integer        k;
  public Real           productℝ1;
  public Integer        endIndexℤ1;
  public RealPolynomial r̅3;
  public Integer        ℤ3;
  public Integer        ℤ2;
  public RealPolynomial r̅5;
  public Real           valueℝ2;
  public Real           productℝ2;
  public Integer        endIndexℤ2;
  public Real           ℝ1;
  public F              F;
  public final factorℝ2 factorℝ2 = new factorℝ2();
  public final factorℝ1 factorℝ1 = new factorℝ1();

  public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    RealPolynomial var10000;
    switch (in.getSignedValue())
    {
    case 0:
      var10000 = result.set(c2);
      break;
    default:
      var10000 = result.identity().mul(F.evaluate(in.sub(c2, bits, ℤ1), order, bits, r̅1), bits, r̅2);
      factorℝ1.n = in;
      productℝ1.multiplicativeIdentity();
      k.set(c2);
      endIndexℤ1.set(p);

      do
      {
        productℝ1.mul(factorℝ1.evaluate(k, bits, valueℝ1), bits);
      }
      while (k.increment().compareTo(endIndexℤ1) <= 0);

      var10000 = var10000.mul(productℝ1, bits, r̅3);
      Integer var10002 = in.sub(c2, bits, ℤ3).factorial(bits, ℤ2);
      factorℝ2.n = in;
      productℝ2.multiplicativeIdentity();
      k.set(c2);
      endIndexℤ2.set(q);

      do
      {
        productℝ2.mul(factorℝ2.evaluate(k, bits, valueℝ2), bits);
      }
      while (k.increment().compareTo(endIndexℤ2) <= 0);

      result.div(var10002.mul(productℝ2, bits, ℝ1), bits, result);
    }

    return var10000;
  }

  public F()
  {
    c1         = new Integer("0");
    c2         = new Integer("1");
    ℤ1         = new Integer();
    r̅1        = new RealPolynomial();
    r̅2        = new RealPolynomial();
    valueℝ1    = new Real();
    k          = new Integer();
    productℝ1  = new Real();
    endIndexℤ1 = new Integer();
    r̅3        = new RealPolynomial();
    ℤ3         = new Integer();
    ℤ2         = new Integer();
    r̅5        = new RealPolynomial();
    valueℝ2    = new Real();
    productℝ2  = new Real();
    endIndexℤ2 = new Integer();
    ℝ1         = new Real();
  }

  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (p == null)
    {
      throw new AssertionError("p is null");
    }
    else if (q == null)
    {
      throw new AssertionError("q is null");
    }
    else
    {
      factorℝ2.p    = p;
      factorℝ2.q    = q;
      factorℝ2.α    = α;
      factorℝ2.β    = β;
      factorℝ1.p    = p;
      factorℝ1.q    = q;
      factorℝ1.α    = α;
      factorℝ1.β    = β;
      F             = new F();
      F.p           = p;
      F.q           = q;
      F.α           = α;
      F.β           = β;
      isInitialized = true;
    }
  }

  public void close()
  {
    c1.close();
    c2.close();
    ℤ1.close();
    r̅1.close();
    r̅2.close();
    valueℝ1.close();
    k.close();
    productℝ1.close();
    endIndexℤ1.close();
    r̅3.close();
    ℤ3.close();
    ℤ2.close();
    r̅5.close();
    valueℝ2.close();
    productℝ2.close();
    endIndexℤ2.close();
    ℝ1.close();
    if (F != null)
    {
      F.close();
    }
  }
}
