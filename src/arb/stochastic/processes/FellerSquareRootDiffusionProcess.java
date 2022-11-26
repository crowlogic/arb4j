package arb.stochastic.processes;

import arb.Real;
import arb.stochastic.RealProbabilityDensityFunction;

/**
 * Also known as a Cox-Ingersoll-Ross process. The CIR model specifies that the
 * instantaneous rate function νₜ ( interest, variance, whatever) follows the
 * stochastic differential equation, also named the CIR Process:
 * 
 * <pre>
 * dνₜ = λ*(θ − νₜ)*dt + σ*√νₜ*dWₜ
 * </pre>
 * 
 * @see <a href="doc-files/InterestRateTermStructureTheory.pdf">A Theory of the
 *      Term Structure of Interest Rates</a> Assumption 3
 */
public class FellerSquareRootDiffusionProcess<S extends DiffusionProcessState> implements
                                             DiffusionProcess<S>
{
  @Override
  public <P extends RealProbabilityDensityFunction> P getDensityFunction()
  {
    assert false : "implement me, closed form density involving modified Bessel functions of the first kind";
    return null;

  }

  /**
   * 
   * @param λ mean-reversion rate
   * @param θ mean level around which process varies
   * @param σ volatility of volatility
   */
  public FellerSquareRootDiffusionProcess(Real λ, Real θ, Real σ)
  {
    this.λ = λ;
    this.θ = θ;
    this.σ = σ;
  }

  public Real λ, θ, σ;

  /**
   * @return λ*(θ-νₜ)*dt where νₜ= {@link DiffusionProcessState#value()}
   */
  @Override
  public DriftCoeffecientFunction<S> μ()
  {
    return (state, order, prec, result) ->
    {
      Real vₜ = state.value();
      assert order <= 1 : "TODO: implement order " + order + " . Only order=1 supported currently";
      λ.mul(θ.sub(vₜ, prec, result), prec);
      return result;
    };

  }

  /**
   * @return σ*√vₜ if order = 1 or [σ*√vₜ,σ/(2*√vₜ)] if order = 2 where νₜ=
   *         {@link DiffusionProcessState#value()}
   */
  @Override
  public DiffusionCoeffecientFunction<S> σ()
  {
    return (state, order, prec, result) ->
    {
      assert order <= 2 : "TODO: implement order " + order + " . Only order=1,2 supported currently";

      Real vₜ = state.value();
      try ( Real σₜ = vₜ.sqrt(prec, new Real());)
      {
        // res=σ*√vₜ=σ*σₜ

        σ.mul(σₜ, prec, result);

        if (order >= 2)
        { // res[1]=σ/(2*√vₜ)
          σ.div(σₜ.mul(2, prec, result.get(1)), prec);
        }
        return result;
      }
    };
  }

}
