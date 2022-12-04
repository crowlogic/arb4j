package arb.stochastic.processes;

import static arb.RealConstants.half;
import static arb.RealConstants.one;
import static arb.RealConstants.zero;
import static arb.utensils.Utilities.println;

import arb.Magnitude;
import arb.RandomState;
import arb.Real;
import junit.framework.TestCase;

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
    try ( WienerProcess wienerProcess = new WienerProcess(three))
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
      println("sqrtHalfTimesσ=" + sqrtHalfTimesσ.toString() + "\n     diffusion=" + diffusion.toString());
      assertTrue(diffusion.getRad().sub(sqrtHalfTimesσ.getRad(), new Magnitude()).doubleValue() < Math.pow(10, -45));
      assertTrue(diffusion.getMid().toString(80) + " != " + sqrtHalfTimesσ.getMid().toString(80),
                 diffusion.getMid().equals(sqrtHalfTimesσ.getMid()));
      assertTrue(diffusion.toString(80) + " != " + sqrtHalfTimesσ.toString(80), diffusion.equals(sqrtHalfTimesσ));
    }
  }

}
