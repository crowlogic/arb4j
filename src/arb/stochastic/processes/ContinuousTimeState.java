package arb.stochastic.processes;

import static arb.RealConstants.*;
import static arb.utensils.Utilities.*;

import arb.*;
import arb.Float;
import arb.dynamical.systems.*;

public abstract class ContinuousTimeState<S> implements
                                         AutoCloseable,
                                         State<S>,
                                         Lockable
{
  @Override
  public boolean locked()
  {
    return locked;
  }

  private boolean locked = false;

  @Override
  public void lock()
  {
    assert !locked : "this " + getClass().getSimpleName() + " is already locked";
    locked = true;
  }

  @Override
  public void unlock()
  {
    assert locked : "this " + getClass().getSimpleName() + " isn't locked";
    locked = false;
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

  public ContinuousTimeState setTime(Real t)
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

  public ContinuousTimeState<S> setdt(Real dt)
  {
    checkLock();
    dt.printPrecision = true;
    println("Setting " + this.getClass().getSimpleName() + ".dt to " + dt.toString(10));

    this.dt.set(dt);
    return this;
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