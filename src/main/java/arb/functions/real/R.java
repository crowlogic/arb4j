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
    if (!isInitialized)
    {
      initialize();
    }

    return result.identity()
                 .ascendingFactorial(n, bits, qXℝ1)
                 .mul(result.identity().div(cℤ1, bits, qXℝ2).pow(n.neg(qXℝ3), bits, qXℝ4), bits, qXℝ5)
                 .mul(new RealQuasiPolynomial(vℝ1.set(new Real[]
                 { cℤ2.div(cℤ1, bits, ℝ1).sub(n.div(cℤ1, bits, ℝ2), bits, ℝ3), n.div(cℤ1, bits, ℝ4).neg(ℝ5) }),
                                              vℝ2.set(new Real[]
                                              { ℝ6.set(result.identity()), n.neg(ℝ7),
                                                cℤ2.sub(result.identity(), bits, qXℝ6).sub(n, bits, ℝ8) }),
                                              RealQuasiPolynomial.parse("-z^2")).evaluate(null, 1, bits, result),
                      bits,
                      result);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else
    {
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ2.close();
    cℤ1.close();
    qXℝ1.close();
    qXℝ2.close();
    qXℝ3.close();
    qXℝ4.close();
    qXℝ5.close();
    vℝ2.close();
    vℝ1.close();
    ℝ1.close();
    ℝ2.close();
    ℝ3.close();
    ℝ4.close();
    qXℝ6.close();
    ℝ5.close();
    ℝ6.close();
    ℝ7.close();
    ℝ8.close();
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
