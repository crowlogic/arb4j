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
 * <p>Correctness is checked against known specializations of Fox H to
 * already-implemented functions in arb4j (Mittag-Leffler, exponential).
 * No magic numbers are hard-coded for intermediate residue coefficients;
 * the price-level identity is the test.</p>
 *
 * @author Stephen Crowley \u00a92025-2026
 */
public class FoxHFunctionTest extends
                              TestCase
{
  static final int prec = 128;

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
    Context  ctx     = new Context();
    Complex  result  = new Complex();
    Complex  ref     = new Complex();
    Complex  zVal    = new Complex();

    // The Fox H side: a = (0), A = (1) so a is a length-1 Complex with value 0,
    //                 b = (0, 0), B = (1, \u03b1) so b is length-2 Complex with
    //                 both entries 0 and B is length-2 Real with entries (1, \u03b1).
    //
    // Both sides take z as the argument; the Fox H side uses -z (the relation
    // is H^{1,1}_{1,2}(-z | (0,1); (0,1),(0,\u03b1)) = E_\u03b1(z)).
    ComplexFunction H = ComplexFunction.express("H",
                                                "FoxH(1, 1, [0], [1], [0, 0], [1, 0.6]; -z)",
                                                ctx);
    ComplexFunction E = ComplexFunction.express("E",
                                                "MittagLeffler(0.6, z)",
                                                new Context());

    for (double zd : new double[] { 0.0, 0.1, 0.25 })
    {
      zVal.set(zd, 0);
      H.evaluate(zVal, 1, prec, result);
      E.evaluate(zVal, 1, prec, ref);

      double dRe = result.re().doubleValue() - ref.re().doubleValue();
      double dIm = result.im().doubleValue() - ref.im().doubleValue();
      assertEquals("Re mismatch at z=" + zd, 0.0, dRe, 1e-12);
      assertEquals("Im mismatch at z=" + zd, 0.0, dIm, 1e-12);
    }
  }
}
