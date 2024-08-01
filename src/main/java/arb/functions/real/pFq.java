package arb.functions.real;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;

public class pFq implements RationalNullaryFunction, Typesettable, AutoCloseable, Initializable
{
  public boolean                         isInitialized;
  Integer                                cℤ1 = new Integer("2");
  Integer                                cℤ4 = new Integer("4");
  Integer                                cℤ3 = new Integer("1");
  Real                                   cℝ2 = new Real("3.5",
                                                        128);
  public Fraction                        vf1 = new Fraction();
  public Fraction                        vf2 = new Fraction();
  public Fraction                        f1  = new Fraction();
  public Fraction                        f2  = new Fraction();
  public Fraction                        f3  = new Fraction();
  public Fraction                        f4  = new Fraction();
  public Fraction                        f5  = new Fraction();
  public RationalHypergeometricFunction f;

  public static void main(String args[])
  {
    pFq              pfq = new pFq();
    RationalFunction a   = pfq.evaluate(128);
    System.out.println("f=" + a);
  }

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

    var      arg   = arb.functions.real.RationalNullaryFunction.parse("(1/2)-(x/2)");
    Fraction numer = vf1.set(cℤ1.neg(f1), f2.set(cℝ2), f3.set(cℤ3));
    Fraction denom = vf2.set(f4.set(cℤ1), f5.set(cℤ4));
    f = new RationalHypergeometricFunction(numer,
                                           denom,
                                           arg);
    return f.evaluate(null, 1, bits, result);
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
    vf1.close();
    vf2.close();
    f1.close();
    f2.close();
    f3.close();
    f4.close();
    f5.close();
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
