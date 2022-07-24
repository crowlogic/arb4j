package arb.stochastic.processes;

import arb.Float;
import arb.FloatInterval;
import arb.Real;

public class MilsteinDiscretizationScheme implements
                                          DiscretizationScheme
{

  @Override
  public Real discretize(FloatInterval interval, int prec, Real μvector, Real σvector, Real dt, Real μ0, Real σ0)
  {
    return arb.utensils.Utilities.TODO("implement me");
  }

}
