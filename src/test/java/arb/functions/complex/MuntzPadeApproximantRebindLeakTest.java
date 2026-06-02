package arb.functions.complex;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Real;
import junit.framework.TestCase;

/**
 * Regression guard for the Müntz–Padé rebind leak that made the rough-Heston
 * calibration slow and OOM-killed it.
 *
 * <p>
 * The approximant is rebound across a sweep of perturbation points {@code v} — a
 * Levenberg–Marquardt calibration drives one rebind per market residual per
 * step. Each rebind invalidates the v-dependent caches. The curried Padé
 * sequence {@code Φ:M➔z➔Φnum(M)(z)/Φden(M)(z)} <em>owns</em> the inner
 * {@code Φfunc(M)} instances it constructs; those instances are reusable across
 * a v change (only their per-point result memo goes stale), so invalidation must
 * reset them <em>in place</em> and keep them. A regression that instead drops
 * and reconstructs them on every rebind orphans their native
 * {@link ComplexPolynomial} scratch — a leak that grows linearly with the number
 * of rebinds (≈26 live polynomials per rebind here) until the process is
 * OOM-killed, and the reconstruction is itself the allocation churn that made the
 * calibration slow.
 *
 * <p>
 * The guard asserts what the fix guarantees: the count of live owned native
 * polynomials does <em>not</em> grow with the number of rebinds. If the
 * reuse-in-place architecture is broken, the live count climbs and this test
 * fails — so the slow/leaky behaviour can never pass CI again.
 *
 * @see MuntzPadeApproximant#rebind(Complex, int)
 * @see arb.functions.IndexCache#invalidateEntries(boolean)
 */
public class MuntzPadeApproximantRebindLeakTest extends
                                                 TestCase
{
  static final int bits = 128;

  public void testRebindReusesInnerInstancesAndDoesNotLeak()
  {
    boolean wasTracking = ComplexPolynomial.TRACK;
    ComplexPolynomial.TRACK = true;
    // tanh oracle: y'=1-y², y(0)=0  (μ=1, P=1, Q=0, R=-1)
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1", bits), "1", "0", "-1");
          Complex v = new Complex();
          Complex t = new Complex();
          Complex r = new Complex())
    {
      t.re().set(0.5);

      // Warm to the steady-state working set over the v-range.
      for (int i = 0; i < 30; i++)
      {
        v.re().set(0.05 + 0.01 * (i % 19));
        eq.evaluate(v, 1, bits, null).evaluate(t, 1, bits, r);
      }
      int liveAfterWarm = ComplexPolynomial.liveTrackedCount();

      // Many more rebinds over the same v-range. Reuse ⇒ no growth; a drop+
      // reconstruct regression ⇒ ~26 leaked polynomials per rebind.
      int rebinds = 90;
      for (int i = 0; i < rebinds; i++)
      {
        v.re().set(0.05 + 0.01 * (i % 19));
        eq.evaluate(v, 1, bits, null).evaluate(t, 1, bits, r);
      }
      int liveAfterSweep = ComplexPolynomial.liveTrackedCount();

      // The warm-up loop already covered the whole v-range (30 iterations over 19
      // distinct points), so the working set of live owned polynomials is fully
      // populated. Reuse-in-place makes that working set INVARIANT: 90 more
      // rebinds over the same range create no new persistent native objects, so
      // the count must be byte-for-byte identical. A drop-and-reconstruct
      // regression leaks one fresh set per rebind, so the count climbs — there is
      // no admissible nonzero growth, hence an exact equality with no threshold.
      assertEquals("Müntz-Padé rebind leaks native ComplexPolynomials (calibration OOM/slowness regression): "
                    + "live count changed from " + liveAfterWarm + " to " + liveAfterSweep + " over " + rebinds
                    + " rebinds; the curried Padé inner instances are being dropped+reconstructed instead of "
                    + "reused in place",
                   liveAfterWarm,
                   liveAfterSweep);
    }
    finally
    {
      ComplexPolynomial.TRACK = wasTracking;
    }
  }
}
