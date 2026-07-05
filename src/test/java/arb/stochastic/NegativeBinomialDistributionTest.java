package arb.stochastic;

import java.util.Random;

import arb.Real;
import arb.RealMatrix;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Component tests for the negative-binomial distribution and its
 * maximum-likelihood calibration. Each derivative produced by the expression
 * compiler is checked against its closed form, and parameter recovery is
 * validated from the method-of-moments initial guess with the Newton–Kantorovich
 * iteration, against the 95% Wald interval from the observed-information inverse.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public class NegativeBinomialDistributionTest extends
                                              TestCase
{
  private static final int    BITS  = 256;
  private static final double Z_975 = 1.959963984540054;

  private static boolean tiny(Real a, Real b)
  {
    try ( Real d = new Real(); Real threshold = new Real().one().mul2e(-100))
    {
      a.sub(b, BITS, d).abs(BITS, d);
      return d.compareTo(threshold) < 0;
    }
  }

  public void testParametersRoundTrip()
  {
    try ( NegativeBinomialDistribution d = new NegativeBinomialDistribution(5.0, 0.5);
          Real θ = Real.newVector(new double[] { 3.25, 0.4 }))
    {
      d.setParameters(θ);
      assertTrue(tiny(d.parameters().get(0), θ.get(0)));
      assertTrue(tiny(d.parameters().get(1), θ.get(1)));
    }
  }

  public void testDomain()
  {
    try ( NegativeBinomialDistribution d = new NegativeBinomialDistribution(5.0, 0.5))
    {
      assertTrue(d.isInDomain(Real.newVector(new double[] { 5.0, 0.5 })));
      assertFalse(d.isInDomain(Real.newVector(new double[] { 0.0, 0.5 })));
      assertFalse(d.isInDomain(Real.newVector(new double[] { -1.0, 0.5 })));
      assertFalse(d.isInDomain(Real.newVector(new double[] { 5.0, 0.0 })));
      assertFalse(d.isInDomain(Real.newVector(new double[] { 5.0, 1.0 })));
    }
  }

  public void testDensityIsPositiveOnItsSupport()
  {
    try ( NegativeBinomialDistribution d = new NegativeBinomialDistribution(4.5, 0.5);
          Real x = new Real(); Real y = new Real())
    {
      for (double probe : new double[] { 0.0, 0.5, 1.0, 2.0, 3.7, 7.5, 15.25 })
      {
        x.set(probe);
        d.densityFunction().evaluate(x, 1, BITS, y);
        assertTrue("f(" + probe + ")>0", y.sign() > 0);
      }
    }
  }

  public void testLogDensityEqualsLogOfDensity()
  {
    try ( NegativeBinomialDistribution d = new NegativeBinomialDistribution(4.5, 0.5);
          Real x = new Real(); Real f = new Real(); Real logf = new Real(); Real ℓ = new Real())
    {
      for (double probe : new double[] { 0.0, 1.0, 2.5, 6.0, 12.0 })
      {
        x.set(probe);
        d.densityFunction().evaluate(x, 1, BITS, f);
        f.log(BITS, logf);
        d.logDensityFunction().evaluate(x, 1, BITS, ℓ);
        assertTrue("ln f(" + probe + ")", tiny(logf, ℓ));
      }
    }
  }

  public void testDensityIsIncrementOfDistributionFunction()
  {
    // A discrete law: the mass f(k) is the increment F(k)−F(k−1) of the
    // distribution function, and F rises monotonically to 1.
    try ( NegativeBinomialDistribution d = new NegativeBinomialDistribution(4.5, 0.5);
          Real x = new Real(); Real mass = new Real(); Real Fk = new Real(); Real Fk1 = new Real();
          Real increment = new Real(); Real total = new Real())
    {
      RealFunction F = d.distributionFunction();
      for (int k = 0; k <= 8; k++)
      {
        x.set(k);
        F.evaluate(x, 1, BITS, Fk);
        x.set(k - 1);
        F.evaluate(x, 1, BITS, Fk1);
        x.set(k);
        d.densityFunction().evaluate(x, 1, BITS, mass);
        Fk.sub(Fk1, BITS, increment);
        assertTrue("f(" + k + ")=F(" + k + ")−F(" + (k - 1) + ")", tiny(mass, increment));
        assertTrue("F increasing at " + k, Fk.compareTo(Fk1) >= 0);
      }
      x.set(1000);
      F.evaluate(x, 1, BITS, total);
      assertTrue("F(1000)→1", tiny(total, new Real().one()));
    }
  }

  public void testScorePClosedForm()
  {
    // ∂ℓ/∂p = r/p − x/(1−p)
    try ( NegativeBinomialDistribution d = new NegativeBinomialDistribution(5.0, 0.5);
          Real x = new Real(); Real got = new Real(); Real want = new Real(); Real a = new Real(); Real b = new Real())
    {
      RealFunction sp = d.logDensityFunction().derivative("p");
      for (double probe : new double[] { 0.0, 1.0, 4.0, 9.0 })
      {
        x.set(probe);
        sp.evaluate(x, 1, BITS, got);
        new Real().set(5.0).div(new Real().set(0.5), BITS, a);
        x.div(new Real().set(0.5), BITS, b);
        a.sub(b, BITS, want);
        assertTrue("∂ℓ/∂p(" + probe + ")", tiny(got, want));
      }
    }
  }

  public void testScoreRClosedForm()
  {
    // ∂ℓ/∂r = ψ(x+r) − ψ(r) + ln p
    try ( NegativeBinomialDistribution d = new NegativeBinomialDistribution(5.0, 0.5);
          Real x = new Real(); Real got = new Real(); Real want = new Real();
          Real xr = new Real(); Real dxr = new Real(); Real dr = new Real(); Real lnp = new Real())
    {
      RealFunction sr = d.logDensityFunction().derivative("r");
      new Real().set(0.5).log(BITS, lnp);
      new Real().set(5.0).digamma(BITS, dr);
      for (double probe : new double[] { 0.0, 1.0, 4.0, 9.0 })
      {
        x.set(probe);
        sr.evaluate(x, 1, BITS, got);
        x.add(new Real().set(5.0), BITS, xr).digamma(BITS, dxr);
        dxr.sub(dr, BITS, want).add(lnp, BITS, want);
        assertTrue("∂ℓ/∂r(" + probe + ")", tiny(got, want));
      }
    }
  }

  public void testHessianRPClosedForm()
  {
    // ∂²ℓ/∂r∂p = 1/p
    try ( NegativeBinomialDistribution d = new NegativeBinomialDistribution(5.0, 0.5);
          Real x = new Real(); Real got = new Real(); Real want = new Real())
    {
      RealFunction srp = d.logDensityFunction().derivative("r").derivative("p");
      new Real().one().div(new Real().set(0.5), BITS, want);
      for (double probe : new double[] { 0.0, 2.0, 7.0 })
      {
        x.set(probe);
        srp.evaluate(x, 1, BITS, got);
        assertTrue("∂²ℓ/∂r∂p(" + probe + ")", tiny(got, want));
      }
    }
  }

  public void testHessianPPClosedForm()
  {
    // ∂²ℓ/∂p² = −r/p² − x/(1−p)²
    try ( NegativeBinomialDistribution d = new NegativeBinomialDistribution(5.0, 0.5);
          Real x = new Real(); Real got = new Real(); Real want = new Real();
          Real p2 = new Real(); Real q2 = new Real(); Real a = new Real(); Real b = new Real())
    {
      RealFunction spp = d.logDensityFunction().derivative("p").derivative("p");
      new Real().set(0.5).pow(2, BITS, p2);
      new Real().set(0.5).pow(2, BITS, q2);
      for (double probe : new double[] { 0.0, 3.0, 8.0 })
      {
        x.set(probe);
        spp.evaluate(x, 1, BITS, got);
        new Real().set(5.0).div(p2, BITS, a).neg(a);
        x.div(q2, BITS, b);
        a.sub(b, BITS, want);
        assertTrue("∂²ℓ/∂p²(" + probe + ")", tiny(got, want));
      }
    }
  }

  public void testTrigammaRecurrence()
  {
    // ψ₁ = digamma', and ψ₁(x+1) = ψ₁(x) − 1/x².
    try ( RealFunction ψ1 = RealFunction.express("digamma(x)").derivative("x");
          Real x = new Real(); Real at = new Real(); Real atPlus1 = new Real();
          Real want = new Real(); Real inv = new Real())
    {
      for (double probe : new double[] { 1.5, 3.0, 7.25 })
      {
        x.set(probe);
        ψ1.evaluate(x, 1, BITS, at);
        x.add(1, BITS, x);
        ψ1.evaluate(x, 1, BITS, atPlus1);
        x.sub(1, BITS, x);
        x.pow(2, BITS, inv);
        new Real().one().div(inv, BITS, inv);
        at.sub(inv, BITS, want);
        assertTrue("ψ₁(" + probe + "+1)=ψ₁−1/x²", tiny(atPlus1, want));
      }
    }
  }

  public void testGammaDerivativeRelations()
  {
    // lnΓ' = digamma.
    try ( RealFunction lnGammaPrime = RealFunction.express("ln(Γ(x))").derivative("x");
          RealFunction digamma = RealFunction.express("digamma(x)");
          Real x = new Real(); Real a = new Real(); Real b = new Real())
    {
      for (double probe : new double[] { 1.0, 2.5, 6.0 })
      {
        x.set(probe);
        lnGammaPrime.evaluate(x, 1, BITS, a);
        digamma.evaluate(x, 1, BITS, b);
        assertTrue("lnΓ'=ψ at " + probe, tiny(a, b));
      }
    }
  }

  public void testRecoversParametersFromMethodOfMomentsStart()
  {
    double trueShape = 5.0;
    double trueProbability = 0.5;
    int    sampleSize = 2000;
    Real   observations = sampleData(sampleSize, trueShape, trueProbability, 20260706L);

    try ( NegativeBinomialDistribution d = new NegativeBinomialDistribution(trueShape, trueProbability);
          Real initial = methodOfMomentsInitialGuess(observations))
    {
      int iterations = d.calibrate(observations, initial, 100, BITS);
      assertTrue("Newton–Kantorovich must converge from the moment start; iterations=" + iterations,
                 iterations >= 0);

      RealMatrix cov = d.parameterCovariance();
      double rHat = d.parameters().get(0).doubleValue();
      double pHat = d.parameters().get(1).doubleValue();
      double seR = Math.sqrt(cov.get(0, 0).doubleValue());
      double seP = Math.sqrt(cov.get(1, 1).doubleValue());

      assertTrue("r₀ in 95% Wald interval " + rHat + "±" + (Z_975 * seR),
                 Math.abs(rHat - trueShape) <= Z_975 * seR);
      assertTrue("p₀ in 95% Wald interval " + pHat + "±" + (Z_975 * seP),
                 Math.abs(pHat - trueProbability) <= Z_975 * seP);
    }
  }

  /** Paper's initial guess: p₀ = x̄/s², r₀ = x̄²/(s²−x̄). */
  private static Real methodOfMomentsInitialGuess(Real observations)
  {
    int m = observations.dim();
    Real θ = Real.newVector(2);
    try ( Real mean = new Real(); Real var = new Real(); Real d = new Real())
    {
      mean.zero();
      for (int i = 0; i < m; i++)
      {
        mean.add(observations.get(i), BITS, mean);
      }
      mean.div(m, BITS, mean);
      var.zero();
      for (int i = 0; i < m; i++)
      {
        observations.get(i).sub(mean, BITS, d);
        d.pow(2, BITS, d);
        var.add(d, BITS, var);
      }
      var.div(m - 1, BITS, var);
      mean.div(var, BITS, θ.get(1));                 // p₀ = x̄/s²
      mean.pow(2, BITS, d);
      Real denom = new Real();
      var.sub(mean, BITS, denom);
      d.div(denom, BITS, θ.get(0));                  // r₀ = x̄²/(s²−x̄)
      denom.close();
    }
    return θ;
  }

  private static Real sampleData(int sampleSize, double shape, double probability, long seed)
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
