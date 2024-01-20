package arb.functions;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;

public class P implements
               Function<Integer, RealPolynomial>
{
  public Integer                           const1 = new Integer("0");
  public Integer                           const2 = new Integer("1");
  public Integer                           const3 = new Integer("2");
  public Real                              α;
  public Real                              β;
  public Real                              r1     = new Real();
  public Real                              r2     = new Real();
  public RealPolynomial                    rp1    = new RealPolynomial();
  public RealPolynomial                    rp2    = new RealPolynomial();
  public RealPolynomial                    rp3    = new RealPolynomial();
  public RealPolynomial                    rp4    = new RealPolynomial();
  public Integer                           i1     = new Integer();
  public RealPolynomial                    rp5    = new RealPolynomial();
  public RealPolynomial                    rp6    = new RealPolynomial();
  public Real                              r3     = new Real();
  public Real                              r4     = new Real();
  public Integer                           i2     = new Integer();
  public RealPolynomial                    rp7    = new RealPolynomial();
  public RealPolynomial                    rp8    = new RealPolynomial();
  public RealPolynomial                    rp9    = new RealPolynomial();
  public Real                              r5     = new Real();
  public Real                              r6     = new Real();
  public Function<Integer, RealPolynomial> P;
  public Function<Integer, RealPolynomial> A;
  public Function<Real, Real>              B;
  public Function<Real, Real>              C;
  public Function<Real, Real>              E;

  public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result)
  {
    if (α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("β is null");
    }
    else if (A == null)
    {
      throw new AssertionError("A is null");
    }
    else if (B == null)
    {
      throw new AssertionError("B is null");
    }
    else if (C == null)
    {
      throw new AssertionError("C is null");
    }
    else if (E == null)
    {
      throw new AssertionError("E is null");
    }
    else
    {
      return switch (in.getSignedValue())
      {
      case 0 -> result.set(const2);
      case 1 -> C.evaluate(r1.set(const2), order, bits, r2)
                 .mul(result.identity(), bits, rp1)
                 .sub(β, bits, rp2)
                 .add(α, bits, rp3)
                 .div(const3, bits, result);
      default ->
      {
        RealPolynomial var5 = A.evaluate(in, order, bits, rp4);
        if (P == null)
        {
          P = new P(this);
        }

        var5 = var5.mul(P.evaluate(in.sub(const2, bits, i1), order, bits, rp5), bits, rp6);
        Real var10001 = B.evaluate(r3.set(in), order, bits, r4);
        if (P == null)
        {
          P = new P(this);
        }

        yield var5.sub(var10001.mul(P.evaluate(in.sub(const3, bits, i2), order, bits, rp7), bits, rp8), bits, rp9)
                  .div(E.evaluate(r5.set(in), order, bits, r6), bits, result);
      }
      };
    }
  }

  public P()
  {
    initializeContextualFunctions();
  }

  public void initializeContextualFunctions()
  {
    A = new A();
    B = new B();
    C = new C();
    E = new E();
  }

  public P(P var1)
  {
    this();
    α = var1.α;
    β = var1.β;
  }

  public void close()
  {
    const1.close();
    const2.close();
    const3.close();
    r1.close();
    r2.close();
    rp1.close();
    rp2.close();
    rp3.close();
    rp4.close();
    i1.close();
    rp5.close();
    rp6.close();
    r3.close();
    r4.close();
    i2.close();
    rp7.close();
    rp8.close();
    rp9.close();
    r5.close();
    r6.close();
    P.close();
  }
}
