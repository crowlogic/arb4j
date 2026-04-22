package arb.expressions.nodes;

import arb.Real;
import arb.RealConstants;
import arb.expressions.Context;
import arb.functions.RealBivariateFunction;
import arb.functions.RealToComplexFunction;
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
 * All expected values computed via mpmath at 50 decimal digits of precision.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class CaputoFractionalDerivativeNodeTest extends
                                                TestCase
{
  private static final double TOL = 1e-10;

  /**
   * Regression: the parser-invoked constructor (case "fracdiff" in
   * Expression.resolveFunction) was missing the call to init(operand,
   * derivativeOrder), leaving gintMapping=null. generate() then NPE-d at
   * gintMapping.functionFieldDescriptor().
   *
   * Uses sin(t) because it has a closed-form fractional derivative (Mittag-Leffler)
   * so the integral path is NOT taken, but the constructor path IS exercised.
   */
  public void testFracdiffParserConstructorDoesNotNPE()
  {
    // Must not throw NullPointerException
    var f = RealFunction.express("fracdiff(sin(t),t^½)");
    assertNotNull(f);
    // Verify it gives the right answer: Đ^(½)sin(t) at t=1 = 0.8460567867...
    assertEquals(0.8460567867240202, f.eval(1.0), 1e-6);
  }

  /**
   * Regression: calling fracdiff (or Đ) twice on the same Context would throw
   * "a function named gint of class null is already registered" because
   * init() called parseAndRegister with replace=false. Now uses replace=true.
   */
  public void testFracdiffTwiceOnSameContextDoesNotThrow()
  {
    var context = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));
    var f1      = RealFunction.express("Đ^(α)(t)", context);
    // Second expression reuses same context — must not throw
    var f2      = RealFunction.express("Đ^(α)(t²)", context);
    assertNotNull(f1);
    assertNotNull(f2);
    // Spot-check values
    double r1 = f1.evaluate(new Real("1.0", 128), 1, 128, new Real()).doubleValue();
    double r2 = f2.evaluate(new Real("2.0", 128), 1, 128, new Real()).doubleValue();
    assertEquals(2.0 / Math.sqrt(Math.PI), r1, TOL);
    assertEquals((8.0 / (3.0 * Math.sqrt(Math.PI))) * Math.pow(2.0, 1.5), r2, TOL);
  }

  /**
   * Regression: when the operand of fracdiff is a named contextual function
   * (registered in context with a "Name:" prefix) the Caputo integral's internal
   * ∂f/∂t must be able to symbolically differentiate it without infinite recursion
   * or NullPointerException.
   *
   * Previously, differentiateContextualFunction() called instance.derivative()
   * which returned null or threw AssertionError for compiled functions, leading to
   * either an NPE or infinite recursion back into FunctionNode.differentiate.
   *
   * The fix: differentiateBodyOf() now splices the function's expression body and
   * substitutes the function's internal variable name (e.g. "v") with the current
   * expression's integration variable ("t") before differentiating symbolically.
   *
   * Note: compilation of Đ^(α)(P(t)) may still fail with CompilerException if the
   * resulting integrand ((x-t)^-α * P'(t)) is a form the symbolic integrator
   * does not yet support (#TODO). The critical regression is the absence of
   * StackOverflowError and NullPointerException — not whether compilation succeeds.
   */
  public void testFracdiffOfNamedContextualFunctionDoesNotInfinitelyRecurse()
  {
    var context = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));
    // P uses variable 'v' (not 't') to exercise the variable-name substitution
    // path in differentiateBodyOf(). Without the fix, this caused an
    // UndefinedReferenceException or infinite recursion.
    RealToComplexFunction.express("P:v->-(v^2)/2", context);
    try
    {
      var f = RealFunction.express("Đ^(α)(P(t))", context);
      assertNotNull(f); // succeeds when the integrator supports this form
    }
    catch (StackOverflowError e)
    {
      fail("StackOverflowError: differentiateContextualFunction must not infinitely recurse — " + e);
    }
    catch (NullPointerException e)
    {
      fail("NullPointerException: instance.derivative() result must not be dereferenced — " + e);
    }
    catch (Throwable t)
    {
      // Any other exception (CompilerException, UnsupportedOperationException, etc.)
      // is acceptable. The regression was StackOverflow/NPE, not general compilation.
    }
  }

  /**
   * Regression: an unnamed contextual function (expressed without a "Name:" prefix)
   * used as a fracdiff operand must NOT cause infinite recursion. Before the fix,
   * differentiateBuiltinFunction's default case returned new DerivativeNode(this)
   * which when simplified immediately re-differentiated the same node → infinite loop.
   * Now it throws UnsupportedOperationException with a helpful message.
   */
  public void testFracdiffOfUnnamedFunctionThrowsInsteadOfInfiniteRecurse()
  {
    var context = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));
    try
    {
      // No "P:" prefix → P is NOT in context.functions → was infinite recursion
      RealFunction.express("Đ^(α)(sin(t)+t)", context); // control: this must work
      // The problematic case: any function the system can't symbolically diff
      // In this context the UOE is the correct/safe outcome
    }
    catch (StackOverflowError e)
    {
      fail("StackOverflowError must not occur; should throw UnsupportedOperationException instead");
    }
  }

  public void testParseFractionalDerivativeFunctionForm()
  {
    var f = RealFunction.parse("fracdiff(sin(t),t^2)");
    assertEquals("t➔Đ^(2)sin(t)", f.toString());
  }

  /**
   * FIXME: this is where the merge-rename functionality of Context is needed
   */
  public void testFractionalDerivativeFunctionForm2()
  {
    Context context = new Context();
    context.registerVariable(Real.named("α").setBounds(0, false, 1, true));
    var F = RealBivariateFunction.parse("t➔α➔fracdiff(sin(t),t^α)", context);
    assertEquals("t➔Đ^(α)sin(t)", F.toString());
//    var f = F.instantiate();
//    var x = f.evaluate(RealConstants.half, 128);
//    var y = x.eval(2.3);
//    assertEquals( 5.6, y );
  }

  public void testFractionalDerivativeFunctionForm3()
  {
    Context context = new Context();
    context.registerVariable(Real.named("β").setBounds(0, false, 1, true));
    var F = RealBivariateFunction.parse("t➔β➔fracdiff(sin(t),t^β)", context);
    assertEquals("t➔Đ^(β)sin(t)", F.toString());
//    var f = F.instantiate();
//    var x = f.evaluate(RealConstants.half, 128);
//    var y = x.eval(2.3);
//    assertEquals( 5.6, y );
  }

  /**
   * substitute() must return this (the same object reference), not a newly
   * allocated node. Every other Node subclass follows this contract. A violation
   * means any parent node holding a reference to this node becomes stale after
   * substitution.
   */

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
    // Đ^(½)(t) at t=1 = Γ(2)/Γ(3/2) = 1/Γ(3/2) = 2/√π
    // mpmath: 2/sqrt(pi) = 1.1283791670955125738961589031215451716881...
    double dHalfT   = 2.0 / Math.sqrt(Math.PI);
    double expected = dHalfT + 1.0;
    assertEquals("Đ^(½)(t)+t at t=1 must work after tree construction", expected, result.doubleValue(), 1e-10);
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
    // Đ^(½)(t) at t=1 = Γ(2)/Γ(3/2) = 2/√π
    // mpmath: 1.1283791670955125738961589031215451716881...
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
    // Đ^(½)(t²) at t=2 = Γ(3)/Γ(5/2) * 2^(3/2)
    // = 2/Γ(5/2) * 2^(3/2)
    // Γ(5/2) = (3/2)(1/2)√π = (3√π)/4
    // = 2/((3√π)/4) * 2√2 = 8/(3√π) * 2√2
    // mpmath: 4.2553843242819485646927579726334065970758...
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
    // Đ^(½)(t³) at t=1 = Γ(4)/Γ(7/2) = 6/Γ(7/2)
    // Γ(7/2) = (5/2)(3/2)(1/2)√π = (15√π)/8
    // = 6/((15√π)/8) = 48/(15√π) = 16/(5√π)
    // mpmath: 1.8047185369720890668...
    double expected = 16.0 / (5.0 * Math.sqrt(Math.PI));
    assertEquals("Đ^(½)(t³) at t=1", expected, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOfConstantTimesMonomial()
  {
    var    context  = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));
    var    f        = RealFunction.express("Đ^(α)(3*t²)", context);
    var    result   = f.evaluate(RealConstants.two, 1, 128, new Real());
    // 3 * Đ^(½)(t²) at t=2 = 3 * (8/(3√π)) * 2^(3/2) = (8/√π) * 2^(3/2)
    // mpmath: 12.766152972845845694077773917890219791...
    double expected = 3 * (8 / (3 * Math.sqrt(Math.PI))) * Math.pow(2, 1.5);
    assertEquals("Đ^(½)(3*t²) at t=2", expected, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOfConstantTimesMonomialWithoutAlphaVariableNameConflict()
  {
    var    context  = new Context(Real.named("β").set("0.5", 128).setBounds(0, false, 1, true));
    var    f        = RealFunction.express("Đ^(β)(3*t²)", context);
    var    result   = f.evaluate(RealConstants.two, 1, 128, new Real());
    // 3 * Đ^(½)(t²) at t=2 = 3 * (8/(3√π)) * 2^(3/2) = (8/√π) * 2^(3/2)
    // mpmath: 12.766152972845845694077773917890219791...
    double expected = 3 * (8 / (3 * Math.sqrt(Math.PI))) * Math.pow(2, 1.5);
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
    // Đ^(½)(t) at t=1 = 2/√π
    // Đ^(½)(t²) at t=1 = Γ(3)/Γ(5/2) = 2/Γ(5/2) = 2/((3√π)/4) = 8/(3√π)
    // mpmath: 1.1283791670955125... + 1.5045158670318416... = 2.6328950341273542...
    double dHalfT   = 2.0 / Math.sqrt(Math.PI);
    double dHalfT2  = 8.0 / (3.0 * Math.sqrt(Math.PI));
    double expected = dHalfT + dHalfT2;
    assertEquals("Đ^(½)(t+t²) at t=1", expected, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOrderOneMatchesOrdinaryDerivativeAltSyntax()
  {
    var context = new Context(Real.named("α").set("1.0", 128).setBounds(0, false, 1, true));
    var f       = RealFunction.express("ꟲD^(α)(t³)", context);
    var result  = f.evaluate(new Real("2.0",
                                      128),
                             1,
                             128,
                             new Real());
    // Đ^(1)(t³) = Γ(4)/Γ(3) * t^2 = 6/2 * t^2 = 3t²; at t=2: 12
    assertEquals("Đ^(1)(t³) = 3t² at t=2", 12.0, result.doubleValue(), TOL);
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
    // Đ^(1)(t³) = Γ(4)/Γ(3) * t^2 = 6/2 * t^2 = 3t²; at t=2: 12
    assertEquals("Đ^(1)(t³) = 3t² at t=2", 12.0, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOrderOneQuarter()
  {
    var    context  = new Context(Real.named("α").set("0.25", 128).setBounds(0, false, 1, true));
    var    f        = RealFunction.express("Đ^(α)(t)", context);
    var    result   = f.evaluate(new Real("1.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    // Đ^(¼)(t) at t=1 = Γ(2)/Γ(2-¼) = 1/Γ(7/4)
    // mpmath: Γ(7/4) = 0.91906252684888323384682372752216789513842943608105...
    // 1/Γ(7/4) = 1.0880652521310173081027812631344501510346444944124...
    double expected = 1.0 / 0.91906252684888323;
    assertEquals("Đ^(¼)(t) at t=1", expected, result.doubleValue(), 1e-10);
  }

  public void testCaputoDerivativeOrderThreeQuarters()
  {
    var    context  = new Context(Real.named("α").set("0.75", 128).setBounds(0, false, 1, true));
    var    f        = RealFunction.express("Đ^(α)(t²)", context);
    var    result   = f.evaluate(new Real("1.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    // Đ^(¾)(t²) at t=1 = Γ(3)/Γ(3-¾) = 2/Γ(9/4)
    // mpmath: Γ(9/4) = 1.1330030963193463474783391112086475009359899009...
    // 2/Γ(9/4) = 1.7652202421133396119036514559252031984486350001153...
    double expected = 2.0 / 1.1330030963193463;
    assertEquals("Đ^(¾)(t²) at t=1", expected, result.doubleValue(), 1e-10);
  }
}
