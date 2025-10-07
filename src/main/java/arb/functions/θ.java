package arb.functions;

import arb.*;
import arb.Integer;
import arb.functions.real.RealFunction;

public class θ implements
               RealFunction,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean           isInitialized;
  public final Integer     cℤ0000     = new Integer("2");
  public ComplexPolynomial arg        = new ComplexPolynomial();
  public ComplexPolynomial resultPoly = new ComplexPolynomial();
  public Complex           vℂ0001     = new Complex();
  public Complex           vℂ0002     = new Complex();
  public Complex           vℂ0003     = new Complex();
  public Complex           vℂ0004     = new Complex();
  public Real              vℝ0001     = new Real();
  public Real              vℝ0002     = new Real();
  public Real              vℝ0003     = new Real();
  public Real              vℝ0004     = new Real();

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
  public Real evaluate(Real t, int order, int bits, Real result)
  {
    Complex           var20 = this.vℂ0001;
    ComplexPolynomial var21 = new ComplexPolynomial();
    arblib.acb_poly_init(var21);
    ComplexPolynomial var22 = new ComplexPolynomial();
    arblib.acb_poly_init(var22);
    arblib.acb_poly_fit_length(var22, 1);
    arblib.acb_poly_set_coeff_acb(var22,
                                  0,
                                  FractionConstants.oneQuarter.add(ComplexConstants.ⅈ.mul(t,
                                                                                          bits,
                                                                                          this.vℂ0002)
                                                                                     .div(this.cℤ0000,
                                                                                          bits,
                                                                                          this.vℂ0003),
                                                                   bits,
                                                                   this.vℂ0004));
    Complex var23;
    arblib.acb_one(var23 = new Complex());
    arblib.acb_poly_set_coeff_acb(var22, 1, var23);
    arblib.acb_poly_lgamma_series(var21, var22, 1, bits);
    arblib.acb_poly_get_coeff_acb(var20, var21, 0);
    arblib.acb_poly_clear(var21);
    arblib.acb_poly_clear(var22);
    return var20.im(bits, this.vℝ0001)
                .sub(RealConstants.π.log(bits, this.vℝ0002)
                                    .div(this.cℤ0000, bits, this.vℝ0003)
                                    .mul(t, bits, this.vℝ0004),
                     bits,
                     result);
  }

  public RealFunction derivative()
  {
    return Function.express(Real.class,
                            Real.class,
                            RealFunction.class,
                            "diff(im(lnΓ(¼+((ⅈ*t)/2)))-((log(π)/2)*t),t)");
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
    this.cℤ0000.close();
    this.arg.close();
    this.resultPoly.close();
    this.vℂ0001.close();
    this.vℂ0002.close();
    this.vℂ0003.close();
    this.vℂ0004.close();
    this.vℝ0001.close();
    this.vℝ0002.close();
    this.vℝ0003.close();
    this.vℝ0004.close();
  }

  @Override
  public String toString()
  {
    return "t➔im(lnΓ(¼+((ⅈ*t)/2)))-((log(π)/2)*t)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\im(\\\\lnGAMMA(\\left(\\frac{1}{4} + \\frac{\\left(ⅈ \\cdot t\\right)}{2}\\right)))-\\left(\\frac{\\log(\\pi)}{2} \\cdot t\\right)\\right)";
  }
}