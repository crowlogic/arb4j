package arb.stochastic.processes.integrators;

import java.util.Iterator;

import arb.RandomState;
import arb.Real;
import arb.Verifiable;
import arb.stochastic.processes.ContinuousTimeState;
import arb.stochastic.processes.DiffusionProcessState;

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
  public void lock()
  {
    super.lock();
    forEach(DiffusionProcessState::lock);
  }

  @Override
  public void unlock()
  {
    super.unlock();
    forEach(DiffusionProcessState::unlock);
  }

  @Override
  public MultivariateDiffusionProcessState setdt(Real dt)
  {
    super.setdt(dt);
    forEach(state -> state.setdt(dt));
    return this;

  }

  /**
   * Calls super{@link #setTime(Real)} and then iterates thru each dimension of
   * this state calling {@link DiffusionProcessState#setTime(Real)} , so as to
   * keep the time variable in lock-step between state transitions
   */
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
