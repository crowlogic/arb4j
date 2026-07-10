package arb.stochastic;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.RandomState;
import arb.Real;
import arb.stochastic.NegativeBinomialMaximumLikelihoodEstimation.Result;
import junit.framework.TestCase;

/**
 * Tests of {@link NegativeBinomialMaximumLikelihoodEstimation}: a sample set
 * is drawn from NB(r=4, p=0.35), the Levenberg–Marquardt iteration is run
 * from a handful of different starting points, and each run is checked for
 * convergence, its iteration count, agreement between the starting points,
 * and the profile identity p̂ = N·r̂/(N·r̂ + Σᵢ yᵢ) of Crowley,
 * <i>Maximum Likelihood Estimation of the Negative Binomial Distribution</i>,
 * vixra 1211.0113 (2012), eq. (8).
 *
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class NegativeBinomialMaximumLikelihoodEstimationTest extends
                                                             TestCase
{

  private static final Logger log  = LoggerFactory.getLogger(NegativeBinomialMaximumLikelihoodEstimationTest.class);

  static final int            bits = 128;

  @Test
  public void testEstimationFromSeveralStartingPoints() throws Exception
  {
    int N = 250;
    try ( NegativeBinomialDistribution nb = new NegativeBinomialDistribution(new Real("4",
                                                                                      bits),
                                                                             new Real("0.35",
                                                                                      bits),
                                                                             bits);
          Real samples = Real.newVector(N); RandomState state = new RandomState(); Real sum = new Real())
    {
      state.initialize().seed(7L);
      nb.sample(state, bits, samples, N);
      for (int i = 0; i < N; i++)
      {
        sum.add(samples.get(i), bits, sum);
      }

      try ( NegativeBinomialMaximumLikelihoodEstimation mle = new NegativeBinomialMaximumLikelihoodEstimation(nb,
                                                                                                              samples,
                                                                                                              N,
                                                                                                              bits))
      {
        String[][] startingPoints =
        {
          { "1", "0.5" },
          { "2", "0.2" },
          { "8", "0.7" },
          { "0.5", "0.9" } };
        Real   firstR = new Real(bits);
        Real   firstP = new Real(bits);
        try
        {
          for (int s = 0; s < startingPoints.length; s++)
          {
            String[] start = startingPoints[s];
            try ( Real r0 = new Real(start[0],
                                     bits);
                  Real p0 = new Real(start[1],
                                     bits);
                  Result result = mle.estimate(r0, p0))
            {
              if (log.isDebugEnabled())
              {
                log.debug("from (r₀={}, p₀={}): {}", start[0], start[1], result);
              }
              assertTrue("converged from (" + start[0] + "," + start[1] + ")", result.converged);
              assertTrue("iterations " + result.iterations + " within bound from (" + start[0] + "," + start[1] + ")",
                         result.iterations <= 100);
              assertTrue("r̂ > 0", result.r.sign() > 0);
              assertTrue("p̂ ∈ (0,1)", result.p.sign() > 0 && result.p.doubleValue() < 1);

              // profile identity, eq. (8): p̂ = N·r̂/(N·r̂ + Σ yᵢ)
              try ( Real numerator = new Real(); Real denominator = new Real(); Real profile = new Real())
              {
                result.r.mul(N, bits, numerator);
                numerator.add(sum, bits, denominator);
                numerator.div(denominator, bits, profile);
                assertEquals("p̂ satisfies the profile identity from (" + start[0] + "," + start[1] + ")",
                             profile.doubleValue(),
                             result.p.doubleValue(),
                             1e-9);
              }

              // every starting point reaches the same estimates
              if (s == 0)
              {
                firstR.set(result.r);
                firstP.set(result.p);
              }
              else
              {
                assertEquals("r̂ agrees between starting points", firstR.doubleValue(), result.r.doubleValue(), 1e-8);
                assertEquals("p̂ agrees between starting points", firstP.doubleValue(), result.p.doubleValue(), 1e-8);
              }

              // the estimates land near the generating parameters
              assertEquals("r̂ near 4", 4.0, result.r.doubleValue(), 1.5);
              assertEquals("p̂ near 0.35", 0.35, result.p.doubleValue(), 0.12);
            }
          }
        }
        finally
        {
          firstR.close();
          firstP.close();
        }
      }
    }
  }

}
