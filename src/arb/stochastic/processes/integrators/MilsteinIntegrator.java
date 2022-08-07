package arb.stochastic.processes.integrators;

import static arb.ComplexConstants.prec;
import static arb.FloatConstants.one;
import static arb.utensils.Utilities.println;

import arb.EvaluationSequence;
import arb.Float;
import arb.FloatInterval;
import arb.RandomState;
import arb.Real;
import arb.RealOrderedPair;
import arb.dynamical.systems.DiscreteTimeDynamicalSystem;
import arb.stochastic.processes.DiffusionProcess;
import arb.stochastic.processes.DiffusionProcessState;
import arb.stochastic.processes.OrnsteinUhlenbeckProcess;
import de.erichseifert.gral.data.DataTable;

/**
 * Integrates a {@link DiffusionProcess} via Milstein's method
 * 
 * <pre>
 * dXₜ = μ(Xₜ)*dt + σ(Xₜ)*dBₜ + ( (Zₜ)² - 1 ) * ( dt * σ(Xₜ)∂Xₜ * σ(Xₜ) ) / 2
 * </pre>
 * 
 * where σ(Xₜ)∂Xₜ is the derivative of σ relative to X, not t; and Bₜ is a
 * BrownianMotion also-known-as a WienerProcess having zero mean drift and
 * standard deviation parameter σ=√(dt) such that the variance is dt, the time
 * elapsed between invocations of
 * {@link DiscreteTimeDynamicalSystem}{@link #jump(DiffusionProcessState, int, EvaluationSequence)}.
 * This method is only applicable to processes whose drift and diffusions do not
 * *directly* depend on t. TODO: find a way to assert this, at compile-time
 * preferably. <br>
 * <br>
 * 
 * The key to the Milstein scheme is that the accuracy of the discretization is
 * increased by considering expansions of the coefficients μₜ=μ(Sₜ) and σₜ=σ(Sₜ)
 * via Itō’s lemma.
 */
public class MilsteinIntegrator<P extends DiffusionProcess<D>, D extends DiffusionProcessState> extends
                               EulerIntegrator<P, D> implements
                               AutoCloseable
{

  @Override
  public String toString()
  {
    return String.format("MilsteinIntegrator[X=%s, sqrtδt=%s, state=%s]", diffusionProcess, sqrtdt, state);
  }

  public static void main(String args[])
  {

    OrnsteinUhlenbeckProcess process = new OrnsteinUhlenbeckProcess(new Real("1.5",
                                                                             128),
                                                                    new Real("2",
                                                                             128),
                                                                    new Real("0.1",
                                                                             128));
    try ( var integrator = new MilsteinIntegrator(process,
                                                  new DiffusionProcessState(new Real("3",
                                                                                     128),
                                                                            new RandomState(31337)));)
    {

      // Generate data
      DataTable data = new DataTable(Double.class,
                                     Double.class);

      var       path = integrator.integrate(new FloatInterval(0,
                                                              5),
                                            750,
                                            prec);

      for (RealOrderedPair sample : path)
      {
        data.add(sample.a.doubleValue(), sample.b.doubleValue());
      }

      integrator.print(data);

      println("mean=" + path.values.arithmeticMean(128, new Real()) + " " + path.partition.dt);
    }

  }

  @Override
  public void close()
  {
    super.close();
    σσi.close();

  }

  Real σσi = new Real();

  @Override
  public EvaluationSequence step(D state, int prec, EvaluationSequence evalSequence)
  {
    Real xi = step(state, prec, evalSequence, 2).values.get(state.index());

    // 2nd order correction
    σi.mul(σi.get(1), prec, σσi);
    assert σi.isFinite() && σi.get(1).isFinite() : "σ is not finite " + σσi + "\nσ=" + σi + " xi=" + xi;

    assert σσi.isFinite() : "σσ is not finite " + σσi + "\nσ=" + σi;
    σσi.mul(state.dt(), prec).div(2, prec).mul(xi.pow(2, prec).sub(1, prec), prec);

    μi.add(σi, prec, xi).add(σσi, prec);

    // the derivative is in σi.get(1) .. the 2nd
    // order to be added is ( (Zₜ)² - 1 ) * ( dt * σ(Xₜ)∂Xₜ * σ(Xₜ) ) / 2 where
    // σ(Xₜ)∂Xₜ is the derivative of σ relative to X, which is a function of t,
    // but this method will not work if either coefficient function depends directly
    // on t
    return evalSequence;
  }

  public MilsteinIntegrator(P x, D state)
  {
    super(x,
          state);
  }

  @Override
  public Float weakConvergenceOrder()
  {
    return one;
  }

  @Override
  public Float strongConvergenceOrder()
  {
    return one;
  }

}
