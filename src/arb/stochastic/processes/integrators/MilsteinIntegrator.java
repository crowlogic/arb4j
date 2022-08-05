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
public class MilsteinIntegrator<S extends DiffusionProcessState, P extends DiffusionProcess<S>> extends
                               EulerIntegrator<S, P> implements
                               AutoCloseable
{

  @Override
  public String toString()
  {
    return String.format("MilsteinIntegrator[X=%s, sqrtδt=%s, state=%s]", process, sqrtδt, state);
  }

  public static void main(String args[])
  {

    OrnsteinUhlenbeckProcess process = new OrnsteinUhlenbeckProcess(new Real("1.2",
                                                                             128),
                                                                    new Real("2",
                                                                             128),
                                                                    new Real("1.5",
                                                                             128));
    try ( MilsteinIntegrator integrator = new MilsteinIntegrator<DiffusionProcessState, OrnsteinUhlenbeckProcess>(process,
                                                                                                                  new DiffusionProcessState(new Real("3",
                                                                                                                                                     128))))
    {

      System.out.println("state.seed=" + integrator.state.getRandomState().getInitialValue());

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
  public EvaluationSequence step(S state, int prec, EvaluationSequence evalSequence)
  {
    assert state.dt != null && state.dt.isFinite() : "state is null or not finite";
    setSqrtδt(state, prec);
    Real xi = evalSequence.values.get(++i); // xi is the i-th sample from a standard normal distribution
    xi.printPrecision = true;
    μ.evaluate(state, 1, prec, μi);
    assert μi.isFinite() : μi + " is not finite for μ=" + μ.getClass().getSimpleName() + " X=" + process + "\nstate="
                  + state;
    μi.mul(state.dt, prec);
    σ.evaluate(state, 2, prec, σi);
    assert σi.isFinite() && σi.get(1).isFinite() : "σ is not finite " + σσi + "\nσ=" + σi;
    σi.mul(xi, prec);
    assert σi.isFinite() && σi.get(1).isFinite() : "σ is not finite " + σσi + "\nσ=" + σi + " xi=" + xi;
    assert !sqrtδt.isZero() : "sqrtδt is zero";
    xi.mul(sqrtδt, prec);
    assert σi.isFinite();
    // 2nd order correction
    σi.mul(σi.get(1), prec, σσi);
    assert σi.isFinite() && σi.get(1).isFinite() : "σ is not finite " + σσi + "\nσ=" + σi + " xi=" + xi;

    assert σσi.isFinite() : "σσ is not finite " + σσi + "\nσ=" + σi;
    σσi.mul(state.dt, prec).div(2, prec).mul(xi.pow(2, prec).sub(1, prec), prec);

    // the derivative is in σi.get(1) .. the 2nd
    // order to be added is ( (Zₜ)² - 1 ) * ( dt * σ(Xₜ)∂Xₜ * σ(Xₜ) ) / 2 where
    // σ(Xₜ)∂Xₜ is the derivative of σ relative to X, which is a function of t,
    // but this method will not work if either coefficient function depends directly
    // on t
    return evalSequence;
  }

  public void setSqrtδt(S state, int prec)
  {
    if (sqrtδt == null || sqrtδt.isZero())
    {
      state.sqrtdt(prec, sqrtδt);
      assert !sqrtδt.isZero() : "dt=" + state.getδt(σσi) + " sqrtδt=" + sqrtδt;
    }
  }

  @Override
  public EvaluationSequence jump(S state, int prec, EvaluationSequence evalSequence)
  {
    Real xi = evalSequence.values.get(i); // xi is the i-th sample from a normal distribution wIth variance equal to
                                          // dt

    state.setValue(xi);

    if (verbose)
    {
      System.out.format("i=%s time=%s μi=%s σi=%s xi=%s\n state=%s\n",
                        i,
                        state.time().toString(7),
                        μi,
                        σi,
                        xi,
                        state);
    }

    return evalSequence;
  }

  public MilsteinIntegrator(P x, S state)
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
