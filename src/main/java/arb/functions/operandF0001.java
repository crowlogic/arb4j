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
import arb.functions.real.RealFunction;

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
  public Real           vℝ0103     = new Real();
  public Real           vℝ0104     = new Real();
  public Real           vℝ0105     = new Real();
  public Real           vℝ0106     = new Real();
  public Real           vℝ0107     = new Real();
  public Real           vℝ0108     = new Real();
  public Real           vℝ0109     = new Real();
  public Real           vℝ0110     = new Real();
  public Real           vℝ0111     = new Real();
  public Real           vℝ0112     = new Real();
  public Integer        vℤ0010     = new Integer();
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
      if (!isInitialized)
      {
        initialize();
      }

      Real           var10000 = (Real) ((RealSequence) ω.evaluate(j,
                                                                  order,
                                                                  bits,
                                                                  vSℝ0001)).evaluate(k,
                                                                                     order,
                                                                                     bits,
                                                                                     vℝ0103);
      Real           var36    = vℝ0104;
      RealPolynomial var37    = new RealPolynomial();
      arblib.arb_poly_init(var37);
      RealPolynomial var38 = new RealPolynomial();
      arblib.arb_poly_init(var38);
      arblib.arb_poly_fit_length(var38, 1);
      arblib.arb_poly_set_coeff_arb(var38, 0, k.add(cℤ0000, bits, vℝ0105));
      Real var39;
      arblib.arb_one(var39 = new Real());
      arblib.arb_poly_set_coeff_arb(var38, 1, var39);
      arblib.arb_poly_gamma_series(var37, var38, 1, bits);
      arblib.arb_poly_get_coeff_arb(var36, var37, 0);
      arblib.arb_poly_clear(var37);
      arblib.arb_poly_clear(var38);
      var10000 = var10000.mul(var36, bits, vℝ0106);
      Real           var40 = vℝ0107;
      RealPolynomial var41 = new RealPolynomial();
      arblib.arb_poly_init(var41);
      RealPolynomial var42 = new RealPolynomial();
      arblib.arb_poly_init(var42);
      arblib.arb_poly_fit_length(var42, 1);
      arblib.arb_poly_set_coeff_arb(var42, 0, k.add(cℤ0000, bits, vℤ0010).sub(γ, bits, vℝ0108));
      Real var43;
      arblib.arb_one(var43 = new Real());
      arblib.arb_poly_set_coeff_arb(var42, 1, var43);
      arblib.arb_poly_gamma_series(var41, var42, 1, bits);
      arblib.arb_poly_get_coeff_arb(var40, var41, 0);
      arblib.arb_poly_clear(var41);
      arblib.arb_poly_clear(var42);
      // input needs to be propagated: i is ascendent input
      return var10000.div(var40, bits, vℝ0109)
                     .mul((Real) ((RealFunction) χ.evaluate(i,
                                                            order,
                                                            bits,
                                                            vℝ0110)).evaluate(k.sub(γ,
                                                                                    bits,
                                                                                    vℝ0111),
                                                                              order,
                                                                              bits,
                                                                              vℝ0112),
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
                            context);
  }

  @Override
  public Function integral()
  {
    return Function.express(Integer.class,
                            Real.class,
                            Function.class,
                            "_intoperandF0001",
                            "int((((ω(j)(k))*Γ(k+1))/Γ((k+1)-γ))*(χ(i)(k-γ)),k)",
                            context);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (γ == null)
    {
      throw new AssertionError("γ is null");
    }
    else
    {
      if (ω == null)
      {
        ω = new ω();
      }

      if (ω.α == null)
      {
        ω.α = new Real();
        ω.α.set(α);
      }
      else
      {
        ω.α = α;
      }

      if (ω.β == null)
      {
        ω.β = new Real();
        ω.β.set(β);
      }
      else
      {
        ω.β = β;
      }

      if (ω.γ == null)
      {
        ω.γ = new Real();
        ω.γ.set(γ);
      }
      else
      {
        ω.γ = γ;
      }

      if (ω.t == null)
      {
        ω.t = new Real();
        ω.t.set(t);
      }
      else
      {
        ω.t = t;
      }

      if (χ == null)
      {
        χ = new χ();
      }

      if (χ.α == null)
      {
        χ.α = new Real();
        χ.α.set(α);
      }
      else
      {
        χ.α = α;
      }

      if (χ.β == null)
      {
        χ.β = new Real();
        χ.β.set(β);
      }
      else
      {
        χ.β = β;
      }

      if (χ.γ == null)
      {
        χ.γ = new Real();
        χ.γ.set(γ);
      }
      else
      {
        χ.γ = γ;
      }

      if (χ.t == null)
      {
        χ.t = new Real();
        χ.t.set(t);
      }
      else
      {
        χ.t = t;
      }

      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    arg.close();
    resultPoly.close();
    vSℝ0001.close();
    vℝ0103.close();
    vℝ0104.close();
    vℝ0105.close();
    vℝ0106.close();
    vℝ0107.close();
    vℝ0108.close();
    vℝ0109.close();
    vℝ0110.close();
    vℝ0111.close();
    vℝ0112.close();
    vℤ0010.close();
    χ.close();
    ω.close();
  }

  @Override
  public String getName()
  {
    return "operandF0001";
  }

  @Override
  public Context getContext()
  {
    return context;
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
