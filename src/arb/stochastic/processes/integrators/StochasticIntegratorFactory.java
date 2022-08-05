package arb.stochastic.processes.integrators;

import arb.stochastic.processes.*;

public abstract class StochasticIntegratorFactory
{
  public static enum IntegrationMethod
  {
   Euler,
   Milstein
  }

  /**
   * Construct a new instance of either a {@link IntegrationMethod#Euler} or
   * {@link IntegrationMethod#Milstein}
   * 
   * @param <X>     the type of {@link DiffusionProcessIntegrator}
   * @param <P>     the type of {@link DiffusionProcess}
   * @param <D>     the type of {@link DiffusionProcessState}
   * @param method
   * @param process
   * @param state
   * @return a newly constructed instance of the specified method where the given
   *         process and state has been passed to the constructor
   */
  public static <X extends DiffusionProcessIntegrator<D, P>, P extends DiffusionProcess<D>, D extends DiffusionProcessState>
         X
         newIntegrator(IntegrationMethod method, P process, D state)
  {
    switch (method)
    {
    case Euler:
      X eulerIntegrator = (X) new EulerIntegrator<P, D>(process,
                                                        state);
      return eulerIntegrator;
    case Milstein:
      X milsteinIntegrator = (X) new MilsteinIntegrator<P, D>(process,
                                                              state);
      return milsteinIntegrator;
    }
    assert false : "impossible";
    return null;
  }
}
