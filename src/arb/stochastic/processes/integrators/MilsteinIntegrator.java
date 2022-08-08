package arb.stochastic.processes.integrators;

import static arb.ComplexConstants.*;
import static arb.FloatConstants.*;
import static arb.utensils.Utilities.*;

import java.awt.*;
import java.awt.event.*;
import java.awt.geom.*;
import java.lang.Integer;

import javax.swing.*;

import arb.*;
import arb.Float;
import arb.dynamical.systems.*;
import arb.stochastic.processes.*;
import arb.utensils.*;
import de.erichseifert.gral.data.*;
import de.erichseifert.gral.plots.*;
import de.erichseifert.gral.plots.points.*;
import de.erichseifert.gral.ui.*;

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

    OrnsteinUhlenbeckProcess process  = new OrnsteinUhlenbeckProcess(new Real("1.5",
                                                                              128),
                                                                     new Real("2",
                                                                              128),
                                                                     new Real("0.1",
                                                                              128));
    OrnsteinUhlenbeckProcess process2 = new OrnsteinUhlenbeckProcess(new Real("1.5",
                                                                              128),
                                                                     new Real("2",
                                                                              128),
                                                                     new Real("0.1",
                                                                              128));
    int                      seed     = (int) (Integer.MAX_VALUE * Math.random());
    try ( var integrator = new MilsteinIntegrator(process,
                                                  new DiffusionProcessState(new Real("3",
                                                                                     128),
                                                                            new RandomState(seed)));
          var integrator2 = new MilsteinIntegrator(process2,
                                                   new DiffusionProcessState(new Real("3",
                                                                                      128),
                                                                             new RandomState(seed)));)
    {

      // Generate data
      DataTable     data     = new DataTable(Double.class,
                                             Double.class);
      DataTable     data2    = new DataTable(Double.class,
                                             Double.class);
      FloatInterval interval = new FloatInterval(0,
                                                 5);
      var           path     = integrator.integrate(interval, 750 / 4, prec);

      for (RealOrderedPair sample : path)
      {
        data.add(sample.a.doubleValue(), sample.b.doubleValue());
      }
      var path2 = integrator2.integrate(interval, 750 / 4, prec);
      for (RealOrderedPair sample : path2)
      {
        data2.add(sample.a.doubleValue(), sample.b.doubleValue());
      }
      integrator.print(data, data2);

      println("mean=" + path.values.arithmeticMean(128, new Real()) + " " + path.partition.dt);
    }

  }

  protected void print(DataTable data, DataTable data2)
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

    formatPlot(plot);
    plot.setPointRenderers(data, new DefaultPointRenderer2D());
    plot.setPointRenderers(data2, new DefaultPointRenderer2D());
    halveThePointSize(plot.getPointRenderers(data).get(0));
    halveThePointSize(plot.getPointRenderers(data2).get(0));

    formatDataLines(linearSeries, plot, Color.RED);
    formatDataLines(linearSeries2, plot, Color.GREEN);

    // Add plot to Swing component
    Utilities.openInJFrame(new InteractivePanel(plot), 1900, 800, getClass().toString(), JFrame.EXIT_ON_CLOSE)
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

  public void halveThePointSize(PointRenderer pointRenderer)
  {
    Shape oldShape = pointRenderer.getShape();
    // Get a new shape that is twice as large
    Shape newShape = AffineTransform.getScaleInstance(0, 0).createTransformedShape(oldShape);
    pointRenderer.setShape(newShape);
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
