package arb.functions;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;
import arb.functions.rational.RationalFunctionSequence;

public class A implements
               RationalFunctionSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean          isInitialized;
  public final Integer    cℤ0000 = new Integer("1");
  public final Integer    cℤ0001 = new Integer("2");
  public Fraction         vf0006 = new Fraction();
  public Fraction         vf0007 = new Fraction();
  public Fraction         vf0008 = new Fraction();
  public Fraction         vf0009 = new Fraction();
  public Fraction         vf0010 = new Fraction();
  public RationalFunction vℚ0001 = new RationalFunction();
  public RationalFunction vℚ0002 = new RationalFunction();
  public RationalFunction vℚ0003 = new RationalFunction();
  public RationalFunction vℚ0004 = new RationalFunction();
  public C                C;
  public G                G;
  public F                F;
  public Real             α;
  public Real             β;

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  @Override
  public RationalFunction evaluate(Integer n, int order, int bits, RationalFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return F.evaluate(n, order, bits, vf0006)
            .mul(vℚ0001.identity(), bits, vℚ0002)
            .add(G.evaluate(null, order, bits, vf0007), bits, vℚ0003)
            .mul(C.evaluate(vf0008.set(n), order, bits, vf0009).sub(cℤ0000, bits, vf0010), bits, vℚ0004)
            .div(cℤ0001, bits, result);
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
      throw new AssertionError("A.α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("A.β is null");
    }
    else
    {
   

      if (F == null)
      {
        F = new F();
      }
      if (C == null)
      {
        C = new C();
      }
      F.C = C;
      if (G == null)
      {
        G = new G();
      }

      C.α           = α;
      C.β           = β;
      F.α           = α;
      F.β           = β;
      G.α           = α;
      G.β           = β;
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    cℤ0001.close();
    vf0006.close();
    vf0007.close();
    vf0008.close();
    vf0009.close();
    vf0010.close();
    vℚ0001.close();
    vℚ0002.close();
    vℚ0003.close();
    vℚ0004.close();
    C.close();
    F.close();
    G.close();
  }

  @Override
  public String toString()
  {
    return "A:n➔(F(n)*x+G(null)*C(n)-1)/2";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\F(n) \\cdot x + \\G() \\cdot \\left(\\C(n)-1\\right)}{2}";
  }
}
