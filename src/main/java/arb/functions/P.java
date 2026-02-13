package arb.functions;

import arb.*;
import arb.Integer;
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
      if (!isInitialized)
      {
        initialize();
      }
      return switch (n.getSignedValue())
      {
      case 0 -> result.set(cℤ0001);
      case 1 -> C.evaluate(vℝ0026.set(cℤ0001), order, bits, vℝ0027)
                 .mul(vXℝ0005.identity(), bits, vXℝ0006)
                 .sub(β, bits, vXℝ0007)
                 .add(α, bits, vXℝ0008)
                 .div(cℤ0002, bits, result);
      default -> A.evaluate(n, order, bits, vXℝ0009)
                  .mul(P.evaluate(n.sub(cℤ0001, bits, vℤ0001), order, bits, vXℝ0010), bits, vXℝ0011)
                  .sub(B.evaluate(n, order, bits, vℝ0028)
                        .mul(P.evaluate(n.sub(cℤ0002, bits, vℤ0002), order, bits, vXℝ0012),
                             bits,
                             vXℝ0013),
                       bits,
                       vXℝ0014)
                  .div(E.evaluate(n, order, bits, vℝ0029), bits, result);
      };
    }
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      if (A == null)
      {
        A = new A();
      }

      if (B == null)
      {
        B = new B();
      }

      if (C == null)
      {
        C = new C();
      }

      if (E == null)
      {
        E = new E();
      }

      if (E.α == null)
      {
        E.α = α;
      }
      else
      {
        E.α.set(α);
      }

      if (E.β == null)
      {
        E.β = β;
      }
      else
      {
        E.β.set(β);
      }

      if (B.α == null)
      {
        B.α = α;
      }
      else
      {
        B.α.set(α);
      }

      if (B.β == null)
      {
        B.β = β;
      }
      else
      {
        B.β.set(β);
      }

      if (A.α == null)
      {
        A.α = α;
      }
      else
      {
        A.α.set(α);
      }

      if (A.β == null)
      {
        A.β = β;
      }
      else
      {
        A.β.set(β);
      }

      if (C.α == null)
      {
        C.α = α;
      }
      else
      {
        C.α.set(α);
      }

      if (C.β == null)
      {
        C.β = β;
      }
      else
      {
        C.β.set(β);
      }

      A.C = C;
      B.C = C;
      E.C = C;
      P   = new P();
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
    cℤ0001.close();
    cℤ0002.close();
    vXℝ0005.close();
    vXℝ0006.close();
    vXℝ0007.close();
    vXℝ0008.close();
    vXℝ0009.close();
    vXℝ0010.close();
    vXℝ0011.close();
    vXℝ0012.close();
    vXℝ0013.close();
    vXℝ0014.close();
    vℝ0026.close();
    vℝ0027.close();
    vℝ0028.close();
    vℝ0029.close();
    vℤ0001.close();
    vℤ0002.close();
    P.close();
    A.close();
    B.close();
    C.close();
    E.close();
  }

  @Override
  public String getName()
  {
    return "P";
  }

  @Override
  public Context getContext()
  {
    return context;
  }

  @Override
  public String toString()
  {
    return "P:n➔when(n=0,1,n=1,(((C(1)*x)-β)+α)/2,else,((A(n)*P(n-1))-(B(n)*P(n-2)))/E(n))";
  }

  @Override
  public String typeset()
  {
    return "\\left\\{\\begin{array}{ll}\n1 & \\text{if } n = 0\\\\\n\\frac{\\left(\\left(\\left(\\C(1) \\cdot x\\right)-β\\right) + α\\right)}{2} & \\text{if } n = 1\\\\\n\\frac{\\left(\\left(\\A(n) \\cdot \\P(\\left(n-1\\right))\\right)-\\left(\\B(n) \\cdot \\P(\\left(n-2\\right))\\right)\\right)}{\\E(n)} & \\text{otherwise}\n\\end{array}\\right.";
  }
}
