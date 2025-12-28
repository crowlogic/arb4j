package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.RealPolynomial;
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
  public normSq         normSq;
  public _intw          _intw;
  public P              P;
  public Integer        i;
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
      if (!this.isInitialized)
      {
        this.initialize();
      }

      return this.cℤ0000.pow(p.add(this.cℤ0000, bits, this.vℝ0084), bits, this.vℝ0085)
                        .div(this.vℝ0084, bits, this.vℝ0086)
                        .mul((Real) this._intw.evaluate(this.vℝ0087.set(this.cℤ0000),
                                                        order,
                                                        bits,
                                                        this.vℝ0088),
                             bits,
                             this.vℝ0089)
                        .mul((Real) ((RealPolynomial) this.P.evaluate(this.i,
                                                                      order,
                                                                      bits,
                                                                      this.vXℝ0015)).integral()
                                                                                    .evaluate(this.vℝ0090.set(this.cℤ0000),
                                                                                              order,
                                                                                              bits,
                                                                                              this.vℝ0091),
                             bits,
                             this.vℝ0092)
                        .sub(this.cℤ0000.neg(this.vℤ0007)
                                        .pow(this.vℝ0084, bits, this.vℝ0093)
                                        .div(this.vℝ0084, bits, this.vℝ0094)
                                        .mul((Real) this._intw.evaluate(this.cℤ0000.neg(this.vℝ0095),
                                                                        order,
                                                                        bits,
                                                                        this.vℝ0096),
                                             bits,
                                             this.vℝ0097)
                                        .mul((Real) ((RealPolynomial) this.P.evaluate(this.i,
                                                                                      order,
                                                                                      bits,
                                                                                      this.vXℝ0016)).integral()
                                                                                                    .evaluate(this.vℝ0098.set(this.cℤ0000.neg(this.vℤ0008)),
                                                                                                              order,
                                                                                                              bits,
                                                                                                              this.vℝ0099),
                                             bits,
                                             this.vℝ0100),
                             bits,
                             this.vℝ0101)
                        .div((Real) this.normSq.evaluate(this.i, order, bits, this.vℝ0102),
                             bits,
                             result);
    }
  }

  @Override
  public RealFunction derivative()
  {
    return Function.express(Real.class,
                            Real.class,
                            RealFunction.class,
                            "_diffχfunc",
                            "diff((((((1^(p+1))/(p+1))*_intw(1))*(PolynomialIntegralNode[polynomialNode=P(i)(class arb.expressions.nodes.unary.FunctionNode of type class arb.RealPolynomial), argumentNode=1(class arb.expressions.nodes.LiteralConstantNode of type class arb.Integer)]))-((((-1^(p+1))/(p+1))*_intw(-1))*(PolynomialIntegralNode[polynomialNode=P(i)(class arb.expressions.nodes.unary.FunctionNode of type class arb.RealPolynomial), argumentNode=-1(class arb.expressions.nodes.unary.NegationNode of type class arb.Integer)])))/normSq(i),p)",
                            this.context);
  }

  @Override
  public RealFunction integral()
  {
    return Function.express(Real.class,
                            Real.class,
                            RealFunction.class,
                            "_intχfunc",
                            "int((((((1^(p+1))/(p+1))*_intw(1))*(PolynomialIntegralNode[polynomialNode=P(i)(class arb.expressions.nodes.unary.FunctionNode of type class arb.RealPolynomial), argumentNode=1(class arb.expressions.nodes.LiteralConstantNode of type class arb.Integer)]))-((((-1^(p+1))/(p+1))*_intw(-1))*(PolynomialIntegralNode[polynomialNode=P(i)(class arb.expressions.nodes.unary.FunctionNode of type class arb.RealPolynomial), argumentNode=-1(class arb.expressions.nodes.unary.NegationNode of type class arb.Integer)])))/normSq(i),p)",
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

      if (this.P.t == null)
      {
        this.P.t = new Real();
        this.P.t.set(this.t);
      }
      else
      {
        this.P.t = this.t;
      }

      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ0000.close();
    this.vXℝ0015.close();
    this.vXℝ0016.close();
    this.vℝ0084.close();
    this.vℝ0085.close();
    this.vℝ0086.close();
    this.vℝ0087.close();
    this.vℝ0088.close();
    this.vℝ0089.close();
    this.vℝ0090.close();
    this.vℝ0091.close();
    this.vℝ0092.close();
    this.vℝ0093.close();
    this.vℝ0094.close();
    this.vℝ0095.close();
    this.vℝ0096.close();
    this.vℝ0097.close();
    this.vℝ0098.close();
    this.vℝ0099.close();
    this.vℝ0100.close();
    this.vℝ0101.close();
    this.vℝ0102.close();
    this.vℤ0007.close();
    this.vℤ0008.close();
    this.P.close();
    this._intw.close();
    this.normSq.close();
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
    return "p➔(((((1^(p+1))/(p+1))*_intw(1))*(PolynomialIntegralNode[polynomialNode=P(i)(class arb.expressions.nodes.unary.FunctionNode of type class arb.RealPolynomial), argumentNode=1(class arb.expressions.nodes.LiteralConstantNode of type class arb.Integer)]))-((((-1^(p+1))/(p+1))*_intw(-1))*(PolynomialIntegralNode[polynomialNode=P(i)(class arb.expressions.nodes.unary.FunctionNode of type class arb.RealPolynomial), argumentNode=-1(class arb.expressions.nodes.unary.NegationNode of type class arb.Integer)])))/normSq(i)";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(\\left(\\left(\\frac{{1}^{(\\left(p + 1\\right))}}{\\left(p + 1\\right)} \\cdot \\_intw(1)\\right) \\cdot \\int \\P(i)(1) d1\\right)-\\left(\\left(\\frac{{-1}^{(\\left(p + 1\\right))}}{\\left(p + 1\\right)} \\cdot \\_intw(-1)\\right) \\cdot \\int \\P(i)(-1) d-1\\right)\\right)}{\\normSq(i)}";
  }
}
