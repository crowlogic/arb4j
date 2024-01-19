package arb.functions;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;

public class P implements
               Function<Integer, RealPolynomial>
{
  public Integer                           _c0;
  public Integer                           _c1;
  public Integer                           _c2;
  public Real                              α;
  public Real                              β;
  public Real                              r1;
  public Real                              r2;
  public RealPolynomial                    rp1;
  public RealPolynomial                    rp2;
  public RealPolynomial                    rp3;
  public RealPolynomial                    rp4;
  public Integer                           i1;
  public RealPolynomial                    rp5;
  public RealPolynomial                    rp6;
  public Real                              r3;
  public Real                              r4;
  public Integer                           i2;
  public RealPolynomial                    rp7;
  public RealPolynomial                    rp8;
  public RealPolynomial                    rp9;
  public Real                              r5;
  public Real                              r6;
  public Function<Integer, RealPolynomial> P;
  public Function<Integer, RealPolynomial> A;
  public Function<Real, Real>              B;
  public Function<Real, Real>              C;
  public Function<Real, Real>              E;

  public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result)
  {
    RealPolynomial var10000;
    switch (in.getSignedValue())
    {
    case 0:
      var10000 = result.set(_c1);
      break;
    case 1:
      var10000 = C.evaluate(r1.set(_c1), order, bits, r2)
                  .mul(result.identity(), bits, rp1)
                  .sub(β, bits, rp2)
                  .add(α, bits, rp3)
                  .div(_c2, bits, result);
      break;
    default:
      var10000 = A.evaluate(in, order, bits, rp4);
      if (P == null)
      {
        P = new P(this);
      }

      var10000 = var10000.mul(P.evaluate(in.sub(_c1, bits, i1), order, bits, rp5), bits, rp6);
      Real var10001 = B.evaluate(r3.set(in), order, bits, r4);
      if (P == null)
      {
        P = new P(this);
      }

      var10000 = var10000.sub(var10001.mul(P.evaluate(in.sub(_c2, bits, i2), order, bits, rp7), bits, rp8),
                              bits,
                              rp9)
                         .div(E.evaluate(r5.set(in), order, bits, r6), bits, result);
    }

    return var10000;
  }

  public P()
  {
    _c0 = new Integer("0");
    _c1 = new Integer("1");
    _c2 = new Integer("2");
    r1  = new Real();
    r2  = new Real();
    rp1 = new RealPolynomial();
    rp2 = new RealPolynomial();
    rp3 = new RealPolynomial();
    rp4 = new RealPolynomial();
    i1  = new Integer();
    rp5 = new RealPolynomial();
    rp6 = new RealPolynomial();
    r3  = new Real();
    r4  = new Real();
    i2  = new Integer();
    rp7 = new RealPolynomial();
    rp8 = new RealPolynomial();
    rp9 = new RealPolynomial();
    r5  = new Real();
    r6  = new Real();
    A   = new A();
    B   = new B();
    C   = new C();
    E   = new E();
  }

  public P(P var1)
  {
    this();
    α = var1.α;
    β = var1.β;
  }

  public void close()
  {
    _c0.close();
    _c1.close();
    _c2.close();
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
