package arb.expressions;

import arb.Real;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Tests for parsing the ∈ operator in variable specifications, as described in
 * <a href="https://github.com/crowlogic/arb4j/issues/878">#878</a>.
 * 
 * <p>
 * Verifies that expressions of the form {@code x∈(a,b)➔...} correctly set
 * compile-time bounds on the independent variable's {@link VariableReference}.
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class BoundedVariableParsingTest extends
                                         TestCase
{

  /**
   * Open interval: x∈(0,1)➔x² should set bounds (0, 1) with both endpoints
   * exclusive.
   */
  public void testOpenIntervalBounds()
  {
    var expr = RealFunction.parse("x∈(0,1)➔x²");
    var ref  = expr.getIndependentVariable().reference;
    assertNotNull("bounds should be set", ref.bounds);
    assertEquals(0.0, ref.bounds.lower);
    assertEquals(1.0, ref.bounds.upper);
    assertFalse("lower should be exclusive", ref.bounds.lowerInclusive);
    assertFalse("upper should be exclusive", ref.bounds.upperInclusive);
  }

  /**
   * Closed interval: x∈[0,1]➔x² should set bounds [0, 1] with both endpoints
   * inclusive.
   */
  public void testClosedIntervalBounds()
  {
    var expr = RealFunction.parse("x∈[0,1]➔x²");
    var ref  = expr.getIndependentVariable().reference;
    assertNotNull("bounds should be set", ref.bounds);
    assertEquals(0.0, ref.bounds.lower);
    assertEquals(1.0, ref.bounds.upper);
    assertTrue("lower should be inclusive", ref.bounds.lowerInclusive);
    assertTrue("upper should be inclusive", ref.bounds.upperInclusive);
  }

  /**
   * Half-open interval: x∈[0,1)➔x² should have inclusive lower, exclusive upper.
   */
  public void testHalfOpenLeftClosedBounds()
  {
    var expr = RealFunction.parse("x∈[0,1)➔x²");
    var ref  = expr.getIndependentVariable().reference;
    assertNotNull("bounds should be set", ref.bounds);
    assertEquals(0.0, ref.bounds.lower);
    assertEquals(1.0, ref.bounds.upper);
    assertTrue("lower should be inclusive", ref.bounds.lowerInclusive);
    assertFalse("upper should be exclusive", ref.bounds.upperInclusive);
  }

  /**
   * Half-open interval: x∈(0,1]➔x² should have exclusive lower, inclusive upper.
   */
  public void testHalfOpenRightClosedBounds()
  {
    var expr = RealFunction.parse("x∈(0,1]➔x²");
    var ref  = expr.getIndependentVariable().reference;
    assertNotNull("bounds should be set", ref.bounds);
    assertEquals(0.0, ref.bounds.lower);
    assertEquals(1.0, ref.bounds.upper);
    assertFalse("lower should be exclusive", ref.bounds.lowerInclusive);
    assertTrue("upper should be inclusive", ref.bounds.upperInclusive);
  }

  /**
   * Non-trivial bounds: t∈(2,7)➔sin(t) with larger numeric bounds.
   */
  public void testNonTrivialBounds()
  {
    var expr = RealFunction.parse("t∈(2,7)➔sin(t)");
    var ref  = expr.getIndependentVariable().reference;
    assertNotNull("bounds should be set", ref.bounds);
    assertEquals(2.0, ref.bounds.lower);
    assertEquals(7.0, ref.bounds.upper);
  }

  /**
   * Without ∈, bounds should remain null.
   */
  public void testNoBoundsWithoutMembershipOperator()
  {
    var expr = RealFunction.parse("x➔x²");
    var ref  = expr.getIndependentVariable().reference;
    assertNull("bounds should be null when ∈ is absent", ref.bounds);
  }

  /**
   * The expression should still evaluate correctly when bounds are present.
   * x∈(0,1)➔x² evaluated at x=0.5 should produce 0.25.
   */
  public void testBoundedExpressionEvaluatesCorrectly()
  {
    RealFunction f = RealFunction.express("x∈(0,1)➔x²");
    try ( Real x = Real.newVector(2))
    {
      x.set("0.5", 128);
      Real result = f.evaluate(x, 128, x.get(1));
      assertEquals("0.25", result.toString(5));
    }
  }

  /**
   * Bounds.toString() should render the interval notation correctly.
   */
  public void testBoundsToString()
  {
    var expr = RealFunction.parse("x∈(0,1)➔x²");
    var ref  = expr.getIndependentVariable().reference;
    assertEquals("(0.0, 1.0)", ref.bounds.toString());
  }

  /**
   * Bounds.toString() for a closed interval should use square brackets.
   */
  public void testClosedBoundsToString()
  {
    var expr = RealFunction.parse("x∈[0,1]➔x²");
    var ref  = expr.getIndependentVariable().reference;
    assertEquals("[0.0, 1.0]", ref.bounds.toString());
  }

  /**
   * isBounded() should return true when ∈ is present and false otherwise.
   */
  public void testIsBounded()
  {
    var bounded   = RealFunction.parse("x∈(0,1)➔x²");
    var unbounded = RealFunction.parse("x➔x²");
    assertTrue(bounded.getIndependentVariable().reference.isBounded());
    assertFalse(unbounded.getIndependentVariable().reference.isBounded());
  }
}
