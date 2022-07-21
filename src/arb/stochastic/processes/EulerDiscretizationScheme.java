package arb.stochastic.processes;

import arb.*;
import arb.Float;
import arb.functions.*;
import arb.utensils.*;

public class EulerDiscretizationScheme<F extends Function> implements
                                      DiscretizationScheme
{
  public EulerDiscretizationScheme(DiffusionProcess<F> x)
  {
    X = x;
  }

  public DiffusionProcess<F> X;

  public Real                dt;

  /**
   * 
   * @param interval
   * @param prec     precision
   * @param μmesh    upon entry it should be a Real vector of length n
   * @param μmesh    upon entry it should be a Real vector of length n
   * 
   * @return the resulting stepsize, this{@link #dt}
   */
  public Float discretize(FloatInterval interval, int prec, Real μmesh, Real σmesh, Float dt)
  {
    int n = μmesh.size();
    assert n == σmesh.size();
    F     a = X.μ();
    F     b = X.σ();

    Float T = interval.getB().sub(interval.getA(), prec, dt);

    return Utils.TODO("iterate from 1 to n chopping up the interval into n smaller intervals of size dt=T/n");
//    for (int i = 0; i < n; i++)
//    {
//
//    }
//    return dt.div(n, prec, T);
  }
}
