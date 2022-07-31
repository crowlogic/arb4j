package arb.stochastic.processes.integrators;

import java.lang.ref.Cleaner.Cleanable;

import arb.Float;
import arb.Real;
import arb.stochastic.processes.*;

public abstract class AbstractStochasticIntegrator implements
                                                   StochasticIntegrator,
                                                   AutoCloseable,
                                                   Cleanable
{

  public DiffusionProcess                X;
  public boolean                         verbose = false;
  protected DriftCoeffecientFunction     μ;
  protected DiffusionCoeffecientFunction σ;
  protected Float                        T       = new Float();
  protected Real                         μi      = new Real();
  protected Real                         σi      = Real.newVector(2);
  protected Real                         sqrtδt  = new Real();

  public AbstractStochasticIntegrator(DiffusionProcess x)
  {
    X                 = x;
    μ                 = X.μ();
    σ                 = X.σ();
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