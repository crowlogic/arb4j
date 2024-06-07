package arb.stochastic.processes.integrators;

import java.lang.ref.Cleaner.Cleanable;

import arb.Float;
import arb.Real;
import arb.Verifiable;
import arb.stochastic.processes.ContinuousTimeState;
import arb.stochastic.processes.DiffusionProcess;

/**
 * <pre>
 * Represents an abstract base class for implementing diffusion process
 * integrators. This class provides a common structure for integrating
 * continuous-time state diffusion processes.
 * 
 * This class implements the {@link DiffusionProcessIntegrator} interface, 
 * as well as {@link AutoCloseable}, {@link Cleanable}, and {@link Verifiable} 
 * interfaces, providing basic functionality for handling resources and 
 * verification of the integration process.
 * 
 * Subclasses are expected to implement specific integration algorithms for
 * various diffusion processes.
 * </pre>
 * 
 * @param <S> The type of {@link ContinuousTimeState} used in the diffusion
 *            process.
 * @param <D> The type of {@link DiffusionProcess} to be integrated.
 */
public abstract class AbstractDiffusionProcessIntegrator<S extends ContinuousTimeState, D extends DiffusionProcess<S>>
                                                        implements
                                                        DiffusionProcessIntegrator<S, D>,
                                                        AutoCloseable,
                                                        Cleanable,
                                                        Verifiable
{

  public S        state;
  public D        diffusionProcess;
  public boolean  verbose = false;

  protected Float T       = new Float();
  protected Real  μi      = new Real();
  protected Real  σi      = Real.newVector(2);
  protected Real  sqrtdt  = new Real();

  @Override
  public boolean verify()
  {
    return true;
  }

  public AbstractDiffusionProcessIntegrator(D x)
  {
    diffusionProcess  = x;
    μi.printPrecision = true;
    σi.printPrecision = true;
  }

  @Override
  public void clean()
  {
    close();
  }

  @Override
  public void close()
  {
    T.close();
    μi.close();
    σi.close();
    sqrtdt.close();
  }
}