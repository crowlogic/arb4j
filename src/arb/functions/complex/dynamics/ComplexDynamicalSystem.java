package arb.functions.complex.dynamics;

import arb.*;
import arb.functions.complex.*;

public abstract class ComplexDynamicalSystem<F extends ComplexFunction>
{
  F f;

  /**
   * 
   * @param z0
   * @return a trajectory where each point of the trajectory is equal to the same
   *         phase , z0, {@link Complex#arg(int, Real)}
   */
  public NewtonFlow<F> flowFrom(Complex z0)
  {
    return new NewtonFlow(f);
  }
}
