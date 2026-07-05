package arb.applications;

import java.util.Arrays;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.stochastic.MaximumLikelihoodEstimation;
import arb.stochastic.NegativeBinomialDistribution;

/**
 * Command-line entry point that synthesizes negative-binomial data and runs the
 * compiler-based maximum-likelihood estimator from several starting points.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public class NegativeBinomialMleApplication
{
  private static final Logger log = LoggerFactory.getLogger(NegativeBinomialMleApplication.class);

  public static void main(String[] args) throws Exception
  {
    int sampleSize = args.length > 0 ? Integer.parseInt(args[0]) : 400;
    double trueShape = 5.0;
    double trueProbability = 0.35;

    double[] observations = sampleData(sampleSize, trueShape, trueProbability, 123456789L);

    try ( NegativeBinomialDistribution distribution = new NegativeBinomialDistribution(trueShape, trueProbability))
    {
      log.info("distribution: {}", distribution.getName());
      log.info("log-density expression: {}", distribution.logDensityExpression());
      log.info("cumulative expression: {}", distribution.cumulativeExpression());
      log.info("sample size: {}", observations.length);

      double[][] starts = {
                            { 2.0, 0.20 },
                            { 6.0, 0.50 },
                            { 1.5, 0.80 }
      };
      for (double[] start : starts)
      {
        MaximumLikelihoodEstimation.EstimateResult result = MaximumLikelihoodEstimation.estimate(distribution,
                                                                                                  observations,
                                                                                                  start,
                                                                                                  48,
                                                                                                  1e-8,
                                                                                                  256);
        log.info("start={} -> parameters={} iterations={} converged={} objective={} gradientNorm={}",
                 Arrays.toString(start),
                 Arrays.toString(result.parameters),
                 result.iterations,
                 result.converged,
                 result.objective,
                 result.gradientNorm);
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
}
