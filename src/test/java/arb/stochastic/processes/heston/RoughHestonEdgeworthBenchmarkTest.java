package arb.stochastic.processes.heston;

import arb.ComplexConstants;
import arb.Real;
import arb.expressions.Context;
import junit.framework.TestCase;

/**
 * Benchmark test for {@link RoughHestonOptionPricer} against the published
 * reference values in
 *
 * <p>
 * Boyarchenko, De Innocentis, Levendorskiĭ. <em>Fast reliable pricing and
 * calibration of the rough Heston model</em>. arxiv:2508.15080. Table 1.
 *
 * <p>
 * Parameter set (eq 1.3 of the paper, calibrated to the S&amp;P IV surface as
 * of 7 January 2010, originally from El Euch–Rosenbaum 2019 §5.2):
 *
 * <pre>
 *   α = 0.62,  γ = 0.1,   ρ = −0.681,
 *   θ = 0.3156, ν = 0.331, v₀ = 0.0392,
 *   T = 1/252, S₀ = 1,    r = 0
 * </pre>
 *
 * <p>
 * Note: paper's α = our {@code μ}; paper's γ = our {@code λ}; paper's v₀ = our
 * {@code V0}. The fractional order convention is identical (the Riccati
 * derivative order ∈ (½, 1) is called α in the paper, μ in our code).
 *
 * <p>
 * Reference benchmark prices V (absolute error reported as &lt; 1e-13 in the
 * paper, derived via SINH-CB with M=20000 Adams steps):
 *
 * <pre>
 *   K        V (OTM put for K&lt;1, ATM/OTM call for K≥1)
 *   0.95     2.4557955  E−07
 *   0.975    1.29117047 E−04
 *   1.000    5.0111443104 E−03
 *   1.025    9.16277402 E−05
 *   1.05     3.3118     E−08
 * </pre>
 *
 * <h2>Tolerance</h2>
 *
 * The full Edgeworth series — cumulants from a Müntz-truncated rough Heston CF,
 * Hermite-basis weights c_n built by the Blinnikov–Moessner recurrence (no
 * integer-partition enumeration) — converges in N (Müntz truncation), J=2N
 * (Hermite cutoff), and bits (working precision) to the published SINH-CB
 * benchmark to within {@code 1e-8} absolute, every strike. Unlike
 * Gram–Charlier-A, the cross-cumulant contributions for n ≥ 4 are retained, so
 * the residual is bounded by the Müntz tail of Φ_N rather than by the
 * Hermite-tail aliasing that GC-A suffers.
 */
public class RoughHestonEdgeworthBenchmarkTest extends
                                               TestCase
{
  /**
   * Strike grid from arxiv:2508.15080 Table 1 (decimal strings — parsed to Real).
   */
  private static final String[] STRIKES =
  { "0.95", "0.975", "1.0", "1.025", "1.05" };

  /**
   * Reference benchmark V from arxiv:2508.15080 Table 1; OTM put for K&lt;1,
   * ATM/OTM call for K≥1. Absolute error in the paper is &lt;1e-13. Stored as
   * exact decimal strings and parsed to {@link Real} (no doubleValue).
   */
  private static final String[] REF_OTM =
  { "0.00000024557955", "0.000129117047", "0.0050111443104", "0.0000916277402", "0.000000033118" };

  /** Required absolute accuracy for the test to pass. */
  private static final String   ABS_TOL = "0.00000001";                                            // 1e-8

  /**
   * Edgeworth pricer at bits=512 reproduces every reference price within
   * {@value #ABS_TOL} absolute error.
   */
  public void testEdgeworthAgainstSinhCbBenchmark()
  {
    final int bits = 512;

    Context   ctx  = new Context();

    try ( Real λ = new Real("0.1",
                            bits,
                            "λ");

          Real θ = new Real("0.3156",
                            bits,
                            "θ");
          Real ν = new Real("0.331",
                            bits,
                            "ν");
          Real V0 = new Real("0.0392",
                             bits,
                             "V0");
          Real ρ = new Real("-0.681",
                            bits,
                            "ρ");
          Real μ = new Real("0.62",
                            bits,
                            "μ");
          Real T = new Real("0",
                            bits,
                            "T");)
    {
      T.set(1).div(252, bits, T);
      ctx.registerVariable(λ);
      ctx.registerVariable(θ);
      ctx.registerVariable(ν);
      ctx.registerVariable(V0);
      ctx.registerVariable(ρ);
      ctx.registerVariable(μ);
      ctx.registerVariable(T);
    }
    Real S0   = new Real("1",
                         bits,
                         "S0");
    Real rate = new Real("0",
                         bits,
                         "rr");
    ctx.registerVariable(S0);
    ctx.registerVariable(rate);
    // ctx.packageName = "rh";
    Real strike = new Real("1",
                           bits);

    try ( RoughHestonOptionPricer pricer = new RoughHestonOptionPricer(ctx,
                                                                       strike,
                                                                       ComplexConstants.zero);
          Real price = new Real(); Real K = new Real(); Real otm = new Real(); Real ref = new Real();
          Real diff = new Real(); Real tolR = new Real(ABS_TOL,
                                                       bits))
    {
      long t0 = System.nanoTime();
      for (int i = 0; i < STRIKES.length; i++)
      {
        K.set(STRIKES[i], bits);
        System.out.printf("[T1 %d/%d] pricing K=%s elapsed=%.1fs%n", i + 1, STRIKES.length, STRIKES[i], (System.nanoTime() - t0) / 1e9);
        pricer.call(K, bits, price);
        System.out.printf("[T1 %d/%d] priced  K=%s elapsed=%.1fs%n", i + 1, STRIKES.length, STRIKES[i], (System.nanoTime() - t0) / 1e9);

        // OTM: put for K<1 (P = C − 1 + K by parity at r=0), call for K≥1.
        if (i < 2)
        {
          price.sub(1, bits, otm);
          otm.add(K, bits, otm);
        }
        else
          otm.set(price);

        ref.set(REF_OTM[i], bits);
        otm.sub(ref, bits, diff);
        diff.abs();
        assertTrue("K=" + STRIKES[i] + ": otm=" + otm + " ref=" + ref + " |Δ|=" + diff + " exceeds tolerance "
                      + ABS_TOL,
                   diff.compareTo(tolR) < 0);
      }
    }
  }

  /**
   * Strike grid from arxiv:2508.15080 Table 2 (T=1/52, one trading week).
   */
  private static final String[] STRIKES_T2 =
  { "0.8", "0.85", "0.9", "0.95", "1.0", "1.05", "1.1", "1.15" };

  /**
   * Reference benchmark V from arxiv:2508.15080 Table 2; OTM put for K<1,
   * ATM/OTM call for K≥1. Printed precision varies by strike
   * (2-8 significant digits).
   */
  private static final String[] REF_OTM_T2 =
  { "0.0000178", "0.000189042", "0.001390943", "0.006975898",
    "0.023896768", "0.006556374", "0.000978149", "0.0000673" };

  /**
   * Per-strike absolute tolerances for Table 2, keyed to the last significant
   * digit of each printed reference value.
   * K=0.8,1.15: deep OTM, few digits → 5e-6.
   * K=0.85-1.1:  6+ digits → 1e-7.
   */
  private static final String[] TOL_T2 =
  { "0.000005", "0.0000001", "0.0000001", "0.0000001",
    "0.0000001", "0.0000001", "0.0000001", "0.000005" };

  /**
   * Edgeworth pricer (auto-terminating optimal-truncation accumulation, no fixed
   * truncation order) at bits=512 reproduces every Table 2 reference price
   * to within the per-strike tolerance.
   */
  public void testEdgeworthAgainstSinhCbBenchmarkTable2()
  {
    final int bits = 512;

    Context ctx = new Context();

    try ( Real λ = new Real("0.1", bits, "λ");
          Real θ = new Real("0.3156", bits, "θ");
          Real ν = new Real("0.331", bits, "ν");
          Real V0 = new Real("0.0392", bits, "V0");
          Real ρ = new Real("-0.681", bits, "ρ");
          Real μ = new Real("0.62", bits, "μ");
          Real T = new Real("0", bits, "T");)
    {
      T.set(1).div(52, bits, T);
      ctx.registerVariable(λ);
      ctx.registerVariable(θ);
      ctx.registerVariable(ν);
      ctx.registerVariable(V0);
      ctx.registerVariable(ρ);
      ctx.registerVariable(μ);
      ctx.registerVariable(T);
    }
    Real S0   = new Real("1", bits, "S0");
    Real rate = new Real("0", bits, "rr");
    ctx.registerVariable(S0);
    ctx.registerVariable(rate);
    Real strike = new Real("1", bits);

    try ( RoughHestonOptionPricer pricer = new RoughHestonOptionPricer(ctx,
                                                                       strike,
                                                                       ComplexConstants.zero);
          Real price = new Real(); Real K = new Real();
          Real otm = new Real(); Real ref = new Real();
          Real diff = new Real(); Real tolR = new Real())
    {
      long t0 = System.nanoTime();
      for (int i = 0; i < STRIKES_T2.length; i++)
      {
        K.set(STRIKES_T2[i], bits);
        System.out.printf("[T2 %d/%d] pricing K=%s elapsed=%.1fs%n", i + 1, STRIKES_T2.length, STRIKES_T2[i], (System.nanoTime() - t0) / 1e9);
        pricer.call(K, bits, price);
        System.out.printf("[T2 %d/%d] priced  K=%s elapsed=%.1fs%n", i + 1, STRIKES_T2.length, STRIKES_T2[i], (System.nanoTime() - t0) / 1e9);

        if (i < 4)
        {
          price.sub(1, bits, otm);
          otm.add(K, bits, otm);
        }
        else
          otm.set(price);

        ref.set(REF_OTM_T2[i], bits);
        tolR.set(TOL_T2[i], bits);
        otm.sub(ref, bits, diff);
        diff.abs();
        assertTrue("K=" + STRIKES_T2[i] + ": otm=" + otm + " ref=" + ref
                      + " |Δ|=" + diff + " exceeds tolerance " + TOL_T2[i],
                   diff.compareTo(tolR) < 0);
      }
    }
  }
}
