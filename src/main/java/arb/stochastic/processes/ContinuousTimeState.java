package arb.stochastic.processes;

import static arb.RealConstants.zero;

import arb.Lockable;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.stochastic.processes.integrators.State;
import arb.Float;

/**
 * 
 * ContinuousTimeState represents the state of a continuous-time dynamical
 * system. It provides methods to manage the state's time and time step (dt)
 * properties, as well as handling locking and unlocking for safe state
 * modifications. This class is intended to be used in conjunction with
 * continuous-time dynamical systems and their corresponding states.
 * 
 * @param <S> The type of the state for the continuous-time dynamical system
 *
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class ContinuousTimeState implements
                                          AutoCloseable,
                                          State,
                                          Lockable<ContinuousTimeState>
{
  @Override
  public boolean locked()
  {
    return locked;
  }

  private boolean locked = false;

  @Override
  public ContinuousTimeState lock()
  {
    assert !locked : "this " + getClass().getSimpleName() + " is already locked";
    locked = true;
    return this;
  }

  @Override
  public ContinuousTimeState unlock()
  {
    assert locked : "this " + getClass().getSimpleName() + " isn't locked";
    locked = false;
    return this;
  }

  private final Real prevTime = new Real().negInf();
  private final Real time     = new Real().negInf();
  private final Real sqrtdt   = new Real().indeterminate();
  private final Real dt       = new Real().indeterminate();

  public ContinuousTimeState()
  {
    super();
  }

  @Override
  public void close()
  {
    prevTime.close();
    time.close();
    sqrtdt.close();
    dt.close();
  }

  /**
   * TODO: support variable this{@link #dt}
   */
  public synchronized final ContinuousTimeState setTime(Float t)
  {
    checkLock();
    assert !prevTime.isFinite()
                  || time.compareTo(prevTime) > 0 : "this isnt programmed for backwards time translation";
    prevTime.set(time);
    time.set(t);
    return this;
  }

  public synchronized ContinuousTimeState setTime(Real t)
  {
    checkLock();
    t.printPrecision = true;
    // println("Setting " + this.getClass().getSimpleName() + ".time to " +
    // t.toString(10));
    assert prevTime != null && t != null
                  && t.compareTo(prevTime) > 0 : "this isnt programmed for backwards time translation, time=" + time
                                + " prevTime=" + prevTime;
    prevTime.set(time);
    time.set(t);
    return this;
  }

  /**
   * TODO: employ the copy-on-write feature of memory-mapping to effectively make
   * the returned value immutable by other callers
   * 
   * @return
   */
  public final Real dt()
  {
    return getdt(null);
  }

  /**
   * @param result
   * @return
   */
  public synchronized final Real getdt(Real result)
  {

    if (dt.isFinite())
    {
      if (result == null)
      {
        return dt;
      }

      // return the fixed-length step-size if its set
      return result.set(dt);
    }
    if (!prevTime.isFinite())
    {
      if (result == null)
      {
        return zero;
      }
      else
      {
        return result.set(zero);
      }
    }
    assert time.compareTo(prevTime) > 0 : "this isnt programmed for backwards time translation, time=" + time
                  + " prevTime=" + prevTime;
    return time.sub(prevTime, time.bits(), result);
  }

  public final Real prevTime()
  {
    return prevTime;
  }

  public final Real time()
  {
    return time;

  }

  public final Real sqrtdt(int prec, Real result)
  {
    if (sqrtdt.isFinite() && !sqrtdt.isZero())
    {
      return result.set(sqrtdt);
    }
    if (dt.isFinite())
    {
      return result.set(dt.sqrt(prec, sqrtdt));
    }
    assert time.compareTo(prevTime) > 0 : "this isnt programmed for backwards time translation, time=" + time
                  + " prevTime=" + prevTime;
    return time.sub(prevTime, prec, result).sqrt(prec);

  }

  @Override
  public Real setdt(Real dt)
  {
    this.dt.set(dt);
    return dt;
  }

  protected int i = 0;

  /**
   * 
   * @return
   */
  public final int index()
  {
    return i;
  }

  /**
   * 
   * @return i-- if this isn't this{@link #locked()} otherwise an
   *         {@link AssertionError} is thrown if assertions are enabled with -ea
   */
  public final int prevIndex()
  {
    checkLock();
    return i--;
  }

  /**
   * 
   * @return i++ if this isn't this{@link #locked()} otherwise an
   *         {@link AssertionError} is thrown if assertions are enabled with -ea
   */
  public final int nextIndex()
  {
    checkLock();
    return i++;
  }

}