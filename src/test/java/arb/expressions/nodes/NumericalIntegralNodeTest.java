package arb.expressions.nodes;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Fast structural tests for the {@code nint} keyword and
 * {@link NumericalIntegralNode}. None of these tests verifies numerical
 * accuracy beyond a few digits — they verify that the bytecode emitter
 * correctly wires up the trapezoid integrator field, the integrand
 * sub-expression field, and the F(b) − F(a) evaluation pattern.
 *
 * Each test runs an O(N) trapezoid sweep with N defaulting to 1024 or
 * an explicit small N. The whole suite is sized to run in well under
 * 100&nbsp;ms.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NumericalIntegralNodeTest extends
                                       TestCase
{

  /**
   * The trapezoid rule on a smooth integrand with known antiderivative —
   * ∫₀^π sin(t)dt = 2 — should match to ~3 digits with default N=1024.
   */
  public void testSinIntegralDefaultN()
  {
    var    f     = RealFunction.express("nint(t➔sin(t), t=0…π)");
    double value = f.eval(0.0);
    assertEquals(2.0, value, 1e-3);
  }

  /**
   * Explicit N= argument should override the default. Choosing a tiny
   * N=4 gives a deliberately-coarse trapezoid result; we verify only
   * that the call succeeds and produces a finite real number.
   */
  public void testExplicitPanelCount()
  {
    var    f     = RealFunction.express("nint(t➔sin(t), t=0…π, N=4)");
    double value = f.eval(0.0);
    assertTrue("trapezoid with N=4 should produce a finite value: " + value,
               Double.isFinite(value));
    // Trapezoid on sin over [0,π] with N=4 gives ≈ 1.896; bound it loosely.
    assertTrue("expected coarse approximation in [1.5, 2.0]: " + value,
               value > 1.5 && value <= 2.0);
  }

  /**
   * Explicit dt= argument should also work and follow the d&lt;var&gt;
   * naming convention.
   */
  public void testExplicitPanelWidth()
  {
    var    f     = RealFunction.express("nint(t➔sin(t), t=0…π, dt=0.1)");
    double value = f.eval(0.0);
    assertEquals("dt=0.1 trapezoid on sin over [0,π]", 2.0, value, 1e-2);
  }

  /**
   * Verify {@code nint} is genuinely numerical: the integrand involves
   * a function with no closed-form antiderivative in elementary terms
   * (sin(t²) — Fresnel-like), and a symbolic {@code int(...)} would fail
   * or produce a non-evaluable form. {@code nint} must just work.
   */
  public void testNonElementaryIntegrand()
  {
    var    f     = RealFunction.express("nint(t➔sin(t^2), t=0…1)");
    double value = f.eval(0.0);
    // Reference: ∫₀¹ sin(t²)dt ≈ 0.31026830 (Fresnel S, scaled).
    assertEquals(0.310268, value, 1e-3);
  }

  /**
   * The {@code nint} expression must report itself as a NumericalIntegralNode,
   * not the parent IntegralNode — this catches a regression where the parser
   * routes {@code nint} to the symbolic case.
   */
  public void testNodeType()
  {
    var f = RealFunction.express("nint(t➔t, t=0…1)");
    // A roundtrip through the function's expression is sufficient: if it
    // were a plain IntegralNode we'd see a symbolic antiderivative form.
    String repr = f.toString();
    assertTrue("expected toString to contain 'nint(', got: " + repr,
               repr.contains("nint("));
  }
}
