package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.RationalNullaryFunction;
import arb.Real;
import arb.Typesettable;
import arb.functions.real.RealRationalHypergeometricFunction;
import arb.functions.real.RealRationalNullaryFunction;

public class pFq implements RationalNullaryFunction, Typesettable, AutoCloseable, Initializable
{
  public static void main(String args[])
  {
    try ( pFq f = new pFq())
    {
      RationalFunction x = f.evaluate(128);
      System.out.println(f + "=" + x);
    }
  }

  public boolean isInitialized;
  Integer        cℤ1 = new Integer("2");
  Integer        cℤ4 = new Integer("4");
  Integer        cℤ3 = new Integer("1");
  Real           cℝ2 = new Real("3.5",
                                128);
  public Real    ℝ1  = new Real();
  public Real    ℝ2  = new Real();
  public Real    ℝ3  = new Real();
  public Real    ℝ4  = new Real();
  public Real    vℝ2 = new Real();
  public Real    vℝ1 = new Real();

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  @Override
  public RationalFunction evaluate(Object in, int order, int bits, RationalFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    Real numer = vℝ1.set(cℤ1.neg(ℝ1), cℝ2, ℝ2.set(cℤ3));
    Real denom = vℝ2.set(ℝ3.set(cℤ1), ℝ4.set(cℤ4));
    var  arg   = RealRationalNullaryFunction.parse("(1/2)-(x/2)");
    try ( var h = new RealRationalHypergeometricFunction(numer,
                                                         denom,
                                                         arg))
    {
      return h.evaluate(null, 1, bits, result);
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
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ1.close();
    cℤ4.close();
    cℤ3.close();
    cℝ2.close();
    ℝ1.close();
    ℝ2.close();
    ℝ3.close();
    ℝ4.close();
    vℝ2.close();
    vℝ1.close();
  }

  @Override
  public String toString()
  {
    return "pFq([-2,3.5,1],[2,4],1/2-x/2)";
  }

  @Override
  public String typeset()
  {
    return "${_3F_2}\\left(\\left[-2,3.5,1\\right], \\left[2,4\\right] ; \\left(\\frac{1}{2}-\\frac{x}{2}\\right)\\right)";
  }
}
