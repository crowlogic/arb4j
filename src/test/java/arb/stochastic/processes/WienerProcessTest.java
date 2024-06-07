package arb.stochastic.processes;

import static arb.RealConstants.half;
import static arb.RealConstants.one;
import static arb.RealConstants.zero;

import arb.Magnitude;
import arb.RandomState;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class WienerProcessTest extends
                               TestCase
{
  public static final int prec = 128;

  public void testunitσ()
  {
    testσ(one);
  }

  public void testσ()
  {
    testσ(new Real("3",
                   128));
  }

  protected static void testσ(Real three)
  {
    try ( BrownianMotion wienerProcess = new BrownianMotion(three))
    {
      DiffusionProcessState state = new DiffusionProcessState(new RandomState(41));
      state.setTime(zero);
      state.setTime(half);
      Real drift = wienerProcess.μ().evaluate(state, 1, prec, new Real());
      assertTrue(drift.isZero());
      Real diffusion      = wienerProcess.σ().evaluate(state, 1, prec, new Real());
      Real sqrtHalfTimesσ = half.sqrt(prec, new Real()).mul(three, prec);
      diffusion.printPrecision      = true;
      sqrtHalfTimesσ.printPrecision = true;
      assertTrue(diffusion.getRad().sub(sqrtHalfTimesσ.getRad(), new Magnitude()).doubleValue() < Math.pow(10, -45));
      assertTrue(diffusion.getMid().toString(80) + " != " + sqrtHalfTimesσ.getMid().toString(80),
                 diffusion.getMid().equals(sqrtHalfTimesσ.getMid()));
      assertTrue(diffusion.toString(80) + " != " + sqrtHalfTimesσ.toString(80), diffusion.equals(sqrtHalfTimesσ));
    }
  }

}
