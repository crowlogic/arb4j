package arb.functions;

import static java.lang.System.out;

import java.util.ArrayList;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;

public class P implements
               Function<Integer, RealPolynomial>
{
  public static void main(String args[])
  {
    ArrayList<RealPolynomial> polys = new ArrayList<>();

    try ( P P = new P())
    {
      P.α = new Real("-0.50",
                     128);
      P.β = new Real("-0.50",
                     128);
      P.initializeContext();
      for (int n = 0; n < 10; n++)
      {
        RealPolynomial p = P.evaluate(new Integer(n), 1024, new RealPolynomial());
        polys.add(p);
        out.format("P(%d,x)=%s\n", n, p);
      }
    }
    // ShellFunctions.plot(-1, 1, 1000, polys.toArray(new
    // RealPolynomial[polys.size()]));

  }

  private boolean       isInitialized;
  public Integer        const1 = new Integer("0");
  public Integer        const2 = new Integer("1");
  public Integer        const3 = new Integer("2");
  public Real           α;
  public Real           β;
  public Real           ℝ1     = new Real();
  public Real           ℝ2     = new Real();
  public RealPolynomial 𝕽1    = new RealPolynomial();
  public RealPolynomial 𝕽2    = new RealPolynomial();
  public RealPolynomial 𝕽3    = new RealPolynomial();
  public RealPolynomial 𝕽4    = new RealPolynomial();
  public Integer        ℤ1     = new Integer();
  public RealPolynomial 𝕽5    = new RealPolynomial();
  public RealPolynomial 𝕽6    = new RealPolynomial();
  public Real           ℝ3     = new Real();
  public Real           ℝ4     = new Real();
  public Integer        ℤ2     = new Integer();
  public RealPolynomial 𝕽7    = new RealPolynomial();
  public RealPolynomial 𝕽8    = new RealPolynomial();
  public RealPolynomial 𝕽9    = new RealPolynomial();
  public Real           ℝ5     = new Real();
  public Real           ℝ6     = new Real();
  public P              P;
  public A              A;
  public B              B;
  public C              C;
  public E              E;
  public F              F;
  public G              G;

  public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result)
  {
    if (!this.isInitialized)
    {
      this.initializeContext();
    }

    if (this.α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      return switch (in.getSignedValue())
      {
      case 0 -> result.set(this.const2);
      case 1 -> ((Real) this.C.evaluate(this.ℝ1.set(this.const2), order, bits, this.ℝ2))
                                                                                        .mul(result.identity(),
                                                                                             bits,
                                                                                             this.𝕽1)
                                                                                        .sub(this.β, bits, this.𝕽2)
                                                                                        .add(this.α, bits, this.𝕽3)
                                                                                        .div(this.const3,
                                                                                             bits,
                                                                                             result);
      default ->
      {
        RealPolynomial var5 = (RealPolynomial) this.A.evaluate(in, order, bits, this.𝕽4);
        if (this.P == null)
        {
          this.P = new P(this);
        }

        var5 = var5.mul((RealPolynomial) this.P.evaluate(in.sub(this.const2, bits, this.ℤ1), order, bits, this.𝕽5),
                        bits,
                        this.𝕽6);
        Real var10001 = (Real) this.B.evaluate(this.ℝ3.set(in), order, bits, this.ℝ4);
        if (this.P == null)
        {
          this.P = new P(this);
        }

        yield var5.sub(var10001.mul((RealPolynomial) this.P.evaluate(in.sub(this.const3, bits, this.ℤ2),
                                                                     order,
                                                                     bits,
                                                                     this.𝕽7),
                                    bits,
                                    this.𝕽8),
                       bits,
                       this.𝕽9)
                  .div((Real) this.E.evaluate(this.ℝ5.set(in), order, bits, this.ℝ6), bits, result);
      }
      };
    }
  }

  public P()
  {
  }

  public void initializeContext()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (this.α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      A var10001 = this.A = new A();
      this.A.α = this.α;
      this.A.β = this.β;
      this.A   = var10001;
      B var1 = this.B = new B();
      this.B.α = this.α;
      this.B.β = this.β;
      this.B   = var1;
      C var2 = this.C = new C();
      this.C.α = this.α;
      this.C.β = this.β;
      this.C   = var2;
      E var3 = this.E = new E();
      this.E.α           = this.α;
      this.E.β           = this.β;
      this.E             = var3;
      this.isInitialized = true;
    }
  }

  public P(P var1)
  {
    this();
    if (var1.α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (var1.β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      this.α = var1.α;
      this.β = var1.β;
    }
  }

  public void close()
  {
    this.const1.close();
    this.const2.close();
    this.const3.close();
    this.ℝ1.close();
    this.ℝ2.close();
    this.𝕽1.close();
    this.𝕽2.close();
    this.𝕽3.close();
    this.𝕽4.close();
    this.ℤ1.close();
    this.𝕽5.close();
    this.𝕽6.close();
    this.ℝ3.close();
    this.ℝ4.close();
    this.ℤ2.close();
    this.𝕽7.close();
    this.𝕽8.close();
    this.𝕽9.close();
    this.ℝ5.close();
    this.ℝ6.close();
    this.P.close();
  }
}
