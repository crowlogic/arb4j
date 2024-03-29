package arb.stochastic.processes;

import static arb.RealConstants.zero;

import arb.Real;
import arb.stochastic.GaussianCharacteristicFunction;
import arb.stochastic.GaussianDensityFunction;
import arb.stochastic.GaussianDistribution;

/**
 * A Gaussian "white noise" process of specified fixed mean and standard
 * deviation
 * 
 *
 */
public class WhiteNoise implements
                        GaussianProcess

{

  public Real σ;

  /**
   * TODO: move the parameters into a class instead of duplicating them across the
   * density, distribution, and characteristic functions
   * 
   * @param σ
   */
  public WhiteNoise(Real σ)
  {
    super();
    this.σ = σ;
    this.p = new GaussianDensityFunction(zero,
                                         σ);
    this.φ = new GaussianCharacteristicFunction(zero,
                                                σ);
    this.f = new GaussianDistribution(zero,
                                      σ);
  }

  public GaussianDensityFunction        p;

  public GaussianCharacteristicFunction φ;

  public GaussianDistribution           f;

  @Override
  public GaussianDensityFunction getDensityFunction()
  {
    return p;
  }

  @Override
  public GaussianCharacteristicFunction φ(Real timeToMaturity)
  {
    return φ;
  }

  @Override
  public GaussianDistribution getDistributionFunction()
  {
    return f;
  }

  @Override
  public DriftCoeffecientFunction<DiffusionProcessState> μ()
  {
    return (state, order, precision, result) ->
    {
      return zero;
    };
  }

  @Override
  public DiffusionCoeffecientFunction<DiffusionProcessState> σ()
  {
    return (state, order, precision, result) ->
    {
      return σ.mul(state.sqrtdt(precision, result), precision, result);
    };
  }

}
