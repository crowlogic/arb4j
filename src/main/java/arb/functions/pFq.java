package arb.functions;

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
  public RationalHypergeometricFunction hypqF1;
  public RationalFunction                           elementℝ1;
  public Real                           ℝ1  = new Real();
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

    return elementℝ1.evaluate(result, order, bits, result);
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
      hypqF1.init(vℝ1.set(cℤ1.neg(ℝ1), cℝ2, cℝ3),
                  vℝ2.set(cℝ4, cℝ5, cℝ6),
                  RationalNullaryFunction.parse("-x^2"));
      hypqF1.evaluate(null, 1, 128, elementℝ1);
      isInitialized = true;
    }
  }

  public pFq/* $VF was: pFq({Minus5,3_75,1_2},{1_4,2_7,3_4},MinusxToThePowerOf2) */()
  {
    hypqF1    = new RationalHypergeometricFunction();
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
    ℝ1.close();
    hypqF1.close();
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
