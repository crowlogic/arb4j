package arb.stochastic;

import arb.RandomState;
import arb.Real;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RealFunction;

/**
 * The (discrete) negative binomial distribution
 *
 * <pre>
 *                Γ(r+y)·pʳ·(1-p)ʸ
 * pnb(y|r,p) =  ─────────────────     y = 0, 1, 2, …
 *                  Γ(r)·Γ(y+1)
 * </pre>
 *
 * where r &gt; 0 is the number of successes at which the experiment stops and
 * p ∈ (0,1) the per-trial success probability, following Crowley,
 * <i>Maximum Likelihood Estimation of the Negative Binomial Distribution</i>,
 * vixra 1211.0113 (2012). The mean is r·(1-p)/p and the variance r·(1-p)/p².
 *
 * <p>
 * The density and per-observation log-likelihood
 *
 * <pre>
 * ℓ(y|r,p) = lnΓ(r+y) - lnΓ(r) - lnΓ(y+1) + r·ln(p) + y·ln(1-p)
 * </pre>
 *
 * are compiled from expression-language source over the named parameter
 * handles {@link #r} and {@link #p} registered in the {@link #context}; the
 * score
 *
 * <pre>
 * ∂ℓ/∂r = ψ(r+y) - ψ(r) + ln(p)
 * ∂ℓ/∂p = r/p - y/(1-p)
 * </pre>
 *
 * is obtained symbolically from the compiled log-density via
 * {@link RealFunction#jacobian(String[])} with the variable-name sequence
 * {"r","p"} — no procedural differentiation anywhere.
 *
 * <p>
 * The distribution function is P(Y ≤ y) = I_p(r, ⌊y⌋+1), the regularized
 * incomplete beta function evaluated through
 * {@link Real#betaLower(Real, Real, int, int, Real)}
 * (arb_hypgeom_beta_lower).
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NegativeBinomialDistribution extends
                                          Distribution
{

  /**
   * Stopping number of successes, r &gt; 0 (named handle registered in
   * {@link Distribution#context}).
   */
  public final Real         r;

  /**
   * Per-trial success probability, p ∈ (0,1) (named handle registered in
   * {@link Distribution#context}).
   */
  public final Real         p;

  /**
   * pnb(y|r,p) = Γ(r+y)·pʳ·(1-p)ʸ/(Γ(r)·Γ(y+1)), compiled from
   * expression-language source.
   */
  public final RealFunction density;

  /**
   * ℓ(y|r,p) = lnΓ(r+y) - lnΓ(r) - lnΓ(y+1) + r·ln(p) + y·ln(1-p), compiled
   * from expression-language source; its symbolic parameter derivatives are
   * the score.
   */
  public final RealFunction logDensity;

  private final RealFunction distributionFunction;

  public NegativeBinomialDistribution(Real r, Real p, int bits)
  {
    super(new Context(r.setName("r"),
                      p.setName("p")),
          bits);
    this.r               = r;
    this.p               = p;
    this.density         =
                 RealFunction.express("pnb", "y➔Γ(r+y)*p^r*(1-p)^y/(Γ(r)*Γ(y+1))", context);
    this.logDensity      =
                 RealFunction.express("ℓ", "y➔lnΓ(r+y)-lnΓ(r)-lnΓ(y+1)+r*ln(p)+y*ln(1-p)", context);
    this.distributionFunction = new CumulativeDistributionFunction();
  }

  /**
   * F(y) = P(Y ≤ y) = I_p(r, ⌊y⌋+1) via arb_hypgeom_beta_lower with
   * regularized=1.
   */
  private final class CumulativeDistributionFunction implements
                                                     RealFunction
  {
    @Override
    public Real evaluate(Real y, int order, int bits, Real result)
    {
      if (y.sign() < 0)
      {
        return result.zero();
      }
      try ( Real kPlusOne = new Real())
      {
        y.floor(bits, kPlusOne);
        kPlusOne.add(1, bits, kPlusOne);
        return r.betaLower(kPlusOne, p, 1, bits, result);
      }
    }

    @Override
    public String toString()
    {
      return "y➔I(p;r,⌊y⌋+1)";
    }
  }

  @Override
  public RealFunction densityFunction()
  {
    return density;
  }

  @Override
  public RealFunction distributionFunction()
  {
    return distributionFunction;
  }

  @Override
  public RealFunction logDensityFunction()
  {
    return logDensity;
  }

  /**
   * Inverse-distribution-function draw: u is uniform on [0,1] via
   * {@link arblib#arb_urandom(Real, RandomState, int)}, and the variate is the
   * least y with F(y) ≥ u, located by accumulating the exact pmf recursion
   *
   * <pre>
   * P(0)   = pʳ
   * P(y+1) = P(y)·(1-p)·(r+y)/(y+1)
   * </pre>
   *
   * in ball arithmetic.
   */
  @Override
  public Real sample(RandomState state, int bits, Real result)
  {
    try ( Real u = new Real(); Real mass = new Real(); Real cumulative = new Real(); Real ratio = new Real();
          Real numerator = new Real(); Real one = new Real())
    {
      arblib.arb_urandom(u, state, bits);
      one.one();
      one.sub(p, bits, ratio);                       // ratio = 1-p
      p.pow(r, bits, mass);                          // P(0) = p^r
      cumulative.set(mass);
      int y = 0;
      while (cumulative.compareTo(u) < 0)
      {
        numerator.set(r).add(y, bits, numerator);    // r+y
        numerator.mul(ratio, bits, numerator);       // (r+y)·(1-p)
        numerator.div(y + 1, bits, numerator);       // /(y+1)
        mass.mul(numerator, bits, mass);
        cumulative.add(mass, bits, cumulative);
        y++;
      }
      return result.set(y);
    }
  }

  @Override
  public String toString()
  {
    return "NegativeBinomialDistribution[r=" + r + ", p=" + p + "]";
  }

  @Override
  public void close()
  {
    density.close();
    logDensity.close();
    r.close();
    p.close();
  }

}
