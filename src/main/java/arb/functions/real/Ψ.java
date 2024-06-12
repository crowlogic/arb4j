package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.RealConstants;
import arb.RealQuasiPolynomial;
import arb.Typesettable;
import arb.functions.sequences.Sequence;

public class Ψ implements Sequence<RealQuasiPolynomial>, Typesettable, AutoCloseable, Initializable
{
  public boolean             isInitialized;
  Integer                    cℤ2  = new Integer("4");
  Integer                    cℤ1  = new Integer("2");
  Integer                    cℤ3  = new Integer("1");
  public RealQuasiPolynomial qXℝ1 = new RealQuasiPolynomial();
  public RealQuasiPolynomial qXℝ2 = new RealQuasiPolynomial();
  public RealQuasiPolynomial qXℝ3 = new RealQuasiPolynomial();
  public RealQuasiPolynomial qXℝ4 = new RealQuasiPolynomial();
  public RealQuasiPolynomial qXℝ5 = new RealQuasiPolynomial();
  public Integer             ℤ1   = new Integer();
  public Integer             ℤ2   = new Integer();
  public Integer             ℤ3   = new Integer();
  public Integer             ℤ4   = new Integer();
  public RealQuasiPolynomial qXℝ6 = new RealQuasiPolynomial();
  public RealQuasiPolynomial qXℝ7 = new RealQuasiPolynomial();
  public RealQuasiPolynomial qXℝ8 = new RealQuasiPolynomial();
  public RealQuasiPolynomial qXℝ9 = new RealQuasiPolynomial();

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

    RealConstants.half.mul(cℤ1.mul(cℤ2.mul(n, bits, ℤ1).add(1, ℤ2), bits, ℤ3)
                              .div(result.identity(), bits, qXℝ1)
                              .sqrt(bits, qXℝ2),
                           bits,
                           qXℝ3)
                      .mul(cℤ3.neg(qXℝ4).pow(n, bits, qXℝ5), bits, qXℝ6);
    return cℤ1.mul(n, bits, ℤ4).add(RealConstants.half, bits, qXℝ8).mul(qXℝ9, bits, result);
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
    cℤ3.close();
    qXℝ1.close();
    qXℝ2.close();
    qXℝ3.close();
    qXℝ4.close();
    qXℝ5.close();
    ℤ1.close();
    ℤ2.close();
    ℤ3.close();
    ℤ4.close();
    qXℝ6.close();
    qXℝ7.close();
    qXℝ8.close();
    qXℝ9.close();
  }

  @Override
  public String toString()
  {
    return "n➔½*√(2*(4*n+1)/y)*(-1)^n*J(2*n+½,y)";
  }

  @Override
  public String typeset()
  {
    return "\\frac{1}{2} \\cdot \\sqrt{\\frac{2 \\cdot 4 \\cdot n + 1}{y}} \\cdot -1^n \\cdot \\J{y}";
  }
}
