package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.RealPolynomial;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.integer.RealPolynomialSequence;

public class A implements
               RealPolynomialSequence,
               Typesettable,
               AutoCloseable,
               Initializable,
               Named
{
  public boolean        isInitialized;
  public Context        context = new Context();
  public final Integer  cℤ0000  = new Integer("1");
  public final Integer  cℤ0001  = new Integer("2");
  public RealPolynomial vXℝ0001 = new RealPolynomial();
  public RealPolynomial vXℝ0002 = new RealPolynomial();
  public RealPolynomial vXℝ0003 = new RealPolynomial();
  public RealPolynomial vXℝ0004 = new RealPolynomial();
  public Real           vℝ0009  = new Real();
  public Real           vℝ0010  = new Real();
  public Real           vℝ0011  = new Real();
  public Real           vℝ0012  = new Real();
  public Real           vℝ0013  = new Real();
  public G              G;
  public F              F;
  public C              C;
  public Real           α;
  public Real           β;

  @Override
  public Class<Integer> domainType()
  {
    return Integer.class;
  }

  @Override
  public Class<RealPolynomial> coDomainType()
  {
    return RealPolynomial.class;
  }

  @Override
  public RealPolynomial evaluate(Integer n, int order, int bits, RealPolynomial result)
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

      return ((Real) this.F.evaluate(n,
                                     order,
                                     bits,
                                     this.vℝ0009)).mul(this.vXℝ0001.identity(), bits, this.vXℝ0002)
                                                  .add((Real) this.G.evaluate(null,
                                                                              order,
                                                                              bits,
                                                                              this.vℝ0010),
                                                       bits,
                                                       this.vXℝ0003)
                                                  .mul(((Real) this.C.evaluate(this.vℝ0011.set(n),
                                                                               order,
                                                                               bits,
                                                                               this.vℝ0012)).sub(this.cℤ0000,
                                                                                                 bits,
                                                                                                 this.vℝ0013),
                                                       bits,
                                                       this.vXℝ0004)
                                                  .div(this.cℤ0001, bits, result);
    }
  }

  @Override
  public RealPolynomialSequence derivative()
  {
    return Function.express(Integer.class,
                            RealPolynomial.class,
                            RealPolynomialSequence.class,
                            "_diffA",
                            "diff((((F(n)*x)+G())*(C(n)-1))/2,n)",
                            this.context);
  }

  @Override
  public RealPolynomialSequence integral()
  {
    return Function.express(Integer.class,
                            RealPolynomial.class,
                            RealPolynomialSequence.class,
                            "_intA",
                            "int((((F(n)*x)+G())*(C(n)-1))/2,n)",
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
      if (this.G == null)
      {
        this.G = new G();
      }

      if (this.G.α == null)
      {
        this.G.α = new Real();
        this.G.α.set(this.α);
      }
      else
      {
        this.G.α = this.α;
      }

      if (this.G.β == null)
      {
        this.G.β = new Real();
        this.G.β.set(this.β);
      }
      else
      {
        this.G.β = this.β;
      }

      if (this.F == null)
      {
        this.F = new F();
      }

      if (this.F.α == null)
      {
        this.F.α = new Real();
        this.F.α.set(this.α);
      }
      else
      {
        this.F.α = this.α;
      }

      if (this.F.β == null)
      {
        this.F.β = new Real();
        this.F.β.set(this.β);
      }
      else
      {
        this.F.β = this.β;
      }

      if (this.C == null)
      {
        this.C = new C();
      }

      if (this.C.α == null)
      {
        this.C.α = new Real();
        this.C.α.set(this.α);
      }
      else
      {
        this.C.α = this.α;
      }

      if (this.C.β == null)
      {
        this.C.β = new Real();
        this.C.β.set(this.β);
      }
      else
      {
        this.C.β = this.β;
      }

      this.F.C           = this.C;
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ0000.close();
    this.cℤ0001.close();
    this.vXℝ0001.close();
    this.vXℝ0002.close();
    this.vXℝ0003.close();
    this.vXℝ0004.close();
    this.vℝ0009.close();
    this.vℝ0010.close();
    this.vℝ0011.close();
    this.vℝ0012.close();
    this.vℝ0013.close();
    this.C.close();
    this.F.close();
    this.G.close();
  }

  @Override
  public String getName()
  {
    return "A";
  }

  @Override
  public Context getContext()
  {
    return this.context;
  }

  @Override
  public String toString()
  {
    return "A:n➔(((F(n)*x)+G())*(C(n)-1))/2";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(\\left(\\left(\\F(n) \\cdot x\\right) + \\G()\\right) \\cdot \\left(\\C(n)-1\\right)\\right)}{2}";
  }
}
