package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.real.RealFunction;

public class χfunc implements
                   RealFunction,
                   Typesettable,
                   AutoCloseable,
                   Initializable,
                   Named
{
  public boolean isInitialized;
  public Context context = new Context();
  public normSq  normSq;
  public _intw   _intw;
  public P       P;
  public Integer i;
  public Real    α;
  public Real    β;
  public Real    γ;

  @Override
  public Class<Real> domainType()
  {
    return Real.class;
  }

  @Override
  public Class<RealFunction> coDomainType()
  {
    return RealFunction.class;
  }

  @Override
  public RealFunction evaluate(Real t, int order, int bits, RealFunction result)
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

      χfuncfunc var10000 = new χfuncfunc();
      var10000.α      = this.α;
      var10000.β      = this.β;
      var10000.γ      = this.γ;
      var10000.P      = this.P;
      var10000._intw  = this._intw;
      var10000.normSq = this.normSq;
      var10000.initialize();
      return var10000;
    }
  }

  @Override
  public RealFunction derivative()
  {
    return Function.express(Real.class,
                            RealFunction.class,
                            RealFunction.class,
                            "_diffχfunc",
                            "diff((((((1^(p+1))/(p+1))*_intw(1))*(∫P(i)d1))-((((-1^(p+1))/(p+1))*_intw(-1))*(∫P(i)d-1)))/normSq(i),t)",
                            this.context);
  }

  @Override
  public RealFunction integral()
  {
    return Function.express(Real.class,
                            RealFunction.class,
                            RealFunction.class,
                            "_intχfunc",
                            "int((((((1^(p+1))/(p+1))*_intw(1))*(∫P(i)d1))-((((-1^(p+1))/(p+1))*_intw(-1))*(∫P(i)d-1)))/normSq(i),t)",
                            this.context);
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
      if (this.normSq == null)
      {
        this.normSq = new normSq();
      }

      if (this.normSq.α == null)
      {
        this.normSq.α = new Real();
        this.normSq.α.set(this.α);
      }
      else
      {
        this.normSq.α = this.α;
      }

      if (this.normSq.β == null)
      {
        this.normSq.β = new Real();
        this.normSq.β.set(this.β);
      }
      else
      {
        this.normSq.β = this.β;
      }

      if (this.normSq.γ == null)
      {
        this.normSq.γ = new Real();
        this.normSq.γ.set(this.γ);
      }
      else
      {
        this.normSq.γ = this.γ;
      }

      if (this._intw == null)
      {
        this._intw = new _intw();
      }

      if (this._intw.α == null)
      {
        this._intw.α = new Real();
        this._intw.α.set(this.α);
      }
      else
      {
        this._intw.α = this.α;
      }

      if (this._intw.β == null)
      {
        this._intw.β = new Real();
        this._intw.β.set(this.β);
      }
      else
      {
        this._intw.β = this.β;
      }

      if (this._intw.γ == null)
      {
        this._intw.γ = new Real();
        this._intw.γ.set(this.γ);
      }
      else
      {
        this._intw.γ = this.γ;
      }

      if (this.P == null)
      {
        this.P = new P();
      }

      if (this.P.α == null)
      {
        this.P.α = new Real();
        this.P.α.set(this.α);
      }
      else
      {
        this.P.α = this.α;
      }

      if (this.P.β == null)
      {
        this.P.β = new Real();
        this.P.β.set(this.β);
      }
      else
      {
        this.P.β = this.β;
      }

      if (this.P.γ == null)
      {
        this.P.γ = new Real();
        this.P.γ.set(this.γ);
      }
      else
      {
        this.P.γ = this.γ;
      }

      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
  }

  @Override
  public String getName()
  {
    return "χfunc";
  }

  @Override
  public Context getContext()
  {
    return this.context;
  }

  @Override
  public String toString()
  {
    return "t➔(((((1^(p+1))/(p+1))*_intw(1))*(∫P(i)d1))-((((-1^(p+1))/(p+1))*_intw(-1))*(∫P(i)d-1)))/normSq(i)";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(\\left(\\left(\\frac{{1}^{(\\left(p + 1\\right))}}{\\left(p + 1\\right)} \\cdot \\_intw(1)\\right) \\cdot \\int \\P(i)(1) d1\\right)-\\left(\\left(\\frac{{-1}^{(\\left(p + 1\\right))}}{\\left(p + 1\\right)} \\cdot \\_intw(-1)\\right) \\cdot \\int \\P(i)(-1) d-1\\right)\\right)}{\\normSq(i)}";
  }
}
