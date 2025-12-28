package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.RealPolynomial;
import arb.Typesettable;
import arb.arblib;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.integer.RealSequence;

public class operandF0001 implements
                          Function<Integer, Real>,
                          Typesettable,
                          AutoCloseable,
                          Initializable,
                          Named
{
  public boolean        isInitialized;
  public Context        context    = new Context();
  public final Integer  cℤ0000     = new Integer("1");
  public RealPolynomial arg        = new RealPolynomial();
  public RealPolynomial resultPoly = new RealPolynomial();
  public RealSequence   vSℝ0001;
  public RealSequence   vSℝ0002;
  public Real           vℝ0098     = new Real();
  public Real           vℝ0099     = new Real();
  public Real           vℝ0100     = new Real();
  public Real           vℝ0101     = new Real();
  public Real           vℝ0102     = new Real();
  public Real           vℝ0103     = new Real();
  public Real           vℝ0104     = new Real();
  public Real           vℝ0105     = new Real();
  public Real           vℝ0106     = new Real();
  public Integer        vℤ0011     = new Integer();
  public ω              ω;
  public χ              χ;
  public Integer        j;
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
  public Real evaluate(Integer k, int order, int bits, Real result)
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

      Real           var10000 =
                              (Real) ((RealSequence) this.ω.evaluate(this.j,
                                                                     order,
                                                                     bits,
                                                                     this.vSℝ0001)).evaluate(k,
                                                                                             order,
                                                                                             bits,
                                                                                             this.vℝ0098);
      Real           var36    = this.vℝ0099;
      RealPolynomial var37    = new RealPolynomial();
      arblib.arb_poly_init(var37);
      RealPolynomial var38 = new RealPolynomial();
      arblib.arb_poly_init(var38);
      arblib.arb_poly_fit_length(var38, 1);
      arblib.arb_poly_set_coeff_arb(var38, 0, k.add(this.cℤ0000, bits, this.vℝ0100));
      Real var39;
      arblib.arb_one(var39 = new Real());
      arblib.arb_poly_set_coeff_arb(var38, 1, var39);
      arblib.arb_poly_gamma_series(var37, var38, 1, bits);
      arblib.arb_poly_get_coeff_arb(var36, var37, 0);
      arblib.arb_poly_clear(var37);
      arblib.arb_poly_clear(var38);
      var10000 = var10000.mul(var36, bits, this.vℝ0101);
      Real           var40 = this.vℝ0102;
      RealPolynomial var41 = new RealPolynomial();
      arblib.arb_poly_init(var41);
      RealPolynomial var42 = new RealPolynomial();
      arblib.arb_poly_init(var42);
      arblib.arb_poly_fit_length(var42, 1);
      arblib.arb_poly_set_coeff_arb(var42,
                                    0,
                                    k.add(this.cℤ0000, bits, this.vℤ0011)
                                     .sub(this.γ, bits, this.vℝ0103));
      Real var43;
      arblib.arb_one(var43 = new Real());
      arblib.arb_poly_set_coeff_arb(var42, 1, var43);
      arblib.arb_poly_gamma_series(var41, var42, 1, bits);
      arblib.arb_poly_get_coeff_arb(var40, var41, 0);
      arblib.arb_poly_clear(var41);
      arblib.arb_poly_clear(var42);
      RealSequence x = ((RealSequence) this.χ.evaluate(this.i, order, bits, this.vSℝ0002));
      return var10000.div(var40, bits, this.vℝ0104)
                     .mul(x.evaluate(k.sub(this.γ, bits, this.vℝ0105), order, bits, this.vℝ0106),
                          bits,
                          result);
    }
  }

  @Override
  public Function derivative()
  {
    return Function.express(Integer.class,
                            Real.class,
                            Function.class,
                            "_diffoperandF0001",
                            "diff((((ω(j)(k))*Γ(k+1))/Γ((k+1)-γ))*(χ(i)(k-γ)),k)",
                            this.context);
  }

  @Override
  public Function integral()
  {
    return Function.express(Integer.class,
                            Real.class,
                            Function.class,
                            "_intoperandF0001",
                            "int((((ω(j)(k))*Γ(k+1))/Γ((k+1)-γ))*(χ(i)(k-γ)),k)",
                            this.context);
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (this.γ == null)
    {
      throw new AssertionError("γ is null");
    }
    else
    {
      if (this.ω == null)
      {
        this.ω = new ω();
      }

      if (this.ω.α == null)
      {
        this.ω.α = new Real();
        this.ω.α.set(this.α);
      }
      else
      {
        this.ω.α = this.α;
      }

      if (this.ω.β == null)
      {
        this.ω.β = new Real();
        this.ω.β.set(this.β);
      }
      else
      {
        this.ω.β = this.β;
      }

      if (this.ω.γ == null)
      {
        this.ω.γ = new Real();
        this.ω.γ.set(this.γ);
      }
      else
      {
        this.ω.γ = this.γ;
      }

      if (this.ω.t == null)
      {
        this.ω.t = new Real();
        this.ω.t.set(this.t);
      }
      else
      {
        this.ω.t = this.t;
      }

      if (this.χ == null)
      {
        this.χ = new χ();
      }

      if (this.χ.α == null)
      {
        this.χ.α = new Real();
        this.χ.α.set(this.α);
      }
      else
      {
        this.χ.α = this.α;
      }

      if (this.χ.β == null)
      {
        this.χ.β = new Real();
        this.χ.β.set(this.β);
      }
      else
      {
        this.χ.β = this.β;
      }

      if (this.χ.γ == null)
      {
        this.χ.γ = new Real();
        this.χ.γ.set(this.γ);
      }
      else
      {
        this.χ.γ = this.γ;
      }

      if (this.χ.t == null)
      {
        this.χ.t = new Real();
        this.χ.t.set(this.t);
      }
      else
      {
        this.χ.t = this.t;
      }

      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ0000.close();
    this.arg.close();
    this.resultPoly.close();
    this.vSℝ0001.close();
    this.vSℝ0002.close();
    this.vℝ0098.close();
    this.vℝ0099.close();
    this.vℝ0100.close();
    this.vℝ0101.close();
    this.vℝ0102.close();
    this.vℝ0103.close();
    this.vℝ0104.close();
    this.vℝ0105.close();
    this.vℝ0106.close();
    this.vℤ0011.close();
    this.χ.close();
    this.ω.close();
  }

  @Override
  public String getName()
  {
    return "operandF0001";
  }

  @Override
  public Context getContext()
  {
    return this.context;
  }

  @Override
  public String toString()
  {
    return "operandF0001:k➔(((ω(j)(k))*Γ(k+1))/Γ((k+1)-γ))*(χ(i)(k-γ))";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\frac{\\left(\\ω(j)\\left(k\\right) \\cdot \\Gamma(\\left(k + 1\\right))\\right)}{\\Gamma(\\left(\\left(k + 1\\right)-γ\\right))} \\cdot \\χ(i)\\left(\\left(k-γ\\right)\\right)\\right)";
  }
}
