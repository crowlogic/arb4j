package arb.stochastic.processes;

import static arb.RealConstants.zero;

import java.lang.ref.Cleaner.Cleanable;

import arb.Float;
import arb.Real;

/**
 * The arguments passed to the functions representing the drift rate
 * {@link DiffusionProcess#μ()} and diffusion rate {@link DiffusionProcess#σ()}
 * which would be expresed in mathematical notation as μ(Sₜ,t) and σ(Sₜ,t) for
 * the drift and diffusion respectively
 */
public class DiffusionProcessState implements
                                   AutoCloseable,
                                   Cleanable
{
  @Override
  public String toString()
  {
    return String.format("DiffusionProcessState[prevTime=%s, time=%s, value=%s, mesh=%s]",
                         prevTime,
                         time,
                         value,
                         mesh);
  }

  private final Real prevTime = new Real().negInf();

  private final Real time     = new Real().negInf();

  @Override
  public void close()
  {
    dt.close();
    mesh.close();
    time.close();
    prevTime.close();
    value.close();
  }

  public final Real value = new Real();

  public Real       mesh  = new Real();

  private Real      dt    = new Real();

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

  public synchronized Real dt()
  {
    if (!prevTime.isFinite())
    {
      return zero;
    }
    assert time.compareTo(prevTime) > 0 : "this isnt programmed for backwards time translation, time=" + time
                  + " prevTime=" + prevTime;
    return time.sub(prevTime, time.bits(), dt);
  }

  public Real getTime()
  {
    return time;

  }


}
