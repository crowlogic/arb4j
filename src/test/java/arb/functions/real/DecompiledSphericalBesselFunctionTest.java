package arb.functions.real;

import arb.FractionConstants;
import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.rational.LommelPolynomial;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class DecompiledSphericalBesselFunctionTest extends
                                                   TestCase implements
                                                   RealFunction,
                                                   Typesettable,
                                                   AutoCloseable,
                                                   Initializable
{
  public static void testEval()
  {
    try ( DecompiledSphericalBesselFunctionTest f = new DecompiledSphericalBesselFunctionTest())
    {
      f.n = new Integer(3);
      double x = f.eval(2.3);
      //System.out.format("f(%s)=%s\n", f, x);
      assertEquals(0.0856499630648839, x);
    }
  }

  public boolean          isInitialized;
  public final Integer    cℤ2 = new Integer("3");
  public final Integer    cℤ1 = new Integer("1");
  public final Integer    cℤ3 = new Integer("2");
  public Integer          n;
  public LommelPolynomial seqqR1;
  public Real             ℝ1;
  public Real             ℝ2;
  public Real             ℝ3;
  public LommelPolynomial seqqR2;
  public Real             ℝ4;
  public RationalFunction elementq2;
  public RationalFunction elementq1;
  public Real             ℝ5;
  public Real             ℝ6;
  public Real             ℝ7;
  public Integer             Z10 = new Integer();
  public Real             ℝ11 = new Real();
  public Real             ℝ9;
  public Real             ℝ8;

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

    return elementq1.evaluate(x, order, bits, ℝ1)
                    .mul(x.sin(bits, ℝ2), bits, ℝ3)
                    .sub(elementq2.evaluate(x, order, bits, ℝ4).mul(x.cos(bits, ℝ5), bits, ℝ6),
                         bits,
                         ℝ7)
                    .div(x, bits, result);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (n == null)
    {
      throw new AssertionError("n shan't be null");
    }
    else
    {
      seqqR1.n.set(n);
      seqqR1.v.set(ℝ9.set(FractionConstants.oneHalf));
      seqqR1.evaluate(null, 1, 128, elementq1);
      seqqR2.n.set(n.sub(cℤ1, 128, Z10));
      seqqR2.v.set(cℤ2.div(cℤ3, 128, ℝ11));
      seqqR2.evaluate(null, 1, 128, elementq2);
      isInitialized = true;
    }
  }

  public DecompiledSphericalBesselFunctionTest()
  {
    elementq2 = new RationalFunction();
    elementq1 = new RationalFunction();
    seqqR1    = new LommelPolynomial();
    ℝ1        = new Real();
    ℝ2        = new Real();
    ℝ3        = new Real();
    seqqR2    = new LommelPolynomial();
    ℝ4        = new Real();
    ℝ9        = new Real();
    ℝ5        = new Real();
    ℝ6        = new Real();
    ℝ7        = new Real();
    ℝ8        = new Real();
  }

  @Override
  public void close()
  {
    cℤ2.close();
    cℤ1.close();
    cℤ3.close();
    Z10.close();
    ℝ11.close();
    elementq2.close();
    elementq1.close();
    seqqR1.close();
    ℝ1.close();
    ℝ2.close();
    ℝ3.close();
    seqqR2.close();
    ℝ4.close();
    ℝ9.close();
    ℝ5.close();
    ℝ6.close();
    ℝ7.close();
    ℝ8.close();
  }

  @Override
  public String toString()
  {
    return "x➔(R(n,½;x)*sin(x) - R(n-1,3⁄2;x)*cos(x))/x";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(R_{n, \\frac{1}{2}}(x) \\cdot \\sin(x)-R_{\\left(n-1\\right), \\frac{3}{2}}(x) \\cdot \\cos(x)\\right)}{x}";
  }
}

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
