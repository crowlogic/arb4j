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
    switch (((Integer) in).getSignedValue())
    {
    case 0:
      var10000 = ((RealPolynomial) result).set(this._c1);
      break;
    case 1:
      var10000 = ((Real) this.C.evaluate(this.r1.set(this._c1),
                                         order,
                                         bits,
                                         this.r2)).mul(((RealPolynomial) result).identity(), bits, this.rp1)
                                                  .sub(this.β, bits, this.rp2)
                                                  .add(this.α, bits, this.rp3)
                                                  .div(this._c2, bits, (RealPolynomial) result);
      break;
    default:
      var10000 = (RealPolynomial) this.A.evaluate((Integer) in, order, bits, this.rp4);
      if (this.P == null)
      {
        this.P = new P(this);
      }

      var10000 = var10000.mul((RealPolynomial) this.P.evaluate(((Integer) in).sub(this._c1, bits, this.i1),
                                                               order,
                                                               bits,
                                                               this.rp5),
                              bits,
                              this.rp6);
      Real var10001 = (Real) this.B.evaluate(this.r3.set((Integer) in), order, bits, this.r4);
      if (this.P == null)
      {
        this.P = new P(this);
      }

      var10000 = var10000.sub(var10001.mul((RealPolynomial) this.P.evaluate(((Integer) in).sub(this._c2,
                                                                                               bits,
                                                                                               this.i2),
                                                                            order,
                                                                            bits,
                                                                            this.rp7),
                                           bits,
                                           this.rp8),
                              bits,
                              this.rp9)
                         .div((Real) this.E.evaluate(this.r5.set((Integer) in), order, bits, this.r6),
                              bits,
                              (RealPolynomial) result);
    }

    return var10000;
  }

  public P()
  {
    this._c0 = new Integer("0");
    this._c1 = new Integer("1");
    this._c2 = new Integer("2");
    this.r1  = new Real();
    this.r2  = new Real();
    this.rp1 = new RealPolynomial();
    this.rp2 = new RealPolynomial();
    this.rp3 = new RealPolynomial();
    this.rp4 = new RealPolynomial();
    this.i1  = new Integer();
    this.rp5 = new RealPolynomial();
    this.rp6 = new RealPolynomial();
    this.r3  = new Real();
    this.r4  = new Real();
    this.i2  = new Integer();
    this.rp7 = new RealPolynomial();
    this.rp8 = new RealPolynomial();
    this.rp9 = new RealPolynomial();
    this.r5  = new Real();
    this.r6  = new Real();
    this.P   = this;
//    this.A   = new A();
//    this.B   = new B();;
//    this.C   = new C();
//    this.E   = new E();
  }

  public P(P var1)
  {
    this();
    this.α = var1.α;
    this.β = var1.β;
  }

  public void close()
  {
    this._c0.close();
    this._c1.close();
    this._c2.close();
    this.r1.close();
    this.r2.close();
    this.rp1.close();
    this.rp2.close();
    this.rp3.close();
    this.rp4.close();
    this.i1.close();
    this.rp5.close();
    this.rp6.close();
    this.r3.close();
    this.r4.close();
    this.i2.close();
    this.rp7.close();
    this.rp8.close();
    this.rp9.close();
    this.r5.close();
    this.r6.close();
    this.P.close();
  }
}
