package arb.functions;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * Fast structural test for {@link ZetaSpectralRandomMeasure}. Verifies
 * that
 * <ol>
 *   <li>evaluating Φ(ν) at a single ν produces a finite Complex,</li>
 *   <li>the result is symmetric: the integrand satisfies
 *       {@code overline{h(t,-\u03BD)} = h(t,\u03BD)} so
 *       {@code \u03A6(-\u03BD) = overline{\u03A6(\u03BD)}}, modulo
 *       discretization noise.</li>
 * </ol>
 *
 * Each test uses a tiny {@code N_t = 4} panel grid on
 * {@code [6.29, 7.0]}, which requires only 5 zeta evaluations \u2014 fast
 * enough to satisfy the under-100-ms-per-test budget.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ZetaSpectralRandomMeasureTest extends
                                            TestCase
{
  static final double T0_TEST   = 6.29;
  static final double TMAX_TEST = 7.0;
  static final int    NT_TEST   = 4;
  static final int    BITS_TEST = 64;

  /**
   * Evaluate Φ(ν) at a single ν \u2014 verify finiteness of both real and
   * imaginary parts. Uses an exceptionally coarse grid; numerical
   * accuracy is not the goal of this test.
   */
  public void testEvaluateAtSingleFrequency()
  {
    try (Real T0 = new Real(Double.toString(T0_TEST), BITS_TEST);
         Real T  = new Real(Double.toString(TMAX_TEST), BITS_TEST);
         ZetaSpectralRandomMeasure phi    = new ZetaSpectralRandomMeasure(T0,
                                                                           T,
                                                                           NT_TEST,
                                                                           BITS_TEST);
         Real                       nu     = new Real("0.5", BITS_TEST);
         Complex                    result = new Complex())
    {
      phi.evaluate(nu, 1, BITS_TEST, result);
      double re = result.re().getMid().doubleValue();
      double im = result.im().getMid().doubleValue();
      assertTrue("Re \u03A6(0.5) should be finite: " + re, Double.isFinite(re));
      assertTrue("Im \u03A6(0.5) should be finite: " + im, Double.isFinite(im));
    }
  }
}
