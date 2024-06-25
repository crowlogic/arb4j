package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealQuasiPolynomial;
import arb.Typesettable;
import arb.functions.sequences.Sequence;

public class R implements Sequence<RealQuasiPolynomial>, Typesettable, AutoCloseable, Initializable
{
  public boolean             isInitialized;
  Integer                    cℤ2  = new Integer("1");
  Integer                    cℤ1  = new Integer("2");
  public RealQuasiPolynomial qXℝ1 = new RealQuasiPolynomial();
  public RealQuasiPolynomial qXℝ2 = new RealQuasiPolynomial();
  public RealQuasiPolynomial qXℝ3 = new RealQuasiPolynomial();
  public RealQuasiPolynomial qXℝ4 = new RealQuasiPolynomial();
  public RealQuasiPolynomial qXℝ5 = new RealQuasiPolynomial();
  public Real                vℝ2  = new Real();
  public Real                vℝ1  = new Real();
  public Real                ℝ1   = new Real();
  public Real                ℝ2   = new Real();
  public Real                ℝ3   = new Real();
  public Real                ℝ4   = new Real();
  public RealQuasiPolynomial qXℝ6 = new RealQuasiPolynomial();
  public Real                ℝ5   = new Real();
  public Real                ℝ6   = new Real();
  public Real                ℝ7   = new Real();
  public Real                ℝ8   = new Real();

  @Override
  public Class<RealQuasiPolynomial> coDomainType()
  {
    return RealQuasiPolynomial.class;
  }

  @Override
  public RealQuasiPolynomial evaluate(Integer n, int order, int bits, RealQuasiPolynomial result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    return result.identity()
                 .ascendingFactorial(n, bits, this.qXℝ1)
                 .mul(result.identity().div(this.cℤ1, bits, this.qXℝ2).pow(n.neg(this.qXℝ3), bits, this.qXℝ4),
                      bits,
                      this.qXℝ5)
                 .mul(new RealQuasiPolynomial(this.vℝ1.set(new Real[]
                 { this.cℤ2.div(this.cℤ1, bits, this.ℝ1).sub(n.div(this.cℤ1, bits, this.ℝ2), bits, this.ℝ3),
                   n.div(this.cℤ1, bits, this.ℝ4).neg(this.ℝ5) }),
                                              this.vℝ2.set(new Real[]
                                              { this.ℝ6.set(result.identity()), n.neg(this.ℝ7),
                                                this.cℤ2.sub(result.identity(), bits, this.qXℝ6)
                                                        .sub(n, bits, this.ℝ8) }),
                                              RealQuasiPolynomial.parse("-z^2")).evaluate(null, 1, bits, result),
                      bits,
                      result);
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else
    {
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ2.close();
    this.cℤ1.close();
    this.qXℝ1.close();
    this.qXℝ2.close();
    this.qXℝ3.close();
    this.qXℝ4.close();
    this.qXℝ5.close();
    this.vℝ2.close();
    this.vℝ1.close();
    this.ℝ1.close();
    this.ℝ2.close();
    this.ℝ3.close();
    this.ℝ4.close();
    this.qXℝ6.close();
    this.ℝ5.close();
    this.ℝ6.close();
    this.ℝ7.close();
    this.ℝ8.close();
  }

  @Override
  public String toString()
  {
    return "n➔v₍ₙ₎*(z/2)^(-n)*pFq([1/2-n/2,-n/2],[v,-n,1-v-n],-z^2)";
  }

  @Override
  public String typeset()
  {
    return "(v)_{n} \\cdot \\frac{z}{2}^-n \\cdot \\pFq{-z^2}";
  }
}
