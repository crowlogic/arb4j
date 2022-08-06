package arb.stochastic.processes;

import static arb.RealConstants.zero;

import arb.Float;
import arb.RandomState;
import arb.Real;
import arb.dynamical.systems.State;

public class ContinuousTimeState implements
                                 AutoCloseable, State<Real>
{

  protected final Real prevTime = new Real().negInf();
  protected final Real time     = new Real().negInf();
  public final Real    sqrtdt   = new Real().indeterminate();
  public final Real    dt       = new Real().indeterminate();

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

  public synchronized ContinuousTimeState setTime(Float t)
  {
    assert !prevTime.isFinite()
                  || time.compareTo(prevTime) > 0 : "this isnt programmed for backwards time translation";
    prevTime.set(time);
    time.set(t);
    return this;
  }

  public ContinuousTimeState setTime(Real t)
  {
    assert !prevTime.isFinite()
                  || time.compareTo(prevTime) > 0 : "this isnt programmed for backwards time translation, time="
                                + time + " prevTime=" + prevTime;
    prevTime.set(time);
    time.set(t);
    return this;
  }

  /**
   * @param result
   * @return
   */
  public synchronized Real getδt(Real result)
  {
    if (dt.isFinite())
    {
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

  public Real time()
  {
    return time;

  }

  public Real sqrtdt(int prec, Real result)
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

  public Real setδt(Real dt)
  {
    return this.dt.set(dt);
  }

  @Override
  public RandomState getRandomState()
  {
    assert false : "implement me";
    return null;
    
  }

}