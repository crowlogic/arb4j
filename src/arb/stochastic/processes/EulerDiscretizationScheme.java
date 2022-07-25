package arb.stochastic.processes;

import arb.*;
import arb.Float;
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
   * @param S        upon entry it should be a Real vector of length n
   * @return the time delta this{@link #dt} between points of S
   */
  @Override
  public Real discretize(FloatInterval interval, int prec, Real S, Real dt, Real initialLevel, Real initialVariance)
  {
    int                          n     = S.size();
    DriftCoeffecientFunction     μ     = X.μ();
    DiffusionCoeffecientFunction σ     = X.σ();

    Float                        start = interval.getA();
    Float                        T     = interval.getB().sub(start, prec, dt.getMid());
    try ( DiffusionProcessCoordinates coords = new DiffusionProcessCoordinates())
    {
      Real  tReal = coords.time();
      Float t     = tReal.getMid();

      for (int i = 0; i < n; i++)
      {
        // t = start + dt*i
        dt.mul(i, prec, tReal);
        start.add(t, prec, t);

        Real Si = S.get(i);
        μ.evaluate(coords, 1, prec, Si);
        Si.mul(dt, prec, Si);
        start.add(dt.mul(i, prec, tReal).getMid(), prec, coords.value().getMid());

      }
    }

    return dt;
  }
}
