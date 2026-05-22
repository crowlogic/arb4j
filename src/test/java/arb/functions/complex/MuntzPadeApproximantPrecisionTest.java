package arb.functions.complex;

import arb.Complex;
import arb.Real;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * Caching / precision-reuse behaviour of {@link MuntzPadeApproximant}, using
 * the classical Riccati oracle y'=1-y², y(0)=0 → y(t)=tanh(t) (P=1, Q=0, R=-1,
 * μ=1).
 *
 * <p>
 * The approximant memoizes its σ-table / Jacobi / Padé sequences (Pn, Q, σ, h,
 * α, β …) by sequence index. Those caches are reused across evaluation points
 * at the same precision, and a precision guard rebuilds them when a request
 * asks for more bits than the cache currently holds. These tests pin that
 * contract:
 * <ul>
 * <li>same bits, different t → reuse, every value correct;</li>
 * <li>more bits than cached → cache cleared and rebuilt, full precision (this
 * is the regression guard: without it the higher-bits result is silently
 * capped at the lower precision);</li>
 * <li>fewer bits than cached → cache reused, result correct.</li>
 * </ul>
 *
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class MuntzPadeApproximantPrecisionTest extends
                                              TestCase
{
  private static final Complex ZERO_V = new Complex();

  private static RiccatiMuntzPadeFunctional tanhFunctional(int bits)
  {
    return new RiccatiMuntzPadeFunctional(new Real().set("1", bits), "1", "0", "-1");
  }

  /**
   * |Re(approx) − tanh(t)| evaluated at {@code refBits}, returned as a double
   * for thresholding. The error magnitudes under test (down to ~1e-43) are all
   * representable as doubles, so this is exact enough to threshold against.
   */
  private static double errVsTanh(Complex approx, RealNullaryFunction tanhRef, int refBits)
  {
    try ( Real ref = new Real(); Real err = new Real())
    {
      tanhRef.evaluate(refBits, ref);
      approx.getReal().sub(ref, refBits, err);
      return Math.abs(err.doubleValue());
    }
  }

  /**
   * Same precision, several distinct evaluation points: the symbolic sequence
   * caches are reused across t, and every value is correct. (Correctness is the
   * observable contract; the reuse is what makes the repeats cheap.)
   */
  public void testReuseAcrossEvaluationPointsSameBits()
  {
    int bits = 128;
    try ( RiccatiMuntzPadeFunctional eq = tanhFunctional(bits))
    {
      ComplexFunction approx = eq.evaluate(ZERO_V, 1, bits, null);

      Complex t   = new Complex();
      Complex r   = new Complex();
      int     ref = 200;

      long start = System.currentTimeMillis();

      t.set("1/2", bits);
      approx.evaluate(t, 1, bits, r);
      assertTrue("y(1/2)=tanh(1/2)", errVsTanh(r, RealNullaryFunction.express("tanh(1/2)"), ref) < 1e-20);

      t.set("1", bits);
      approx.evaluate(t, 1, bits, r);
      assertTrue("y(1)=tanh(1)", errVsTanh(r, RealNullaryFunction.express("tanh(1)"), ref) < 1e-20);

      t.set("3/2", bits);
      approx.evaluate(t, 1, bits, r);
      assertTrue("y(3/2)=tanh(3/2)", errVsTanh(r, RealNullaryFunction.express("tanh(3/2)"), ref) < 1e-20);

      // Re-evaluate already-seen points on the same approximant: still correct.
      t.set("1/2", bits);
      approx.evaluate(t, 1, bits, r);
      assertTrue("y(1/2) on reuse", errVsTanh(r, RealNullaryFunction.express("tanh(1/2)"), ref) < 1e-20);

      t.set("1", bits);
      approx.evaluate(t, 1, bits, r);
      assertTrue("y(1) on reuse", errVsTanh(r, RealNullaryFunction.express("tanh(1)"), ref) < 1e-20);

      long elapsed = System.currentTimeMillis() - start;
      assertTrue("5 evaluations must complete in <500ms (took " + elapsed + "ms) — exponential σ-table recomputation", elapsed < 500);
    }
  }

  /**
   * Increasing precision on the SAME approximant must rebuild the caches at the
   * higher precision. Without the precision guard the bits=256 result reuses
   * the bits=32 cache entries and is silently capped at ~32-bit accuracy
   * (≈5e-8); the guard makes it fully accurate (≈2e-43).
   */
  public void testIncreasingPrecisionRebuildsCache()
  {
    try ( RiccatiMuntzPadeFunctional eq = tanhFunctional(256))
    {
      ComplexFunction approx = eq.evaluate(ZERO_V, 1, 256, null);
      Complex         t      = new Complex();
      Complex         r      = new Complex();

      long start = System.currentTimeMillis();

      t.set("1", 32);
      approx.evaluate(t, 1, 32, r);
      assertTrue("32-bit eval is ~32-bit accurate",
                 errVsTanh(r, RealNullaryFunction.express("tanh(1)"), 300) < 1e-6);

      t.set("1", 256);
      approx.evaluate(t, 1, 256, r);
      double err = errVsTanh(r, RealNullaryFunction.express("tanh(1)"), 300);
      assertTrue("256-bit eval must NOT be capped by the 32-bit cache (err=" + err + ")", err < 1e-30);

      long elapsed = System.currentTimeMillis() - start;
      assertTrue("2 evaluations must complete in <500ms (took " + elapsed + "ms) — exponential σ-table recomputation", elapsed < 500);
    }
  }

  public void testDecreasingPrecisionReusesCache()
  {
    try ( RiccatiMuntzPadeFunctional eq = tanhFunctional(256))
    {
      ComplexFunction approx = eq.evaluate(ZERO_V, 1, 256, null);
      Complex         t      = new Complex();
      Complex         r      = new Complex();

      long start = System.currentTimeMillis();

      t.set("1", 256);
      approx.evaluate(t, 1, 256, r);
      assertTrue("256-bit eval accurate", errVsTanh(r, RealNullaryFunction.express("tanh(1)"), 300) < 1e-30);

      t.set("1", 64);
      approx.evaluate(t, 1, 64, r);
      double err = errVsTanh(r, RealNullaryFunction.express("tanh(1)"), 300);
      assertTrue("64-bit eval correct to ~half-precision floor (err=" + err + ")", err < 1e-12);

      long elapsed = System.currentTimeMillis() - start;
      assertTrue("2 evaluations must complete in <500ms (took " + elapsed + "ms) — exponential σ-table recomputation", elapsed < 500);
    }
  }
}
