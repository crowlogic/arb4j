package arb.functions;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Initializable;
import arb.Integer;
import arb.Typesettable;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.polynomials.ComplexPolynomialHypergeometricFunction;

public class Vpluscomplexfunc implements
                              ComplexFunction,
                              Typesettable,
                              AutoCloseable,
                              Initializable
{
  public boolean                                 isInitialized;
  public final Integer                           cℤ0002     = new Integer("2");
  public final Integer                           cℤ0001     = new Integer("1");
  public ComplexPolynomialHypergeometricFunction hypXℂF0002 = new ComplexPolynomialHypergeometricFunction();
  public ComplexPolynomial                       elementXℂ0001;
  public Integer                                 m;
  public Complex                                 vℂ0006     = new Complex();
  public Complex                                 vℂ0004     = new Complex();
  public Complex                                 vℂ0005     = new Complex();
  public Complex                                 vℂ0002     = new Complex();
  public Complex                                 vℂ0003     = new Complex();
  public Complex                                 vℂ0001     = new Complex();

  @Override
  public Class<Complex> coDomainType()
  {
    return Complex.class;
  }

  @Override
  public Complex evaluate(Complex y, int order, int bits, Complex result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return elementXℂ0001.evaluate(y, order, bits, result);
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
      hypXℂF0002.init(vℂ0004.set(new Complex[]
      { vℂ0001.set(cℤ0001), vℂ0002.set(m), m.neg(vℂ0003) }), vℂ0006.set(new Complex[]
      { cℤ0001.div(cℤ0002, 128, vℂ0005) }), ComplexPolynomialNullaryFunction.parse("neg((1/2*ⅈ)/y)"));
      hypXℂF0002.evaluate(null, 1, 128, elementXℂ0001);
      isInitialized = true;
    }
  }

  public Vpluscomplexfunc()
  {
    elementXℂ0001 = new ComplexPolynomial();
  }

  @Override
  public void close()
  {
    cℤ0002.close();
    cℤ0001.close();
    hypXℂF0002.close();
    vℂ0006.close();
    vℂ0004.close();
    vℂ0005.close();
    vℂ0002.close();
    vℂ0003.close();
    vℂ0001.close();
    elementXℂ0001.close();
  }

  @Override
  public String toString()
  {
    return "y➔pFq([1,m,neg(m)],[1/2];neg((1/2*ⅈ)/y))";
  }

  @Override
  public String typeset()
  {
    return "{_3F_1}\\left(\\left[1,m,\\neg(m)\\right], \\left[\\frac{1}{2}\\right] ; \\neg(\\frac{\\frac{1}{2} \\cdot ⅈ}{y})\\right)";
  }

  public String intermediateStates()
  {
    return "TODO: insert intermediate states here";
  }
}
