package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.RealPolynomial;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.real.RealFunction;

public class χfuncfunc implements
                       RealFunction,
                       Typesettable,
                       AutoCloseable,
                       Initializable,
                       Named
{
  public boolean        isInitialized;
  public Context        context = new Context();
  public final Integer  cℤ0000  = new Integer("1");
  public RealPolynomial vXℝ0015 = new RealPolynomial();
  public RealPolynomial vXℝ0016 = new RealPolynomial();
  public Real           vℝ0084  = new Real();
  public Real           vℝ0085  = new Real();
  public Real           vℝ0086  = new Real();
  public Real           vℝ0087  = new Real();
  public Real           vℝ0088  = new Real();
  public Real           vℝ0089  = new Real();
  public Real           vℝ0090  = new Real();
  public Real           vℝ0091  = new Real();
  public Real           vℝ0092  = new Real();
  public Real           vℝ0093  = new Real();
  public Real           vℝ0094  = new Real();
  public Real           vℝ0095  = new Real();
  public Real           vℝ0096  = new Real();
  public Real           vℝ0097  = new Real();
  public Real           vℝ0098  = new Real();
  public Real           vℝ0099  = new Real();
  public Real           vℝ0100  = new Real();
  public Real           vℝ0101  = new Real();
  public Real           vℝ0102  = new Real();
  public Integer        vℤ0007  = new Integer();
  public Integer        vℤ0008  = new Integer();
  public Integer        vℤ0009  = new Integer();
  public normSq         normSq;
  public _intw          _intw;
  public P              P;
  public Real           t;
  public Real           α;
  public Real           β;
  public Real           γ;

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
  public Real evaluate(Real p, int order, int bits, Real result)
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

      return cℤ0000.pow(p.add(cℤ0000, bits, vℝ0084), bits, vℝ0085)
                   .div(vℝ0084, bits, vℝ0086)
                   .mul((Real) _intw.evaluate(vℝ0087.set(cℤ0000), order, bits, vℝ0088),
                        bits,
                        vℝ0089)
                   .mul(P.evaluate(vℤ0007.set(i, order, bits, vXℝ0015))
                         .integral()
                         .evaluate(vℝ0090.set(cℤ0000), order, bits, vℝ0091),
                        bits,
                        vℝ0092)
                   .sub(cℤ0000.neg(vℤ0008)
                              .pow(vℝ0084, bits, vℝ0093)
                              .div(vℝ0084, bits, vℝ0094)
                              .mul((Real) _intw.evaluate(cℤ0000.neg(vℝ0095), order, bits, vℝ0096),
                                   bits,
                                   vℝ0097)
                              .mul((Real) ((RealPolynomial) P.evaluate(i,
                                                                       order,
                                                                       bits,
                                                                       vXℝ0016)).integral()
                                                                                .evaluate(vℝ0098.set(cℤ0000.neg(vℤ0009)),
                                                                                          order,
                                                                                          bits,
                                                                                          vℝ0099),
                                   bits,
                                   vℝ0100),
                        bits,
                        vℝ0101)
                   .div((Real) normSq.evaluate(i, order, bits, vℝ0102), bits, result);
    }
  }

  @Override
  public RealFunction derivative()
  {
    return Function.express(Real.class,
                            Real.class,
                            RealFunction.class,
                            "_diffχfuncfunc",
                            "diff((((((1^(p+1))/(p+1))*_intw(1))*(∫P(i)d1))-((((-1^(p+1))/(p+1))*_intw(-1))*(∫P(i)d-1)))/normSq(i),p)",
                            context);
  }

  @Override
  public RealFunction integral()
  {
    return Function.express(Real.class,
                            Real.class,
                            RealFunction.class,
                            "_intχfuncfunc",
                            "int((((((1^(p+1))/(p+1))*_intw(1))*(∫P(i)d1))-((((-1^(p+1))/(p+1))*_intw(-1))*(∫P(i)d-1)))/normSq(i),p)",
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
      if (normSq == null)
      {
        normSq = new normSq();
      }

      if (normSq.α == null)
      {
        normSq.α = new Real();
        normSq.α.set(α);
      }
      else
      {
        normSq.α = α;
      }

      if (normSq.β == null)
      {
        normSq.β = new Real();
        normSq.β.set(β);
      }
      else
      {
        normSq.β = β;
      }

      if (normSq.γ == null)
      {
        normSq.γ = new Real();
        normSq.γ.set(γ);
      }
      else
      {
        normSq.γ = γ;
      }

      if (_intw == null)
      {
        _intw = new _intw();
      }

      if (_intw.α == null)
      {
        _intw.α = new Real();
        _intw.α.set(α);
      }
      else
      {
        _intw.α = α;
      }

      if (_intw.β == null)
      {
        _intw.β = new Real();
        _intw.β.set(β);
      }
      else
      {
        _intw.β = β;
      }

      if (_intw.γ == null)
      {
        _intw.γ = new Real();
        _intw.γ.set(γ);
      }
      else
      {
        _intw.γ = γ;
      }

      if (P == null)
      {
        P = new P();
      }

      if (P.α == null)
      {
        P.α = new Real();
        P.α.set(α);
      }
      else
      {
        P.α = α;
      }

      if (P.β == null)
      {
        P.β = new Real();
        P.β.set(β);
      }
      else
      {
        P.β = β;
      }

      if (P.γ == null)
      {
        P.γ = new Real();
        P.γ.set(γ);
      }
      else
      {
        P.γ = γ;
      }

      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    vXℝ0015.close();
    vXℝ0016.close();
    vℝ0084.close();
    vℝ0085.close();
    vℝ0086.close();
    vℝ0087.close();
    vℝ0088.close();
    vℝ0089.close();
    vℝ0090.close();
    vℝ0091.close();
    vℝ0092.close();
    vℝ0093.close();
    vℝ0094.close();
    vℝ0095.close();
    vℝ0096.close();
    vℝ0097.close();
    vℝ0098.close();
    vℝ0099.close();
    vℝ0100.close();
    vℝ0101.close();
    vℝ0102.close();
    vℤ0007.close();
    vℤ0008.close();
    vℤ0009.close();
    P.close();
    _intw.close();
    normSq.close();
  }

  @Override
  public String getName()
  {
    return "χfuncfunc";
  }

  @Override
  public Context getContext()
  {
    return context;
  }

  @Override
  public String toString()
  {
    return "p➔(((((1^(p+1))/(p+1))*_intw(1))*(∫P(i)d1))-((((-1^(p+1))/(p+1))*_intw(-1))*(∫P(i)d-1)))/normSq(i)";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(\\left(\\left(\\frac{{1}^{(\\left(p + 1\\right))}}{\\left(p + 1\\right)} \\cdot \\_intw(1)\\right) \\cdot \\int \\P(i)(1) d1\\right)-\\left(\\left(\\frac{{-1}^{(\\left(p + 1\\right))}}{\\left(p + 1\\right)} \\cdot \\_intw(-1)\\right) \\cdot \\int \\P(i)(-1) d-1\\right)\\right)}{\\normSq(i)}";
  }
}
