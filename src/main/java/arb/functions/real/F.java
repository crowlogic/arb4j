package arb.functions.real;

import arb.Complex;
import arb.ComplexQuasiPolynomial;
import arb.Initializable;
import arb.Integer;
import arb.Typesettable;
import arb.functions.polynomials.quasi.complex.ComplexHypergeometricQuasiPolynomial;
import arb.functions.sequences.Sequence;

public class F implements Sequence<ComplexQuasiPolynomial>, Typesettable, AutoCloseable, Initializable
{
  public boolean isInitialized;
  Integer        cℤ2 = new Integer("2");
  Integer        cℤ1 = new Integer("1");
  public Complex vℂ1 = new Complex();
  public Complex ℂ4  = new Complex();
  public Complex ℂ3  = new Complex();
  public Complex ℂ2  = new Complex();
  public Complex vℂ2 = new Complex();
  public Complex ℂ1  = new Complex();

  public static void main(String arg[])
  {
    F                      f  = new F();
    ComplexQuasiPolynomial f3 = f.evaluate(3, 128);
    System.out.println("f3=" + f3);
  }

  @Override
  public Class<ComplexQuasiPolynomial> coDomainType()
  {
    return ComplexQuasiPolynomial.class;
  }

  @Override
  public ComplexQuasiPolynomial evaluate(Integer n, int order, int bits, ComplexQuasiPolynomial result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    return new ComplexHypergeometricQuasiPolynomial(this.vℂ1.set(new Complex[]
    { this.ℂ1.set(this.cℤ1), this.ℂ2.set(n), n.neg(this.ℂ3) }),
                                                    this.vℂ2.set(new Complex[]
                                                    { this.cℤ1.div(this.cℤ2, bits, this.ℂ4) }),
                                                    ComplexQuasiPolynomial.parse("(ⅈ*y)/2")).evaluate(null,
                                                                                                      1,
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
    this.vℂ1.close();
    this.ℂ4.close();
    this.ℂ3.close();
    this.ℂ2.close();
    this.vℂ2.close();
    this.ℂ1.close();
  }

  @Override
  public String toString()
  {
    return "n➔pFq([1,n,-n],[1/2],ⅈ*y/2)";
  }

  @Override
  public String typeset()
  {
    return "\\pFq{\\frac{ⅈ \\cdot y}{2}}";
  }
}
