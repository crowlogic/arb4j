package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealQuasiPolynomial;
import arb.Typesettable;
import arb.functions.polynomials.quasi.real.RealHypergeometricQuasiPolynomial;
import arb.functions.sequences.Sequence;

public class R implements Sequence<RealQuasiPolynomial>, Typesettable, AutoCloseable, Initializable
{
  public boolean             isInitialized;
  Integer                    cℤ2  = new Integer("1");
  Integer                    cℤ1  = new Integer("2");
  public Real                v;
  public RealQuasiPolynomial qXℝ1 = new RealQuasiPolynomial();
  public RealQuasiPolynomial qXℝ2 = new RealQuasiPolynomial();
  public RealQuasiPolynomial qXℝ3 = new RealQuasiPolynomial();
  public RealQuasiPolynomial qXℝ4 = new RealQuasiPolynomial();
  public Real                vℝ2  = new Real();
  public Real                vℝ1  = new Real();
  public Real                ℝ1   = new Real();
  public Real                ℝ2   = new Real();
  public Real                ℝ3   = new Real();
  public Real                ℝ4   = new Real();
  public Real                ℝ9   = new Real();
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

    return v.ascendingFactorial(n, bits, ℝ1)
            .mul(result.identity().div(cℤ1, bits, qXℝ1).pow(n.neg(qXℝ2), bits, qXℝ3), bits, qXℝ4)
            .mul(new RealHypergeometricQuasiPolynomial(vℝ1.set(new Real[]
            { cℤ2.div(cℤ1, bits, ℝ2).sub(n.div(cℤ1, bits, ℝ3), bits, ℝ4), n.div(cℤ1, bits, ℝ5).neg(ℝ6) }),
                                                       vℝ2.set(new Real[]
                                                       { v, n.neg(ℝ7), cℤ2.sub(v, bits, ℝ8).sub(n, bits, ℝ9) }),
                                                       RealQuasiPolynomial.parse("-z^2")).evaluate(null,
                                                                                                   1,
                                                                                                   bits,
                                                                                                   result),
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
    else if (v == null)
    {
      throw new AssertionError("v shan't be null");
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
    vℝ2.close();
    vℝ1.close();
    ℝ1.close();
    ℝ2.close();
    ℝ3.close();
    ℝ4.close();
    ℝ9.close();
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
