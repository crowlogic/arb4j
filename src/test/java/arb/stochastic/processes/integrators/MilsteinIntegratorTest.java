package arb.stochastic.processes.integrators;

import java.lang.Float;

import arb.*;
import arb.stochastic.*;
import arb.stochastic.processes.*;
import junit.framework.TestCase;

public class MilsteinIntegratorTest extends
                                    TestCase
{

  private static final Float dt        = new Float(0.01);
  private static final int   precision = 10;
  private static final int   steps     = 100;

  public void testIntegration()
  {
    // Create a simple diffusion process and state
    DiffusionProcess<DiffusionProcessState> process = new SimpleDiffusionProcess();
    DiffusionProcessState                   state   = new SimpleDiffusionProcessState(new RandomState(69));

    try ( MilsteinIntegrator<DiffusionProcess<DiffusionProcessState>, DiffusionProcessState> integrator = new MilsteinIntegrator<>(process,
                                                                                                                                   state))
    {
      // Perform the integration
      EvaluationSequence result        = integrator.integrate(new FloatInterval(0,
                                                                                steps * dt.doubleValue()),
                                                              steps,
                                                              precision);

      // Check the result
      // In this simple example, we expect the value after 'steps' steps to be close
      // to the initial value
      Real               expectedValue = state.value();
      Real               finalValue    = result.dimensions[0].get(steps - 1);
      assertTrue(expectedValue.sub(finalValue, precision).abs().compareTo(new Real(0.1)) < 0);
    }
  }

  private static class SimpleDiffusionProcess implements
                                              DiffusionProcess<DiffusionProcessState>
  {

    @Override
    public DiffusionCoeffecientFunction<DiffusionProcessState> σ()
    {
      return (state, order, prec, result) ->
      {

        result.one();

        return result;
      };
    }

    @Override
    public DriftCoeffecientFunction<DiffusionProcessState> μ()
    {
      return (state, order, prec, result) ->
      {

        result.zero();

        return result;
      };
    }

    @Override
    public CharacteristicFunction φ(Real timeToMaturity)
    {
      assert false : "todo";
      return null;
    }

    @Override
    public RealProbabilityDensityFunction getDensityFunction()
    {
      assert false : "todo";
      return null;
    }

    @Override
    public ProbabilityDistributionFunction getDistributionFunction()
    {
      assert false : "todo";
      return null;
    }
  }

  private static class SimpleDiffusionProcessState extends
                                                   DiffusionProcessState
  {

    private Real value;

    public SimpleDiffusionProcessState(RandomState s)
    {
      super(
            s);
      value = new Real();
    }

    @Override
    public Real value()
    {
      return value;
    }

    @Override
    public DiffusionProcessState setValue(Real value)
    {
      this.value = value;
      return this;
    }

  }
}
