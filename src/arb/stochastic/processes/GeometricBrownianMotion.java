package arb.stochastic.processes;

import static arb.RealConstants.zero;
import static arb.RealConstants.one;

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
    this(zero,one);
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
      Real Sₜ = state.value;
      return μ.mul(Sₜ, prec, result);
    };
  }

  /**
   * @return σ*Sₜ
   */
  @Override
  public DiffusionCoeffecientFunction<DiffusionProcessState> σ()
  {
    return (state, order, prec, result) ->
    {
      assert !state.value().isZero() : "state.value must be strictly positive";
      Real Sₜ = state.value;
      return σ.mul(Sₜ, prec, result);
    };
  }

}
