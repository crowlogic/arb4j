package arb.stochastic.processes;

import java.lang.ref.Cleaner.Cleanable;

import arb.Lockable;
import arb.RandomState;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.stochastic.processes.integrators.State;

/**
 * The arguments passed to the functions representing the drift rate
 * {@link DiffusionProcess#μ(int)} and diffusion rate
 * {@link DiffusionProcess#σ(int)} which would be expressed in mathematical
 * notation as μ(Sₜ,t) and σ(Sₜ,t) for the drift and diffusion respectively
 * 
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class DiffusionProcessState extends
                                   ContinuousTimeState implements
                                   State,
                                   AutoCloseable,
                                   Cleanable,
                                   Lockable<ContinuousTimeState>
{

  public RandomState randomState;

  public final Real  value = new Real();

  public DiffusionProcessState(RandomState randomState)
  {
    this.randomState     = randomState;
    value.printPrecision = true;
  }

  /**
   * initialize with a specified {@link RandomState} and call
   * this{@link #setValue(Real)} to set the initial value of the process
   */
  public DiffusionProcessState(Real S0,
                               RandomState randomState)
  {
    this(
         randomState);
    setValue(S0);
  }

  @Override
  public void clean()
  {
    close();
  }

  @Override
  public void close()
  {
    super.close();
    value.close();
  }

  @Override
  public RandomState getRandomState()
  {
    return randomState;
  }

  public void setIndex(int index)
  {
    checkLock();
    this.i = index;
  }

  public DiffusionProcessState setValue(Real x)
  {
    assert x.isFinite() : x + " is not finite";
    checkLock();
    value.set(x);
    return this;
  }

  @Override
  public String toString()
  {
    return String.format("DiffusionProcessState[i=%s, prevTime=%s, time=%s, value=%s, dt=%s, seed=%s]",
                         i,
                         prevTime(),
                         time(),
                         value,
                         dt().toFixedString(),
                         randomState.getInitialValue());
  }

  /**
   * 
   * @return value at this{@link #dt()}
   */
  public Real value()
  {
    return value;
  }

}
