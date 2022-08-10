package arb.stochastic.processes.integrators;

import static arb.ComplexConstants.prec;
import static arb.FloatConstants.half;
import static arb.RealConstants.zero;
import static arb.utensils.Utilities.println;
import static java.lang.String.format;

import java.awt.Color;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

import javax.swing.JFrame;

import arb.EvaluationSequence;
import arb.Float;
import arb.FloatConstants;
import arb.FloatInterval;
import arb.RandomState;
import arb.Real;
import arb.RealOrderedPair;
import arb.RealPartition;
import arb.dynamical.systems.*;
import arb.stochastic.GaussianProbabilityDistribution;
import arb.stochastic.processes.*;
import arb.utensils.Utilities;
import de.erichseifert.gral.data.DataSeries;
import de.erichseifert.gral.data.DataTable;
import de.erichseifert.gral.plots.XYPlot;
import de.erichseifert.gral.plots.points.DefaultPointRenderer2D;
import de.erichseifert.gral.ui.InteractivePanel;

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
public class EulerIntegrator<P extends DiffusionProcess<D>, D extends ContinuousTimeState> extends
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
    try ( var integrator = new EulerIntegrator(process,
                                               new DiffusionProcessState(new Real("3",
                                                                                  128),
                                                                         new RandomState(31337))))
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

      print(integrator.getClass().getSimpleName(), data);

      println("mean=" + path.values[0].arithmeticMean(128, new Real()));
    }

  }

  private int dim;

  public EulerIntegrator(P x, D diffusionProcessState)
  {
    super(x);
    state = diffusionProcessState;
    μ     = diffusionProcess.μ();
    σ     = diffusionProcess.σ();
    this.dim = 0;
  }

  DriftCoeffecientFunction<D>     μ;
  DiffusionCoeffecientFunction<D> σ;

  @Override
  public synchronized EvaluationSequence integrate(FloatInterval interval, int n, int prec)
  {
    // x is the set of values of the evaluation sequence which is a Partition
    // together with a set of values for each element of the partition

    interval.length(prec, T);

    RealPartition partition = interval.partition(n, prec);
    state.setdt(partition.dt);

    EvaluationSequence evaluationSequence = new EvaluationSequence(partition,1);

    evaluationSequence.generateRandomSamples(new GaussianProbabilityDistribution(zero,
                                                                                 state.sqrtdt(prec, sqrtdt)),
                                             state.getRandomState(),
                                             prec);

    state.setTime(interval.getA());
    for (Real t : partition)
    {
      state.setTime(t);
      state.lock();
      step(state, prec, evaluationSequence);
      state.unlock();
      jump((DiffusionProcessState) state, prec, evaluationSequence);
    }

    return evaluationSequence;
  }

  @Override
  public EvaluationSequence step(D state, int prec, EvaluationSequence evaluationSequence)
  {
    return step(state, prec, evaluationSequence, 1);
  }

  /**
   * 
   * @param state
   * @param prec
   * @param evaluationSequence
   * @param σorder             the order to pass to the
   *                           {@link DiffusionCoeffecientFunction}, the
   *                           {@link MilsteinIntegrator} calls this with 2, but
   *                           the EulerIntegrator only needs 1
   * @return
   */
  protected EvaluationSequence step(D state, int prec, EvaluationSequence evaluationSequence, int σorder)
  {
    int  i  = state.index();
    Real xi = evaluationSequence.values[dim].get(i);
    xi.printPrecision = true;

    diffusionProcess.μ().evaluate(state, 1, prec, μi);
    μi.mul(state.dt(), prec);
    assert μi.isFinite();
    diffusionProcess.σ().evaluate(state, σorder, prec, σi);
    assert !σi.isNegative() && σi.isFinite() : "X.σ is not finite and nonnegative. state=" + state;

    if (verbose)
    {
      println("i=" + " xi=" + xi + " μi=" + μi + " σi=" + σi);
    }
    σi.mul(xi, prec);

    if (σorder == 1)
    {
      μi.add(σi, prec, xi);
    }

    return evaluationSequence;
  }

  @Override
  public final EvaluationSequence jump(DiffusionProcessState state, int prec, EvaluationSequence evaluationSequence)
  {
    int i = state.nextIndex();
    assert i >= 0;
    Real xi = evaluationSequence.values[dim].get(i);

    state.setValue(xi.add(state.value(), prec));

    if (verbose)
    {
      System.out.format("i=%s time=%s μi=%s σi=%s xi=%s\n state=%s\n", i, state.time(), μi, σi, xi, state);
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

  protected static void print(String title, DataTable data, DataTable data2)
  {
    DataSeries linearSeries  = new DataSeries(data,
                                              0,
                                              1);
    DataSeries linearSeries2 = new DataSeries(data2,
                                              0,
                                              1);

    // Create new xy-plot
    XYPlot     plot          = new XYPlot(linearSeries,
                                          linearSeries2);

    formatPlot(title, plot);
    plot.setPointRenderers(data, new DefaultPointRenderer2D());
    plot.setPointRenderers(data2, new DefaultPointRenderer2D());

    formatDataLines(linearSeries, plot, Color.RED);
    formatDataLines(linearSeries2, plot, Color.GREEN);

    // Add plot to Swing component
    Utilities.openInJFrame(new InteractivePanel(plot), 1900, 800, title, JFrame.EXIT_ON_CLOSE)
             .addKeyListener(new KeyListener()
             {

               @Override
               public void keyTyped(KeyEvent e)
               {

               }

               @Override
               public void keyPressed(KeyEvent e)
               {
                 switch (e.getKeyCode())
                 {
                 case KeyEvent.VK_ESCAPE:
                   System.exit(1);
                 }

               }

               @Override
               public void keyReleased(KeyEvent e)
               {

               }
             });
    ;
  }

}
