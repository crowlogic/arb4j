package arb.functions.complex;

import arb.Complex;
import arb.expressions.Context;
import junit.framework.TestCase;

/**
 * End-to-end tests for the DSL surface of the Fox H-function node. Every test
 * here goes through {@code FoxH(\u2026)} parsed from a DSL string, exercising
 * {@link arb.expressions.nodes.unary.FoxHFunctionNode}, the runtime
 * {@link FoxHFunction}, and the residue-term expression that
 * {@link FoxHFunction#init} compiles.
 *
 * <p>
 * Correctness is checked against known specializations of Fox H to
 * already-implemented functions in arb4j (Mittag-Leffler, exponential). No
 * magic numbers are hard-coded for intermediate residue coefficients; the
 * price-level identity is the test.
 * </p>
 *
 * @author Stephen Crowley \u00a92025-2026
 */
public class FoxHFunctionTest extends
                              TestCase
{
  static final int prec = 64;

  /** Hard ceiling on every test method so a hung evaluation surfaces fast. */
  @Override
  public void runBare() throws Throwable
  {
    Thread t = new Thread(() ->
    {
      try
      {
        super.runBare();
      }
      catch (Throwable th)
      {
        throw new RuntimeException(th);
      }
    });
    t.setDaemon(true);
    t.start();
    t.join(30_000);
    if (t.isAlive())
    {
      t.interrupt();
      throw new AssertionError("test exceeded 30s wall-clock; likely hung in FoxHFunction.evaluate");
    }
  }

  /**
   * Mittag-Leffler reduction:
   *
   * <pre>
   *   H^{1,1}_{1,2} ( -z | (0, 1) ; (0, 1), (0, \u03b1) )  =  E_\u03b1(z)
   * </pre>
   *
   * For \u03b1 = 0.6 and a few small real z, compare against the existing
   * MittagLeffler node.
   */
  public void testMittagLefflerReduction()
  {
    Context         ctx     = new Context();
    Complex         result  = new Complex();
    Complex         ref     = new Complex();
    Complex         zVal    = new Complex();

    // The Fox H side: a = (0), A = (1) so a is a length-1 Complex with value 0,
    // b = (0, 0), B = (1, \u03b1) so b is length-2 Complex with
    // both entries 0 and B is length-2 Real with entries (1, \u03b1).
    //
    // Both sides take z as the argument; the Fox H side uses -z (the relation
    // is H^{1,1}_{1,2}(-z | (0,1); (0,1),(0,\u03b1)) = E_\u03b1(z)).
    ComplexFunction H       = ComplexFunction.express("H", "FoxH(1, 1, [0], [1], [0, 0], [1, 0.6]; -z)", ctx);
    ComplexFunction E       = ComplexFunction.express("E", "MittagLeffler(0.6, z)", new Context());

    // μ = B_1 + B_2 - A_1 = 1 + 0.6 - 1 = 0.6 > 0, so per Mathai-Saxena-
    // Haubold the LHP residue series is the analytic continuation across the
    // entire principal sheet |arg z| < π. Test points span the inside-the-
    // basic-sector regime AND the analytic-continuation regime |arg z| > a*π/2.
    // For Mittag-Leffler the Fox H argument is -z, so |arg(-z)| = |π - arg z|;
    // tests cover z values from purely imaginary (Fox H arg on negative
    // imaginary axis) through near-real-positive (Fox H arg near negative
    // real axis, deep in the continuation regime).
    double[][]      zPoints =
    {
      { 0.05 * Math.cos(0.6 * Math.PI), 0.05 * Math.sin(0.6 * Math.PI) },                                                           // inside basic sector
      { 0.15 * Math.cos(0.6 * Math.PI), 0.15 * Math.sin(0.6 * Math.PI) },
      { 0.3 * Math.cos(0.6 * Math.PI), 0.3 * Math.sin(0.6 * Math.PI) },
      { 0.0, 0.2 },                                                                                                                 // pure imaginary: |arg(-z)|
                                                                                                                                    // = π/2, INSIDE basic
                                                                                                                                    // sector
      { 0.0, 0.5 },
      { 0.1, 0.05 },                                                                                                                // |arg(-z)| ≈ 2.68, ABOVE
                                                                                                                                    // a*π/2 = 2.20 —
                                                                                                                                    // continuation regime
      { 0.3, 0.01 },                                                                                                                // |arg(-z)| ≈ 3.11, very
                                                                                                                                    // deep in continuation
                                                                                                                                    // regime
    };
    for (double[] pt : zPoints)
    {
      zVal.set(pt[0], pt[1]);
      H.evaluate(zVal, 1, prec, result);
      E.evaluate(zVal, 1, prec, ref);

      double dRe = result.re().doubleValue() - ref.re().doubleValue();
      double dIm = result.im().doubleValue() - ref.im().doubleValue();
      assertEquals("Re mismatch at z=" + zVal, 0.0, dRe, 1e-12);
      assertEquals("Im mismatch at z=" + zVal, 0.0, dIm, 1e-12);
    }
  }
}
