package arb.stochastic.processes;

import arb.Real;
import arb.RealOrderedPair;

/**
 * The arguments passed to the functions representing the drift rate
 * {@link DiffusionProcess#μ()} and diffusion rate {@link DiffusionProcess#σ()}
 * which would be expresed in mathematical notation as μ(Sₜ,t) and σ(Sₜ,t) for
 * the drift and diffusion respectively
 */
public class DiffusionProcessCoordinates extends
                                         RealOrderedPair
{

  public DiffusionProcessCoordinates()
  {
    super();
  }

  public DiffusionProcessCoordinates(Real a, Real b)
  {
    super(a,
          b);
  }

  /**
   * 
   * @return value at this{@link #time()}
   */
  public Real value()
  {
    return a;
  }

  /**
   * 
   * @return the time
   */
  public Real time()
  {
    return b;
  }
}
