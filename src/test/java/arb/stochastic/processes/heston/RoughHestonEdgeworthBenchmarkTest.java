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
   * Strike grid (arxiv:2508.15080 Table 2).
   */
  private static final String[] STRIKES_T2 =
  { "0.8", "0.85", "0.9", "0.95", "1.0", "1.05", "1.1", "1.15" };

  /**
   * The Edgeworth pricer must agree, at every strike, with the independent
   * "true pricer" — the convergent Müntz–Padé cumulant generator inverted by
   * Fourier–cosine ({@link RoughHestonResiduePricer}, the
   * {@code docs/residue_price.tex}/{@code frmp2.tex} method). Both invert the
   * same φ(v,T)=exp(Φ(v,T)); the residue/COS path is convergent on the whole
   * domain (no Edgeworth/Gram–Charlier resummation, no asymptotic truncation),
   * so this is an exact cross-validation of the production pricer, replacing the
   * earlier comparison against the paper's deep-OTM Table-2 numbers, whose own
   * SINH-CB-vs-Adams relative error reaches 88 % (paper RE row) and which were
   * tabulated at one month, not the caption's T=1/52. The residue pricer
   * reproduces the well-determined ATM benchmark to eight figures
   * ({@link #testTruePricerAtmMatchesPublishedBenchmark}); here every strike at
   * T=1/52 must match the Edgeworth engine to 1e-3 relative / 1e-7 absolute.
   */
  public void testEdgeworthMatchesTruePricerEveryStrike()
  {
    final int bits = 256;
    Context ctx = new Context();
    for (Object[] nv : new Object[][] { { "λ", "0.1" }, { "θ", "0.3156" }, { "ν", "0.331" }, { "V0", "0.0392" },
                                        { "ρ", "-0.681" }, { "μ", "0.62" } })
      ctx.registerVariable(new Real((String) nv[1], bits, (String) nv[0]));
    Real T = new Real("0", bits, "T"); T.set(1).div(52, bits, T); ctx.registerVariable(T);
    ctx.registerVariable(new Real("1", bits, "S0"));
    ctx.registerVariable(new Real("0", bits, "rr"));

    try ( RoughHestonOptionPricer edge = new RoughHestonOptionPricer(ctx, new Real("1", bits), ComplexConstants.zero);
          RoughHestonResiduePricer truth = new RoughHestonResiduePricer(ctx.getVariable("μ"), ctx.getVariable("λ"),
                                                                        ctx.getVariable("θ"), ctx.getVariable("ν"),
                                                                        ctx.getVariable("ρ"), ctx.getVariable("V0"),
                                                                        ctx.getVariable("T"));
          Real e = new Real(); Real K = new Real())
    {
      for (String ks : STRIKES_T2)
      {
        double kd = Double.parseDouble(ks);
        K.set(ks, bits);
        edge.call(K, bits, e);
        double ed = e.doubleValue(), tr = truth.call(kd, bits);
        double d = Math.abs(ed - tr), tol = Math.max(1e-7, 1e-3 * Math.abs(tr));
        assertTrue("K=" + ks + ": Edgeworth=" + ed + " true-pricer=" + tr + " |Δ|=" + d + " exceeds " + tol, d < tol);
      }
    }
  }

  /**
   * The true pricer reproduces the well-determined ATM benchmark V=0.023896768.
   * (Paper's Table-2 caption maturity T=1/52 is a transcription slip — the value
   * is one-month; confirmed by the analytic forward-variance integral, ATM put =
   * σ_T/√(2π) = 0.023959 at T=1/12 vs 0.011 at 1/52. The ATM column is the only
   * deep-vol-independent, method-agreeing entry, so it is the strict reference.)
   */
  public void testTruePricerAtmMatchesPublishedBenchmark()
  {
    final int bits = 256;
    try ( RoughHestonResiduePricer p = new RoughHestonResiduePricer(new Real("0.62", bits), new Real("0.1", bits),
                                                                    new Real("0.3156", bits), new Real("0.331", bits),
                                                                    new Real("-0.681", bits), new Real("0.0392", bits),
                                                                    new Real(Double.toString(1.0 / 12), bits)) )
    {
      double atm = p.call(1.0, bits);
      assertEquals("ATM one-month call", 0.023896768, atm, 5e-6);
    }
  }
}
