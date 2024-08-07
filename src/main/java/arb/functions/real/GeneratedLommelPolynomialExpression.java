package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;
import arb.functions.sequences.LommelPolynomialSequence;
import junit.framework.TestCase;

public class GeneratedLommelPolynomialExpression implements RealFunction, Typesettable, AutoCloseable, Initializable
{
  public boolean isInitialized;
  Integer        cℤ2 = new Integer("2");
  Integer        cℤ1 = new Integer("1");
  Integer        cℤ3 = new Integer("3");
  public Real    ℝ1  = new Real();
  public Real    ℝ2  = new Real();

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  public int               bits = 128;

  LommelPolynomialSequence seq  = new LommelPolynomialSequence(cℤ1.div(cℤ2, bits, ℝ1));
  private RationalFunction element;

  public static void main(String args[])
  {
    GeneratedLommelPolynomialExpression r   = new GeneratedLommelPolynomialExpression();
    double                              val = r.eval(2.3);
    System.out.format("R[2.3]=%s\n", val);
    TestCase.assertEquals(-1.3758527163639351505, val);

  }

  @Override
  public Real evaluate(Real z, int order, int bits, Real result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return element.evaluate(z, order, bits, result);

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
    element = seq.evaluate(cℤ3, 128);

  }

  @Override
  public void close()
  {
    cℤ2.close();
    cℤ1.close();
    cℤ3.close();
    ℝ1.close();
    ℝ2.close();
  }

  @Override
  public String toString()
  {
    return "z➔R(1/2,3;z)";
  }

  @Override
  public String typeset()
  {
    return "$R_{\\frac{1}{2}, 3} (z)$";
  }
}
