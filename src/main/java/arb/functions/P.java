package arb.functions;


import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.RealPolynomial;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.integer.RealPolynomialSequence;

public class P implements
               RealPolynomialSequence,
               Typesettable,
               AutoCloseable,
               Initializable,
               Named
{
  public boolean        isInitialized;
  public Context        context = new Context();
  public final Integer  cℤ0000  = new Integer("0");
  public final Integer  cℤ0001  = new Integer("1");
  public final Integer  cℤ0002  = new Integer("2");
  public RealPolynomial vXℝ0005 = new RealPolynomial();
  public RealPolynomial vXℝ0006 = new RealPolynomial();
  public RealPolynomial vXℝ0007 = new RealPolynomial();
  public RealPolynomial vXℝ0008 = new RealPolynomial();
  public RealPolynomial vXℝ0009 = new RealPolynomial();
  public RealPolynomial vXℝ0010 = new RealPolynomial();
  public RealPolynomial vXℝ0011 = new RealPolynomial();
  public RealPolynomial vXℝ0012 = new RealPolynomial();
  public RealPolynomial vXℝ0013 = new RealPolynomial();
  public RealPolynomial vXℝ0014 = new RealPolynomial();
  public Real           vℝ0026  = new Real();
  public Real           vℝ0027  = new Real();
  public Real           vℝ0028  = new Real();
  public Real           vℝ0029  = new Real();
  public Integer        vℤ0001  = new Integer();
  public Integer        vℤ0002  = new Integer();
  public P              P;
  public E              E;
  public B              B;
  public A              A;
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
      return switch (n.getSignedValue())
      {
      case 0 -> result.set(this.cℤ0001);
      case 1 ->
           ((Real) this.C.evaluate(this.vℝ0026.set(this.cℤ0001),
                                   order,
                                   bits,
                                   this.vℝ0027)).mul(this.vXℝ0005.identity(), bits, this.vXℝ0006)
                                                .sub(this.β, bits, this.vXℝ0007)
                                                .add(this.α, bits, this.vXℝ0008)
                                                .div(this.cℤ0002, bits, result);
      default ->
              ((RealPolynomial) this.A.evaluate(n,
                                                order,
                                                bits,
                                                this.vXℝ0009)).mul((RealPolynomial) this.P.evaluate(n.sub(this.cℤ0001, bits, this.vℤ0001), order, bits, this.vXℝ0010), bits, this.vXℝ0011).sub(((Real) this.B.evaluate(n, order, bits, this.vℝ0028)).mul((RealPolynomial) this.P.evaluate(n.sub(this.cℤ0002, bits, this.vℤ0002), order, bits, this.vXℝ0012), bits, this.vXℝ0013), bits, this.vXℝ0014).div((Real) this.E.evaluate(n, order, bits, this.vℝ0029), bits, result);
      };
    }
  }

  @Override
  public RealPolynomialSequence derivative()
  {
    return Function.express(Integer.class,
                            RealPolynomial.class,
                            RealPolynomialSequence.class,
                            "_diffP",
                            "diff(when(n=0,1,n=1,(((C(1)*x)-β)+α)/2,else,((A(n)*P(n-1))-(B(n)*P(n-2)))/E(n)),n)",
                            this.context);
  }

  @Override
  public RealPolynomialSequence integral()
  {
    return Function.express(Integer.class,
                            RealPolynomial.class,
                            RealPolynomialSequence.class,
                            "_intP",
                            "int(when(n=0,1,n=1,(((C(1)*x)-β)+α)/2,else,((A(n)*P(n-1))-(B(n)*P(n-2)))/E(n)),n)",
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
      if (this.E == null)
      {
        this.E = new E();
      }

      if (this.E.α == null)
      {
        this.E.α = new Real();
        this.E.α.set(this.α);
      }
      else
      {
        this.E.α = this.α;
      }

      if (this.E.β == null)
      {
        this.E.β = new Real();
        this.E.β.set(this.β);
      }
      else
      {
        this.E.β = this.β;
      }

      if (this.B == null)
      {
        this.B = new B();
      }

      if (this.B.α == null)
      {
        this.B.α = new Real();
        this.B.α.set(this.α);
      }
      else
      {
        this.B.α = this.α;
      }

      if (this.B.β == null)
      {
        this.B.β = new Real();
        this.B.β.set(this.β);
      }
      else
      {
        this.B.β = this.β;
      }

      if (this.A == null)
      {
        this.A = new A();
      }

      if (this.A.α == null)
      {
        this.A.α = new Real();
        this.A.α.set(this.α);
      }
      else
      {
        this.A.α = this.α;
      }

      if (this.A.β == null)
      {
        this.A.β = new Real();
        this.A.β.set(this.β);
      }
      else
      {
        this.A.β = this.β;
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

      this.A.C = this.C;
      this.B.C = this.C;
      this.E.C = this.C;
      this.P   = new P();
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
    this.cℤ0000.close();
    this.cℤ0001.close();
    this.cℤ0002.close();
    this.vXℝ0005.close();
    this.vXℝ0006.close();
    this.vXℝ0007.close();
    this.vXℝ0008.close();
    this.vXℝ0009.close();
    this.vXℝ0010.close();
    this.vXℝ0011.close();
    this.vXℝ0012.close();
    this.vXℝ0013.close();
    this.vXℝ0014.close();
    this.vℝ0026.close();
    this.vℝ0027.close();
    this.vℝ0028.close();
    this.vℝ0029.close();
    this.vℤ0001.close();
    this.vℤ0002.close();
    this.P.close();
    this.A.close();
    this.B.close();
    this.C.close();
    this.E.close();
  }

  @Override
  public String getName()
  {
    return "P";
  }

  @Override
  public Context getContext()
  {
    return this.context;
  }

  @Override
  public String toString()
  {
    return "P:n➔when(n=0,1,n=1,(((C(1)*x)-β)+α)/2,else,((A(n)*P(n-1))-(B(n)*P(n-2)))/E(n))";
  }

  @Override
  public String typeset()
  {
    return "1, \\frac{\\left(\\left(\\left(\\C(1) \\cdot x\\right)-β\\right) + α\\right)}{2} \text{otherwise} \\frac{\\left(\\left(\\A(n) \\cdot \\P(\\left(n-1\\right))\\right)-\\left(\\B(n) \\cdot \\P(\\left(n-2\\right))\\right)\\right)}{\\E(n)}";
  }
}
