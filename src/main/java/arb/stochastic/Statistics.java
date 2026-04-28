package arb.stochastic;

import java.util.Arrays;

import arb.Real;
import arb.functions.real.RealFunction;

public class Statistics
{

  /**
   * TODO: replace with {@link Real#structure(int, int, Real)} which is a
   * collection of {@link Real#gammaVariance(int, int, Real)}s evaluatedat the
   * given times (evenly spaced).
   * 
   * 
   * Need to add varianceStructureFunction function to {@link RealFunction} which
   * will accept an interval of which to quantize before calculating the
   * associated {@link Real#structure(int, int)} of it
   * 
   * @param x
   * @param maxLagSteps
   * @return
   */
  public static double[] autocorr(double[] x, int maxLagSteps)
  {
    int    n   = x.length;

    double var = Statistics.variance(x);

    if (var < 1e-10)
    {
      return new double[maxLagSteps];
    }

    double[] acorr = new double[maxLagSteps];
    for (int k = 0; k < maxLagSteps; k++)
    {
      if (k == 0)
      {
        acorr[k] = 1.0;
      }
      else if (n - k > 0)
      {
        double cov = 0.0;
        for (int i = 0; i < n - k; i++)
        {
          cov += x[i] * x[i + k];
        }
        acorr[k] = (cov / (n - k)) / var;
      }
    }
    return acorr;
  }

  /**
   * TODO: Replace with {@link Real#variance(int, Real)}
   * 
   * @param x
   * @return
   */
  public static double variance(double[] x)
  {
    return Arrays.stream(x).map(y -> y * y).average().getAsDouble();
  }

}
