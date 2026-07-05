package arb.stochastic;

import org.junit.Test;

import arb.Complex;
import arb.RandomState;
import arb.arblib;
import arb.Real;
import arb.functions.Jacobian;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Tests of the {@link NegativeBinomialDistribution}: the compiled density and
 * log-density, the distribution function, the moments of Crowley,
 * <i>Maximum Likelihood Estimation of the Negative Binomial Distribution</i>,
 * vixra 1211.0113 (2012) eqs. (3)–(4), the symbolic score obtained from
 * {@link RealFunction#jacobian(String[])}, and reproducible sampling.
 *
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class NegativeBinomialDistributionTest extends
                                              TestCase
{

  static final int bits = 128;

  static NegativeBinomialDistribution newDistribution(String r, String p)
  {
    return new NegativeBinomialDistribution(new Real(r,
                                                     bits),
                                            new Real(p,
                                                     bits),
                                            bits);
  }

  /**
   * pnb(0|r,p) = pʳ and pnb(y+1) = pnb(y)·(1-p)·(r+y)/(y+1); check the
   * compiled density against the recursion at r=4, p=0.35 for y=0..20.
   */
  @Test
  public void testDensityMatchesRecursion()
  {
    try ( NegativeBinomialDistribution nb = newDistribution("4", "0.35"); Real y = new Real(); Real value = new Real();
          Real mass = new Real(); Real ratio = new Real(); Real factor = new Real())
    {
      nb.p.pow(nb.r, bits, mass);                    // pnb(0) = p^r
      new Real("1",
               bits).sub(nb.p, bits, ratio);         // 1-p
      for (int k = 0; k <= 20; k++)
      {
        y.set(k);
        nb.densityFunction().evaluate(y, 1, bits, value);
        assertTrue("pnb(" + k + ") = " + value + " must overlap recursion value " + mass,
                   value.overlaps(mass));
        factor.set(nb.r).add(k, bits, factor).mul(ratio, bits, factor).div(k + 1, bits, factor);
        mass.mul(factor, bits, mass);
      }
    }
  }

  /**
   * The compiled log-density agrees with the logarithm of the compiled
   * density.
   */
  @Test
  public void testLogDensityIsLogOfDensity()
  {
    try ( NegativeBinomialDistribution nb = newDistribution("2.5", "0.6"); Real y = new Real(); Real density = new Real();
          Real logDensity = new Real())
    {
      for (int k = 0; k <= 10; k++)
      {
        y.set(k);
        nb.densityFunction().evaluate(y, 1, bits, density);
        nb.logDensityFunction().evaluate(y, 1, bits, logDensity);
        density.log(bits, density);
        assertTrue("ℓ(" + k + ") = " + logDensity + " must overlap ln pnb = " + density,
                   logDensity.overlaps(density));
      }
    }
  }

  /**
   * Partial sums of the density approach 1 (eq. (2)), and the mean and
   * variance match r·(1-p)/p and r·(1-p)/p² (eqs. (3)–(4)) to the tail error
   * of a 400-term partial sum.
   */
  @Test
  public void testMomentsOfCrowley2012()
  {
    try ( NegativeBinomialDistribution nb = newDistribution("4", "0.35"); Real y = new Real(); Real mass = new Real();
          Real total = new Real(); Real mean = new Real(); Real second = new Real(); Real term = new Real();
          Real expected = new Real(); Real variance = new Real())
    {
      for (int k = 0; k <= 400; k++)
      {
        y.set(k);
        nb.densityFunction().evaluate(y, 1, bits, mass);
        total.add(mass, bits, total);
        mass.mul(y, bits, term);
        mean.add(term, bits, mean);
        term.mul(y, bits, term);
        second.add(term, bits, second);
      }
      assertEquals("Σ pnb", 1.0, total.doubleValue(), 1e-15);
      // mean = r(1-p)/p = 4·0.65/0.35
      new Real("1",
               bits).sub(nb.p, bits, expected).mul(nb.r, bits, expected).div(nb.p, bits, expected);
      assertEquals("mean r(1-p)/p", expected.doubleValue(), mean.doubleValue(), 1e-12);
      // variance = r(1-p)/p²
      expected.div(nb.p, bits, expected);
      mean.mul(mean, bits, term);
      second.sub(term, bits, variance);
      assertEquals("variance r(1-p)/p²", expected.doubleValue(), variance.doubleValue(), 1e-10);
    }
  }

  /**
   * The distribution function F(y) = I_p(r,⌊y⌋+1) equals the partial sums of
   * the density, is 0 for y &lt; 0, and approaches 1.
   */
  @Test
  public void testDistributionFunctionMatchesPartialSums()
  {
    try ( NegativeBinomialDistribution nb = newDistribution("4", "0.35"); Real y = new Real(); Real mass = new Real();
          Real partialSum = new Real(); Real cdf = new Real())
    {
      y.set(-1);
      nb.distributionFunction().evaluate(y, 1, bits, cdf);
      assertEquals("F(-1)", 0.0, cdf.doubleValue(), 0.0);
      for (int k = 0; k <= 30; k++)
      {
        y.set(k);
        nb.densityFunction().evaluate(y, 1, bits, mass);
        partialSum.add(mass, bits, partialSum);
        nb.distributionFunction().evaluate(y, 1, bits, cdf);
        assertTrue("F(" + k + ") = " + cdf + " must overlap partial sum " + partialSum,
                   cdf.overlaps(partialSum));
      }
      assertTrue("F(30) approaches 1", cdf.doubleValue() > 0.999);
    }
  }

  /**
   * The symbolic score from {@code logDensity.jacobian({"r","p"})} matches
   * the closed forms ∂ℓ/∂r = ψ(r+y)-ψ(r)+ln(p) and ∂ℓ/∂p = r/p - y/(1-p)
   * from eqs. (7) and (9).
   */
  @Test
  public void testSymbolicScoreMatchesClosedForms()
  {
    try ( NegativeBinomialDistribution nb = newDistribution("4", "0.35"); Real y = new Real(); Real value = new Real();
          Real expected = new Real(); Real tmp = new Real(); Real oneMinusP = new Real())
    {
      Jacobian<Real, Real, RealFunction> score = nb.logDensity.jacobian(new String[]
      { "r", "p" });
      try
      {
        new Real("1",
                 bits).sub(nb.p, bits, oneMinusP);
        for (int k = 0; k <= 12; k++)
        {
          y.set(k);
          // ∂ℓ/∂r = ψ(r+y) - ψ(r) + ln(p)
          nb.r.add(y, bits, expected).digamma(bits, expected);
          nb.r.digamma(bits, tmp);
          expected.sub(tmp, bits, expected);
          nb.p.log(bits, tmp);
          expected.add(tmp, bits, expected);
          value.set(score.partials[0].evaluate(y, 1, bits, value));
          assertTrue("∂ℓ/∂r(" + k + ") = " + value + " must overlap " + expected,
                     value.overlaps(expected));
          // ∂ℓ/∂p = r/p - y/(1-p)
          nb.r.div(nb.p, bits, expected);
          y.div(oneMinusP, bits, tmp);
          expected.sub(tmp, bits, expected);
          value.set(score.partials[1].evaluate(y, 1, bits, value));
          assertTrue("∂ℓ/∂p(" + k + ") = " + value + " must overlap " + expected,
                     value.overlaps(expected));
        }
      }
      finally
      {
        score.close();
      }
    }
  }

  /**
   * Sampling with the same generator state reproduces the same variates, the
   * variates are nonnegative integers, and the sample mean of 500 draws is
   * within 15% of r·(1-p)/p ≈ 7.43.
   */
  @Test
  public void testSamplingReproducibleWithCorrectMean() throws Exception
  {
    int N = 500;
    try ( NegativeBinomialDistribution nb = newDistribution("4", "0.35"); Real first = Real.newVector(N);
          Real second = Real.newVector(N); RandomState state = new RandomState(); Real mean = new Real())
    {
      state.initialize().seed(7L);
      nb.sample(state, bits, first, N);
      state.initialize().seed(7L);
      nb.sample(state, bits, second, N);
      for (int i = 0; i < N; i++)
      {
        assertTrue("draw " + i + " reproduced", first.get(i).equals(second.get(i)));
        assertTrue("draw " + i + " nonnegative", first.get(i).sign() >= 0);
        assertTrue("draw " + i + " integer", first.get(i).isInteger());
        mean.add(first.get(i), bits, mean);
      }
      mean.div(N, bits, mean);
      double expected = 4 * 0.65 / 0.35;
      assertEquals("sample mean near r(1-p)/p", expected, mean.doubleValue(), 0.15 * expected);
    }
  }


  /**
   * The second symbolic pass — each score component's own
   * {@code jacobian({"r","p"})} — matches the closed-form Hessian entries
   * ∂²ℓ/∂r² = ψ₁(r+y)-ψ₁(r), ∂²ℓ/∂r∂p = ∂²ℓ/∂p∂r = 1/p, and
   * ∂²ℓ/∂p² = -r/p² - y/(1-p)², with ψ₁ evaluated through acb_polygamma.
   */
  @Test
  public void testSymbolicHessianMatchesClosedForms()
  {
    try ( NegativeBinomialDistribution nb = newDistribution("4", "0.35"); Real y = new Real(); Real value = new Real();
          Real expected = new Real(); Real tmp = new Real(); Real oneMinusP = new Real();
          Complex s = new Complex(); Complex z = new Complex(); Complex ψ1 = new Complex())
    {
      Jacobian<Real, Real, RealFunction> score = nb.logDensity.jacobian(new String[]
      { "r", "p" });
      Jacobian<Real, Real, RealFunction> rowR  = score.partials[0].jacobian(new String[]
      { "r", "p" });
      Jacobian<Real, Real, RealFunction> rowP  = score.partials[1].jacobian(new String[]
      { "r", "p" });
      try
      {
        new Real("1",
                 bits).sub(nb.p, bits, oneMinusP);
        s.re().one();                                          // polygamma order 1
        for (int k = 0; k <= 8; k++)
        {
          y.set(k);
          // ∂²ℓ/∂r² = ψ₁(r+y) - ψ₁(r)
          nb.r.add(y, bits, tmp);
          z.re().set(tmp);
          z.im().zero();
          arblib.acb_polygamma(ψ1, s, z, bits);
          expected.set(ψ1.re());
          z.re().set(nb.r);
          arblib.acb_polygamma(ψ1, s, z, bits);
          expected.sub(ψ1.re(), bits, expected);
          value.set(rowR.partials[0].evaluate(y, 1, bits, value));
          assertTrue("∂²ℓ/∂r²(" + k + ") = " + value + " must overlap " + expected,
                     value.overlaps(expected));
          // ∂²ℓ/∂r∂p = ∂²ℓ/∂p∂r = 1/p
          new Real("1",
                   bits).div(nb.p, bits, expected);
          value.set(rowR.partials[1].evaluate(y, 1, bits, value));
          assertTrue("∂²ℓ/∂r∂p(" + k + ") = " + value + " must overlap " + expected,
                     value.overlaps(expected));
          value.set(rowP.partials[0].evaluate(y, 1, bits, value));
          assertTrue("∂²ℓ/∂p∂r(" + k + ") = " + value + " must overlap " + expected,
                     value.overlaps(expected));
          // ∂²ℓ/∂p² = -r/p² - y/(1-p)²
          nb.p.mul(nb.p, bits, tmp);
          nb.r.div(tmp, bits, expected).neg(expected);
          oneMinusP.mul(oneMinusP, bits, tmp);
          y.div(tmp, bits, tmp);
          expected.sub(tmp, bits, expected);
          value.set(rowP.partials[1].evaluate(y, 1, bits, value));
          assertTrue("∂²ℓ/∂p²(" + k + ") = " + value + " must overlap " + expected,
                     value.overlaps(expected));
        }
      }
      finally
      {
        score.close();
        rowR.close();
        rowP.close();
      }
    }
  }

}
