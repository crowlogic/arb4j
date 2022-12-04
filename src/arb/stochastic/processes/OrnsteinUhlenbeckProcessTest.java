package arb.stochastic.processes;

import static arb.RealConstants.one;
import static arb.RealConstants.zero;
import static arb.utensils.Utilities.println;

import arb.RandomState;
import arb.Real;
import junit.framework.TestCase;

public class OrnsteinUhlenbeckProcessTest extends
                                          TestCase
{
  public static final int prec = 128;

  /**
   * Test dXₜ = 2 * ( 5 - Xₜ )dt + 3*dWₜ
   */
  public void testDriftAndDiffusion()
  {
    Real θ = new Real("2",
                      prec);
    Real μ = new Real("5",
                      prec);
    Real σ = new Real("3",
                      prec);
    try ( OrnsteinUhlenbeckProcess process = new OrnsteinUhlenbeckProcess(θ,
                                                                          μ,
                                                                          σ);
          DiffusionProcessState state = new DiffusionProcessState(new RandomState(4200)); Real μi = new Real();
          Real σi = new Real())
    {
      μi.printPrecision = true;
      σi.printPrecision = true;
      state.setTime(zero);
      state.value().set(one);
      state.setdt(new Real("0.0001",
                           128));

      process.μ().evaluate(state, 1, prec, μi);
      process.σ().evaluate(state, 1, prec, σi);

      println(state);
      println("μi=" + μi);
      println("σi=" + σi);
      assertTrue(μi.doubleValue() == 8.0);
      assertTrue(σi.doubleValue() == 3.0);

      state.value().set(zero);
      process.μ().evaluate(state, 1, prec, μi);
      process.σ().evaluate(state, 1, prec, σi);

      assertTrue(μi.doubleValue() == 10.0);
      assertTrue(σi.doubleValue() == 3.0);
    }

  }

}
