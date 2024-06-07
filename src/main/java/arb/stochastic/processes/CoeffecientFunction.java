package arb.stochastic.processes;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.stochastic.processes.integrators.State;

/**
 *
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
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
