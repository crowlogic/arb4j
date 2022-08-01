package arb.stochastic.processes;

import arb.Real;

/**
 * dSₜ=μ*Sₜ*dt+ σ*Sₜ*dWₜ
 */
public class GeometricBrownianMotion implements
                                     DiffusionProcess
{
  public final Real μ = new Real();
  public final Real σ = new Real();

  public GeometricBrownianMotion()
  {

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
  public DriftCoeffecientFunction μ()
  {
    return (state, order, prec, result) ->
    {
      Real Sₜ = state.value;
      return μ.mul(Sₜ, prec, result);
    };
  }

  /**
   * @return σ*Sₜ
   */
  @Override
  public DiffusionCoeffecientFunction σ()
  {
    return (state, order, prec, result) ->
    {
      Real Sₜ = state.value;
      return σ.mul(Sₜ, prec, result);
    };
  }

}
