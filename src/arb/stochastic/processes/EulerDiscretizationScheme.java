package arb.stochastic.processes;

import arb.Float;
import arb.FloatInterval;
import arb.Real;
import arb.utensils.Utilities;

public class EulerDiscretizationScheme implements
                                       DiscretizationScheme
{
  public EulerDiscretizationScheme(DiffusionProcess x)
  {
    X = x;
  }

  public DiffusionProcess X;

  public Real             dt;

  /**
   * 
   * @param interval
   * @param prec     precision
   * @param μmesh    upon entry it should be a Real vector of length n
   * @param μmesh    upon entry it should be a Real vector of length n
   * @return the resulting stepsize, this{@link #dt}
   */
  @Override
  public Float discretize(FloatInterval interval, int prec, Real μmesh, Real σmesh, Float dt, Real initialLevel, Real initialVariance)
  {
    int n = μmesh.size();
    assert n == σmesh.size();
    Real  a = X.μ();
    Real  b = X.σ();

    Float T = interval.getB().sub(interval.getA(), prec, dt);

    return Utilities.TODO("iterate from 1 to n chopping up the interval into n smaller intervals of size dt=T/n");
//    for (int i = 0; i < n; i++)
//    {
//
//    }
//    return dt.div(n, prec, T);
  }
}
