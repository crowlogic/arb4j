package arb.functions.real;

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
  public final Integer    cℤ2;
  public final Integer    cℤ1;
  public Real             iℝ8;
  public RationalFunction iℚ5;
  public RationalFunction iℚ2;
  public RationalFunction iℚ1;
  public RationalFunction iℚ4;
  public Real             iℝ7;
  public Real             iℝ6;
  public RationalFunction iℚ3;
  public C                C = new C();
  public F                F = new F();
  public G                G = new G();
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

    return F.evaluate(n, order, bits, iℝ6)
            .mul(iℚ1.identity(), bits, iℚ2)
            .add(G.evaluate(null, order, bits, iℚ3), bits, iℚ4)
            .mul(C.evaluate(n, order, bits, iℝ7).sub(cℤ1, bits, iℝ8), bits, iℚ5)
            .div(cℤ2, bits, result);
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
      C.α           = α;
      C.β           = β;
      F.α           = α;
      F.β           = β;
      G.α           = α;
      G.β           = β;
      isInitialized = true;
    }
  }

  public A()
  {
    cℤ2 = new Integer("2");
    cℤ1 = new Integer("1");
    iℝ8 = new Real();
    iℚ5 = new RationalFunction();
    iℚ2 = new RationalFunction();
    iℚ1 = new RationalFunction();
    iℚ4 = new RationalFunction();
    iℝ7 = new Real();
    iℝ6 = new Real();
    iℚ3 = new RationalFunction();
  }

  @Override
  public void close()
  {
    cℤ2.close();
    cℤ1.close();
    iℝ8.close();
    iℚ5.close();
    iℚ2.close();
    iℚ1.close();
    iℚ4.close();
    iℝ7.close();
    iℝ6.close();
    iℚ3.close();
    C.close();
    F.close();
    G.close();
  }

  @Override
  public String toString()
  {
    return "A:n➔(F(n)*x+G())*(C(n)-1)/2";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\F(n) \\cdot x + \\G() \\cdot \\left(\\C(n)-1\\right)}{2}";
  }
}
