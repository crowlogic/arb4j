package arb.stochastic.processes.heston;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.ComplexConstants;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import junit.framework.TestCase;

/**
 * Benchmark test for {@link RoughHestonEdgeworthCallPrice} against the
 * published reference values in
 *
 * <p>
 * Boyarchenko, De Innocentis, Levendorskiĭ. <em>Fast reliable pricing and
 * calibration of the rough Heston model</em>. arxiv:2508.15080. Tables 1–2.
 *
 * <p>
 * Parameter set (eq 1.3 of the paper, calibrated to the S&amp;P IV surface as
 * of 7 January 2010, originally from El Euch–Rosenbaum 2019 §5.2):
 *
 * <pre>
 *   α = 0.62,  γ = 0.1,   ρ = −0.681,
 *   θ = 0.3156, ν = 0.331, v₀ = 0.0392,
 *   S₀ = 1,    r = 0
 * </pre>
 *
 * <p>
 * Note: paper's α = our {@code μ}; paper's γ = our {@code λ}; paper's v₀ = our
 * {@code V0}. The fractional order convention is identical (the Riccati
 * derivative order ∈ (½, 1) is called α in the paper, μ in our code).
 *
 * <h2>Tolerance</h2>
 *
 * The full Edgeworth series — cumulants from the Müntz-order-N rough Heston
 * CGF, Hermite-basis weights c(n) built by the Blinnikov–Moessner recurrence
 * (no integer-partition enumeration) — converges in N (the Müntz order) and
 * bits (working precision) to the published SINH-CB benchmark, every strike.
 * Unlike Gram–Charlier-A, the cross-cumulant contributions for n ≥ 4 are
 * retained, so the residual is bounded by the Müntz tail of Φ_N rather than by
 * the Hermite-tail aliasing that GC-A suffers.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RoughHestonEdgeworthCallPriceTest extends
                                               TestCase
{
  public static final Logger log = LoggerFactory.getLogger(RoughHestonEdgeworthCallPriceTest.class);

  /**
   * Strike grid from arxiv:2508.15080 Table 1 (T=1/252, one trading day;
   * decimal strings — parsed to Real).
   */
  private static final String[] STRIKES  =
  { "0.95", "0.975", "1.0", "1.025", "1.05" };

  /**
   * Reference benchmark V from arxiv:2508.15080 Table 1; OTM put for K&lt;1,
   * ATM/OTM call for K≥1. Absolute error in the paper is &lt;1e-13. Stored as
   * exact decimal strings and parsed to {@link Real} (no doubleValue).
   */
  private static final String[] REF_OTM  =
  { "0.00000024557955", "0.000129117047", "0.0050111443104", "0.0000916277402", "0.000000033118" };

  /**
   * The Edgeworth call price at bits=512 reproduces every Table 1 reference
   * price exactly.
   */
  public void testEdgeworthAgainstSinhCbBenchmark()
  {
    final int bits = 512;

    Context   ctx  = new Context();

    try ( Real λ = new Real("0.1", bits, "λ");
          Real θ = new Real("0.3156", bits, "θ");
          Real ν = new Real("0.331", bits, "ν");
          Real V0 = new Real("0.0392", bits, "V0");
          Real ρ = new Real("-0.681", bits, "ρ");
          Real μ = new Real("0.62", bits, "μ");
          Real T = new Real("0", bits, "T");)
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
    Real S0   = new Real("1", bits, "S0");
    Real rate = new Real("0", bits, "rr");
    ctx.registerVariable(S0);
    ctx.registerVariable(rate);
    Real strike = new Real("1", bits);

    try ( RoughHestonEdgeworthCallPrice price = new RoughHestonEdgeworthCallPrice(ctx,
                                                                                  strike,
                                                                                  ComplexConstants.zero);
          Real value = new Real(); Real K = new Real(); Real otm = new Real(); Real ref = new Real())
    {
      long t0 = System.nanoTime();
      for (int i = 0; i < STRIKES.length; i++)
      {
        K.set(STRIKES[i], bits);
        log.info("[T1 {}/{}] pricing K={} elapsed={}s", i + 1, STRIKES.length, STRIKES[i], (System.nanoTime() - t0) / 1e9);
        price.call(K, bits, value);
        log.info("[T1 {}/{}] priced  K={} elapsed={}s", i + 1, STRIKES.length, STRIKES[i], (System.nanoTime() - t0) / 1e9);

        // OTM: put for K<1 (P = C − 1 + K by parity at r=0), call for K≥1.
        if (i < 2)
        {
          value.sub(1, bits, otm);
          otm.add(K, bits, otm);
        }
        else
          otm.set(value);

        ref.set(REF_OTM[i], bits);
        log.info("[T1 {}/{}] K={} otm={} ref={}", i + 1, STRIKES.length, STRIKES[i], otm, ref);
        assertEquals("K=" + STRIKES[i], ref.toString(), otm.toString());
      }
    }
  }

  /**
   * Strike grid from arxiv:2508.15080v3 Table 12 (implied volatilities,
   * maturity T=1/12).
   */
  private static final String[] STRIKES_T2 =
  { "0.8", "0.85", "0.9", "0.95", "1.0", "1.05", "1.1", "1.15" };

  /**
   * Benchmark Black–Scholes implied volatilities from arxiv:2508.15080v3
   * (June 2026 revision) Table 12, row "BB" (the paper's benchmark), maturity
   * T=1/12, parameters (5.1) — identical to the (1.3) set of the earlier
   * versions. Published to 4 decimals.
   *
   * <h2>Why implied vols, and why v3</h2>
   *
   * The v1/v2 preprints tabulated OTM <em>prices</em> for this strike grid
   * (their Table 2, caption maturity T=1/52) whose own "RE" row admitted up to
   * 88 % disagreement between the paper's SINH-CB and Adams computations in
   * the wings — the numerical-error phenomenon ("ghost calibration") the paper
   * itself is about. The June 2026 v3 revision replaced that table with the
   * implied-volatility benchmark below. The Edgeworth price reproduces every
   * BB entry to all four published decimals; the superseded v2 wing prices
   * correspond to a spurious smile (e.g. 25.0 % at K=0.8 against the correct
   * 22.8 %) and are matched by neither v3 nor this expansion.
   */
  private static final String[] REF_IV_T2  =
  { "0.2280", "0.2226", "0.2173", "0.2123",
    "0.2075", "0.2030", "0.1986", "0.1945" };

  /**
   * The Edgeworth call price at bits=512 reproduces every arxiv:2508.15080v3
   * Table 12 "BB" benchmark implied volatility at T=1/12 exactly.
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
      T.set(1).div(12, bits, T);                 // T = 1/12, per Table 12
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

    try ( RoughHestonEdgeworthCallPrice price = new RoughHestonEdgeworthCallPrice(ctx,
                                                                                  strike,
                                                                                  ComplexConstants.zero);
          Real value = new Real(); Real K = new Real(); Real otm = new Real(); Real ref = new Real())
    {
      long t0 = System.nanoTime();
      for (int i = 0; i < STRIKES_T2.length; i++)
      {
        K.set(STRIKES_T2[i], bits);
        log.info("[T2 {}/{}] pricing K={} elapsed={}s", i + 1, STRIKES_T2.length, STRIKES_T2[i], (System.nanoTime() - t0) / 1e9);
        price.call(K, bits, value);
        log.info("[T2 {}/{}] priced  K={} elapsed={}s", i + 1, STRIKES_T2.length, STRIKES_T2[i], (System.nanoTime() - t0) / 1e9);

        if (i < 4)
        {
          value.sub(1, bits, otm);
          otm.add(K, bits, otm);
        }
        else
          otm.set(value);

        ref.set(REF_IV_T2[i], bits);
        log.info("[T2 {}/{}] K={} otm={} ref={}", i + 1, STRIKES_T2.length, STRIKES_T2[i], otm, ref);
        assertEquals("K=" + STRIKES_T2[i], ref.toString(), otm.toString());
      }
    }
  }
}
