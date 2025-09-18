package arb.functions;

import arb.Complex;
import arb.ComplexConstants;
import arb.ComplexPolynomial;
import arb.FractionConstants;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.Typesettable;
import arb.arblib;
import arb.functions.real.RealFunction;

// Decompiled by Procyon v0.6.0
public class θ implements
               RealFunction,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean           isInitialized;
  public final Integer     cℤ0000;
  public ComplexPolynomial arg;
  public ComplexPolynomial resultPoly;
  public Complex           vℂ0001;
  public Complex           vℂ0002;
  public Complex           vℂ0003;
  public Complex           vℂ0004;
  public Real              vℝ0001;
  public Real              vℝ0002;
  public Real              vℝ0003;
  public Real              vℝ0004;

  @Override
  public Class<Real> domainType()
  {
    return Real.class;
  }

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(final Real t, final int order, final int bits, final Real result)
  {
    final ComplexPolynomial complexPolynomial = new ComplexPolynomial();
    arblib.acb_poly_init(complexPolynomial);
    final ComplexPolynomial complexPolynomial2 = new ComplexPolynomial();
    arblib.acb_poly_init(complexPolynomial2);
    arblib.acb_poly_fit_length(complexPolynomial2, 1);
    arblib.acb_poly_set_coeff_acb(complexPolynomial2,
                                  0,
                                  FractionConstants.oneQuarter.add(ComplexConstants.ⅈ.mul((Real) t,
                                                                                          bits,
                                                                                          vℂ0002)
                                                                                     .div(cℤ0000,
                                                                                          bits,
                                                                                          vℂ0003),
                                                                   bits,
                                                                   vℂ0004));
    final Complex complex;
    arblib.acb_one(complex = new Complex());
    arblib.acb_poly_set_coeff_acb(complexPolynomial2, 1, complex);
    arblib.acb_poly_lgamma_series(complexPolynomial, complexPolynomial2, 1, bits);
    arblib.acb_poly_get_coeff_acb(vℂ0001, complexPolynomial, 0);
    arblib.acb_poly_clear(complexPolynomial);
    arblib.acb_poly_clear(complexPolynomial2);
    return vℂ0001.im(bits, vℝ0001)
                 .sub(RealConstants.π.log(bits, vℝ0002)
                                     .div(cℤ0000, bits, vℝ0003)
                                     .mul((Real) t, bits, vℝ0004),
                      bits,
                      (Real) result);
  }

  public Function<Real, Real> derivative()
  {
    return Function.express(Real.class,
                            Real.class,
                            Function.class,
                            "diff(im(lnΓ(¼+ⅈ*t/2))-(log(π)/2)*t,t)");
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    isInitialized = true;
  }

  public θ()
  {
    cℤ0000     = new Integer("2");
    arg        = new ComplexPolynomial();
    resultPoly = new ComplexPolynomial();
    vℂ0001     = new Complex();
    vℂ0002     = new Complex();
    vℂ0003     = new Complex();
    vℂ0004     = new Complex();
    vℝ0001     = new Real();
    vℝ0002     = new Real();
    vℝ0003     = new Real();
    vℝ0004     = new Real();
  }

  public void close()
  {
    cℤ0000.close();
    arg.close();
    resultPoly.close();
    vℂ0001.close();
    vℂ0002.close();
    vℂ0003.close();
    vℂ0004.close();
    vℝ0001.close();
    vℝ0002.close();
    vℝ0003.close();
    vℝ0004.close();
  }

  @Override
  public String toString()
  {
    return "t↦(im(lnΓ(¼+((ⅈ*t)/2))))-(((log(π))/2)*t)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\im(\\ln\\Gamma(\\left(\\frac{1}{4} + \\frac{\\left(ⅈ \\cdot t\\right)}{2}\\right)))-\\left(\\frac{\\log(\\pi)}{2} \\cdot t\\right)\\right)";
  }
}
