package arb.functions;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.complex.ComplexFunction;

public class χfunc implements
                   ComplexFunction,
                   Typesettable,
                   AutoCloseable,
                   Initializable,
                   Named
{
  public boolean           isInitialized;
  public Context           context;
  public final Integer     cℤ0000       = new Integer("1");
  public ComplexPolynomial polyCofactor = new ComplexPolynomial();
  public ComplexPolynomial polyProduct  = new ComplexPolynomial();
  public ComplexPolynomial vXℂ0001      = new ComplexPolynomial();
  public ComplexPolynomial vXℂ0002      = new ComplexPolynomial();
  public ComplexPolynomial vXℂ0003      = new ComplexPolynomial();
  public ComplexPolynomial vXℂ0004      = new ComplexPolynomial();
  public RealPolynomial    vXℝ0015      = new RealPolynomial();
  public RealPolynomial    vXℝ0016      = new RealPolynomial();
  public Complex           vℂ0007       = new Complex();
  public Complex           vℂ0008       = new Complex();
  public Complex           vℂ0009       = new Complex();
  public Complex           vℂ0010       = new Complex();
  public Complex           vℂ0011       = new Complex();
  public Complex           vℂ0012       = new Complex();
  public Complex           vℂ0013       = new Complex();
  public Complex           vℂ0014       = new Complex();
  public Real              vℝ0071       = new Real();
  public Real              vℝ0072       = new Real();
  public Real              vℝ0073       = new Real();
  public Real              vℝ0074       = new Real();
  public Integer           vℤ0011       = new Integer();
  public Integer           vℤ0012       = new Integer();
  public w                 w;
  public σ                 σ;
  public P                 P;
  public Integer           i;
  public Real              α;
  public Real              β;
  public Real              γ;

  @Override
  public Class<Complex> domainType()
  {
    return Complex.class;
  }

  @Override
  public Class<Complex> coDomainType()
  {
    return Complex.class;
  }

  @Override
  public Complex evaluate(Complex p, int order, int bits, Complex result)
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

      return vXℂ0001.set(P.evaluate(i, order, bits, vXℝ0015))
                    .mul(cℤ0000.pow(p, bits, vℂ0007)
                               .mul(w.evaluate(vℝ0071.set(cℤ0000), order, bits, vℝ0072),
                                    bits,
                                    vXℂ0002),
                         bits,
                         polyProduct)
                    .integral()
                    .evaluate(vℂ0008.set(cℤ0000), order, bits, vℂ0009)
                    .sub(vXℂ0003.set(P.evaluate(i, order, bits, vXℝ0016))
                                .mul(cℤ0000.neg(vℤ0011)
                                           .pow(p, bits, vℂ0010)
                                           .mul(w.evaluate(cℤ0000.neg(vℝ0073), order, bits, vℝ0074),
                                                bits,
                                                vXℂ0004),
                                     bits,
                                     polyProduct)
                                .integral()
                                .evaluate(vℂ0011.set(cℤ0000.neg(vℤ0012)), order, bits, vℂ0012),
                         bits,
                         vℂ0013)
                    .div(σ.evaluate(i, order, bits, vℂ0014), bits, result);
    }
  }

  @Override
  public ComplexFunction derivative()
  {
    return Function.express(Complex.class,
                            Complex.class,
                            ComplexFunction.class,
                            "_diffχfunc",
                            "diff(((∫((1^p)*w(1))*(P(i))d1)-(∫(((-1)^p)*w((-1)))*(P(i))d(-1)))/σ(i),p)",
                            context);
  }

  @Override
  public ComplexFunction integral()
  {
    return Function.express(Complex.class,
                            Complex.class,
                            ComplexFunction.class,
                            "_intχfunc",
                            "int(((∫((1^p)*w(1))*(P(i))d1)-(∫(((-1)^p)*w((-1)))*(P(i))d(-1)))/σ(i),p)",
                            context);
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
      if (P == null)
      {
        P = new P();
      }

      if (σ == null)
      {
        σ = new σ();
      }

      if (w == null)
      {
        w = new w();
      }

      if (w.α == null)
      {
        w.α = α;
      }
      else
      {
        w.α.set(α);
      }

      if (w.β == null)
      {
        w.β = β;
      }
      else
      {
        w.β.set(β);
      }

      if (σ.α == null)
      {
        σ.α = α;
      }
      else
      {
        σ.α.set(α);
      }

      if (σ.β == null)
      {
        σ.β = β;
      }
      else
      {
        σ.β.set(β);
      }

      if (σ.γ == null)
      {
        σ.γ = γ;
      }
      else
      {
        σ.γ.set(γ);
      }

      if (P.α == null)
      {
        P.α = α;
      }
      else
      {
        P.α.set(α);
      }

      if (P.β == null)
      {
        P.β = β;
      }
      else
      {
        P.β.set(β);
      }

      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    polyCofactor.close();
    polyProduct.close();
    vXℂ0001.close();
    vXℂ0002.close();
    vXℂ0003.close();
    vXℂ0004.close();
    vXℝ0015.close();
    vXℝ0016.close();
    vℂ0007.close();
    vℂ0008.close();
    vℂ0009.close();
    vℂ0010.close();
    vℂ0011.close();
    vℂ0012.close();
    vℂ0013.close();
    vℂ0014.close();
    vℝ0071.close();
    vℝ0072.close();
    vℝ0073.close();
    vℝ0074.close();
    vℤ0011.close();
    vℤ0012.close();
    P.close();
    σ.close();
    w.close();
  }

  @Override
  public String getName()
  {
    return "χfunc";
  }

  @Override
  public Context getContext()
  {
    return context;
  }

  @Override
  public String toString()
  {
    return "χfunc:p➔((∫((1^p)*w(1))*(P(i))d1)-(∫(((-1)^p)*w((-1)))*(P(i))d(-1)))/σ(i)";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(\\int \\left({1}^{p} \\cdot \\w(1)\\right) \\cdot \\P(i)(1) d1-\\int \\left({-(1)}^{p} \\cdot \\w(-(1))\\right) \\cdot \\P(i)(-(1)) d-(1)\\right)}{\\σ(i)}";
  }
}
