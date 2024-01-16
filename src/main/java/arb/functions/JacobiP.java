package arb.functions;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;

/**
 * bad *ASS*
 */
public class JacobiP implements
                     Function<Integer, RealPolynomial>
{
  public Integer                           c0  = new Integer("0");
  public Integer                           c1  = new Integer("1");
  public Integer                           c2  = new Integer("2");
  public Real                              α;
  public Real                              β;

  public Real                              r0  = new Real();
  public Real                              r1  = new Real();
  public RealPolynomial                    rp0 = new RealPolynomial();
  public RealPolynomial                    rp1 = new RealPolynomial();
  public RealPolynomial                    rp2 = new RealPolynomial();
  public RealPolynomial                    rp3 = new RealPolynomial();
  public Integer                           i0  = new Integer();
  public RealPolynomial                    rp4 = new RealPolynomial();
  public RealPolynomial                    rp5 = new RealPolynomial();
  public Real                              r2  = new Real();
  public Real                              r3  = new Real();
  public Integer                           i1  = new Integer();
  public RealPolynomial                    rp6 = new RealPolynomial();
  public RealPolynomial                    rp7 = new RealPolynomial();
  public RealPolynomial                    rp8 = new RealPolynomial();
  public Real                              r4  = new Real();
  public Real                              r5  = new Real();
  public Function<Integer, RealPolynomial> P   = null;
  public Function<Integer, RealPolynomial> A   = null;
  public Function<Real, Real>              B   = null;
  public Function<Real, Real>              C   = null;
  public Function<Real, Real>              E   = null;

  public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result)
  {
    RealPolynomial var10000;
    switch (in.getSignedValue())
    {
    case 0:
      var10000 = result.set(c1);
      break;
    case 1:
      var10000 = C.evaluate(r0.set(c1), order, bits, r1)
                  .mul(result.identity(), bits, rp0)
                  .sub(β, bits, rp1)
                  .add(α, bits, rp2)
                  .div(c2, bits, result);
      break;
    default:
      var10000 = A.evaluate(in, order, bits, rp3)
                  .mul(P.evaluate(in.sub(c1, bits, i0), order, bits, rp4), bits, rp5)
                  .sub(B.evaluate(r2.set(in), order, bits, r3)
                        .mul(P.evaluate(in.sub(c2, bits, i1), order, bits, rp6), bits, rp7),
                       bits,
                       rp8)
                  .div(E.evaluate(r4.set(in), order, bits, r5), bits, result);
    }

    return var10000;
  }

  public void close()
  {
    c0.close();
    c1.close();
    c2.close();
    r0.close();
    r1.close();
    rp0.close();
    rp1.close();
    rp2.close();
    rp3.close();
    i0.close();
    rp4.close();
    rp5.close();
    r2.close();
    r3.close();
    i1.close();
    rp6.close();
    rp7.close();
    rp8.close();
    r4.close();
    r5.close();
  }
}
