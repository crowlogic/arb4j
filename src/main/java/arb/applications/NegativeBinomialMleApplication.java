package arb.applications;

import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.stochastic.NegativeBinomialDistribution;

/**
 * Command-line entry point that synthesizes negative-binomial data and calibrates
 * the distribution by maximum likelihood from several starting points.
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
    int bits = 256;

    Real observations = sampleData(sampleSize, trueShape, trueProbability, 123456789L, bits);

    try ( NegativeBinomialDistribution distribution = new NegativeBinomialDistribution(trueShape, trueProbability))
    {
      log.info("distribution: {}", distribution.getName());
      log.info("log-density expression: {}", distribution.logDensityExpression());
      log.info("cumulative expression: {}", distribution.cumulativeExpression());
      log.info("sample size: {}", observations.dim());

      double[][] starts = {
                            { 2.0, 0.20 },
                            { 6.0, 0.50 },
                            { 1.5, 0.80 }
      };
      for (double[] start : starts)
      {
        try ( Real initial = Real.newVector(start))
        {
          int iterations = distribution.calibrate(observations, initial, 200, bits);
          log.info("start=[{}, {}] -> r={} p={} iterations={}",
                   start[0],
                   start[1],
                   distribution.shape(),
                   distribution.successProbability(),
                   iterations);
        }
      }
    }
  }

  private static Real sampleData(int sampleSize, double shape, double probability, long seed, int bits)
  {
    int effectiveShape = Math.max(1, (int) Math.round(shape));
    Real observations = Real.newVector(sampleSize);
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
      observations.get(i).set(failures);
    }
    return observations;
  }
}
