package arb.stochastic.processes;

import static arb.RealConstants.zero;

import arb.Float;
import arb.Real;
import arb.dynamical.systems.State;

public abstract class ContinuousTimeState implements
                                          AutoCloseable,
                                          State<Real>
{

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
    assert !prevTime.isFinite()
                  || time.compareTo(prevTime) > 0 : "this isnt programmed for backwards time translation";
    prevTime.set(time);
    time.set(t);
    return this;
  }

  public final ContinuousTimeState setTime(Real t)
  {
    assert !prevTime.isFinite()
                  || time.compareTo(prevTime) > 0 : "this isnt programmed for backwards time translation, time="
                                + time + " prevTime=" + prevTime;
    prevTime.set(time);
    time.set(t);
    return this;
  }

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
      return result.set(zero);
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

  public final Real setdt(Real dt)
  {
    return this.dt.set(dt);
  }

}