package arb.stochastic.processes.integrators;

import java.lang.ref.Cleaner.Cleanable;

import arb.Float;
import arb.Real;
import arb.dynamical.systems.*;
import arb.stochastic.processes.DiffusionProcess;
import arb.stochastic.processes.DiffusionProcessState;

public abstract class AbstractStochasticIntegrator<S extends State> implements
                                                  StochasticIntegrator<S>,
                                                  AutoCloseable,
                                                  Cleanable
{

  public S                       state;
  public DiffusionProcess<S> process;
  public boolean                 verbose = true;

  protected Float                T       = new Float();
  protected Real                 μi      = new Real();
  protected Real                 σi      = Real.newVector(2);
  protected Real                 sqrtδt  = new Real();
  public int                     i       = -1;

  public AbstractStochasticIntegrator(DiffusionProcess<S> x)
  {
    process                 = x;
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
    sqrtδt.close();
  }
}