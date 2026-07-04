package arb.stochastic.processes.heston;

import java.util.ArrayList;
import java.util.List;

import arb.Real;
import arb.RealMatrix;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.stochastic.processes.heston.RoughHestonCalibration.Quote;
import arb.stochastic.processes.heston.RoughHestonCalibration.Result;
import junit.framework.TestCase;

/**
 * Parameter-reproduction test: price a multi-maturity, multi-strike, mixed
 * call/put quote set at known rough-Heston parameters, then check that
 * Levenberg–Marquardt — started from a perturbed guess — recovers the
 * originals to twelve digits within five iterations, in seconds. Everything is
 * {@link Real}; the trace shows each iteration so a run can never spin
 * silently.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class RoughHestonCalibrationTest extends
                                        TestCase
{
  static final int bits = 128;

  public void testReproducesKnownParameters()
  {
    final int   NU   = RoughHestonCalibration.NU, R = RoughHestonCalibration.RHO,
                V    = RoughHestonCalibration.V0;
    final int[] free =
    { NU, R, V };

    // quote set: 2 maturities × {0.95 put, 1.0 call, 1.05 call}
    List<Quote> grid = new ArrayList<>();
    for (String Ts : new String[]
    { "0.08333333333333333333333333333333333333", // 1/12, one month
      "0.5" }                                     // six months
    )
    {
      for (String Ks : new String[]
      { "0.9", "0.95", "1.0", "1.05", "1.1" })
      {
        grid.add(new Quote(new Real(Ts,
                                    bits),
                           new Real(Ks,
                                    bits),
                           Ks.compareTo("1") >= 0, // call for K≥1, put below
                           new Real(),
                           new Real("1",
                                    bits)));
      }
    }

    Real truth = Real.newVector(6); // λ θ ν V0 ρ μ — arxiv:1805.12587 §4.1
    set(truth, "0.1", "0.3156", "0.331", "0.0392", "-0.681", "0.62");

    long t0 = System.nanoTime();

    // generate the synthetic market prices at the true parameters
    RealMatrix market = RealMatrix.newMatrix(grid.size(), 1);
    try ( RoughHestonCalibration gen = new RoughHestonCalibration(grid,
                                                                  free,
                                                                  truth,
                                                                  bits))
    {
      System.out.println("[CAL] pricing market grid of " + grid.size() + " quotes");
      gen.priceAll(truth, market);
      System.out.printf("[CAL] market grid priced, elapsed=%.1fs%n", (System.nanoTime() - t0) / 1e9);
    }
    List<Quote> quotes = new ArrayList<>();
    for (int i = 0; i < grid.size(); i++)
    {
      Quote q = grid.get(i);
      Real  p = new Real();
      p.set(market.get(i, 0));
      quotes.add(new Quote(q.T,
                           q.K,
                           q.call,
                           p,
                           new Real("1",
                                    bits)));
      System.out.println("MARKET T=" + q.T + " K=" + q.K + " " + (q.call ? "C" : "P") + " price=" + p);
    }

    // start away from the truth — perturbed within the quadratic basin, as any
    // warm-started calibration is — and recover ν, ρ, V₀
    Real init = Real.newVector(6);
    set(init, "0.1", "0.3156", "0.35", "0.041", "-0.65", "0.62");

    try ( RoughHestonCalibration cal = new RoughHestonCalibration(quotes,
                                                                  free,
                                                                  init,
                                                                  bits))
    {
      System.out.println("[CAL] calibrating (per-iteration trace follows)");
      Result res     = cal.calibrate();
      double elapsed = (System.nanoTime() - t0) / 1e9;
      System.out.printf("RECOVERED ν=%s ρ=%s V0=%s iters=%d elapsed=%.1fs%n",
                        res.params.get(NU),
                        res.params.get(R),
                        res.params.get(V),
                        res.iterations,
                        elapsed);
      assertTrue("calibration must converge", res.converged);
      assertTrue("must converge within 5 iterations, took " + res.iterations, res.iterations <= 5);
      assertClose("ν", res.params.get(NU), "0.331");
      assertClose("ρ", res.params.get(R), "-0.681");
      assertClose("V0", res.params.get(V), "0.0392");
      assertTrue("must finish in seconds, took " + elapsed + "s", elapsed < 60.0);
    }
  }

  /** |actual − expected| < 1e-12: twelve-digit parameter reproduction. */
  private static void assertClose(String name, Real actual, String expected)
  {
    try ( Real ref = new Real(expected,
                              bits);
          Real diff = new Real(); Real tol = new Real("1e-12",
                                                      bits))
    {
      actual.sub(ref, bits, diff);
      diff.abs();
      assertTrue(name + "=" + actual + " must equal " + expected + " to twelve digits; |Δ|=" + diff,
                 diff.compareTo(tol) < 0);
    }
  }

  private static void set(Real v6, String... vals)
  {
    for (int k = 0; k < vals.length; k++)
      v6.get(k).set(vals[k], bits);
  }
}
