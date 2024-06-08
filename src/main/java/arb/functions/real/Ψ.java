package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.RealConstants;
import arb.RealQuasiPolynomial;
import arb.Typesettable;
import arb.arblib;
import arb.functions.sequences.Sequence;

public class Ψ implements Sequence<RealQuasiPolynomial>, Typesettable, AutoCloseable, Initializable
{
  public boolean             isInitialized;
  Integer                    cℤ2  = new Integer("4");
  Integer                    cℤ1  = new Integer("2");
  Integer                    cℤ4  = new Integer("0");
  Integer                    cℤ3  = new Integer("1");
  public RealQuasiPolynomial qXℝ1 = new RealQuasiPolynomial();
  public RealQuasiPolynomial qXℝ2 = new RealQuasiPolynomial();
  public Integer             ℤ4   = new Integer();
  public RealQuasiPolynomial qXℝ3 = new RealQuasiPolynomial();
  public Integer             ℤ5   = new Integer();
  public RealQuasiPolynomial qXℝ4 = new RealQuasiPolynomial();
  public Integer             ℤ6   = new Integer();
  public RealQuasiPolynomial qXℝ5 = new RealQuasiPolynomial();
  public RealQuasiPolynomial qXℝ6 = new RealQuasiPolynomial();
  public Integer             ℤ1   = new Integer();
  public Integer             ℤ2   = new Integer();
  public Integer             ℤ3   = new Integer();

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

    RealQuasiPolynomial var10000 = RealConstants.half.mul(cℤ1.mul(cℤ2.mul(n, bits, ℤ1).add(cℤ3, bits, ℤ2), bits, ℤ3)
                                                             .div(result.identity(), bits, qXℝ1)
                                                             .sqrt(bits, qXℝ2),
                                                          bits,
                                                          qXℝ3)
                                                     .mul(cℤ4.sub(cℤ3, bits, ℤ4).pow(n, bits, ℤ5), bits, qXℝ4);
    RealQuasiPolynomial var10001 = qXℝ5;
    arblib.arb_hypgeom_bessel_j(qXℝ5,
                                cℤ1.mul(n, bits, ℤ6).add(RealConstants.half, bits, qXℝ6),
                                result.identity(),
                                bits);
    return var10000.mul(var10001, bits, result);
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
    cℤ4.close();
    cℤ3.close();
    qXℝ1.close();
    qXℝ2.close();
    ℤ4.close();
    qXℝ3.close();
    ℤ5.close();
    qXℝ4.close();
    ℤ6.close();
    qXℝ5.close();
    qXℝ6.close();
    ℤ1.close();
    ℤ2.close();
    ℤ3.close();
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
