package arb.stochastic.processes;

import static arb.RealConstants.*;
import static arb.utensils.Utilities.println;

import arb.Real;
import junit.framework.TestCase;

public class WienerProcessTest extends
                               TestCase
{
  public static final int prec = 128;

  public void testσ()
  {
    WienerProcess         wienerProcess = new WienerProcess(new Real("3.5",
                                                                     prec));
    DiffusionProcessState state         = new DiffusionProcessState();
    state.setTime(zero);
    state.setTime(half);
    Real drift = wienerProcess.μ().evaluate(state, 1, prec, new Real());
    assertTrue(drift.isZero());
    Real diffusion = wienerProcess.σ().evaluate(state, 1, prec, new Real());
    println(state + " σ=" + diffusion);
    Real sqrtHalf = half.sqrt(prec, new Real());
    assertTrue(diffusion + " != " + sqrtHalf, diffusion.equals(sqrtHalf));

  }
}
