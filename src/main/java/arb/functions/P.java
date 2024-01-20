package arb.functions;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.real.RealFunction;

public class P implements
               Function<Integer, RealPolynomial>
{
  public Integer                           const1;
  public Integer                           const2;
  public Integer                           const3;
  public Real                              α;
  public Real                              β;
  public Real                              G;
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

  public RealPolynomial evaluate(final Integer in, final int order, final int bits, final RealPolynomial result)
  {
    if (this.α == null)
    {
      throw new AssertionError((Object) "α is null");
    }
    if (this.β == null)
    {
      throw new AssertionError((Object) "β is null");
    }
    if (this.A == null)
    {
      throw new AssertionError((Object) "A is null");
    }
    if (this.B == null)
    {
      throw new AssertionError((Object) "B is null");
    }
    if (this.C == null)
    {
      throw new AssertionError((Object) "C is null");
    }
    if (this.E == null)
    {
      throw new AssertionError((Object) "E is null");
    }
    return switch (in.getSignedValue())
    {
    case 0 -> result.set(this.const2);
    case 1 -> ((Real) ((RealFunction) this.C).evaluate((Object) this.r1.set(this.const2),
                                                       order,
                                                       bits,
                                                       (Object) this.r2)).mul(result.identity(), bits, this.rp1)
                                                                         .sub(this.β, bits, this.rp2)
                                                                         .add(this.α, bits, this.rp3)
                                                                         .div(this.const3,
                                                                              bits,
                                                                              (RealPolynomial) result);
    default ->
    {
      final RealPolynomial realPolynomial2 = (RealPolynomial) ((Function) this.A).evaluate((Object) in,
                                                                                           order,
                                                                                           bits,
                                                                                           (Object) this.rp4);
      if (this.P == null)
      {
        this.P = new P(this);
      }
      final RealPolynomial mul  = realPolynomial2.mul((RealPolynomial) ((Function) this.P).evaluate((Object) in.sub(this.const2,
                                                                                                                    bits,
                                                                                                                    this.i1),
                                                                                                    order,
                                                                                                    bits,
                                                                                                    (Object) this.rp5),
                                                      bits,
                                                      this.rp6);
      final Real           real = (Real) ((RealFunction) this.B).evaluate((Object) this.r3.set((Integer) in),
                                                                          order,
                                                                          bits,
                                                                          (Object) this.r4);
      if (this.P == null)
      {
        this.P = new P(this);
      }
      yield mul.sub(real.mul((RealPolynomial) ((Function) this.P).evaluate((Object) in.sub(this.const3,
                                                                                           bits,
                                                                                           this.i2),
                                                                           order,
                                                                           bits,
                                                                           (Object) this.rp7),
                             bits,
                             this.rp8),
                    bits,
                    this.rp9)
               .div((Real) ((RealFunction) this.E).evaluate((Object) this.r5.set((Integer) in),
                                                            order,
                                                            bits,
                                                            (Object) this.r6),
                    bits,
                    (RealPolynomial) result);
    }
    };
  }

  public P()
  {
    this.const1 = new Integer("0");
    this.const2 = new Integer("1");
    this.const3 = new Integer("2");
    this.r1     = new Real();
    this.r2     = new Real();
    this.rp1    = new RealPolynomial();
    this.rp2    = new RealPolynomial();
    this.rp3    = new RealPolynomial();
    this.rp4    = new RealPolynomial();
    this.i1     = new Integer();
    this.rp5    = new RealPolynomial();
    this.rp6    = new RealPolynomial();
    this.r3     = new Real();
    this.r4     = new Real();
    this.i2     = new Integer();
    this.rp7    = new RealPolynomial();
    this.rp8    = new RealPolynomial();
    this.rp9    = new RealPolynomial();
    this.r5     = new Real();
    this.r6     = new Real();
    this.initializeContextualFunctions();
  }

  public void initializeContextualFunctions()
  {
    final A a = new A();
    this.A   = new A();
    this.A.α = this.α;
    this.A.β = this.β;
    this.A.initializeContextualFunctions();
    this.A = a;
    final B b = new B();
    this.B   = new B();
    this.B.α = this.α;
    this.B.β = this.β;
    this.B.initializeContextualFunctions();
    this.B = b;
    final C c = new C();
    this.C   = new C();
    this.C.α = this.α;
    this.C.β = this.β;
    this.C.initializeContextualFunctions();
    this.C = c;
    final E e = new E();
    this.E   = new E();
    this.E.α = this.α;
    this.E.β = this.β;
    this.E.initializeContextualFunctions();
    this.E = e;
  }

  public P(final P p)
  {
    this();
    this.α = p.α;
    this.β = p.β;
  }

  public void close()
  {
    this.const1.close();
    this.const2.close();
    this.const3.close();
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