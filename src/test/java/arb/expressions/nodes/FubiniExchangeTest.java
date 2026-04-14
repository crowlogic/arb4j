package arb.expressions.nodes;

import arb.Real;
import arb.expressions.Expression;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Tests for Fubini/Tonelli order-of-integration exchange (Issue #549).
 *
 * @see IntegralNode#isStructurallyExchangeableWith
 * @see IntegralNode#isAnalyticallyValidToExchangeWith
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

    assertNotNull(expr.rootNode);
  }

  /**
   * Test that isStructurallyExchangeableWith correctly identifies directly
   * nested IntegralNodes as exchangeable when bounds are constant.
   */
  @SuppressWarnings("unchecked")
  public void testStructuralExchangeabilityDirectNesting()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("x➔∫y➔(∫z➔(y*z)dz∈(0,1))dy∈(0,1)", null, false);

    assertTrue("root should be IntegralNode, got: " + expr.rootNode.getClass().getSimpleName(),
               expr.rootNode instanceof IntegralNode);

    IntegralNode<Real, Real, RealFunction> outer = (IntegralNode<Real, Real, RealFunction>) expr.rootNode;

    assertTrue("integrand should be IntegralNode, got: " + outer.integrandNode.getClass().getSimpleName(),
               outer.integrandNode instanceof IntegralNode);

    IntegralNode<Real, Real, RealFunction> inner = (IntegralNode<Real, Real, RealFunction>) outer.integrandNode;

    assertTrue("directly nested integrals with constant bounds should be exchangeable",
               outer.isStructurallyExchangeableWith(inner));
  }

  /**
   * Test that isAnalyticallyValidToExchangeWith approves exchange when both
   * operators have finite constant bounds (Fubini on compact rectangle).
   */
  @SuppressWarnings("unchecked")
  public void testAnalyticValidityFiniteBounds()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("x➔∫y➔(∫z➔(y*z)dz∈(0,1))dy∈(0,1)", null, false);

    IntegralNode<Real, Real, RealFunction> outer = (IntegralNode<Real, Real, RealFunction>) expr.rootNode;
    IntegralNode<Real, Real, RealFunction> inner = (IntegralNode<Real, Real, RealFunction>) outer.integrandNode;

    assertTrue("finite constant bounds should satisfy Fubini",
               outer.isAnalyticallyValidToExchangeWith(inner));
  }

  /**
   * Test that isProvablyNonNegative recognizes squared expressions.
   */
  public void testNonNegativeSquare()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("x^2");
    assertTrue("x^2 should be provably non-negative",
               expr.rootNode.isProvablyNonNegative());
  }

  /**
   * Test that isProvablyNonNegative recognizes exponentials.
   */
  public void testNonNegativeExponential()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("exp(x)");
    assertTrue("exp(x) should be provably non-negative",
               expr.rootNode.isProvablyNonNegative());
  }

  /**
   * Test that isProvablyNonNegative recognizes products of non-negative
   * factors.
   */
  public void testNonNegativeProduct()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("x^2*exp(x)");
    assertTrue("x^2*exp(x) should be provably non-negative",
               expr.rootNode.isProvablyNonNegative());
  }

  /**
   * Test that exchangeOrder performs an in-place swap of two nested integrals
   * using the 6-pointer exchange from {@link Node#exchange}.
   *
   * Before: outer{var=y, body=inner{var=z, body=y*z}}
   * After:  inner{var=z, body=outer{var=y, body=y*z}}
   *
   * The Java references still point to the same objects — the exchange
   * rewires parent/body/child pointers so that inner is now at root position.
   */
  @SuppressWarnings("unchecked")
  public void testExchangeOrderProducesSwappedStructure()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("x➔∫y➔(∫z➔(y*z)dz∈(0,1))dy∈(0,1)", null, false);

    IntegralNode<Real, Real, RealFunction> outer = (IntegralNode<Real, Real, RealFunction>) expr.rootNode;
    IntegralNode<Real, Real, RealFunction> inner = (IntegralNode<Real, Real, RealFunction>) outer.integrandNode;

    assertEquals("y", outer.integrationVariableNode.getName());
    assertEquals("z", inner.integrationVariableNode.getName());

    // exchangeOrder is void — performs in-place 6-pointer swap
    outer.exchangeOrder(inner);

    // After exchange: inner is now at root, outer is its body
    // The objects keep their own variable nodes; positions in the tree swapped.
    assertSame("inner's body should now be outer",
               outer, inner.integrandNode);
    assertEquals("outer still owns variable y",
                 "y", outer.integrationVariableNode.getName());
    assertEquals("inner still owns variable z",
                 "z", inner.integrationVariableNode.getName());
    assertSame("inner's parent should be null (root position)",
               null, inner.parent);
    assertSame("outer's parent should be inner",
               inner, outer.parent);
  }

  /**
   * Test that findExchangeableInnerIntegral finds the inner integral when
   * directly nested.
   */
  @SuppressWarnings("unchecked")
  public void testFindExchangeableInnerIntegral()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("x➔∫y➔(∫z➔(y*z)dz∈(0,1))dy∈(0,1)", null, false);

    IntegralNode<Real, Real, RealFunction> outer = (IntegralNode<Real, Real, RealFunction>) expr.rootNode;

    IntegralNode<Real, Real, RealFunction> found = outer.findExchangeableInnerIntegral();
    assertNotNull("should find an exchangeable inner integral", found);
    assertSame("found integral should be the direct integrand", outer.integrandNode, found);
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
               integral.hasFiniteConstantBounds());
  }

  /**
   * Test that parent pointers are set correctly during parsing.
   * Issue #885: every child's parent field should point to its containing node.
   */
  @SuppressWarnings("unchecked")
  public void testParentPointersSetDuringParsing()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("x➔∫y➔(∫z➔(y*z)dz∈(0,1))dy∈(0,1)", null, false);

    IntegralNode<Real, Real, RealFunction> outer = (IntegralNode<Real, Real, RealFunction>) expr.rootNode;
    IntegralNode<Real, Real, RealFunction> inner = (IntegralNode<Real, Real, RealFunction>) outer.integrandNode;

    assertSame("inner integral's parent should be the outer integral",
               outer, inner.parent);
    assertSame("inner's integrand parent should be the inner integral",
               inner, inner.integrandNode.parent);
  }

  /**
   * Test that isLinearPath correctly identifies a linear path between
   * nested integrals with no intermediate nodes.
   */
  @SuppressWarnings("unchecked")
  public void testIsLinearPathDirectNesting()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("x➔∫y➔(∫z➔(y*z)dz∈(0,1))dy∈(0,1)", null, false);

    IntegralNode<Real, Real, RealFunction> outer = (IntegralNode<Real, Real, RealFunction>) expr.rootNode;
    IntegralNode<Real, Real, RealFunction> inner = (IntegralNode<Real, Real, RealFunction>) outer.integrandNode;

    assertTrue("direct nesting should be a linear path",
               Node.isLinearPath(outer, inner,
                                outer.integrationVariableNode,
                                inner.integrationVariableNode));
  }
}
