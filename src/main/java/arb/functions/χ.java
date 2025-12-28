package arb.functions;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.integer.RealFunctionSequence;
import arb.functions.real.RealFunction;

public class χ implements
               RealFunctionSequence,
               Typesettable,
               AutoCloseable,
               Initializable,
               Named
{
  public boolean isInitialized;
  public Context context = new Context();
  public normSq  normSq;
  public _intw   _intw;
  public w       w;
  public P       P;
  public Real    t;
  public Real    α;
  public Real    β;
  public Real    γ;

  @Override
  public Class<Integer> domainType()
  {
    return Integer.class;
  }

  @Override
  public Class<RealFunction> coDomainType()
  {
    return RealFunction.class;
  }

  @Override
  public RealFunction evaluate(Integer i, int order, int bits, RealFunction result)
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

      χfunc var10000 = new χfunc();
      var10000.i      = i;
      var10000.α      = this.α;
      var10000.β      = this.β;
      var10000.γ      = this.γ;
      var10000.t      = this.t;
      var10000.P      = this.P;
      var10000._intw  = this._intw;
      var10000.normSq = this.normSq;
      var10000.initialize();
      return var10000;
    }
  }

  @Override
  public RealFunctionSequence derivative()
  {
    return Function.express(Integer.class,
                            RealFunction.class,
                            RealFunctionSequence.class,
                            "_diffχ",
                            "diff((((((1^(p+1))/(p+1))*_intw(1))*(PolynomialIntegralNode[polynomialNode=P(i)(class arb.expressions.nodes.unary.FunctionNode of type class arb.RealPolynomial), argumentNode=1(class arb.expressions.nodes.LiteralConstantNode of type class arb.Integer)]))-((((-1^(p+1))/(p+1))*_intw(-1))*(PolynomialIntegralNode[polynomialNode=P(i)(class arb.expressions.nodes.unary.FunctionNode of type class arb.RealPolynomial), argumentNode=-1(class arb.expressions.nodes.unary.NegationNode of type class arb.Integer)])))/normSq(i),i)",
                            this.context);
  }

  @Override
  public RealFunctionSequence integral()
  {
    return Function.express(Integer.class,
                            RealFunction.class,
                            RealFunctionSequence.class,
                            "_intχ",
                            "int((((((1^(p+1))/(p+1))*_intw(1))*(PolynomialIntegralNode[polynomialNode=P(i)(class arb.expressions.nodes.unary.FunctionNode of type class arb.RealPolynomial), argumentNode=1(class arb.expressions.nodes.LiteralConstantNode of type class arb.Integer)]))-((((-1^(p+1))/(p+1))*_intw(-1))*(PolynomialIntegralNode[polynomialNode=P(i)(class arb.expressions.nodes.unary.FunctionNode of type class arb.RealPolynomial), argumentNode=-1(class arb.expressions.nodes.unary.NegationNode of type class arb.Integer)])))/normSq(i),i)",
                            this.context);
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (this.t == null)
    {
      throw new AssertionError("t is null");
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

      if (this.normSq.t == null)
      {
        this.normSq.t = new Real();
        this.normSq.t.set(this.t);
      }
      else
      {
        this.normSq.t = this.t;
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

      if (this._intw.t == null)
      {
        this._intw.t = new Real();
        this._intw.t.set(this.t);
      }
      else
      {
        this._intw.t = this.t;
      }

      if (this.w == null)
      {
        this.w = new w();
      }

      if (this.w.α == null)
      {
        this.w.α = new Real();
        this.w.α.set(this.α);
      }
      else
      {
        this.w.α = this.α;
      }

      if (this.w.β == null)
      {
        this.w.β = new Real();
        this.w.β.set(this.β);
      }
      else
      {
        this.w.β = this.β;
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
    return "χ";
  }

  @Override
  public Context getContext()
  {
    return this.context;
  }

  @Override
  public String toString()
  {
    return "χ:i➔(((((1^(p+1))/(p+1))*_intw(1))*(PolynomialIntegralNode[polynomialNode=P(i)(class arb.expressions.nodes.unary.FunctionNode of type class arb.RealPolynomial), argumentNode=1(class arb.expressions.nodes.LiteralConstantNode of type class arb.Integer)]))-((((-1^(p+1))/(p+1))*_intw(-1))*(PolynomialIntegralNode[polynomialNode=P(i)(class arb.expressions.nodes.unary.FunctionNode of type class arb.RealPolynomial), argumentNode=-1(class arb.expressions.nodes.unary.NegationNode of type class arb.Integer)])))/normSq(i)";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(\\left(\\left(\\frac{{1}^{(\\left(p + 1\\right))}}{\\left(p + 1\\right)} \\cdot \\_intw(1)\\right) \\cdot \\int \\P(i)(1) d1\\right)-\\left(\\left(\\frac{{-1}^{(\\left(p + 1\\right))}}{\\left(p + 1\\right)} \\cdot \\_intw(-1)\\right) \\cdot \\int \\P(i)(-1) d-1\\right)\\right)}{\\normSq(i)}";
  }
}
