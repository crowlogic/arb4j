package arb.stochastic;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.RealSequence;
import arb.functions.real.RealFunction;

/**
 * Negative-binomial probability law with an exact compiler-built density and
 * log-density. It is a <em>discrete</em> law supported on the non-negative
 * integers, so the density is the probability mass f(k) and the distribution
 * function is the partial sum F(x) = ∑ₖ₌₀^⌊x⌋ f(k). The mass is therefore the
 * increment of the distribution function, f(k) = F(k) − F(k−1), the discrete
 * counterpart of the Fundamental Theorem of Calculus.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class NegativeBinomialDistribution extends
                                          Distribution
{
  public final Context      context;
  public final Real         shape;
  public final Real         successProbability;
  public final Real         r;
  public final Real         p;
  public final Real         q;
  public       RealSequence pmf;

  public final RealFunction density;
  public final RealFunction logDensity;
  public final RealFunction distribution;

  public NegativeBinomialDistribution(double shape, double successProbability)
  {
    this(Real.valueOf(shape),
         Real.valueOf(successProbability),
         Double.SIZE);
  }

  public NegativeBinomialDistribution(Real r, Real p, int bits)
  {
    super("negative-binomial");
    this.context            = new Context();
    this.shape              = r.setName("r");
    this.successProbability = p.setName("p");
    this.r                  = this.shape;
    this.p                  = this.successProbability;
    try ( Real qInit = new Real())
    {
      this.q = qInit.one().sub(p, bits, qInit).setName("q");
    }
    this.context.registerVariable(this.shape);
    this.context.registerVariable(this.successProbability);
    this.density      = RealFunction.express("f", densityExpression(), context);
    this.logDensity   = RealFunction.express("ℓ", logDensityExpression(), context);
    this.distribution = RealFunction.express("F", cumulativeExpression(), context);
    this.pmf          = buildPmfSequence(bits);
  }

  /**
   * Compile the pmf recurrence into a {@link RealSequence}. The recurrence
   * {@code f(n) = f(n-1)*((n-1)+r)*q/n} with {@code f(0) = p^r} is defined over a
   * dedicated context so its free variables {@code r}, {@code p}, {@code q} do
   * not collide with the distribution/density/log-density expressions.
   */
  private RealSequence buildPmfSequence(int bits)
  {
    try ( Context pmfContext = new Context())
    {
      Real rVar = new Real().set(this.r).setName("r");
      Real pVar = new Real().set(this.p).setName("p");
      Real qVar = new Real().set(this.q).setName("q");
      pmfContext.registerVariable(rVar);
      pmfContext.registerVariable(pVar);
      pmfContext.registerVariable(qVar);
      return RealSequence.express("f",
                                  "f:n➔when(n=0, p^r, else, f(n-1)*((n-1)+r)*q/n)",
                                  pmfContext);
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
    return new String[]
    { "r", "p" };
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
    Real        observations = Real.newVector(sampleSize);
    RandomState state        = new RandomState().initialize().seed(seed);
    try
    {
      sample(state, bits, observations, sampleSize);
    }
    finally
    {
      try
      {
        state.close();
      }
      catch (Exception e)
      {
        throw new RuntimeException(e.getMessage(),
                                   e);
      }
    }
    return observations;
  }

  public Real sample(RandomState state, int bits, Real results, int count)
  {
    for (int i = 0; i < count; i++)
    {
      sample(state, bits, results.get(i));
    }
    return results;
  }

public Real sample(RandomState state, int bits, Real result)
  {
    try ( Real uniform = new Real(); Real mass = new Real(); Real cumulative = new Real();
           arb.Integer k = new arb.Integer())
    {
      arblib.arb_urandom(uniform, state, bits);
      // f(0) = p^r is the first partial-sum increment
      pmf.evaluate(k.set(0), 1, bits, mass);
      cumulative.set(mass);
      int n = 0;
      while (cumulative.compareTo(uniform) <= 0)
      {
        n++;
        pmf.evaluate(k.set(n), 1, bits, mass);
        cumulative.add(mass, bits, cumulative);
      }
      return result.set(n);
    }
  }

  private void invalidateCaches()
  {
    density.invalidateCache();
    logDensity.invalidateCache();
    distribution.invalidateCache();
    pmf.close();
    pmf = buildPmfSequence(64);
  }

  @Override
  public void close()
  {
    density.close();
    logDensity.close();
    distribution.close();
    pmf.close();
    context.close();
    super.close();
  }
}
