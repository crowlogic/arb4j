package arb.expressions.nodes;

import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Unit tests for polynomial integration-by-parts functionality.
 * Tests the cases described in issue #635.
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class PolynomialIntegrationByPartsTest
                                              extends
                                              TestCase
{
  /**
   * Test ∫ x e^x dx = e^x(x - 1)
   * Basic integration by parts: u = x, dv = e^x dx
   */
  public void testIntegralXTimesExp()
  {
    var f = RealFunction.parse("int(x*exp(x),x)");
    f.simplify();
    assertEquals("x➔exp(x)*(x-1)",
                 f.toString());
  }

  /**
   * Test ∫ x² e^x dx = e^x(x² - 2x + 2)
   * Using tabular method: differentiate x² (→2x→2→0) and integrate e^x repeatedly
   */
  public void testIntegralXSquaredTimesExp()
  {
    var f = RealFunction.parse("int(x²*exp(x),x)");
    f.simplify();
    assertEquals("x➔exp(x)*(x²-2*x+2)",
                 f.toString());
  }

  /**
   * Test the main example from issue #635:
   * ∫ (2x² + 3x) e^x dx = e^x(2x² - x - 2) + C
   */
  public void testIntegral2XSquaredPlus3XTimesExp()
  {
    var f = RealFunction.parse("int((2*x²+3*x)*exp(x),x)");
    f.simplify();
    assertEquals("x➔exp(x)*(2*x²-x-2)",
                 f.toString());
  }

  /**
   * Test ∫ x³ e^x dx = e^x(x³ - 3x² + 6x - 6)
   * Higher degree polynomial to verify recursive tabular method
   */
  public void testIntegralXCubedTimesExp()
  {
    var f = RealFunction.parse("int(x³*exp(x),x)");
    f.simplify();
    assertEquals("x➔exp(x)*(x³-3*x²+6*x-6)",
                 f.toString());
  }

  /**
   * Test ∫ x e^{2x} dx = (e^{2x}/4)(2x - 1)
   * Exponential with coefficient in exponent
   */
  public void testIntegralXTimesExpWithCoefficient()
  {
    var f = RealFunction.parse("int(x*exp(2*x),x)");
    f.simplify();
    assertEquals("x➔exp(2*x)*(x/2-1/4)",
                 f.toString());
  }

  /**
   * Test ∫ x sin(x) dx = sin(x) - x cos(x)
   * Integration by parts with trigonometric function
   */
  public void testIntegralXTimesSin()
  {
    var f = RealFunction.parse("int(x*sin(x),x)");
    f.simplify();
    assertEquals("x➔sin(x)-x*cos(x)",
                 f.toString());
  }

  /**
   * Test ∫ x cos(x) dx = cos(x) + x sin(x)
   * Integration by parts with cosine
   */
  public void testIntegralXTimesCos()
  {
    var f = RealFunction.parse("int(x*cos(x),x)");
    f.simplify();
    assertEquals("x➔cos(x)+x*sin(x)",
                 f.toString());
  }

  /**
   * Test ∫ x² sin(x) dx = 2x sin(x) + (2 - x²) cos(x)
   * Higher degree polynomial with sine requires repeated application
   */
  public void testIntegralXSquaredTimesSin()
  {
    var f = RealFunction.parse("int(x²*sin(x),x)");
    f.simplify();
    assertEquals("x➔2*x*sin(x)+(2-x²)*cos(x)",
                 f.toString());
  }

  /**
   * Test ∫ x² cos(x) dx = (x² - 2) sin(x) + 2x cos(x)
   * Higher degree polynomial with cosine
   */
  public void testIntegralXSquaredTimesCos()
  {
    var f = RealFunction.parse("int(x²*cos(x),x)");
    f.simplify();
    assertEquals("x➔(x²-2)*sin(x)+2*x*cos(x)",
                 f.toString());
  }

  /**
   * Test numerical evaluation of ∫₀¹ (2x² + 3x) e^x dx
   * Should equal e(2-1-2) - (-2) = -e + 2 ≈ -0.71828...
   */
  public void testNumericalEvaluationExpIntegral()
  {
    var    f   = RealFunction.express("x->int((2*t²+3*t)*exp(t),t=0…x)");
    double val = f.eval(1.0);
    assertEquals(-Math.E + 2,
                 val,
                 1e-10);
  }

  /**
   * Test ∫ x ln(x) dx = (x²/2)(ln(x) - 1/2)
   * Logarithmic case: u = ln(x), dv = x dx
   */
  public void testIntegralXTimesLn()
  {
    var f = RealFunction.parse("int(x*ln(x),x)");
    f.simplify();
    assertEquals("x➔(x²/2)*(ln(x)-1/2)",
                 f.toString());
  }

  /**
   * Test constant polynomial: ∫ 3 e^x dx = 3 e^x
   * Edge case where polynomial is just a constant
   */
  public void testIntegralConstantTimesExp()
  {
    var f = RealFunction.parse("int(3*exp(x),x)");
    f.simplify();
    assertEquals("x➔3*exp(x)",
                 f.toString());
  }
}
