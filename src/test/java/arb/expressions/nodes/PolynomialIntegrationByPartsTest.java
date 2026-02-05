package arb.expressions.nodes;

import arb.Real;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Unit tests for polynomial integration-by-parts functionality.
 * Tests the tabular method implementation in MultiplicationNode.integrate().
 * 
 * The tabular method computes ∫ p(x)·f(x) dx by repeatedly differentiating
 * the polynomial p(x) (which eventually becomes 0) while integrating f(x).
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
   * 
   * Tabular method:
   *   u = x      → u' = 1     → u'' = 0
   *   dv = e^x   → v = e^x   → v₁ = e^x
   * 
   * Result: x·e^x - 1·e^x = e^x(x - 1)
   */
  public void testIntegralXTimesExp()
  {
    var f = RealFunction.express("x→int(x*exp(x),x)");
    // Verify numerically: d/dx[e^x(x-1)] = e^x(x-1) + e^x = x·e^x
    try (Real x = new Real("2.0", 128); Real result = new Real())
    {
      f.evaluate(x, 1, 128, result);
      double expected = Math.exp(2.0) * (2.0 - 1.0); // e^2 * 1
      assertEquals(expected, result.doubleValue(), 1e-10);
    }
  }

  /**
   * Test ∫ x² e^x dx = e^x(x² - 2x + 2)
   * 
   * Tabular method:
   *   u = x²    → u' = 2x    → u'' = 2    → u''' = 0
   *   dv = e^x  → v = e^x   → v₁ = e^x  → v₂ = e^x
   * 
   * Result: x²·e^x - 2x·e^x + 2·e^x = e^x(x² - 2x + 2)
   */
  public void testIntegralXSquaredTimesExp()
  {
    var f = RealFunction.express("x→int(x²*exp(x),x)");
    try (Real x = new Real("2.0", 128); Real result = new Real())
    {
      f.evaluate(x, 1, 128, result);
      double expected = Math.exp(2.0) * (4.0 - 4.0 + 2.0); // e^2 * 2
      assertEquals(expected, result.doubleValue(), 1e-10);
    }
  }

  /**
   * Test ∫ x³ e^x dx = e^x(x³ - 3x² + 6x - 6)
   */
  public void testIntegralXCubedTimesExp()
  {
    var f = RealFunction.express("x→int(x³*exp(x),x)");
    try (Real x = new Real("1.0", 128); Real result = new Real())
    {
      f.evaluate(x, 1, 128, result);
      double expected = Math.exp(1.0) * (1.0 - 3.0 + 6.0 - 6.0); // e * (-2)
      assertEquals(expected, result.doubleValue(), 1e-10);
    }
  }

  /**
   * Test ∫ x sin(x) dx = sin(x) - x cos(x)
   * 
   * Tabular method:
   *   u = x      → u' = 1     → u'' = 0
   *   dv = sin(x)→ v = -cos(x)→ v₁ = -sin(x)
   * 
   * Result: x·(-cos(x)) - 1·(-sin(x)) = -x·cos(x) + sin(x)
   */
  public void testIntegralXTimesSin()
  {
    var f = RealFunction.express("x→int(x*sin(x),x)");
    try (Real x = new Real("1.5", 128); Real result = new Real())
    {
      f.evaluate(x, 1, 128, result);
      double expected = Math.sin(1.5) - 1.5 * Math.cos(1.5);
      assertEquals(expected, result.doubleValue(), 1e-10);
    }
  }

  /**
   * Test ∫ x cos(x) dx = cos(x) + x sin(x)
   * 
   * Tabular method:
   *   u = x      → u' = 1     → u'' = 0
   *   dv = cos(x)→ v = sin(x) → v₁ = -cos(x)
   * 
   * Result: x·sin(x) - 1·(-cos(x)) = x·sin(x) + cos(x)
   */
  public void testIntegralXTimesCos()
  {
    var f = RealFunction.express("x→int(x*cos(x),x)");
    try (Real x = new Real("2.0", 128); Real result = new Real())
    {
      f.evaluate(x, 1, 128, result);
      double expected = Math.cos(2.0) + 2.0 * Math.sin(2.0);
      assertEquals(expected, result.doubleValue(), 1e-10);
    }
  }

  /**
   * Test ∫ x ln(x) dx = (x²/2)(ln(x) - 1/2)
   * 
   * Using LIATE rule: u = ln(x), dv = x dx
   *   u = ln(x)  → du = 1/x dx
   *   dv = x     → v = x²/2
   * 
   * Result: (x²/2)·ln(x) - ∫ (x²/2)·(1/x) dx
   *       = (x²/2)·ln(x) - ∫ x/2 dx
   *       = (x²/2)·ln(x) - x²/4
   */
  public void testIntegralXTimesLn()
  {
    var f = RealFunction.express("x→int(x*ln(x),x)");
    try (Real x = new Real("2.0", 128); Real result = new Real())
    {
      f.evaluate(x, 1, 128, result);
      // Expected: (4/2)*ln(2) - 4/4 = 2*ln(2) - 1
      double expected = 2.0 * Math.log(2.0) - 1.0;
      assertEquals(expected, result.doubleValue(), 1e-10);
    }
  }

  /**
   * Test constant × exp: ∫ 3 e^x dx = 3 e^x
   * This is a simple case that doesn't require integration by parts.
   */
  public void testIntegralConstantTimesExp()
  {
    var f = RealFunction.express("x→int(3*exp(x),x)");
    try (Real x = new Real("1.0", 128); Real result = new Real())
    {
      f.evaluate(x, 1, 128, result);
      double expected = 3.0 * Math.exp(1.0);
      assertEquals(expected, result.doubleValue(), 1e-10);
    }
  }

  /**
   * Test the main example from issue #635:
   * ∫ (2x² + 3x) e^x dx
   * 
   * By linearity and tabular method:
   * = 2∫ x² e^x dx + 3∫ x e^x dx
   * = 2·e^x(x²-2x+2) + 3·e^x(x-1)
   * = e^x(2x² - 4x + 4 + 3x - 3)
   * = e^x(2x² - x + 1)
   * 
   * At x=1: e(2-1+1) = 2e
   */
  public void testIntegral2XSquaredPlus3XTimesExp()
  {
    var f = RealFunction.express("x→int((2*x²+3*x)*exp(x),x)");
    try (Real x = new Real("1.0", 128); Real result = new Real())
    {
      f.evaluate(x, 1, 128, result);
      // At x=1: e^1 * (2*1 - 1 + 1) = 2e
      double expected = 2.0 * Math.E;
      assertEquals(expected, result.doubleValue(), 1e-8);
    }
  }

  /**
   * Test definite integral evaluation: ∫₀¹ x e^x dx
   * 
   * F(x) = e^x(x-1)
   * F(1) - F(0) = e(1-1) - e⁰(0-1) = 0 - (-1) = 1
   */
  public void testDefiniteIntegralXTimesExp()
  {
    // Antiderivative at x=1
    var F = RealFunction.express("x→int(x*exp(x),x)");
    try (Real one = new Real("1.0", 128); 
         Real zero = new Real("0.0", 128);
         Real F1 = new Real(); 
         Real F0 = new Real())
    {
      F.evaluate(one, 1, 128, F1);
      F.evaluate(zero, 1, 128, F0);
      double definiteIntegral = F1.doubleValue() - F0.doubleValue();
      assertEquals(1.0, definiteIntegral, 1e-10);
    }
  }
}
