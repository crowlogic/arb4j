package arb.stochastic.processes;

import arb.dynamical.systems.State;

public interface DiffusionCoeffecientFunction<S extends State> extends
                                             CoeffecientFunction<S>
{
  default boolean dependsOnAbsoluteTime()
  {
    return false;
  }
}
