package bonanzai.options.vix;

import java.util.ArrayList;
import java.util.List;

import arb.Real;
import arb.RealMatrix;
import arb.applications.options.RoughHestonCalibrator;
import arb.applications.options.RoughHestonCalibrator.Option;
import arb.applications.options.RoughHestonCalibrator.Result;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * Synthetic-recovery test: price a multi-maturity, multi-strike, mixed call/put
 * set at known parameters, then check that Levenberg–Marquardt — started from a
 * perturbed guess — recovers them. Everything is {@link Real}; the trace shows
 * each iteration so a run can never spin silently.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class RoughHestonCalibratorTest extends
                                       TestCase
{
  static final int bits = 128;

  public void testRecoversKnownParameters()
  {
    final int    NU   = RoughHestonCalibrator.NU, R = RoughHestonCalibrator.RHO;
    int[]        free =
    { NU, R };

    // option set: 2 maturities × {0.9 call, 1.0 call, 1.1 put}
    List<Option> grid = new ArrayList<>();
    for (String Ts : new String[]
    { "0.5", "1.0" })
    {
      for (String Ks : new String[]
      { "0.9", "1.0", "1.1" })
      {
        grid.add(new Option(new Real(Ts,
                                     bits),
                            new Real(Ks,
                                     bits),
                            !Ks.equals("1.1"),
                            new Real(),
                            new Real("1",
                                     bits)));
      }
    }

    Real truth = Real.newVector(6); // λ θ ν V0 ρ μ
    set(truth, "0.1", "0.3", "0.4", "0.09", "-0.6", "0.6");

    // generate the synthetic market prices at the true parameters
    RealMatrix market = RealMatrix.newMatrix(grid.size(), 1);
    try ( RoughHestonCalibrator gen = new RoughHestonCalibrator(grid,
                                                                free,
                                                                truth,
                                                                bits))
    {
      System.out.println("[CAL] pricing market grid of " + grid.size() + " quotes");
      gen.priceAll(truth, market);
      System.out.println("[CAL] market grid priced");
    }
    List<Option> quotes = new ArrayList<>();
    for (int i = 0; i < grid.size(); i++)
    {
      Option o = grid.get(i);
      Real   p = new Real();
      p.set(market.get(i, 0));
      quotes.add(new Option(o.T,
                            o.K,
                            o.call,
                            p,
                            new Real("1",
                                     bits)));
      System.out.println("MARKET T=" + o.T + " K=" + o.K + " " + (o.call ? "C" : "P") + " price=" + p);
    }

    // start away from the truth and recover ν, ρ, V₀ (λ θ ν V0 ρ μ)
    Real init = Real.newVector(6);
    set(init, "0.1", "0.3", "0.25", "0.09", "-0.30", "0.6");

    try ( RoughHestonCalibrator cal = new RoughHestonCalibrator(quotes,
                                                                free,
                                                                init,
                                                                bits))
    {
      System.out.println("[CAL] calibrating (per-iteration trace follows)");
      Result res = cal.calibrate();
      System.out.println("RECOVERED ν=" + res.params.get(NU) + " ρ=" + res.params.get(R));
      assertTrue("calibration must converge", res.converged);
      assertClose("ν", res.params.get(NU), "0.4");
      assertClose("ρ", res.params.get(R), "-0.6");
    }
  }

  private static void set(Real v, String... vals)
  {
    for (int i = 0; i < vals.length; i++)
      v.get(i)
       .set(new Real(vals[i],
                     bits));
  }

  private static void assertClose(String name, Real got, String want)
  {
    try ( Real w = new Real(want,
                            bits);
          Real d = new Real(); Real tol = new Real("1e-3",
                                                   bits))
    {
      got.sub(w, bits, d);
      d.abs();
      assertTrue(name + " recovered: got " + got + " want " + want + " |Δ|=" + d, d.compareTo(tol) < 0);
    }
  }
}
