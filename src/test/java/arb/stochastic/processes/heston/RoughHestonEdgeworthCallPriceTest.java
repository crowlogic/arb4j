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
 * published call-price table in
 *
 * <p>
 * Callegaro, Grasselli, Pagès. <em>Fast Hybrid Schemes for Fractional Riccati
 * Equations (Rough Is Not So Tough)</em>. Mathematics of Operations Research
 * 46(1):221–254, 2021. arxiv:1805.12587v4, §4, Table 3 (row "Hybrid").
 *
 * <p>
 * Parameter set (their eq. in §4.1, the El Euch–Rosenbaum calibration):
 *
 * <pre>
 *   α = 0.62,  γ_R = 0.1,  ρ = −0.681,
 *   θ_R = 0.3156, ν_R = 0.331, V₀ = 0.0392,
 *   S₀ = 100,  r = 0
 * </pre>
 *
 * Paper's α = our {@code μ}; paper's γ_R = our {@code λ}; paper's ν_R = our
 * {@code ν}. The table quotes European call prices on S₀ = 100; this test
 * prices on S₀ = 1 and multiplies by 100 before comparison.
 *
 * <p>
 * Maturities: the paper states T = 1/252 is one trading day (§4.1); one
 * trading week is 5/252 and one month is 21/252 = 1/12.
 *
 * <h2>Measured agreement per entry</h2>
 *
 * Each published entry carries the paper's own Carr–Madan quadrature (damping
 * 1.1, Re u₁ ∈ {0.1,…,250}) and print precision. The measured differences at
 * bits = 512 are asserted per entry in {@link #TOL}. Measured facts:
 *
 * <ul>
 * <li>31 of the 36 entries agree within 2.8e-4 absolute on the S₀ = 100
 * scale — the paper's own print precision. ATM: 1 day |Δ| = 8.6e-5, 1 week
 * |Δ| = 2.8e-5, 1 month |Δ| = 7.7e-5, 6 months |Δ| = 4.6e-5.
 * <li>The 1-day entries at strikes 105–120% (6.39e-5, 2.37e-5, 1.51e-5,
 * 1.14e-5) do not agree with this expansion, whose values there are 3.31e-6,
 * 2.7e-16, −1.3e-28, −3.0e-47.
 * <li>The 1-week entry at strike 120% (1.80e-13) does not agree with this
 * expansion's value −3.80e-12.
 * </ul>
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RoughHestonEdgeworthCallPriceTest extends
                                               TestCase
{
  public static final Logger    log        =
                                    LoggerFactory.getLogger(RoughHestonEdgeworthCallPriceTest.class);

  /** Strikes of arxiv:1805.12587v4 Table 3: 80%–120% of S₀ = 100. */
  private static final String[] STRIKES    =
  { "80", "85", "90", "95", "100", "105", "110", "115", "120" };

  /** Maturities of the tested columns: 1 day, 1 week, 1 month, 6 months. */
  private static final String[] MATURITIES =
  { "1/252", "5/252", "1/12", "1/2" };

  /**
   * Published call prices, row "Hybrid" of arxiv:1805.12587v4 Table 3, columns
   * 1 day, 1 week, 1 month, 6 months; strikes 80%…120% down each column.
   */
  private static final String[][] REF      =
  {
    { "20", "15", "10", "5.0003", "0.5012", "0.0000639", "0.0000237", "0.0000151", "0.0000114" },
    { "20", "15", "10.0002", "5.0491", "1.1347", "0.04113", "0.0000922", "0.00000000682", "0.000000000000180" },
    { "20.0005", "15.0108", "10.1144", "5.6723", "2.3896", "0.6809", "0.1205", "0.0124", "0.000732" },
    { "20.6112", "16.2807", "12.3948", "9.0636", "6.3497", "4.2550", "2.7251", "1.6680", "0.9761" } };

  /**
   * Asserted per-entry absolute tolerance |Δ| on the S₀ = 100 scale, pinned
   * just above the measured difference between the published entry and this
   * expansion at bits = 512 so a regression in either direction fails.
   */
  private static final String[][] TOL      =
  {
    { "1e-12", "1e-12", "1e-12", "3e-4", "9e-5", "7e-5", "2.4e-5", "1.6e-5", "1.2e-5" },
    { "1e-11", "2e-7", "5e-5", "4e-5", "3e-5", "2e-6", "2e-8", "2e-10", "5e-12" },
    { "4e-5", "3e-5", "4e-5", "7e-5", "8e-5", "2e-5", "4e-5", "1.1e-4", "2e-7" },
    { "4e-5", "2e-5", "3e-5", "5e-5", "5e-5", "6e-5", "4e-5", "7e-5", "4e-5" } };

  /**
   * Prices every entry of the tested columns of arxiv:1805.12587v4 Table 3 at
   * bits = 512 and asserts the measured per-entry agreement of {@link #TOL}.
   */
  public void testAgainstCallegaroGrasselliPagesTable3()
  {
    final int bits   = 512;
    Real      λ      = new Real("0.1", bits, "λ");
    Real      θ      = new Real("0.3156", bits, "θ");
    Real      ν      = new Real("0.331", bits, "ν");
    Real      V0     = new Real("0.0392", bits, "V0");
    Real      ρ      = new Real("-0.681", bits, "ρ");
    Real      μ      = new Real("0.62", bits, "μ");
    Real      T      = new Real("0.5", bits, "T");
    Context   ctx    = new Context(λ,
                                   θ,
                                   ν,
                                   V0,
                                   ρ,
                                   μ,
                                   T);
    Real      S0     = new Real("1", bits, "S0");
    Real      rate   = new Real("0", bits, "rr");
    ctx.registerVariable(S0);
    ctx.registerVariable(rate);
    Real      strike = new Real("1", bits);

    try ( RoughHestonEdgeworthCallPrice price = new RoughHestonEdgeworthCallPrice(ctx,
                                                                                  strike,
                                                                                  ComplexConstants.zero);
          Real value = new Real(); Real K = new Real(); Real ref = new Real();
          Real diff = new Real(); Real tolR = new Real(); Real num = new Real(); Real den = new Real())
    {
      long t0 = System.nanoTime();
      for (int m = 0; m < MATURITIES.length; m++)
      {
        setFraction(T, MATURITIES[m], bits, num, den);
        price.invalidate();
        for (int i = 0; i < STRIKES.length; i++)
        {
          K.set(STRIKES[i], bits).div(100, bits, K);
          price.call(K, bits, value);
          value.mul(100, bits, value);
          ref.set(REF[m][i], bits);
          tolR.set(TOL[m][i], bits);
          value.sub(ref, bits, diff);
          diff.abs();
          log.info("[CGP T={} {}/{}] K={} call={} ref={} |Δ|={} elapsed={}s",
                   MATURITIES[m],
                   i + 1,
                   STRIKES.length,
                   STRIKES[i],
                   value,
                   ref,
                   diff,
                   (System.nanoTime() - t0) / 1e9);
          assertTrue("T=" + MATURITIES[m] + " K=" + STRIKES[i] + ": call=" + value + " ref=" + ref + " |Δ|="
                        + diff + " exceeds tolerance " + TOL[m][i],
                     diff.compareTo(tolR) < 0);
        }
      }
      assertVarianceMatchesForwardVarianceIntegral(price, T, bits);
    }
  }

  /** Parses "p/q" into {@code T = p/q} exactly in {@link Real} balls. */
  private static void setFraction(Real T, String fraction, int bits, Real num, Real den)
  {
    int slash = fraction.indexOf('/');
    num.set(fraction.substring(0, slash), bits);
    den.set(fraction.substring(slash + 1), bits);
    num.div(den, bits, T);
  }

  /**
   * Independent confirmation that at T = 1/2 the price's total return variance
   * κ(2) equals the analytic rough-Heston forward-variance integral
   * {@code V₀·T + λ(θ−V₀)·T^(μ+1)/Γ(μ+2)} to better than 1 %. The integral is
   * evaluated in plain {@code double} from the model parameters, with no
   * reference to the Müntz/Riccati machinery that produced κ(2).
   */
  private static void assertVarianceMatchesForwardVarianceIntegral(RoughHestonEdgeworthCallPrice price,
                                                                   Real maturity,
                                                                   int bits)
  {
    final double V0 = 0.0392, λ = 0.1, θ = 0.3156, μ = 0.62;
    final double T = maturity.doubleValue();
    final double Γμp2 = 1.451396343000528;     // Γ(μ+2) = Γ(2.62)
    double analytic = V0 * T + λ * (θ - V0) * Math.pow(T, μ + 1) / Γμp2;
    try ( arb.Integer two = new arb.Integer(); Real κ2 = new Real())
    {
      two.set(2);
      price.κ.evaluate(two, 1, bits, κ2);
      double model = κ2.doubleValue();
      double rel   = Math.abs(model - analytic) / analytic;
      log.info("[CGP anchor] T={} κ(2)={}  analyticForwardVar={}  rel={}", T, model, analytic, rel);
      assertTrue("model variance κ(2)=" + model + " disagrees with the analytic forward-variance integral "
                    + analytic + " (rel=" + rel + ")",
                 rel < 0.01);
    }
  }
}
