package arb.stochastic.processes;

import arb.*;
import arb.Float;
import junit.framework.TestCase;

public class EulerDiscretizationSchemeTest extends
                                           TestCase
{

  public void testDiscretize()
  {
    StandardGaussianProcess   B          = new StandardGaussianProcess();
    EulerDiscretizationScheme integrator = new EulerDiscretizationScheme(B);
    FloatInterval             interval   = new FloatInterval(0,
                                                             10);
    int                       n          = 10000;
    Real                      μ          = Real.newVector(n);
    Real                      σ          = Real.newVector(n);

    Float                     dt         = integrator.discretize(interval, 128, μ, σ, new Float());
    
    fail("Not yet implemented");
  }

}
