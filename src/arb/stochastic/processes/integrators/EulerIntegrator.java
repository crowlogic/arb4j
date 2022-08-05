package arb.stochastic.processes.integrators;

import static arb.ComplexConstants.prec;
import static arb.FloatConstants.half;
import static arb.RealConstants.zero;
import static arb.utensils.Utilities.*;

import java.awt.*;
import java.awt.geom.*;

import javax.swing.*;

import arb.*;
import arb.Float;
import arb.stochastic.*;
import arb.stochastic.processes.*;
import arb.stochastic.processes.integrators.StochasticIntegratorFactory.*;
import arb.utensils.*;
import de.erichseifert.gral.data.*;
import de.erichseifert.gral.graphics.*;
import de.erichseifert.gral.plots.*;
import de.erichseifert.gral.plots.axes.*;
import de.erichseifert.gral.plots.lines.*;
import de.erichseifert.gral.ui.*;

/**
 * Integrates a {@link DiffusionProcess} via Euler's method
 * 
 * <pre>
 * dXₜ = μ(Xₜ,t)dt + σ(Xₜ,t)dBₜ
 * </pre>
 * 
 * where Bₜ is a BrownianMotion also-known-as a WienerProcess having zero mean
 * drift and standard deviation parameter σ=√(dt) such that the variance is dt,
 * the time elapsed
 */
public class EulerIntegrator<P extends DiffusionProcess<D>, D extends DiffusionProcessState> extends
                            AbstractDiffusionProcessIntegrator<D, P>
{



  public static void main(String args[])
  {

    OrnsteinUhlenbeckProcess process = new OrnsteinUhlenbeckProcess(new Real("1.5",
                                                                             128),
                                                                    new Real("2",
                                                                             128),
                                                                    new Real("0.1",
                                                                             128));
    try ( var integrator = StochasticIntegratorFactory.newIntegrator(IntegrationMethod.Euler,
                                                                     process,
                                                                     new DiffusionProcessState(process.θ));)
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

      print(data);

      println("mean=" + path.values.arithmeticMean(128, new Real()) + " " + path.partition.dt);
    }

  }

  public EulerIntegrator(P x, D diffusionProcessState)
  {
    super(x);
    state = diffusionProcessState;
    μ     = X.μ();
    σ     = X.σ();
  }

  DriftCoeffecientFunction<D>     μ;
  DiffusionCoeffecientFunction<D> σ;

  @Override
  public synchronized EvaluationSequence integrate(FloatInterval interval, int n, int prec)
  {
    // x is the set of values of the evaluation sequence which is a Partition
    // together with a set of values for each element of the partition

    interval.length(prec, T);

    RealPartition partition = interval.realPartition(n, prec);
    state.dt.set(partition.dt);

    EvaluationSequence evaluationSequence = new EvaluationSequence(partition,
                                                                   Real.newVector(n + 1));

    evaluationSequence.generateRandomSamples(new GaussianProbabilityDistribution(zero,
                                                                                 state.dt.sqrt(prec, sqrtδt)),
                                             state.randomState,
                                             prec);

    state.setTime(interval.getA());
    for (Real t : partition)
    {
      state.setTime(t);
      step(state, prec, evaluationSequence);
      jump(state, prec, evaluationSequence);
    }

    return evaluationSequence;
  }

  @Override
  public EvaluationSequence step(D state, int prec, EvaluationSequence evaluationSequence)
  {
    Real xi = evaluationSequence.values.get(++i);
    xi.printPrecision = true;

    X.μ().evaluate(state, 1, prec, μi);
    μi.mul(state.dt, prec);
    assert μi.isFinite();

    X.σ().evaluate(state, 1, prec, σi);
    assert !σi.isZero();
    assert σi.isFinite();

    if (verbose)
    {
      println("i=" + " xi=" + xi + " μi=" + μi + " σi=" + σi);
    }
    σi.mul(xi, prec);

    // coords.value = xi = previous(xi) + μi * δt + σi * Z where Z is a draw from
    // W=N(0,√(δt))
    // xi = μi + σi
    μi.add(σi, prec, xi);
    return evaluationSequence;
  }

  @Override
  public EvaluationSequence jump(D state, int prec, EvaluationSequence evaluationSequence)
  {
    Real xi = evaluationSequence.values.get(i);

    state.setValue(xi.add(state.value(), prec));

    if (verbose)
    {
      System.out.format(" time=%s μi=%s σi=%s xi=%s\n state=%s\n", state.time(), μi, σi, xi, state);
    }

    return evaluationSequence;
  }

  @Override
  public Float weakConvergenceOrder(int dim)
  {
    return FloatConstants.one;
  }

  @Override
  public Float strongConvergenceOrder(int dim)
  {
    return half;
  }

}
