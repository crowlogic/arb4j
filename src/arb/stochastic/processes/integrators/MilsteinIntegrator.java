package arb.stochastic.processes.integrators;

import static arb.ComplexConstants.*;
import static arb.FloatConstants.*;
import static arb.utensils.Utilities.*;

import arb.*;
import arb.Float;
import arb.dynamical.systems.*;
import arb.stochastic.processes.*;
import de.erichseifert.gral.data.*;

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
    return String.format("MilsteinIntegrator[X=%s, sqrtδt=%s]", state, X, sqrtδt);
  }

  public static void main(String args[])
  {

    OrnsteinUhlenbeckProcess process = new OrnsteinUhlenbeckProcess(new Real("1.2",
                                                                             128),
                                                                    new Real("2",
                                                                             128),
                                                                    new Real("1.5",
                                                                             128));
    try ( MilsteinIntegrator integrator = new MilsteinIntegrator(process,
                                                                 new DiffusionProcessState(new Real("3",
                                                                                                    128))))
    {

      System.out.println("state.seed=" + integrator.state.randomState.getInitialValue());

      // Generate data
      DataTable          data = new DataTable(Double.class,
                                              Double.class);

      EvaluationSequence path = integrator.integrate(new FloatInterval(0,
                                                                       5),
                                                     750,
                                                     prec);

      for (RealOrderedPair sample : path)
      {
        data.add(sample.a.doubleValue(), sample.b.doubleValue());
      }

      print(data);

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
    Real xi = evalSequence.values.get(++evalSequence.i); // xi is the i-th sample from a standard normal distribution
    xi.printPrecision = true;
    println(this + ".step..state=" + state);
    μ.evaluate(state, 1, prec, μi).mul(state.dt, prec);
    assert μi.isFinite();
    σ.evaluate(state, 2, prec, σi).mul(xi, prec).mul(sqrtδt, prec);
    assert σi.isFinite();
    // 2nd order correction
    σi.mul(σi.get(1), prec, σσi).mul(state.dt, prec).div(2, prec).mul(xi.pow(2, prec).sub(1, prec), prec);

    // the derivative is in σi.get(1) .. the 2nd
    // order to be added is ( (Zₜ)² - 1 ) * ( dt * σ(Xₜ)∂Xₜ * σ(Xₜ) ) / 2 where
    // σ(Xₜ)∂Xₜ is the derivative of σ relative to X, which is a function of t,
    // but this method will not work if either coefficient function depends directly
    // on t
    return evalSequence;
  }

  @Override
  public EvaluationSequence jump(D state, int prec, EvaluationSequence evalSequence)
  {
    Real xi = evalSequence.values.get(evalSequence.i); // xi is the i-th sample from a standard normal distribution

    // xi = xi + μi * δt + σi * Z + ( dt * δσi * σi ) * ( (Zₜ)² - 1 ) / 2
    // where Z is a drawn from a standard Gaussian N(0,1) and xi is the value of Xₜ
    // at the i-th element of the partition of the interval of integration
    state.setValue(μi.add(σi, prec, xi).add(σσi, prec).add(state.value(), prec));

    if (verbose)
    {
      System.out.format("i=%s time=%s μi=%s σi=%s xi=%s\n state=%s\n",
                        evalSequence.i,
                        state.time().toString(7),
                        μi,
                        σi,
                        xi,
                        state);
    }

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
