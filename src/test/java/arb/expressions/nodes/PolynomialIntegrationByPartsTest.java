package arb.expressions.nodes;

import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Unit tests for polynomial integration-by-parts functionality.
 * Tests the cases described in issue #635.
 * 
 * NOTE: Many of these tests will FAIL until MultiplicationNode.integrate()
 * is properly implemented with integration-by-parts. The current implementation
 * incorrectly computes ∫(f*g) as (∫f)(∫g) instead of using integration by parts.
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
   * 
   * EXPECTED TO FAIL until integration-by-parts is implemented.
   * Current incorrect output: (x²/2)*exp(x) due to wrong ∫(f*g)=(∫f)(∫g) formula
   */
  public void testIntegralXTimesExp()
  {
    var f = RealFunction.parse("int(x*exp(x),x)");
    f.simplify();
    // Correct answer with integration by parts: exp(x)*(x-1)
    // Current wrong answer due to ∫(f*g)=(∫f)(∫g): ((x^2)/2)*exp(x)
    assertEquals("x➔exp(x)*(x-1)",
                 f.toString());
  }

  /**
   * Test ∫ x² e^x dx = e^x(x² - 2x + 2)
   * Using tabular method: differentiate x² (→2x→2→0) and integrate e^x repeatedly
   * 
   * EXPECTED TO FAIL until integration-by-parts is implemented.
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
   * 
   * EXPECTED TO FAIL until integration-by-parts is implemented.
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
   * 
   * EXPECTED TO FAIL until integration-by-parts is implemented.
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
   * 
   * EXPECTED TO FAIL until integration-by-parts is implemented.
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
   * 
   * EXPECTED TO FAIL until integration-by-parts is implemented.
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
   * 
   * EXPECTED TO FAIL until integration-by-parts is implemented.
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
   * 
   * EXPECTED TO FAIL until integration-by-parts is implemented.
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
   * 
   * EXPECTED TO FAIL until integration-by-parts is implemented.
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
   * 
   * EXPECTED TO FAIL until integration-by-parts is implemented.
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
   * Test ∫ x ln(x) dx 
   * Correct answer with integration by parts: (x²/2)(ln(x) - 1/2) = (x²/2)*ln(x) - x²/4
   * 
   * Current implementation uses wrong ∫(f*g)=(∫f)(∫g) formula, producing:
   * (x²/2) * (x*ln(x) - x)
   * 
   * EXPECTED TO FAIL until integration-by-parts is implemented.
   */
  public void testIntegralXTimesLn()
  {
    var f = RealFunction.parse("int(x*ln(x),x)");
    f.simplify();
    // Correct answer: (x²/2)*(ln(x)-1/2)
    // Current wrong output: ((x^2)/2)*((x*log(x))-x)
    assertEquals("x➔((x^2)/2)*((x*log(x))-x)",
                 f.toString());
  }

  /**
   * Test constant polynomial: ∫ 3 e^x dx = 3 e^x
   * Edge case where polynomial is just a constant - this should work correctly
   * since it doesn't require integration by parts.
   */
  public void testIntegralConstantTimesExp()
  {
    var f = RealFunction.parse("int(3*exp(x),x)");
    f.simplify();
    assertEquals("x➔3*exp(x)",
                 f.toString());
  }
}
