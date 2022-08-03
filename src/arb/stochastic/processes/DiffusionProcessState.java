package arb.stochastic.processes;

import static arb.RealConstants.zero;

import java.lang.ref.Cleaner.Cleanable;

import arb.Float;
import arb.RandomState;
import arb.Real;
import arb.dynamical.systems.State;

/**
 * The arguments passed to the functions representing the drift rate
 * {@link DiffusionProcess#μ()} and diffusion rate {@link DiffusionProcess#σ()}
 * which would be expresed in mathematical notation as μ(Sₜ,t) and σ(Sₜ,t) for
 * the drift and diffusion respectively
 */
public class DiffusionProcessState implements
                                   State,
                                   AutoCloseable,
                                   Cleanable
{
  public DiffusionProcessState(RandomState randomState)
  {
    this.randomState     = randomState;
    value.printPrecision = true;
  }

  /**
   * initialize with a randomly generated initial value seed
   */
  public DiffusionProcessState()
  {
    this(new RandomState((int) (Math.random() * Integer.MAX_VALUE)));
  }

  /**
   * initialize with a randomly generated initial value seed and call
   * this{@link #setValue(Real)} to set the initial value of the process
   */
  public DiffusionProcessState(Real S0)
  {
    this(new RandomState((int) (Math.random() * Integer.MAX_VALUE)));
    setValue(S0);
  }

  public final RandomState randomState;

  @Override
  public String toString()
  {
    return String.format("DiffusionProcessState[prevTime=%s, time=%s, value=%s, dt=%s, randomState=%s]",
                         prevTime,
                         time,
                         value,
                         dt.toFixedString(),
                         randomState);
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

  public final Real value  = new Real();

  public final Real sqrtdt = new Real().indeterminate();

  public final Real dt     = new Real().indeterminate();

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

  public synchronized <D extends DiffusionProcessState> D setTime(Real t)
  {
    assert !prevTime.isFinite()
                  || time.compareTo(prevTime) > 0 : "this isnt programmed for backwards time translation, time="
                                + time + " prevTime=" + prevTime;
    prevTime.set(time);
    time.set(t);
    return (D) this;
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
      // return the fixed-length step-size if its set
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

  public Real time()
  {
    return time;

  }

  public Real sqrtdt(int prec, Real result)
  {
    if (sqrtdt.isFinite())
    {
      return sqrtdt;
    }
    if (dt.isFinite())
    {
      return dt.sqrt(prec, sqrtdt);
    }
    assert time.compareTo(prevTime) > 0 : "this isnt programmed for backwards time translation, time=" + time
                  + " prevTime=" + prevTime;
    time.sub(prevTime, prec, result);
    result.sqrt(prec, result);
    return result;

  }

}
