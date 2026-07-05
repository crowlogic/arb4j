package arb.stochastic;

import arb.RandomState;
import arb.Real;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RealFunction;

/**
 * Negative-binomial probability law with an exact compiler-built density and
 * log-density. It is a <em>discrete</em> law supported on the non-negative
 * integers, so the density is the probability mass f(k) and the distribution
 * function is the partial sum F(x) = ∑ₖ₌₀^⌊x⌋ f(k). The mass is therefore the
 * increment of the distribution function, f(k) = F(k) − F(k−1), the discrete
 * counterpart of the Fundamental Theorem of Calculus.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public class NegativeBinomialDistribution extends
                                          Distribution
{
  private final Context      context;
  private final Real         shape;
  private final Real         successProbability;

  private final RealFunction density;
  private final RealFunction logDensity;
  private final RealFunction distribution;

  public NegativeBinomialDistribution(double shape, double successProbability)
  {
    super("negative-binomial");
    this.context = new Context();
    this.shape = Real.named("r").set(shape);
    this.successProbability = Real.named("p").set(successProbability);
    this.context.registerVariable(this.shape);
    this.context.registerVariable(this.successProbability);
    this.density = RealFunction.express("f", densityExpression(), context);
    this.logDensity = RealFunction.express("ℓ", logDensityExpression(), context);
    this.distribution = RealFunction.express("F", cumulativeExpression(), context);
  }

  @Override
  public RealFunction densityFunction()
  {
    return density;
  }

  @Override
  public RealFunction distributionFunction()
  {
    return distribution;
  }

  @Override
  public RealFunction logDensityFunction()
  {
    return logDensity;
  }

  @Override
  public String[] parameterNames()
  {
    return new String[] { "r", "p" };
  }

  @Override
  public Real parameters()
  {
    Real θ = Real.newVector(2);
    θ.get(0).set(shape);
    θ.get(1).set(successProbability);
    return θ;
  }

  @Override
  public void setParameters(Real θ)
  {
    assert θ.dim() == 2 : "negative-binomial expects [shape, successProbability]";
    shape.set(θ.get(0));
    successProbability.set(θ.get(1));
    invalidateCaches();
  }

  @Override
  public boolean isInDomain(Real θ)
  {
    return θ.get(0).sign() > 0 && θ.get(1).sign() > 0 && θ.get(1).doubleValue() < 1.0;
  }

  public double shape()
  {
    return shape.doubleValue();
  }

  public double successProbability()
  {
    return successProbability.doubleValue();
  }

  public String densityExpression()
  {
    return "Γ(x+r)/(Γ(r)*Γ(x+1))*(p^r)*((1-p)^x)";
  }

  public String cumulativeExpression()
  {
    return "x➔∑n➔f(n){n=0…⌊x⌋}";
  }

  public String logDensityExpression()
  {
    return "ln(Γ(x+r))-ln(Γ(r))-ln(Γ(x+1))+r*ln(p)+x*ln(1-p)";
  }

  /**
   * Draw a sample of the law by exact inversion: for each observation a uniform
   * ball U ∈ [0,1) from {@code arb_urandom} is inverted through the exact
   * partial-sum distribution function, accumulated by the pmf recurrence
   *
   * <pre>
   *   f(0) = pʳ,   f(k+1) = f(k)·(k+r)·(1−p)/(k+1)
   * </pre>
   *
   * in ball arithmetic at {@code bits}. The recurrence holds for every real
   * r&gt;0 — no integer rounding of the shape parameter enters. The returned
   * observation is the smallest k with F(k) &gt; U; each comparison is between
   * balls whose radii are far below the comparison scale at the working
   * precision, so the inversion is exact.
   *
   * @param sampleSize number of observations
   * @param seed       seed for the deterministic arb random state
   * @param bits       working precision
   * @return a {@link Real} vector of {@code sampleSize} observations
   */
  public Real sample(int sampleSize, long seed, int bits)
  {
    Real observations = Real.newVector(sampleSize);
    RandomState state = new RandomState().initialize().seed(seed);
    try ( Real uniform = new Real(); Real mass = new Real(); Real cumulative = new Real();
          Real q = new Real(); Real ratio = new Real(); Real kPlusR = new Real())
    {
      new Real().one().sub(successProbability, bits, q);
      for (int i = 0; i < sampleSize; i++)
      {
        arblib.arb_urandom(uniform, state, bits);

        successProbability.pow(shape, bits, mass);
        cumulative.set(mass);
        int k = 0;
        while (cumulative.compareTo(uniform) <= 0)
        {
          shape.add(k, bits, kPlusR).mul(q, bits, ratio).div(k + 1, bits, ratio);
          mass.mul(ratio, bits, mass);
          cumulative.add(mass, bits, cumulative);
          k++;
        }
        observations.get(i).set(k);
      }
    }
    finally
    {
      try
      {
        state.close();
      }
      catch (Exception e)
      {
        throw new RuntimeException(e.getMessage(), e);
      }
    }
    return observations;
  }

  private void invalidateCaches()
  {
    density.invalidateCache();
    logDensity.invalidateCache();
    distribution.invalidateCache();
  }

  @Override
  public void close()
  {
    density.close();
    logDensity.close();
    distribution.close();
    context.close();
  }
}
