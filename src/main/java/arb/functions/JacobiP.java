package arb.functions;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;

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
    switch (((Integer) in).getSignedValue())
    {
    case 0:
      var10000 = ((RealPolynomial) result).set(this.c1);
      break;
    case 1:
      var10000 = ((Real) this.C.evaluate(this.r0.set(this.c1),
                                         order,
                                         bits,
                                         this.r1)).mul(((RealPolynomial) result).identity(), bits, this.rp0)
                                                  .sub(this.β, bits, this.rp1)
                                                  .add(this.α, bits, this.rp2)
                                                  .div(this.c2, bits, (RealPolynomial) result);
      break;
    default:
      var10000 = ((RealPolynomial) this.A.evaluate((Integer) in,
                                                   order,
                                                   bits,
                                                   this.rp3)).mul((RealPolynomial) this.P.evaluate(((Integer) in).sub(this.c1, bits, this.i0), order, bits, this.rp4), bits, this.rp5).sub(((Real) this.B.evaluate(this.r2.set((Integer) in), order, bits, this.r3)).mul((RealPolynomial) this.P.evaluate(((Integer) in).sub(this.c2, bits, this.i1), order, bits, this.rp6), bits, this.rp7), bits, this.rp8).div((Real) this.E.evaluate(this.r4.set((Integer) in), order, bits, this.r5), bits, (RealPolynomial) result);
    }

    return var10000;
  }

  public void close()
  {
    this.c0.close();
    this.c1.close();
    this.c2.close();
    this.r0.close();
    this.r1.close();
    this.rp0.close();
    this.rp1.close();
    this.rp2.close();
    this.rp3.close();
    this.i0.close();
    this.rp4.close();
    this.rp5.close();
    this.r2.close();
    this.r3.close();
    this.i1.close();
    this.rp6.close();
    this.rp7.close();
    this.rp8.close();
    this.r4.close();
    this.r5.close();
  }
}
