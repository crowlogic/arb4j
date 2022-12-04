package arb.stochastic.processes;

import arb.Real;
import arb.dynamical.systems.State;
import arb.functions.Function;

public interface CoeffecientFunction<S extends State> extends
                                    Function<S, Real>
{
  /**
   * 
   * @return true if this function explicitly depends on time rather than just on
   *         the state variables which are functions of time
   */
  default boolean dependsOnAbsoluteTime()
  {
    return false;
  }
}
