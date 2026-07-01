package arb.functions.complex;

import arb.Complex;
import arb.LeakTracker;
import arb.Real;
import junit.framework.TestCase;

/**
 * Regression guard against owned arb objects being abandoned without
 * {@code close()} during a Müntz–Padé rebind sweep — the leak that OOM-killed
 * and slowed the rough-Heston calibration.
 *
 * <p>
 * {@link Real}/{@link Complex} own native (arb/FLINT) memory and have no
 * finalizer, so any owned instance dropped without {@code close()} orphans that
 * memory permanently. The Padé inner function memoizes its value by the last
 * argument in an owned {@code Complex} key; the original code's invalidate set
 * that key to {@code null} without closing it, abandoning one owned {@code
 * Complex} on every rebind (a Levenberg–Marquardt step drives many), which is
 * what made the calibration grow without bound.
 *
 * <p>
 * Unlike a live-object count, the abandonment signal is exact: {@link LeakTracker}
 * registers each owned allocation behind a weak reference, and an instance the
 * garbage collector reclaims while it was never closed is, by construction, a
 * definite leak. This test drives the rebind sweep, forces collection, and
 * asserts the sweep abandoned <em>zero</em> owned arb objects. If the
 * close-on-invalidate discipline regresses, the count climbs and this fails.
 */
public class MuntzPadeAbandonedAllocationTest extends
                                                          TestCase
{
  static final int bits = 128;

  public void testRebindAbandonsNoOwnedArbWithoutClose() throws Exception
  {
    boolean wasOn = LeakTracker.ON;
    LeakTracker.ON = true;
    LeakTracker.reset();
    // tanh oracle: y'=1-y², y(0)=0  (μ=1, P=1, Q=0, R=-1)
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1", bits), "1", "0", "-1");
          Complex v = new Complex();
          Complex t = new Complex();
          Complex r = new Complex())
    {
      t.re().set(0.5);

      for (int i = 0; i < 25; i++)
      {
        v.re().set(0.05 + 0.01 * (i % 17));
        eq.evaluate(v, 1, bits, null).evaluate(t, 1, bits, r);
      }
      forceCollection();
      long abandonedAfterWarm = LeakTracker.abandonedTotal();

      int rebinds = 80;
      for (int i = 0; i < rebinds; i++)
      {
        v.re().set(0.05 + 0.01 * (i % 17));
        eq.evaluate(v, 1, bits, null).evaluate(t, 1, bits, r);
      }
      forceCollection();
      long abandonedDuringSweep = LeakTracker.abandonedTotal() - abandonedAfterWarm;

      assertEquals("owned arb objects were garbage-collected WITHOUT close() during the Müntz-Padé rebind "
                    + "sweep — native memory orphaned (the calibration OOM/slowness regression): "
                    + abandonedDuringSweep + " abandoned over " + rebinds + " rebinds",
                   0,
                   abandonedDuringSweep);
    }
    finally
    {
      LeakTracker.ON = wasOn;
    }
  }

  // Reclaim and enqueue every unreferenced owned arb object, then process the
  // queue, so abandonedTotal() reflects everything dropped so far.
  private static void forceCollection() throws InterruptedException
  {
    for (int i = 0; i < 5; i++)
    {
      System.gc();
      Thread.sleep(25);
      LeakTracker.drain();
    }
  }
}
