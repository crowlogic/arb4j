package arb.functions;

import arb.*;
import arb.Integer;
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
      if (!isInitialized)
      {
        initialize();
      }

      return F.evaluate(n, order, bits, vℝ0009)
              .mul(vXℝ0001.identity(), bits, vXℝ0002)
              .add(G.evaluate(null, order, bits, vℝ0010), bits, vXℝ0003)
              .mul(C.evaluate(vℝ0011.set(n), order, bits, vℝ0012).sub(cℤ0000, bits, vℝ0013),
                   bits,
                   vXℝ0004)
              .div(cℤ0001, bits, result);
    }
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
      if (C == null)
      {
        C = new C();
      }

      if (F == null)
      {
        F = new F();
      }

      if (G == null)
      {
        G = new G();
      }

      if (G.α == null)
      {
        G.α = α;
      }
      else
      {
        G.α.set(α);
      }

      if (G.β == null)
      {
        G.β = β;
      }
      else
      {
        G.β.set(β);
      }

      if (F.α == null)
      {
        F.α = α;
      }
      else
      {
        F.α.set(α);
      }

      if (F.β == null)
      {
        F.β = β;
      }
      else
      {
        F.β.set(β);
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

      F.C           = C;
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    cℤ0001.close();
    vXℝ0001.close();
    vXℝ0002.close();
    vXℝ0003.close();
    vXℝ0004.close();
    vℝ0009.close();
    vℝ0010.close();
    vℝ0011.close();
    vℝ0012.close();
    vℝ0013.close();
    C.close();
    F.close();
    G.close();
  }

  @Override
  public String getName()
  {
    return "A";
  }

  @Override
  public Context getContext()
  {
    return context;
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
