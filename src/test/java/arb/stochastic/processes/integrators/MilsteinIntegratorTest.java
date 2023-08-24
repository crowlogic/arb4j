package arb.stochastic.processes.integrators;

import java.lang.Float;

import arb.*;
import arb.stochastic.*;
import arb.stochastic.processes.*;
import junit.framework.TestCase;

public class MilsteinIntegratorTest extends
                                    TestCase
{

  final double             dt        = 1e-4;

  private static final int precision = 128;
  private static final int steps     = 10000;

  public void testIntegration()
  {
    // Create a simple diffusion process and state
    DiffusionProcess<DiffusionProcessState> process = new SimpleDiffusionProcess();
    DiffusionProcessState                   state   = new SimpleDiffusionProcessState(new RandomState(69));

    try ( MilsteinIntegrator<DiffusionProcess<DiffusionProcessState>, DiffusionProcessState> integrator = new MilsteinIntegrator<>(process,
                                                                                                                                   state))
    {
      // Perform the integration
      EvaluationSequence result     = integrator.integrate(new FloatInterval(0,
                                                                             10),
                                                           steps,
                                                           precision);

      // Check the result
      // In this simple example, we expect the value after 'steps' steps to be close
      // to the initial value
      Real               finalValue = result.dimensions[0].get(steps - 1);
      assertTrue(finalValue.toString(), Math.abs(finalValue.doubleValue()) < 0.01);
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
      super(s);
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
