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
  public Integer             ℤ1   = new Integer();
  public Real                vℝ2  = new Real();
  public Real                vℝ1  = new Real();
  public Real                ℝ1   = new Real();
  public Real                ℝ2   = new Real();
  public Real                ℝ3   = new Real();
  public Real                ℝ4   = new Real();
  public RealQuasiPolynomial qXℝ6 = new RealQuasiPolynomial();
  public RealQuasiPolynomial qXℝ7 = new RealQuasiPolynomial();
  public Real                ℝ5   = new Real();
  public Real                ℝ6   = new Real();

  @Override
  public Class<RealQuasiPolynomial> coDomainType()
  {
    return RealQuasiPolynomial.class;
  }

  @Override
  public RealQuasiPolynomial evaluate(Integer v, int order, int bits, RealQuasiPolynomial result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return v.ascendingFactorial(result.identity(), bits, qXℝ1)
            .mul(result.identity().div(cℤ1, bits, qXℝ2).pow(result.identity().neg(qXℝ3), bits, qXℝ4), bits, qXℝ5)
            .mul(new RealQuasiPolynomial(vℝ1.set(new Real[]
            { cℤ2.div(cℤ1, bits, ℝ1).sub(result.identity().div(cℤ1, bits, qXℝ6), bits, ℝ2),
              result.identity().div(cℤ1, bits, qXℝ7).neg(ℝ3) }),
                                         vℝ2.set(new Real[]
                                         { ℝ4.set(v), result.identity().neg(ℝ5),
                                           cℤ2.sub(v, bits, ℤ1).sub(result.identity(), bits, ℝ6) }),
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
    ℤ1.close();
    vℝ2.close();
    vℝ1.close();
    ℝ1.close();
    ℝ2.close();
    ℝ3.close();
    ℝ4.close();
    qXℝ6.close();
    qXℝ7.close();
    ℝ5.close();
    ℝ6.close();
  }

  @Override
  public String toString()
  {
    return "v➔v₍ₙ₎*(z/2)^(-n)*pFq([1/2-n/2,-n/2],[v,-n,1-v-n],-z^2)";
  }

  @Override
  public String typeset()
  {
    return "(v)_{n} \\cdot \\frac{z}{2}^-n \\cdot \\pFq{-z^2}";
  }
}
