package arb.stochastic.processes.heston;

import java.util.ArrayList;
import java.util.List;

import arb.Real;
import arb.RealMatrix;
import arb.stochastic.processes.heston.RoughHestonCalibrator.Option;
import arb.stochastic.processes.heston.RoughHestonCalibrator.Result;

public class CalibProfile
{
  static final int bits = 128;

  public static void main(String[] args)
  {
    final int    NU   = RoughHestonCalibrator.NU, R = RoughHestonCalibrator.RHO;
    int[]        free = { NU, R };

    List<Option> grid = new ArrayList<>();
    for (String Ts : new String[] { "0.5", "1.0" })
    {
      for (String Ks : new String[] { "0.9", "1.0", "1.1" })
      {
        grid.add(new Option(new Real(Ts, bits), new Real(Ks, bits), !Ks.equals("1.1"), new Real(), new Real("1", bits)));
      }
    }

    Real truth = Real.newVector(6);
    set(truth, "0.1", "0.3", "0.4", "0.09", "-0.6", "0.6");

    RealMatrix market = RealMatrix.newMatrix(grid.size(), 1);
    try (RoughHestonCalibrator gen = new RoughHestonCalibrator(grid, free, truth, bits))
    {
      gen.priceAll(truth, market);
    }
    List<Option> quotes = new ArrayList<>();
    for (int i = 0; i < grid.size(); i++)
    {
      Option o = grid.get(i);
      Real   p = new Real();
      p.set(market.get(i, 0));
      quotes.add(new Option(o.T, o.K, o.call, p, new Real("1", bits)));
    }

    Real init = Real.newVector(6);
    set(init, "0.1", "0.3", "0.25", "0.09", "-0.30", "0.6");

    System.out.println("Starting calibration...");
    long t0 = System.nanoTime();
    try (RoughHestonCalibrator cal = new RoughHestonCalibrator(quotes, free, init, bits))
    {
      Result res = cal.calibrate();
      long t1 = System.nanoTime();
      System.out.println("converged=" + res.converged + " time=" + ((t1 - t0) / 1_000_000) + "ms");
    }
  }

  private static void set(Real v, String... vals)
  {
    for (int i = 0; i < vals.length; i++)
      v.get(i).set(new Real(vals[i], bits));
  }
}
