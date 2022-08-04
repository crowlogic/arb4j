package arb.stochastic.processes.integrators;

import java.lang.ref.Cleaner.Cleanable;

import arb.Float;
import arb.Real;
import arb.stochastic.processes.DiffusionProcess;
import arb.stochastic.processes.DiffusionProcessState;

public abstract class AbstractStochasticIntegrator<S extends DiffusionProcessState, D extends DiffusionProcess<S>>
                                                  implements
                                                  StochasticIntegrator<S, D>,
                                                  AutoCloseable,
                                                  Cleanable
{
  @Override
  public D X()
  {
    return X;
  }

  public S        state;
  public D        X;
  public boolean  verbose = false;

  protected Float T       = new Float();
  protected Real  μi      = new Real();
  protected Real  σi      = Real.newVector(2);
  protected Real  sqrtδt  = new Real();
  public int      i       = -1;

  public AbstractStochasticIntegrator(D x)
  {
    X                 = x;
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