package arb.stochastic.processes;

import static arb.utensils.Utils.println;
import static org.junit.Assert.assertEquals;

import arb.RandomState;
import arb.Real;
import arb.stochastic.*;

/**
 * A stochastic process is a family of random variables,<br>
 * <code>{X(t) : t ∈ T} <code> <br>
 * where t usually denotes time or a time-like variable
 */
public interface StochasticProcess<P extends DensityFunction, F extends DistributionFunction, C extends CharacteristicFunction<P>>
{
  public P getDensityFunction();

  public F getDistributionFunction();

  public C getCharacteristicFunction();

  public default Real sample(int prec, RandomState randomState, Real u, Real x)
  {
    return getDistributionFunction().sample(prec, randomState, u, x);
  }

  public default void generateTrajectory(int n, RandomState randomState, int prec)
  {
    Real μ = getMean();
    try ( Real u = new Real(); // uniform sample
          Real x = new Real(); // sample from this
          Real dx2 = new Real(); Real uAccumulator = new Real(); Real xAccumulator = new Real();
          Real dx2Accumulator = new Real();)
    {
      uAccumulator.printPrecision = true;
      xAccumulator.printPrecision = true;
      dx2Accumulator.printPrecision = true;
      int i;
      for (i = 0; i < n; i++)
      {
        sample(prec, randomState, u, x);
        x.sub(μ, prec, dx2).pow(2, prec, dx2);
        uAccumulator.add(u, prec, uAccumulator);
        xAccumulator.add(x, prec, xAccumulator);
        dx2Accumulator.add(dx2, prec, dx2Accumulator);
      }
      uAccumulator.div(i, prec);
      xAccumulator.div(i, prec);
      dx2Accumulator.div(i, prec).sqrt(prec);

      println("seed=" + randomState.getInitialValue() + " i=" + i + " u=" + uAccumulator + " μ=" + xAccumulator + " σ="
                    + dx2Accumulator);
      assertEquals(0.5, uAccumulator.doubleValue(), 0.01);
      assertEquals(getMean().doubleValue(), xAccumulator.doubleValue(), 0.03);
      assertEquals(getStandardDeviation().doubleValue(), dx2Accumulator.doubleValue(), 0.02);

    }
  }

  public Real getMean();

  public Real getStandardDeviation();
}
