package arb.stochastic;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RealFunction;

/**
 * Negative-binomial probability law with an exact compiler-built density and
 * log-density. The distribution function is defined as ∫₀ˣ density(t) dt, with
 * the density being its derivative via the Fundamental Theorem of Calculus —
 * satisfying the {@link Distribution} contract semantically without triggering
 * symbolic antiderivative computation.
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
  }

  @Override
  public RealFunction densityFunction()
  {
    return density;
  }

  @Override
  public RealFunction distributionFunction()
  {
    return RealFunction.express(cumulativeExpression(), context);
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
    return "x➔∫t➔f(t)dt∈(0,x)";
  }

  public String logDensityExpression()
  {
    return "ln(Γ(x+r))-ln(Γ(r))-ln(Γ(x+1))+r*ln(p)+x*ln(1-p)";
  }

  private void invalidateCaches()
  {
    density.invalidateCache();
    logDensity.invalidateCache();
  }

  @Override
  public void close()
  {
    density.close();
    logDensity.close();
    context.close();
  }
}
