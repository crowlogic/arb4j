package arb.stochastic.processes;

import arb.Float;
import arb.FloatInterval;
import arb.Real;
import arb.functions.real.*;
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
   * @return the resulting stepsize, this{@link #dt} after populating μmesh and
   *         σmesh
   */
  @Override
  public Real discretize(FloatInterval interval,
                         int prec,
                         Real μmesh,
                         Real σmesh,
                         Real dt,
                         Real initialLevel,
                         Real initialVariance)
  {
    int n = μmesh.size();
    assert n == σmesh.size();
    RealFunction μ = X.μ();
    RealFunction σ = X.σ();

    Float        T = interval.getB().sub(interval.getA(), prec, dt.getMid());
    try ( Real t = new Real(); Real s = new Real())
    {
      for (int i = 0; i < n; i++)
      {
        interval.getA().add(dt.mul(i, prec, t).getMid(), prec, s.getMid());
        
        Real μi = μmesh.get(i);
        μ.evaluate(s, 1, prec, μi);
        μi.mul(dt, prec, μi);
        interval.getA().add(dt.mul(i, prec, t).getMid(), prec, s.getMid());
        
        Real σi = σmesh.get(i);
        σ.evaluate(s, 1, prec, σi);
        σi.mul(dt, prec, σi);
        
        σi.mul(dt, prec, σi);
      }
    }

    return dt;
  }
}
