package arb.stochastic.processes;

import arb.stochastic.*;

/**
 * The Wiener process W(t) is an integral of the white-noise
 * {@link GaussianProcess} characterized by the following properties:<br>
 * 
 * 1. W(0) = 0<br>
 * 
 * 2. W has independent increments: for every t > 0 the future increments
 * W(t+u)-W(t)∀u≥0 are independent of the past values {W(s):s≤t}<br>
 * 
 * 3. W has Gaussian increments: W(t+u)−W(t) is normally distributed with mean 0
 * and variance u with W(t+u)−W(t)∼N(0,u)<br>
 * 
 * 4. W has continuous paths: W(t) is continuous in t<br>
 * 
 * @author crow
 * @see https://en.wikipedia.org/wiki/Wiener_process
 */
public class WienerProcess implements
                           LévyProcess
{

  @Override
  public DensityFunction getDensityFunction()
  {
    assert false : "2do";
    return null;
  }

  @Override
  public CharacteristicFunction getCharacteristicFunction()
  {
    assert false : "2do";
    return null;
  }

  @Override
  public DistributionFunction getDistributionFunction()
  {
    assert false : "TODO: implement";
    return null;
  }

}
