package arb.stochastic.processes.integrators;

import java.util.Iterator;

import arb.RandomState;
import arb.Real;
import arb.Verifiable;
import arb.stochastic.processes.ContinuousTimeState;
import arb.stochastic.processes.DiffusionProcessState;

/**
 * 
 * This abstract class represents the state of a multivariate diffusion process,
 * which is a system of stochastic differential equations (SDEs) describing the
 * evolution of multiple random variables. It extends the
 * {@link DiffusionProcessState} class and provides additional functionality
 * specific to multivariate processes. The class implements
 * {@link MultivariateState}, {@link Iterable}, and {@link Verifiable}
 * interfaces to provide methods for iterating through the dimensions of the
 * multivariate process, verifying the state, and managing the state's lock and
 * unlock behavior. Additionally, it ensures that the time variable remains
 * synchronized across all dimensions during state transitions.
 * 
 * @see DiffusionProcessState
 * @see MultivariateState
 * @see Iterable
 * @see Verifiable
 */
public abstract class MultivariateDiffusionProcessState extends
                                                        DiffusionProcessState implements
                                                        MultivariateState<DiffusionProcessState>,
                                                        Iterable<DiffusionProcessState>,
                                                        Verifiable
{

  public MultivariateDiffusionProcessState(RandomState randomState)
  {
    super(randomState);
  }

  @Override
  public MultivariateDiffusionProcessState lock()
  {
    super.lock();
    forEach(DiffusionProcessState::lock);
    return this;
  }

  @Override
  public MultivariateDiffusionProcessState unlock()
  {
    super.unlock();
    forEach(DiffusionProcessState::unlock);
    return this;
  }

  @SuppressWarnings("resource")
  @Override
  public Real setdt(Real dt)
  {
    super.setdt(dt);
    forEach(state -> state.setdt(dt));
    return dt;

  }

  /**
   * Calls super{@link #setTime(Real)} and then iterates thru each dimension of
   * this state calling {@link DiffusionProcessState#setTime(Real)} , so as to
   * keep the time variable in lock-step between state transitions
   */
  @SuppressWarnings("resource")
  @Override
  public synchronized ContinuousTimeState setTime(Real t)
  {
    super.setTime(t);
    forEach(state -> state.setTime(t));
    return this;
  }

  public final class DiffusionProcessStateIterator implements
                                                   Iterator<DiffusionProcessState>
  {
    int i;

    @Override
    public boolean hasNext()
    {
      return i < dim();
    }

    @Override
    public DiffusionProcessState next()
    {
      return getState(i++);
    }
  }

  @Override
  public Iterator<DiffusionProcessState> iterator()
  {
    return new DiffusionProcessStateIterator();

  }

  /**
   * Sets each of the dimensions indices to this{@link #index()}
   */
  public void resetIndices()
  {
    final int index = index();

    for (int i = 0; i < dim(); i++)
    {
      getState(i).setIndex(index);
    }
  }

}
