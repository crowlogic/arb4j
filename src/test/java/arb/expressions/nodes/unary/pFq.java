package arb.expressions.nodes.unary;

import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;
import arb.functions.rational.RationalHypergeometricFunction;
import arb.functions.rational.RationalNullaryFunction;
import arb.functions.real.RealFunction;

public class pFq implements
                 RealFunction,
                 Typesettable,
                 AutoCloseable,
                 Initializable
{
  public static void main(String args[])
  {
    try ( pFq pfq = new pFq())
    {
      double y = pfq.eval(2.3);
      System.out.println(pfq + "=" + y);
    }
  }

  public boolean                        isInitialized;
  public final Integer                  cℤ7 = new Integer("2");
  public final Integer                  cℤ1 = new Integer("5");
  public final Real                     cℝ6 = new Real("3.4",
                                                       128);
  public final Real                     cℝ3 = new Real("1.2",
                                                       128);
  public final Real                     cℝ2 = new Real("3.75",
                                                       128);
  public final Real                     cℝ5 = new Real("2.7",
                                                       128);
  public final Real                     cℝ4 = new Real("1.4",
                                                       128);
  public RationalHypergeometricFunction hypℚF1;
  public RationalFunction               elementℝ1;
  public Real                           xℝ1  = new Real();
  public Real                           vℝ2;
  public Real                           vℝ1;

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Real x, int order, int bits, Real result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return elementℝ1.evaluate(x, order, bits, result);
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
      hypℚF1.init(vℝ1.set(cℤ1.neg(xℝ1), cℝ2, cℝ3),
                  vℝ2.set(cℝ4, cℝ5, cℝ6),
                  RationalNullaryFunction.parse("-x^2"));
      hypℚF1.evaluate(null, 1, 128, elementℝ1);
      isInitialized = true;
    }
  }

  public pFq()
  {
    hypℚF1    = new RationalHypergeometricFunction();
    elementℝ1 = new RationalFunction();
    vℝ2       = new Real();
    vℝ1       = new Real();
  }

  @Override
  public void close()
  {
    cℤ7.close();
    cℤ1.close();
    cℝ6.close();
    cℝ3.close();
    cℝ2.close();
    cℝ5.close();
    cℝ4.close();
    xℝ1.close();
    hypℚF1.close();
    elementℝ1.close();
    vℝ2.close();
    vℝ1.close();
  }

  @Override
  public String toString()
  {
    return "x➔pFq([-5,3.75,1.2],[1.4,2.7,3.4],-x^2)";
  }

  @Override
  public String typeset()
  {
    return "{_3F_3}\\left(\\left[-5,3.75,1.2\\right], \\left[1.4,2.7,3.4\\right] ; -{x}^{2}\\right)";
  }
}
