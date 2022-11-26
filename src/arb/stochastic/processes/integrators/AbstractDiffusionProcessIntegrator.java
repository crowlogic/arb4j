package arb.stochastic.processes.integrators;

import java.awt.Color;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.lang.ref.Cleaner.Cleanable;

import javax.swing.JFrame;

import arb.Float;
import arb.Real;
import arb.stochastic.processes.ContinuousTimeState;
import arb.stochastic.processes.DiffusionProcess;
import arb.utensils.Utilities;

public abstract class AbstractDiffusionProcessIntegrator<S extends ContinuousTimeState, D extends DiffusionProcess<S>>
                                                        implements
                                                        DiffusionProcessIntegrator<S, D>,
                                                        AutoCloseable,
                                                        Cleanable
{

  protected static final Color COLOR1  = new Color(55,
                                                   170,
                                                   200);

  protected static final Color COLOR2  = new Color(200,
                                                   80,
                                                   75);

  public S                     state;
  public D                     diffusionProcess;
  public boolean               verbose = true;

  protected Float              T       = new Float();
  protected Real               μi      = new Real();
  protected Real               σi      = Real.newVector(2);
  protected Real               sqrtdt  = new Real();

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