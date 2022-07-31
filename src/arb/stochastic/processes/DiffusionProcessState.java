package arb.stochastic.processes;

import static arb.RealConstants.zero;

import java.lang.ref.Cleaner.Cleanable;

import arb.Float;
import arb.Real;
import arb.dynamical.systems.State;

/**
 * The arguments passed to the functions representing the drift rate
 * {@link DiffusionProcess#μ()} and diffusion rate {@link DiffusionProcess#σ()}
 * which would be expresed in mathematical notation as μ(Sₜ,t) and σ(Sₜ,t) for
 * the drift and diffusion respectively
 */
public class DiffusionProcessState implements State,
                                   AutoCloseable,
                                   Cleanable
{
  @Override
  public String toString()
  {
    return String.format("DiffusionProcessState[prevTime=%s, time=%s, value=%s, dt=%s]", prevTime, time, value, dt.toFixedString());
  }

  private final Real prevTime = new Real().negInf();

  private final Real time     = new Real().negInf();

  @Override
  public void close()
  {
    dt.close();
    time.close();
    prevTime.close();
    value.close();
  }

  public final Real value = new Real();

  public final Real dt    = new Real().indeterminate();

  /**
   * 
   * @return value at this{@link #dt()}
   */
  public Real value()
  {
    return value;
  }

  public synchronized DiffusionProcessState setTime(Float t)
  {
    assert !prevTime.isFinite()
                  || time.compareTo(prevTime) > 0 : "this isnt programmed for backwards time translation";
    prevTime.set(time);
    time.set(t);
    return this;
  }

  public synchronized DiffusionProcessState setTime(Real t)
  {
    assert !prevTime.isFinite()
                  || time.compareTo(prevTime) > 0 : "this isnt programmed for backwards time translation";
    prevTime.set(time);
    time.set(t);
    return this;
  }

  public DiffusionProcessState setValue(Real x)
  {
    value.set(x);
    return this;
  }

  @Override
  public void clean()
  {
    close();
  }

  /**
   * @param result
   * @return
   */
  public synchronized Real dt(Real result)
  {
    if (dt.isFinite())
    {
      return dt;
    }
    if (!prevTime.isFinite())
    {
      return zero;
    }
    assert time.compareTo(prevTime) > 0 : "this isnt programmed for backwards time translation, time=" + time
                  + " prevTime=" + prevTime;
    return time.sub(prevTime, time.bits(), result);
  }

  public Real getTime()
  {
    return time;

  }

}
