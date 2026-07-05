package arb.stochastic;

import java.util.Arrays;
import java.util.Random;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Regression tests for the compiler-built negative-binomial maximum-likelihood
 * workflow, focussed on VALIDATING PARAMETER RECOVERY: synthetic samples are
 * drawn from a known (r, p), and the compiled Levenberg–Marquardt MLE is
 * required to recover those parameters from several distinct initial guesses.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public class NegativeBinomialDistributionTest extends
                                              TestCase
{
  public void testDensityIsPositiveOnItsSupport()
  {
    try ( NegativeBinomialDistribution distribution = new NegativeBinomialDistribution(4.5, 0.35);
          Real x = new Real(); Real output = new Real())
    {
      RealFunction density = distribution.densityFunction();
      double[] probes = { 0.0, 0.5, 1.0, 2.0, 3.7, 7.5, 15.25 };
      for (double probe : probes)
      {
        x.set(probe);
        density.evaluate(x, 1, 128, output);
        assertTrue("density at x=" + probe + " must be positive; got " + output.doubleValue(),
                   output.doubleValue() > 0.0);
      }
    }
  }

  public void testLogDensityMatchesLogOfDensity()
  {
    try ( NegativeBinomialDistribution distribution = new NegativeBinomialDistribution(4.5, 0.35);
          Real x = new Real(); Real density = new Real(); Real logDensity = new Real())
    {
      double[] probes = { 0.0, 1.0, 2.5, 6.0, 12.0 };
      for (double probe : probes)
      {
        x.set(probe);
        distribution.densityFunction().evaluate(x, 1, 128, density);
        distribution.logDensityFunction().evaluate(x, 1, 128, logDensity);
        assertEquals("ln(density) at x=" + probe,
                     Math.log(density.doubleValue()),
                     logDensity.doubleValue(),
                     1e-12);
      }
    }
  }

  public void testMaximumLikelihoodRecoversParametersFromSyntheticData()
  {
    double trueShape = 5.0;
    double trueProbability = 0.35;
    double[] observations = sampleData(1500, trueShape, trueProbability, 777L);
    double sampleMean = mean(observations);
    double sampleVariance = variance(observations, sampleMean);
    double expectedMean = trueShape * (1.0 - trueProbability) / trueProbability;
    double expectedVariance = expectedMean / trueProbability;
    assertEquals("synthetic sample mean must approximate theoretical mean",
                 expectedMean, sampleMean, expectedMean * 0.10);
    assertEquals("synthetic sample variance must approximate theoretical variance",
                 expectedVariance, sampleVariance, expectedVariance * 0.20);

    try ( NegativeBinomialDistribution distribution = new NegativeBinomialDistribution(trueShape, trueProbability))
    {
      double[][] starts = {
                            { 2.0, 0.20 },
                            { 6.0, 0.50 },
                            { 1.5, 0.80 },
                            { 10.0, 0.10 }
      };

      for (double[] start : starts)
      {
        MaximumLikelihoodEstimation.EstimateResult result = MaximumLikelihoodEstimation.estimate(distribution,
                                                                                                  observations,
                                                                                                  start,
                                                                                                  200,
                                                                                                  1e-6,
                                                                                                  256);
        assertTrue("expected convergence from start " + Arrays.toString(start)
                   + " (iterations=" + result.iterations + ", gradient=" + result.gradientNorm + ")",
                   result.converged);
        double rHat = result.parameters[0];
        double pHat = result.parameters[1];
        double meanHat = rHat * (1.0 - pHat) / pHat;
        assertEquals("recovered mean from start " + Arrays.toString(start),
                     sampleMean, meanHat, sampleMean * 0.02);
        assertTrue("recovered shape r from start " + Arrays.toString(start)
                   + " (rHat=" + rHat + ")",
                   Math.abs(rHat - trueShape) < 1.5);
        assertTrue("recovered probability p from start " + Arrays.toString(start)
                   + " (pHat=" + pHat + ")",
                   Math.abs(pHat - trueProbability) < 0.10);
      }
    }
  }

  private static double[] sampleData(int sampleSize, double shape, double probability, long seed)
  {
    int effectiveShape = Math.max(1, (int) Math.round(shape));
    double[] observations = new double[sampleSize];
    Random random = new Random(seed);
    for (int i = 0; i < sampleSize; i++)
    {
      int failures = 0;
      int successes = 0;
      while (successes < effectiveShape)
      {
        if (random.nextDouble() < probability)
        {
          successes++;
        }
        else
        {
          failures++;
        }
      }
      observations[i] = failures;
    }
    return observations;
  }

  private static double mean(double[] values)
  {
    double sum = 0.0;
    for (double value : values)
    {
      sum += value;
    }
    return sum / values.length;
  }

  private static double variance(double[] values, double mean)
  {
    double sum = 0.0;
    for (double value : values)
    {
      double delta = value - mean;
      sum += delta * delta;
    }
    return sum / (values.length - 1);
  }
}
