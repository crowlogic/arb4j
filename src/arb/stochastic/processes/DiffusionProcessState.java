package arb.stochastic.processes;

import arb.Float;
import arb.Real;
import arb.RealOrderedPair;

/**
 * The arguments passed to the functions representing the drift rate
 * {@link DiffusionProcess#μ()} and diffusion rate {@link DiffusionProcess#σ()}
 * which would be expresed in mathematical notation as μ(Sₜ,t) and σ(Sₜ,t) for
 * the drift and diffusion respectively
 */
public class DiffusionProcessState extends
                                         RealOrderedPair
{

  public DiffusionProcessState()
  {
    super();
  }

  public DiffusionProcessState(Real a, Real b)
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

  public DiffusionProcessState setTime(Float t)
  {
    b.set(t);
    return this;
  }

  public DiffusionProcessState setValue(Real x)
  {
    a.set(x);
    return this;
  }
}
