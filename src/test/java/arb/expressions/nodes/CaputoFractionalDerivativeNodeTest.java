package arb.expressions.nodes;

import arb.Real;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Tests for the Caputo fractional derivative operator Đ^(α) applied via
 * Node.fractionalDerivative().
 * 
 * Reference formulas: Đ^(α)(c) = 0 Đ^(α)(t) = Γ(2)/Γ(2-α) * t^(1-α) Đ^(α)(t^k)
 * = Γ(k+1)/Γ(k+1-α) * t^(k-α) Đ^(α)(f+g) = Đ^(α)(f) + Đ^(α)(g) Đ^(α)(c*f) = c *
 * Đ^(α)(f)
 * 
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class CaputoFractionalDerivativeNodeTest extends
                                                TestCase
{
  private static final double TOL = 1e-10;

  /**
   * substitute() must return this (the same object reference), not a newly
   * allocated node. Every other Node subclass follows this contract. A violation
   * means any parent node holding a reference to this node becomes stale after
   * substitution.
   */
  public void testSubstituteReturnsSameInstance()
  {
    var context = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));

    Expression<Real, Real, RealFunction> expr =
      (Expression<Real, Real, RealFunction>) RealFunction.parse("Đ^(α)(t²)", context);

    var root = expr.rootNode;
    assertTrue("root should be a CaputoFractionalDerivativeNode",
               root instanceof CaputoFractionalDerivativeNode);

    var before = root;
    var after  = root.substitute("nonexistent_variable", expr.newLiteralConstant(42));

    assertSame("substitute() must return this for fluent API contract; "
               + "got a different object which means parent references are now stale",
               before,
               after);
  }

  /**
   * After spliceInto a new Expression, the spliced node's fieldName must be null
   * so the target expression's generate() pass allocates its own intermediate
   * variables. A non-null fieldName from the source expression refers to a field
   * that does not exist in the target class.
   */
  public void testSpliceIntoClearsFieldName()
  {
    var context = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));

    @SuppressWarnings("unchecked")
    Expression<Real, Real, RealFunction> sourceExpr =
      (Expression<Real, Real, RealFunction>) RealFunction.parse("Đ^(α)(t)", context);

    // Simulate a fieldName having been set during a prior generate() pass
    sourceExpr.rootNode.fieldName = "staleField1";

    @SuppressWarnings("unchecked")
    Expression<Real, Real, RealFunction> targetExpr =
      (Expression<Real, Real, RealFunction>) RealFunction.parse("t", context);

    var spliced = sourceExpr.rootNode.spliceInto(targetExpr);

    assertNull("spliceInto must not carry fieldName from source expression; "
               + "the target expression will allocate its own during generate()",
               spliced.fieldName);
  }

  /**
   * End-to-end: a CaputoFractionalDerivativeNode embedded in a sum should survive
   * substitution with the parent's references remaining valid.
   */
  public void testSubstituteInSumPreservesTreeIntegrity()
  {
    var    context  = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));
    var    f        = RealFunction.express("Đ^(α)(t)+t", context);
    var    result   = f.evaluate(new Real("1.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    double dHalfT   = 2.0 / Math.sqrt(Math.PI);
    double expected = dHalfT + 1.0;
    assertEquals("Đ^(½)(t)+t at t=1 must work after tree construction",
                 expected,
                 result.doubleValue(),
                 1e-10);
  }
  
  public void testCaputoDerivativeOfConstantIsZero()
  {
    var context = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));
    var f       = RealFunction.express("Đ^(α)(5)", context);
    var result  = f.evaluate(new Real("1.0",
                                      128),
                             1,
                             128,
                             new Real());
    assertEquals("Đ^(α)(constant) must be 0", 0.0, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOfVariable()
  {
    var    context  = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));
    var    f        = RealFunction.express("Đ^(α)(t)", context);
    var    result   = f.evaluate(new Real("1.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    double expected = 2.0 / Math.sqrt(Math.PI);
    assertEquals("Đ^(½)(t) at t=1", expected, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOfTSquared()
  {
    var    context  = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));
    var    f        = RealFunction.express("Đ^(α)(t²)", context);
    var    result   = f.evaluate(new Real("2.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    double expected = (8.0 / (3.0 * Math.sqrt(Math.PI))) * Math.pow(2.0, 1.5);
    assertEquals("Đ^(½)(t²) at t=2", expected, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOfTCubed()
  {
    var    context  = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));
    var    f        = RealFunction.express("Đ^(α)(t³)", context);
    var    result   = f.evaluate(new Real("1.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    double expected = 16.0 / (5.0 * Math.sqrt(Math.PI));
    assertEquals("Đ^(½)(t³) at t=1", expected, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOfConstantTimesMonomial()
  {
    var    context  = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));
    var    f        = RealFunction.express("Đ^(α)(3*t²)", context);
    var    result   = f.evaluate(new Real("2.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    double expected = 3.0 * (8.0 / (3.0 * Math.sqrt(Math.PI))) * Math.pow(2.0, 1.5);
    assertEquals("Đ^(½)(3*t²) at t=2", expected, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOfSum()
  {
    var    context  = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));
    var    f        = RealFunction.express("Đ^(α)(t+t²)", context);
    var    result   = f.evaluate(new Real("1.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    double dHalfT   = 2.0 / Math.sqrt(Math.PI);
    double dHalfT2  = 8.0 / (3.0 * Math.sqrt(Math.PI));
    double expected = dHalfT + dHalfT2;
    assertEquals("Đ^(½)(t+t²) at t=1", expected, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOrderOneMatchesOrdinaryDerivative()
  {
    var context = new Context(Real.named("α").set("1.0", 128).setBounds(0, false, 1, true));
    var f       = RealFunction.express("Đ^(α)(t³)", context);
    var result  = f.evaluate(new Real("2.0",
                                      128),
                             1,
                             128,
                             new Real());
    assertEquals("Đ^(1)(t³) = 3t² at t=2", 12.0, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOrderOneQuarter()
  {
    var    context     = new Context(Real.named("α").set("0.25", 128).setBounds(0, false, 1, true));
    var    f           = RealFunction.express("Đ^(α)(t)", context);
    var    result      = f.evaluate(new Real("1.0",
                                             128),
                                    1,
                                    128,
                                    new Real());
    double gamma7Over4 = 0.9190625268488832;
    double expected    = 1.0 / gamma7Over4;
    assertEquals("Đ^(¼)(t) at t=1", expected, result.doubleValue(), 1e-8);
  }

  public void testCaputoDerivativeOrderThreeQuarters()
  {
    var    context     = new Context(Real.named("α").set("0.75", 128).setBounds(0, false, 1, true));
    var    f           = RealFunction.express("Đ^(α)(t²)", context);
    var    result      = f.evaluate(new Real("1.0",
                                             128),
                                    1,
                                    128,
                                    new Real());
    double gamma9Over4 = 1.1330027984644842;
    double expected    = 2.0 / gamma9Over4;
    assertEquals("Đ^(¾)(t²) at t=1", expected, result.doubleValue(), 1e-8);
  }
}
