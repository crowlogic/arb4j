package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;
import arb.functions.sequences.LommelPolynomialSequence;
import junit.framework.TestCase;

/**
 * need to fix this part: this.seqqR1.v.set(this.cℤ1.div(this.cℤ2, var3,
 * this.ℝ1)); elementq1 = seqqR1.evaluate(cℤ3, 128);
 */
public class GeneratedLommelPolynomialExpression implements RealFunction, Typesettable, AutoCloseable, Initializable
{
  public boolean                  isInitialized;
  Integer                         cℤ2    = new Integer("2");
  Integer                         cℤ1    = new Integer("1");
  Integer                         cℤ3    = new Integer("3");
  public LommelPolynomialSequence seqqR1 = new LommelPolynomialSequence();
  public RationalFunction         elementq1;
  public Real                     ℝ1     = new Real();

  public static void main(String args[])
  {
    GeneratedLommelPolynomialExpression f    = new GeneratedLommelPolynomialExpression();
    double                              eval = f.eval(2.3);
    System.out.println("f=" + eval);
    TestCase.assertEquals(-1.3758527163639351, eval);

  }

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Real z, int order, int bits, Real result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    return this.elementq1.evaluate(z, 0, 128, result);
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else
    {
      int var3 = 128;
      this.seqqR1.v.set(this.cℤ1.div(this.cℤ2, var3, this.ℝ1));
      elementq1          = seqqR1.evaluate(cℤ3, 128);
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ2.close();
    this.cℤ1.close();
    this.cℤ3.close();
    this.seqqR1.close();
    this.ℝ1.close();
    this.elementq1.close();
  }

  @Override
  public String toString()
  {
    return "z➔R(1/2,3;z)";
  }

  @Override
  public String typeset()
  {
    return "R_{\\frac{1}{2}, 3} (z)";
  }
}
