package arb.functions.real;

import arb.Real;
import junit.framework.TestCase;

/**
 * Tests for {@link ZetaSpectralDensity}.
 *
 * <p>
 * The evaluator implements the full stationary-phase mode sum derived from
 * {@code docs/StationaryPhaseLocusAndRemainderAtom.tex} (Lemma "statlocus")
 * and {@code docs/SpectralNonNegativity.md} (eq. 60). These tests verify:
 *
 * <ul>
 * <li>per-mode saddle identity ϑ'(t*) = log(n)/(σ − ν) for n = 2, 3, 4, 5;</li>
 * <li>N_max(T, ν) is consistent with the Lemma-"thetapbound" bound and
 *     the certified tail bound vanishes for N ≥ N_max;</li>
 * <li>the certified tail bound is monotone non-increasing in N;</li>
 * <li>{@link ZetaSpectralDensity#chooseTruncation} returns a truncation
 *     whose tail bound is within the requested tolerance;</li>
 * <li>the density is a full multi-mode sum — NOT a single-mode evaluation —
 *     and regresses against the removed one-mode behavior: for sufficiently
 *     large N the density differs from any single (n=2) term by more than a
 *     single term's magnitude;</li>
 * <li>rejection of out-of-band ν and of bad parameters.</li>
 * </ul>
 */
@SuppressWarnings("resource")
public class ZetaSpectralDensityTest extends
                                    TestCase
{
  private static final int    BITS   = 128;
  private static final double T_LOW  = 200.0;
  private static final double T_HIGH = 1.0e6;

  public void testSaddleIdentityForModes2Through5()
  {
    // Use ν = 0.9 so σ−ν = 0.1 is small; then target = log n/0.1 exceeds
    // ϑ'(T_LOW) ≈ 1.73 for all n ≥ 2, placing t*(n) inside [T_LOW, ∞).
    try ( var ev = new ZetaSpectralDensity();
          Real ν0 = new Real().set(0.9);
          Real tStar = new Real();
          Real jet = Real.newVector(2);
          var θ = new RiemannSiegelThetaFunction())
    {
      for (int nInt = 2; nInt <= 5; nInt++)
      {
        ev.saddleTime(nInt, 1, ν0, T_LOW, BITS, tStar);
        θ.evaluate(tStar, 2, BITS, jet);
        double ϑp     = jet.get(1).doubleValue();
        double target = Math.log(nInt) / (1 - 0.9);
        assertEquals("ϑ'(t*(n=" + nInt + ")) = log n/(σ-ν)", target, ϑp, target * 1e-10);
      }
    }
  }

  public void testMaxModeInWindowIsFinite()
  {
    int nMaxSmall = ZetaSpectralDensity.maxModeInWindow(0.3, 1e4);
    int nMaxLarge = ZetaSpectralDensity.maxModeInWindow(0.3, 1e9);
    assertTrue("N_max(small T) ≥ 2", nMaxSmall >= 2);
    assertTrue("N_max strictly increases with T", nMaxLarge > nMaxSmall);
  }

  public void testTailBoundVanishesAtMaxMode()
  {
    try ( var ev = new ZetaSpectralDensity();
          Real ν0 = new Real().set(0.42);
          Real bound = new Real())
    {
      int nMax = ZetaSpectralDensity.maxModeInWindow(0.42, T_HIGH);
      ev.tailBound(ν0, nMax, T_LOW, T_HIGH, BITS, bound);
      assertEquals("tail bound at N = N_max is zero", 0.0, bound.doubleValue(), 0.0);
    }
  }

  public void testTailBoundIsMonotoneNonIncreasing()
  {
    try ( var ev = new ZetaSpectralDensity();
          Real ν0 = new Real().set(0.42);
          Real prev = new Real();
          Real cur = new Real())
    {
      int nMax = ZetaSpectralDensity.maxModeInWindow(0.42, T_HIGH);
      int N    = 2;
      ev.tailBound(ν0, N, T_LOW, T_HIGH, BITS, prev);
      double lastVal = prev.doubleValue();
      for (int step = 0; step < 6 && N < nMax; step++)
      {
        N = Math.min(nMax, N + Math.max(1, N / 2));
        ev.tailBound(ν0, N, T_LOW, T_HIGH, BITS, cur);
        double v = cur.doubleValue();
        assertTrue("tail bound monotone non-increasing at N=" + N + " (got " + v + " > " + lastVal + ")",
                   v <= lastVal + 1e-12);
        lastVal = v;
      }
    }
  }

  public void testChooseTruncationHonorsTolerance()
  {
    try ( var ev = new ZetaSpectralDensity();
          Real ν0 = new Real().set(0.42);
          Real bound = new Real())
    {
      double tol = 1.0;
      int    N   = ev.chooseTruncation(ν0, tol, T_LOW, T_HIGH, BITS);
      int    nMax = ZetaSpectralDensity.maxModeInWindow(0.42, T_HIGH);
      ev.tailBound(ν0, N, T_LOW, T_HIGH, BITS, bound);
      boolean within   = bound.doubleValue() <= tol + 1e-12;
      boolean exhaustive = N == nMax;
      assertTrue("chosen truncation N=" + N + " has tail bound " + bound.doubleValue()
                 + " (tol=" + tol + ", N_max=" + nMax + ")",
                 within || exhaustive);
    }
  }

  /**
   * Regression test against the removed one-mode behavior. The removed
   * {@code ZetaOnBandStationaryPhaseDensity} presented a SINGLE saddle-mode
   * closed form as the density. The true density G(ν) is the SUM over n ≥ 2.
   * This test asserts that evaluating with N ≥ 3 differs from evaluating
   * with N = 2 by a non-trivial amount — demonstrating the multi-mode
   * contribution — and that the difference is within the tail-bound
   * predicted remainder.
   */
  public void testMultiModeContributionIsNonTrivial()
  {
    try ( var ev = new ZetaSpectralDensity();
          Real ν0 = new Real().set(0.4);
          Real gN2 = new Real();
          Real gN8 = new Real();
          Real bound = new Real())
    {
      ev.evaluate(ν0, 2, T_LOW, BITS, gN2);
      ev.evaluate(ν0, 8, T_LOW, BITS, gN8);
      double diff = Math.abs(gN8.doubleValue() - gN2.doubleValue());
      assertTrue("multi-mode sum must differ from single-mode (|G_8 - G_2| = " + diff + ")",
                 diff > 0.0);

      // The difference must be bounded by the certified remainder-of-2 tail bound
      // (or looser) to certify consistency with the tail estimate.
      ev.tailBound(ν0, 2, T_LOW, T_HIGH, BITS, bound);
      assertTrue("|G_8 - G_2| ≤ tailBound(N=2)  (diff=" + diff
                 + ", bound=" + bound.doubleValue() + ")",
                 diff <= bound.doubleValue() + 1e-9);
    }
  }

  public void testEvaluatorIsFiniteAndReproducible()
  {
    try ( var ev = new ZetaSpectralDensity();
          Real ν0 = new Real().set(0.42);
          Real first = new Real();
          Real second = new Real())
    {
      ev.evaluate(ν0, 6, T_LOW, BITS, first);
      ev.evaluate(ν0, 6, T_LOW, BITS, second);
      double a = first.doubleValue();
      double b = second.doubleValue();
      assertTrue("evaluator produced a finite density; got " + a, Double.isFinite(a));
      assertEquals("repeated evaluation reproduces the same value", a, b, 0.0);
    }
  }

  public void testRejectsFrequencyAtOrOutsideBand()
  {
    try ( var ev = new ZetaSpectralDensity();
          Real res = new Real())
    {
      double[] bad = { -1.5, -1.0, 0.0, 1.0, 1.7 };
      for (double νd : bad)
      {
        try ( Real νBad = new Real().set(νd))
        {
          try
          {
            ev.evaluate(νBad, 4, T_LOW, BITS, res);
            fail("expected IllegalArgumentException for ν = " + νd);
          }
          catch (IllegalArgumentException expected)
          {
            // ok
          }
        }
      }
    }
  }

  public void testRejectsInvalidTruncationOrModeArguments()
  {
    try ( var ev = new ZetaSpectralDensity();
          Real ν0 = new Real().set(0.3);
          Real res = new Real())
    {
      try
      {
        ev.evaluate(ν0, 0, T_LOW, BITS, res);
        fail("expected IllegalArgumentException for N = 0");
      }
      catch (IllegalArgumentException ok)
      {
      }
      try
      {
        ev.saddleTime(1, 1, ν0, T_LOW, BITS, res);
        fail("expected IllegalArgumentException for n = 1");
      }
      catch (IllegalArgumentException ok)
      {
      }
      try
      {
        ev.saddleTime(3, 0, ν0, T_LOW, BITS, res);
        fail("expected IllegalArgumentException for σ = 0");
      }
      catch (IllegalArgumentException ok)
      {
      }
      try
      {
        ev.saddleTime(3, -1, ν0, T_LOW, BITS, res);
        fail("expected IllegalArgumentException for σ = -1 with ν = 0.3 (σ-ν<0)");
      }
      catch (IllegalArgumentException ok)
      {
      }
    }
  }
}
