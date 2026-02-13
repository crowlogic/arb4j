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
  public Complex           vℂ0011       = new Complex();
  public Complex           vℂ0012       = new Complex();
  public Complex           vℂ0013       = new Complex();
  public Complex           vℂ0014       = new Complex();
  public Complex           vℂ0015       = new Complex();
  public Complex           vℂ0016       = new Complex();
  public Complex           vℂ0017       = new Complex();
  public Complex           vℂ0018       = new Complex();
  public Real              vℝ0067       = new Real();
  public Real              vℝ0068       = new Real();
  public Real              vℝ0069       = new Real();
  public Real              vℝ0070       = new Real();
  public Integer           vℤ0009       = new Integer();
  public Integer           vℤ0010       = new Integer();
  public normSq            normSq;
  public w                 w;
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
                    .mul(cℤ0000.pow(p, bits, vℂ0011)
                               .mul(w.evaluate(vℝ0067.set(cℤ0000), order, bits, vℝ0068),
                                    bits,
                                    vXℂ0002),
                         bits,
                         polyProduct)
                    .integral()
                    .evaluate(vℂ0012.set(cℤ0000), order, bits, vℂ0013)
                    .sub(vXℂ0003.set(P.evaluate(i, order, bits, vXℝ0016))
                                .mul(cℤ0000.neg(vℤ0009)
                                           .pow(p, bits, vℂ0014)
                                           .mul(w.evaluate(cℤ0000.neg(vℝ0069), order, bits, vℝ0070),
                                                bits,
                                                vXℂ0004),
                                     bits,
                                     polyProduct)
                                .integral()
                                .evaluate(vℂ0015.set(cℤ0000.neg(vℤ0010)), order, bits, vℂ0016),
                         bits,
                         vℂ0017)
                    .div(normSq.evaluate(i, order, bits, vℂ0018), bits, result);
    }
  }

  @Override
  public ComplexFunction derivative()
  {
    return Function.express(Complex.class,
                            Complex.class,
                            ComplexFunction.class,
                            "_diffχfunc",
                            "diff(((∫((1^p)*w(1))*(P(i))d1)-(∫((-1^p)*w(-1))*(P(i))d-1))/normSq(i),p)",
                            context);
  }

  @Override
  public ComplexFunction integral()
  {
    return Function.express(Complex.class,
                            Complex.class,
                            ComplexFunction.class,
                            "_intχfunc",
                            "int(((∫((1^p)*w(1))*(P(i))d1)-(∫((-1^p)*w(-1))*(P(i))d-1))/normSq(i),p)",
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

      if (w == null)
      {
        w = new w();
      }

      if (normSq == null)
      {
        normSq = new normSq();
      }

      if (normSq.α == null)
      {
        normSq.α = α;
      }
      else
      {
        normSq.α.set(α);
      }

      if (normSq.β == null)
      {
        normSq.β = β;
      }
      else
      {
        normSq.β.set(β);
      }

      if (normSq.γ == null)
      {
        normSq.γ = γ;
      }
      else
      {
        normSq.γ.set(γ);
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
    vℂ0011.close();
    vℂ0012.close();
    vℂ0013.close();
    vℂ0014.close();
    vℂ0015.close();
    vℂ0016.close();
    vℂ0017.close();
    vℂ0018.close();
    vℝ0067.close();
    vℝ0068.close();
    vℝ0069.close();
    vℝ0070.close();
    vℤ0009.close();
    vℤ0010.close();
    P.close();
    w.close();
    normSq.close();
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
    return "p➔((∫((1^p)*w(1))*(P(i))d1)-(∫((-1^p)*w(-1))*(P(i))d-1))/normSq(i)";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(\\int \\left({1}^{p} \\cdot \\w(1)\\right) \\cdot \\P(i)(1) d1-\\int \\left({-1}^{p} \\cdot \\w(-1)\\right) \\cdot \\P(i)(-1) d-1\\right)}{\\normSq(i)}";
  }
}
