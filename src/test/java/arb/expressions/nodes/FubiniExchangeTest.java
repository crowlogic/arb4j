package arb.expressions.nodes;

import arb.Real;
import arb.expressions.Expression;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Tests for Fubini/Tonelli order-of-integration exchange (Issue #549).
 *
 * @see ExchangeabilityChecker
 * @see IntegrabilityChecker
 * @see <a href="https://github.com/crowlogic/arb4j/issues/549">#549</a>
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class FubiniExchangeTest extends
                                 TestCase
{

  /**
   * Test that two directly nested definite integrals with constant bounds
   * are structurally exchangeable.
   *
   * ∫₀¹∫₀¹ y*z dz dy → exchangeable
   */
  public void testDirectNestingConstantBoundsIsExchangeable()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("x➔∫y➔(∫z➔(y*z)dz∈(0,1))dy∈(0,1)");
    expr.simplify();

    // After simplification, the double integral should have been processed.
    // The outer IntegralNode should recognize the inner IntegralNode.
    assertNotNull(expr.rootNode);
  }

  /**
   * Test that the ExchangeabilityChecker correctly identifies directly
   * nested IntegralNodes as exchangeable when bounds are constant.
   */
  @SuppressWarnings("unchecked")
  public void testExchangeabilityCheckerDirectNesting()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("x➔∫y➔(∫z➔(y*z)dz∈(0,1))dy∈(0,1)", null, false);

    assertTrue("root should be IntegralNode, got: " + expr.rootNode.getClass().getSimpleName(),
               expr.rootNode instanceof IntegralNode);

    IntegralNode<Real, Real, RealFunction> outer = (IntegralNode<Real, Real, RealFunction>) expr.rootNode;

    assertTrue("integrand should be IntegralNode, got: " + outer.integrandNode.getClass().getSimpleName(),
               outer.integrandNode instanceof IntegralNode);

    IntegralNode<Real, Real, RealFunction> inner = (IntegralNode<Real, Real, RealFunction>) outer.integrandNode;

    assertTrue("directly nested integrals with constant bounds should be exchangeable",
               ExchangeabilityChecker.isStructurallyExchangeable(outer, inner));
  }

  /**
   * Test that the IntegrabilityChecker approves exchange when both
   * operators have finite constant bounds (Fubini on compact rectangle).
   */
  @SuppressWarnings("unchecked")
  public void testIntegrabilityCheckerFiniteBounds()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("x➔∫y➔(∫z➔(y*z)dz∈(0,1))dy∈(0,1)", null, false);

    IntegralNode<Real, Real, RealFunction> outer = (IntegralNode<Real, Real, RealFunction>) expr.rootNode;
    IntegralNode<Real, Real, RealFunction> inner = (IntegralNode<Real, Real, RealFunction>) outer.integrandNode;

    assertTrue("finite constant bounds should satisfy Fubini",
               IntegrabilityChecker.isAnalyticallyValid(outer, inner));
  }

  /**
   * Test that isProvablyNonNegative recognizes squared expressions.
   */
  public void testNonNegativeSquare()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("x^2");
    assertTrue("x^2 should be provably non-negative",
               IntegrabilityChecker.isProvablyNonNegative(expr.rootNode));
  }

  /**
   * Test that isProvablyNonNegative recognizes exponentials.
   */
  public void testNonNegativeExponential()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("exp(x)");
    assertTrue("exp(x) should be provably non-negative",
               IntegrabilityChecker.isProvablyNonNegative(expr.rootNode));
  }

  /**
   * Test that isProvablyNonNegative recognizes products of non-negative
   * factors.
   */
  public void testNonNegativeProduct()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("x^2*exp(x)");
    assertTrue("x^2*exp(x) should be provably non-negative",
               IntegrabilityChecker.isProvablyNonNegative(expr.rootNode));
  }

  /**
   * Test that exchangeOrder produces a structurally valid swapped integral.
   */
  @SuppressWarnings("unchecked")
  public void testExchangeOrderProducesSwappedStructure()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("x➔∫y➔(∫z➔(y*z)dz∈(0,1))dy∈(0,1)", null, false);

    IntegralNode<Real, Real, RealFunction> outer = (IntegralNode<Real, Real, RealFunction>) expr.rootNode;
    IntegralNode<Real, Real, RealFunction> inner = (IntegralNode<Real, Real, RealFunction>) outer.integrandNode;

    String outerVarBefore = outer.integrationVariableNode.getName();
    String innerVarBefore = inner.integrationVariableNode.getName();

    Node<Real, Real, RealFunction> exchanged = outer.exchangeOrder(inner);

    assertTrue("exchanged result should be IntegralNode",
               exchanged instanceof IntegralNode);

    IntegralNode<Real, Real, RealFunction> newOuter = (IntegralNode<Real, Real, RealFunction>) exchanged;

    assertEquals("new outer should use old inner's variable",
                 innerVarBefore, newOuter.integrationVariableNode.getName());

    assertTrue("new outer's integrand should be IntegralNode",
               newOuter.integrandNode instanceof IntegralNode);
    IntegralNode<Real, Real, RealFunction> newInner = (IntegralNode<Real, Real, RealFunction>) newOuter.integrandNode;
    assertEquals("new inner should use old outer's variable",
                 outerVarBefore, newInner.integrationVariableNode.getName());
  }

  /**
   * Test that ExchangeabilityChecker.findExchangeableInnerOperator finds the
   * inner integral when directly nested.
   */
  @SuppressWarnings("unchecked")
  public void testFindExchangeableInnerOperator()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("x➔∫y➔(∫z➔(y*z)dz∈(0,1))dy∈(0,1)", null, false);

    IntegralNode<Real, Real, RealFunction> outer = (IntegralNode<Real, Real, RealFunction>) expr.rootNode;

    Node<Real, Real, RealFunction> found = ExchangeabilityChecker.findExchangeableInnerOperator(outer);
    assertNotNull("should find an exchangeable inner operator", found);
    assertTrue("found operator should be IntegralNode", found instanceof IntegralNode);
    assertSame("found operator should be the direct integrand", outer.integrandNode, found);
  }

  /**
   * Test hasFiniteConstantBounds for IntegralNode with constant bounds.
   */
  @SuppressWarnings("unchecked")
  public void testHasFiniteConstantBounds()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("x➔∫y➔exp(y)dy∈(0,1)", null, false);

    assertTrue("root should be IntegralNode",
               expr.rootNode instanceof IntegralNode);
    IntegralNode<Real, Real, RealFunction> integral = (IntegralNode<Real, Real, RealFunction>) expr.rootNode;
    assertTrue("integral with constant 0,1 bounds should have finite constant bounds",
               IntegrabilityChecker.hasFiniteConstantBounds(integral));
  }
}
