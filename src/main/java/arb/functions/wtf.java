package arb.functions;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.polynomials.ComplexPolynomialHypergeometricFunction;

public class wtf implements
                 ComplexPolynomialNullaryFunction,
                 Typesettable,
                 AutoCloseable,
                 Initializable
{
  public static void main(String... args)
  {
    wtf               wtf = new wtf();
    ComplexPolynomial a   = wtf.evaluate(128);
    System.out.format("%s=%s\n", wtf, a);
  }

  public boolean                                 isInitialized;
  Integer                                        cℤ1 = new Integer("2");
  Integer                                        cℤ4 = new Integer("4");
  Integer                                        cℤ3 = new Integer("1");
  Real                                           cℝ2 = new Real("3.5",
                                                                128);
  public ComplexPolynomialHypergeometricFunction hypXℂF1;
  public ComplexPolynomial                       elementXℂ1;
  public Complex                                 vℂ1 = new Complex();
  public Complex                                 ℂ5  = new Complex();
  public Complex                                 ℂ4  = new Complex();
  public Complex                                 ℂ3  = new Complex();
  public Complex                                 ℂ2  = new Complex();
  public Complex                                 vℂ2 = new Complex();
  public Complex                                 ℂ1;

  @Override
  public Class<ComplexPolynomial> coDomainType()
  {
    return ComplexPolynomial.class;
  }

  @Override
  public ComplexPolynomial evaluate(Object in, int order, int bits, ComplexPolynomial result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    return this.elementXℂ1;
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
      this.hypXℂF1.init(this.vℂ1.set(new Complex[]
      { this.cℤ1.neg(this.ℂ1), this.ℂ2.set(this.cℝ2), this.ℂ3.set(this.cℤ3) }),
                        this.vℂ2.set(new Complex[]
                        { this.ℂ4.set(this.cℤ1), this.ℂ5.set(this.cℤ4) }),
                        ComplexPolynomialNullaryFunction.parse("(1/2)-(x/2)"));
      this.isInitialized = true;
    }
  }

  public wtf()
  {
    this.hypXℂF1    = new ComplexPolynomialHypergeometricFunction();
    this.elementXℂ1 = new ComplexPolynomial();
    this.ℂ1         = new Complex();
  }

  @Override
  public void close()
  {
    this.cℤ1.close();
    this.cℤ4.close();
    this.cℤ3.close();
    this.cℝ2.close();
    this.vℂ1.close();
    this.ℂ5.close();
    this.ℂ4.close();
    this.ℂ3.close();
    this.ℂ2.close();
    this.vℂ2.close();
    this.hypXℂF1.close();
    this.elementXℂ1.close();
    this.ℂ1.close();
  }

  @Override
  public String toString()
  {
    return "pFq([-2,3.5,1],[2,4],1/2-x/2)";
  }

  @Override
  public String typeset()
  {
    return "{_3F_2}\\left(\\left[-2,3.5,1\\right], \\left[2,4\\right] ; \\left(\\frac{1}{2}-\\frac{x}{2}\\right)\\right)";
  }
}
