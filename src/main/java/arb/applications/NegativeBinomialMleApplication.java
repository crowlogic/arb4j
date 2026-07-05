package arb.applications;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Real;
import arb.RealMatrix;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.stochastic.NegativeBinomialDistribution;

/**
 * Command-line entry point that draws an exact-inversion negative-binomial
 * sample and calibrates the distribution by maximum likelihood
 * (Levenberg–Marquardt on the exact compiler-built score and observed
 * information) from several starting points.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public class NegativeBinomialMleApplication
{
  private static final Logger log = LoggerFactory.getLogger(NegativeBinomialMleApplication.class);

  public static void main(String[] args) throws Exception
  {
    int sampleSize = args.length > 0 ? Integer.parseInt(args[0]) : 2000;
    double trueShape = args.length > 1 ? Double.parseDouble(args[1]) : 4.75;
    double trueProbability = args.length > 2 ? Double.parseDouble(args[2]) : 0.5;
    int bits = 256;

    try ( NegativeBinomialDistribution distribution = new NegativeBinomialDistribution(trueShape, trueProbability))
    {
      log.info("distribution: {}", distribution.getName());
      log.info("density expression: {}", distribution.densityExpression());
      log.info("log-density expression: {}", distribution.logDensityExpression());
      log.info("distribution-function expression: {}", distribution.cumulativeExpression());
      log.info("true parameters: r={} p={}", trueShape, trueProbability);

      Real observations = distribution.sample(sampleSize, 123456789L, bits);
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
          RealMatrix covariance = distribution.parameterCovariance();
          log.info("start=[{}, {}] -> r̂={} p̂={} iterations={} var(r̂)={} var(p̂)={}",
                   start[0],
                   start[1],
                   distribution.parameters().get(0),
                   distribution.parameters().get(1),
                   iterations,
                   covariance.get(0, 0),
                   covariance.get(1, 1));
        }
      }
      observations.close();
    }
  }
}
