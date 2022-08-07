package arb.stochastic.processes;

import java.lang.ref.Cleaner.Cleanable;

import arb.RandomState;
import arb.Real;
import arb.dynamical.systems.State;

/**
 * The arguments passed to the functions representing the drift rate
 * {@link DiffusionProcess#μ(int)} and diffusion rate
 * {@link DiffusionProcess#σ(int)} which would be expressed in mathematical
 * notation as μ(Sₜ,t) and σ(Sₜ,t) for the drift and diffusion respectively
 * 
 */
public class DiffusionProcessState extends
                                   ContinuousTimeState implements
                                   State<Real>,
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

  public RandomState randomState;

  @Override
  public String toString()
  {
    return String.format("DiffusionProcessState[prevTime=%s, time=%s, value=%s, dt=%s, seed=%s]",
                         prevTime(),
                         time(),
                         value,
                         dt().toFixedString(),
                         randomState.getInitialValue());
  }

  

  @Override
  public void close()
  {
    super.close();
    value.close();
  }

  public final Real value = new Real();

  /**
   * 
   * @return value at this{@link #dt()}
   */
  public Real value()
  {
    return value;
  }

  public DiffusionProcessState setValue(Real x)
  {
    assert x.isFinite() : x + " is not finite";
    value.set(x);
    return this;
  }

  @Override
  public void clean()
  {
    close();
  }

  @Override
  public RandomState getRandomState()
  {
    return randomState;
  }

}
