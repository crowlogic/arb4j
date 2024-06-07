package arb.stochastic.processes;

import static arb.RealConstants.one;
import static arb.RealConstants.zero;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.stochastic.ProbabilityDistributionFunction;
import arb.stochastic.RealProbabilityDensityFunction;

/**
 * TODO: also, Brownian motion
 * 
 * dSₜ=μ*Sₜ*dt+ σ*Sₜ*dWₜ
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class GeometricBrownianMotion implements
                                     DiffusionProcess<DiffusionProcessState>
{
  public final Real μ = new Real();
  public final Real σ = new Real();

  public GeometricBrownianMotion()
  {
    this(zero,
         one);
  }

  public GeometricBrownianMotion(Real mean, Real stdev)
  {
    μ.set(mean);
    σ.set(stdev);
  }

  /**
   * @return μ*Sₜ
   */
  @Override
  public DriftCoeffecientFunction<DiffusionProcessState> μ()
  {
    return (state, order, prec, result) ->
    {
      Real Sₜ = state.value();
      return μ.mul(Sₜ, prec, result);
    };
  }

  /**
   * @return σ*Sₜ
   */
  @SuppressWarnings("resource")
  @Override
  public DiffusionCoeffecientFunction<DiffusionProcessState> σ()
  {
    return (state, order, prec, result) ->
    {
      assert !state.value().isZero() : "state.value must be strictly positive";
      Real Sₜ = state.value();
      return σ.mul(Sₜ, prec, result);
    };
  }

  @Override
  public RealProbabilityDensityFunction getDensityFunction()
  {
    assert false : "todo";
    return null;
  }

  @Override
  public ProbabilityDistributionFunction getDistributionFunction()
  {
    assert false : "todo";
    return null;
  }

}
