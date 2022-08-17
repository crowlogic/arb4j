package arb.stochastic.processes.integrators;

import java.util.Iterator;

import arb.Lockable;
import arb.Real;
import arb.Verifiable;
import arb.stochastic.processes.ContinuousTimeState;
import arb.stochastic.processes.DiffusionProcessState;

public abstract class MultivariateDiffusionProcessState extends
                                                        ContinuousTimeState<DiffusionProcessState> implements
                                                        MultivariateState<DiffusionProcessState>,
                                                        Iterable<DiffusionProcessState>,
                                                        Verifiable
{

  @Override
  public void lock()
  {
    super.lock();
    for (Lockable x : this)
    {
      x.lock();
    }
  }

  @Override
  public void unlock()
  {
    super.unlock();
    for (Lockable x : this)
    {
      x.unlock();
    }
  }

  @Override
  public MultivariateDiffusionProcessState setdt(Real dt)
  {
    super.setdt(dt);
    for (DiffusionProcessState state : this)
    {
      state.setdt(dt);
    }
    return this;

  }

  /**
   * Calls super{@link #setTime(Real)} and then iterates thru each dimension of
   * this state calling {@link DiffusionProcessState#setTime(Real)} , so as to
   * keep the time variable in lock-step between state transitions
   */
  @Override
  public ContinuousTimeState setTime(Real t)
  {
    super.setTime(t);
    for (DiffusionProcessState state : this)
    {
      state.setTime(t);
    }
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

  @Override
  public abstract DiffusionProcessState getState(int i);

}
