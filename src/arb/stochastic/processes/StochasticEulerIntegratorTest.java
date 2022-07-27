package arb.stochastic.processes;

import arb.*;
import junit.framework.*;

public class StochasticEulerIntegratorTest extends
                                           TestCase
{
  public static final int prec = 128;

  public void testDiscretize()
  {
    StandardGaussianProcess   B          = new StandardGaussianProcess();
    StochasticEulerIntegrator integrator = new StochasticEulerIntegrator(B);
    FloatInterval             interval   = new FloatInterval(0,
                                                             10);
    int                       n          = 10000;
    Partition                 partition  = interval.partition(n, prec);
    Real                      μ          = Real.newVector(n);
    Real                      σ          = Real.newVector(n);

    Real                      dt         = integrator.integrate(interval, 128, μ, new Real(), null, null);

  }

}
