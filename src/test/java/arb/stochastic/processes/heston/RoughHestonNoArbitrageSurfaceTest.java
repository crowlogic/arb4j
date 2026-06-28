package arb.stochastic.processes.heston;

import java.util.ArrayList;
import java.util.List;

import arb.ComplexConstants;
import arb.Real;
import arb.RealMatrix;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import junit.framework.TestCase;

/**
 * No-arbitrage and monotonicity tests for {@link RoughHestonOptionPricer} over a
 * strike × maturity grid. Needs <b>no external reference</b>: every
 * European-call surface C(K,T) produced under S₀=1, r=0 must satisfy four static
 * no-arbitrage / shape constraints, and any violation beyond rounding is a
 * genuine arbitrage.
 *
 * <p>
 * The full surface is held in a single {@link RealMatrix} (rows = maturities,
 * columns = strikes); entry C(m,s) = price at MATS[m], STRIKES[s].
 *
 * <p>
 * With S₀ = 1 and r = 0 (forward = 1, discounting = identity):
 * <ol>
 * <li><b>Bounds:</b> (1−K)⁺ ≤ C(K,T) ≤ 1.</li>
 * <li><b>Strike-monotonicity &amp; slope:</b> C non-increasing in K with
 * −1 ≤ ∂C/∂K ≤ 0, i.e. 0 ≤ C(Kᵢ)−C(Kᵢ₊₁) ≤ Kᵢ₊₁−Kᵢ.</li>
 * <li><b>Butterfly / convexity:</b> C(K−h) − 2·C(K) + C(K+h) ≥ 0.</li>
 * <li><b>Calendar-monotonicity:</b> C non-decreasing in T at fixed K.</li>
 * </ol>
 *
 * Tolerance is 2^-{@value #TOL_EXP} ≈ 7.5e-10, far above the solver's
 * 2^(-bits/2) floor, so a failure is structural, not numerical.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class RoughHestonNoArbitrageSurfaceTest extends
                                               TestCase
{
  static final int      bits         = 256;

  /** Tolerance = 2^-TOL_EXP ≈ 7.5e-10. */
  static final int      TOL_EXP      = 30;

  /** Committed grid: equally-spaced strikes ±30% (h=0.05). */
  static final String[] STRIKES      =
  { "0.70", "0.75", "0.80", "0.85", "0.90", "0.95", "1.00",
    "1.05", "1.10", "1.15", "1.20", "1.25", "1.30" };

  /** Committed maturities {num,den}: 1d, 1w, 1m, 3m, 6m, 1y. */
  static final int[][]  MATS         =
  { { 1, 252 }, { 1, 52 }, { 1, 12 }, { 1, 4 }, { 1, 2 }, { 1, 1 } };

  /** Wide probe: strikes ±70% (h=0.15, uniform). */
  static final String[] WIDE_STRIKES =
  { "0.30", "0.45", "0.60", "0.75", "0.90", "1.05", "1.20", "1.35", "1.50", "1.65" };

  /** Wide probe maturities: 1d .. 5y. */
  static final int[][]  WIDE_MATS    =
  { { 1, 252 }, { 1, 12 }, { 1, 2 }, { 2, 1 }, { 5, 1 } };

  /** Committed grid: fail on any no-arbitrage violation. */
  public void testNoArbitrageSurface()
  {
    try ( RealMatrix C = priceSurface(STRIKES, MATS))
    {
      List<String> v = findViolations(C, STRIKES, MATS);
      assertTrue("no-arbitrage violations:\n" + String.join("\n", v), v.isEmpty());
    }
  }

  /** Wide probe: report every violation across 0.30..1.70 × 1d..10y, then assert none. */
  public void testWideGridProbe()
  {
    try ( RealMatrix C = priceSurface(WIDE_STRIKES, WIDE_MATS))
    {
      List<String> v = findViolations(C, WIDE_STRIKES, WIDE_MATS);
      System.out.println("WIDE GRID PROBE: " + (WIDE_MATS.length * WIDE_STRIKES.length) + " prices ("
                         + WIDE_STRIKES.length + " strikes " + WIDE_STRIKES[0] + ".." + WIDE_STRIKES[WIDE_STRIKES.length - 1]
                         + " × " + WIDE_MATS.length + " maturities 1d..5y), " + v.size()
                         + " no-arbitrage violations beyond 2^-" + TOL_EXP);
      for (String s : v)
        System.out.println("  VIOLATION: " + s);
      assertTrue("wide-grid no-arbitrage violations:\n" + String.join("\n", v), v.isEmpty());
    }
  }

  // ─────────────────────────────────────────────────────────────────────
  // Surface construction: one RealMatrix, rows=maturities, cols=strikes.
  // ─────────────────────────────────────────────────────────────────────

  private static RealMatrix priceSurface(String[] strikes, int[][] mats)
  {
    RealMatrix C = RealMatrix.newMatrix(mats.length, strikes.length);
    for (int m = 0; m < mats.length; m++)
      priceRow(C, m, mats[m][0], mats[m][1], strikes);
    return C;
  }

  /** Price one maturity (a whole row of the surface) into {@code C}. */
  private static void priceRow(RealMatrix C, int m, int num, int den, String[] strikes)
  {
    // Calibrated El Euch–Rosenbaum / S&P set (maturity-independent).
    Real λ  = new Real("0.1",    bits).setName("λ");
    Real θ  = new Real("0.3156", bits).setName("θ");
    Real ν  = new Real("0.331",  bits).setName("ν");
    Real V0 = new Real("0.0392", bits).setName("V0");
    Real ρ  = new Real("-0.681", bits).setName("ρ");
    Real μ  = new Real("0.62",   bits).setName("μ");
    Real T  = new Real(bits).setName("T");
    T.set(num).div(den, bits, T);
    Real S0 = new Real("1", bits).setName("S0");
    Real rr = new Real("0", bits).setName("rr");

    Context ctx = new Context(λ, θ, ν, V0, ρ, μ, T);
    ctx.registerVariable(S0);
    ctx.registerVariable(rr);

    Real strike0 = new Real("1", bits);
    try ( RoughHestonOptionPricer pricer = new RoughHestonOptionPricer(ctx, strike0, ComplexConstants.zero);
          Real Ks = new Real(); Real px = new Real())
    {
      long t0 = System.nanoTime();
      for (int s = 0; s < strikes.length; s++)
      {
        Ks.set(strikes[s], bits);
        System.out.printf("[SURFACE row %d T=%d/%d] pricing K=%s (%d/%d) elapsed=%.1fs%n", m, num, den, strikes[s], s + 1, strikes.length, (System.nanoTime() - t0) / 1e9);
        pricer.call(Ks, bits, px);
        C.set(m, s, px);
      }
      System.out.printf("[SURFACE row %d T=%d/%d] done %d strikes in %.1fs%n", m, num, den, strikes.length, (System.nanoTime() - t0) / 1e9);
    }
    strike0.close();
    λ.close(); θ.close(); ν.close(); V0.close(); ρ.close(); μ.close(); T.close(); S0.close(); rr.close();
  }

  // ─────────────────────────────────────────────────────────────────────
  // No-arbitrage / shape checks. Collects every violation (no fail-fast).
  // ─────────────────────────────────────────────────────────────────────

  private static List<String> findViolations(RealMatrix C, String[] strikes, int[][] mats)
  {
    List<String> v = new ArrayList<>();
    final int    M = mats.length, S = strikes.length;

    try ( Real tol = new Real(); Real negTol = new Real(); Real one = new Real();
          Real lo = new Real(); Real d = new Real(); Real h = new Real(); Real bf = new Real(); Real K = new Real())
    {
      tol.one().mul2e(-TOL_EXP);
      negTol.set(tol).neg();
      one.one();
      h.set(strikes[1], bits); K.set(strikes[0], bits); h.sub(K, bits, h); // ΔK

      for (int m = 0; m < M; m++)
      {
        // (1) finiteness + bounds (1-K)⁺ ≤ C ≤ 1
        for (int s = 0; s < S; s++)
        {
          Real c = C.get(m, s);
          if (!c.isFinite()) { v.add(tag(mats, strikes, m, s) + " non-finite C=" + c); continue; }
          K.set(strikes[s], bits);
          one.sub(K, bits, lo); if (lo.sign() < 0) lo.zero();
          c.sub(lo, bits, d);
          if (d.compareTo(negTol) < 0) v.add(tag(mats, strikes, m, s) + " below intrinsic by " + neg(d));
          one.sub(c, bits, d);
          if (d.compareTo(negTol) < 0) v.add(tag(mats, strikes, m, s) + " above S₀ by " + neg(d));
        }
        // (2) strike-monotonicity + slope in [-1,0]
        for (int s = 0; s + 1 < S; s++)
        {
          C.get(m, s).sub(C.get(m, s + 1), bits, d); // -ΔC
          if (d.compareTo(negTol) < 0) v.add(tag(mats, strikes, m, s) + " not decreasing in K by " + neg(d));
          h.sub(d, bits, bf);                          // ΔK - (-ΔC)
          if (bf.compareTo(negTol) < 0) v.add(tag(mats, strikes, m, s) + " slope < -1 by " + neg(bf));
        }
        // (3) butterfly / convexity ≥ 0
        for (int s = 1; s + 1 < S; s++)
        {
          C.get(m, s - 1).add(C.get(m, s + 1), bits, bf);
          C.get(m, s).mul(2, bits, d);
          bf.sub(d, bits, bf);
          if (bf.compareTo(negTol) < 0) v.add(tag(mats, strikes, m, s) + " butterfly arbitrage by " + neg(bf));
        }
      }
      // (4) calendar-monotonicity in T
      for (int s = 0; s < S; s++)
        for (int m = 0; m + 1 < M; m++)
        {
          C.get(m + 1, s).sub(C.get(m, s), bits, d);
          if (d.compareTo(negTol) < 0)
            v.add("K=" + strikes[s] + " calendar arbitrage " + frac(mats, m) + "→" + frac(mats, m + 1) + " by " + neg(d));
        }
    }
    return v;
  }

  private static String tag(int[][] mats, String[] strikes, int m, int s)
  {
    return "[T=" + frac(mats, m) + ", K=" + strikes[s] + "]";
  }

  private static String frac(int[][] mats, int m)
  {
    return mats[m][0] + "/" + mats[m][1];
  }

  private static String neg(Real d)
  {
    try ( Real a = new Real())
    {
      d.neg(a);
      return a.toString();
    }
  }
}
