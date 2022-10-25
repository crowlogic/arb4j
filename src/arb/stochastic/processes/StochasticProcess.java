package arb.stochastic.processes;

import arb.Real;
import arb.RandomState;
import arb.dynamical.systems.*;
import arb.stochastic.*;

/**
 * A stochastic process is a family of random variables,<br>
 * <code>{X(t) : t ∈ T} <code> <br>
 * where t usually denotes time or a time-like variable
 */
public interface StochasticProcess extends
                                   ContinuousTimeDynamicalSystem
{
  /**
   * 
   * @return the dimension of this process
   */
  public default int dim()
  {
    return 1;
  }

  public default <P extends RealProbabilityDensityFunction> P getDensityFunction()
  {
    assert false : "do this";
    return null;
  }

  public default <F extends ProbabilityDistributionFunction> F getDistributionFunction()
  {
    assert false : "do this";
    return null;
  }

  public default CharacteristicFunction getCharacteristicFunction()
  {
    assert false : "todo";
    return null;
  }

  public default Real sample(Real t, int prec, CorrelatedRandomVectorGenerator generator, Real x)
  {
    return getDistributionFunction().sample(generator, prec, x);
  }

}
