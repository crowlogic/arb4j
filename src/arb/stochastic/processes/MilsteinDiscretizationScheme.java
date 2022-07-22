package arb.stochastic.processes;

import arb.Float;
import arb.FloatInterval;
import arb.Real;

public class MilsteinDiscretizationScheme implements
                                          DiscretizationScheme
{

  @Override
  public Float discretize(FloatInterval interval, int prec, Real μvector, Real σvector, Float dt, Real μ0, Real σ0)
  {
    return arb.utensils.Utilities.TODO("implement me");
  }

}
