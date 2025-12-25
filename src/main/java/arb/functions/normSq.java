package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.RealPolynomial;
import arb.Typesettable;
import arb.arblib;
import arb.expressions.Context;
import arb.functions.integer.RealSequence;

public class normSq implements
                    RealSequence,
                    Typesettable,
                    AutoCloseable,
                    Initializable,
                    Named
{
  public boolean        isInitialized;
  public Context        context    = new Context();
  public final Integer  cℤ0000     = new Integer("2");
  public final Integer  cℤ0001     = new Integer("1");
  public RealPolynomial arg        = new RealPolynomial();
  public RealPolynomial resultPoly = new RealPolynomial();
  public Real           vℝ0034     = new Real();
  public Real           vℝ0035     = new Real();
  public Real           vℝ0036     = new Real();
  public Real           vℝ0037     = new Real();
  public Real           vℝ0038     = new Real();
  public Real           vℝ0039     = new Real();
  public Real           vℝ0040     = new Real();
  public Real           vℝ0041     = new Real();
  public Real           vℝ0042     = new Real();
  public Real           vℝ0043     = new Real();
  public Real           vℝ0044     = new Real();
  public Real           vℝ0045     = new Real();
  public Real           vℝ0046     = new Real();
  public Real           vℝ0047     = new Real();
  public Real           vℝ0048     = new Real();
  public Real           vℝ0049     = new Real();
  public Real           vℝ0050     = new Real();
  public Real           vℝ0051     = new Real();
  public Real           vℝ0052     = new Real();
  public Real           vℝ0053     = new Real();
  public Real           vℝ0054     = new Real();
  public Integer        vℤ0003     = new Integer();
  public Real           t;
  public Real           α;
  public Real           β;
  public Real           γ;

  @Override
  public Class<Integer> domainType()
  {
    return Integer.class;
  }

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Integer i, int order, int bits, Real result)
  {
    if (order > 1)
    {
      throw new AssertionError("TODO: implement order=" + order + ">1");
    }
    else
    {
      if (!this.isInitialized)
      {
        this.initialize();
      }

      Real           var10000 = this.cℤ0000.pow(
                                                this.α.add(this.β, bits, this.vℝ0034)
                                                      .add(this.cℤ0001, bits, this.vℝ0035),
                                                bits,
                                                this.vℝ0036);
      Real           var20    = this.vℝ0037;
      RealPolynomial var21    = new RealPolynomial();
      arblib.arb_poly_init(var21);
      RealPolynomial var22 = new RealPolynomial();
      arblib.arb_poly_init(var22);
      arblib.arb_poly_fit_length(var22, 1);
      arblib.arb_poly_set_coeff_arb(var22,
                                    0,
                                    i.add(this.α, bits, this.vℝ0038)
                                     .add(this.cℤ0001, bits, this.vℝ0039));
      Real var23;
      arblib.arb_one(var23 = new Real());
      arblib.arb_poly_set_coeff_arb(var22, 1, var23);
      arblib.arb_poly_gamma_series(var21, var22, 1, bits);
      arblib.arb_poly_get_coeff_arb(var20, var21, 0);
      arblib.arb_poly_clear(var21);
      arblib.arb_poly_clear(var22);
      var10000 = var10000.mul(var20, bits, this.vℝ0040);
      Real           var24 = this.vℝ0041;
      RealPolynomial var25 = new RealPolynomial();
      arblib.arb_poly_init(var25);
      RealPolynomial var26 = new RealPolynomial();
      arblib.arb_poly_init(var26);
      arblib.arb_poly_fit_length(var26, 1);
      arblib.arb_poly_set_coeff_arb(var26,
                                    0,
                                    i.add(this.β, bits, this.vℝ0042)
                                     .add(this.cℤ0001, bits, this.vℝ0043));
      Real var27;
      arblib.arb_one(var27 = new Real());
      arblib.arb_poly_set_coeff_arb(var26, 1, var27);
      arblib.arb_poly_gamma_series(var25, var26, 1, bits);
      arblib.arb_poly_get_coeff_arb(var24, var25, 0);
      arblib.arb_poly_clear(var25);
      arblib.arb_poly_clear(var26);
      var10000 = var10000.mul(var24, bits, this.vℝ0044);
      Real           var10001 = this.cℤ0000.mul(i, bits, this.vℤ0003)
                                           .add(this.α, bits, this.vℝ0045)
                                           .add(this.β, bits, this.vℝ0046)
                                           .add(this.cℤ0001, bits, this.vℝ0047);
      Real           var28    = this.vℝ0048;
      RealPolynomial var29    = new RealPolynomial();
      arblib.arb_poly_init(var29);
      RealPolynomial var30 = new RealPolynomial();
      arblib.arb_poly_init(var30);
      arblib.arb_poly_fit_length(var30, 1);
      arblib.arb_poly_set_coeff_arb(var30, 0, i.add(this.cℤ0001, bits, this.vℝ0049));
      Real var31;
      arblib.arb_one(var31 = new Real());
      arblib.arb_poly_set_coeff_arb(var30, 1, var31);
      arblib.arb_poly_gamma_series(var29, var30, 1, bits);
      arblib.arb_poly_get_coeff_arb(var28, var29, 0);
      arblib.arb_poly_clear(var29);
      arblib.arb_poly_clear(var30);
      var10001 = var10001.mul(var28, bits, this.vℝ0050);
      Real           var32 = this.vℝ0051;
      RealPolynomial var33 = new RealPolynomial();
      arblib.arb_poly_init(var33);
      RealPolynomial var34 = new RealPolynomial();
      arblib.arb_poly_init(var34);
      arblib.arb_poly_fit_length(var34, 1);
      arblib.arb_poly_set_coeff_arb(var34,
                                    0,
                                    this.vℝ0038.add(this.β, bits, this.vℝ0052)
                                               .add(this.cℤ0001, bits, this.vℝ0053));
      Real var35;
      arblib.arb_one(var35 = new Real());
      arblib.arb_poly_set_coeff_arb(var34, 1, var35);
      arblib.arb_poly_gamma_series(var33, var34, 1, bits);
      arblib.arb_poly_get_coeff_arb(var32, var33, 0);
      arblib.arb_poly_clear(var33);
      arblib.arb_poly_clear(var34);
      return var10000.div(var10001.mul(var32, bits, this.vℝ0054), bits, result);
    }
  }

  @Override
  public RealSequence derivative()
  {
    return Function.express(Integer.class,
                            Real.class,
                            RealSequence.class,
                            "_diffnormSq",
                            "diff((((2^((α+β)+1))*Γ((i+α)+1))*Γ((i+β)+1))/((((((2*i)+α)+β)+1)*Γ(i+1))*Γ(((i+α)+β)+1)),i)",
                            this.context);
  }

  @Override
  public RealSequence integral()
  {
    return Function.express(Integer.class,
                            Real.class,
                            RealSequence.class,
                            "_intnormSq",
                            "int((((2^((α+β)+1))*Γ((i+α)+1))*Γ((i+β)+1))/((((((2*i)+α)+β)+1)*Γ(i+1))*Γ(((i+α)+β)+1)),i)",
                            this.context);
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (this.α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("β is null");
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
    this.cℤ0001.close();
    this.arg.close();
    this.resultPoly.close();
    this.vℝ0034.close();
    this.vℝ0035.close();
    this.vℝ0036.close();
    this.vℝ0037.close();
    this.vℝ0038.close();
    this.vℝ0039.close();
    this.vℝ0040.close();
    this.vℝ0041.close();
    this.vℝ0042.close();
    this.vℝ0043.close();
    this.vℝ0044.close();
    this.vℝ0045.close();
    this.vℝ0046.close();
    this.vℝ0047.close();
    this.vℝ0048.close();
    this.vℝ0049.close();
    this.vℝ0050.close();
    this.vℝ0051.close();
    this.vℝ0052.close();
    this.vℝ0053.close();
    this.vℝ0054.close();
    this.vℤ0003.close();
  }

  @Override
  public String getName()
  {
    return "normSq";
  }

  @Override
  public Context getContext()
  {
    return this.context;
  }

  @Override
  public String toString()
  {
    return "normSq:i➔(((2^((α+β)+1))*Γ((i+α)+1))*Γ((i+β)+1))/((((((2*i)+α)+β)+1)*Γ(i+1))*Γ(((i+α)+β)+1))";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(\\left({2}^{(\\left(\\left(α + β\\right) + 1\\right))} \\cdot \\Gamma(\\left(\\left(i + α\\right) + 1\\right))\\right) \\cdot \\Gamma(\\left(\\left(i + β\\right) + 1\\right))\\right)}{\\left(\\left(\\left(\\left(\\left(\\left(2 \\cdot i\\right) + α\\right) + β\\right) + 1\\right) \\cdot \\Gamma(\\left(i + 1\\right))\\right) \\cdot \\Gamma(\\left(\\left(\\left(i + α\\right) + β\\right) + 1\\right))\\right)}";
  }
}
