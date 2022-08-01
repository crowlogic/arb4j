package arb.stochastic.processes.integrators;

import static arb.ComplexConstants.prec;
import static arb.FloatConstants.*;
import static arb.RealConstants.zero;
import static arb.utensils.Utilities.println;

import java.awt.*;
import java.awt.geom.Point2D;
import java.util.HashMap;
import java.util.Map;

import javax.swing.JFrame;

import arb.*;
import arb.Float;
import arb.stochastic.GaussianProbabilityDistribution;
import arb.stochastic.processes.*;
import arb.utensils.Utilities;
import de.erichseifert.gral.data.DataSeries;
import de.erichseifert.gral.data.DataTable;
import de.erichseifert.gral.graphics.Insets2D;
import de.erichseifert.gral.graphics.Label;
import de.erichseifert.gral.graphics.Orientation;
import de.erichseifert.gral.plots.XYPlot;
import de.erichseifert.gral.plots.axes.*;
import de.erichseifert.gral.plots.lines.*;
import de.erichseifert.gral.plots.points.*;
import de.erichseifert.gral.ui.InteractivePanel;
import de.erichseifert.gral.util.GraphicsUtils;

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
public class EulerIntegrator extends
                             AbstractStochasticIntegrator implements
                             StochasticIntegrator
{

  /** First corporate color used for normal coloring. */
  protected static final Color COLOR1 = new Color(55,
                                                  170,
                                                  200);
  /** Second corporate color used as signal color */
  protected static final Color COLOR2 = new Color(200,
                                                  80,
                                                  75);

  public static void main(String args[])
  {
    EulerIntegrator       integrator = new EulerIntegrator(new StandardGaussianProcess());
    DiffusionProcessState state      = new DiffusionProcessState();

    // Generate data
    DataTable             data       = new DataTable(Double.class,
                                                     Double.class);

    for (RealOrderedPair sample : integrator.integrate(state,
                                                       new FloatInterval(0,
                                                                         1),
                                                       500,
                                                       prec))
    {
      println(sample);
      data.add(sample.a.getMid().doubleValue(), sample.b.doubleValue());

    }
            
    print(data);

  }

  protected static void print(DataTable data)
  {
    DataSeries linearSeries = new DataSeries(data,
                                             0,
                                             1);

    // Create new xy-plot
    XYPlot     plot         = new XYPlot(linearSeries);

    formatPlot(plot);

    formatAxes(plot);

    //formatDataPointRenderer(linearSeries, plot);

    formatDataLines(linearSeries, plot);

    // Add plot to Swing component
    Utilities.openInJFrame(new InteractivePanel(plot),
                           800,
                           600,
                           EulerIntegrator.class.toString(),
                           JFrame.EXIT_ON_CLOSE);
  }

  protected static void formatPlot(XYPlot plot)
  {
    // Format plot
    plot.setInsets(new Insets2D.Double(20.0,
                                       40.0,
                                       40.0,
                                       40.0));
    plot.setBackground(Color.WHITE);
    plot.getTitle().setText(EulerIntegrator.class.toString());

    // Format plot area
    plot.getPlotArea()
        .setBackground(new RadialGradientPaint(new Point2D.Double(0.5,
                                                                  0.5),
                                               0.75f,
                                               new float[]
                                               { 0.6f, 0.8f, 1.0f },
                                               new Color[]
                                               { new Color(0,
                                                           0,
                                                           0,
                                                           0),
                                                 new Color(0,
                                                           0,
                                                           0,
                                                           32),
                                                 new Color(0,
                                                           0,
                                                           0,
                                                           128) }));
    plot.getPlotArea().setBorderStroke(null);
  }

  protected static void formatDataLines(DataSeries seriesLin, XYPlot plot)
  {
    // Format data lines
    AbstractLineRenderer2D discreteRenderer = new SmoothLineRenderer2D();
    discreteRenderer.setColor(COLOR1);
    discreteRenderer.setStroke(new BasicStroke(0.5f));
    plot.setLineRenderers(seriesLin, discreteRenderer);
 
 
  }

  protected static void formatDataPointRenderer(DataSeries seriesLin, XYPlot plot)
  {
    // Format rendering of data points
    PointRenderer sizeablePointRenderer = new DefaultPointRenderer2D();
    sizeablePointRenderer.setColor(COLOR1);
    plot.setPointRenderers(seriesLin, sizeablePointRenderer);

  }

  protected static void formatAxes(XYPlot plot)
  {
    // Format axes
    AxisRenderer axisRendererX = new LinearRenderer2D();
    AxisRenderer axisRendererY = plot.getAxisRenderer(XYPlot.AXIS_Y);
    axisRendererX.setLabel(new Label("Time t"));
    plot.setAxisRenderer(XYPlot.AXIS_X, axisRendererX);
  
    // Custom stroke for the x-axis
    BasicStroke stroke = new BasicStroke(0.1f);
    axisRendererX.setShapeStroke(stroke);
    
    Label linearAxisLabel = new Label("Xₜ");
//    linearAxisLabel.setRotation(90);
    
    axisRendererY.setLabel(linearAxisLabel);
    // Change intersection point of Y axis
    //axisRendererY.setIntersection(1.0);
    axisRendererY.setTicksAutoSpaced(true);
    axisRendererX.setTicksAutoSpaced(false);
    // Change tick spacing
    axisRendererX.setTickSpacing(0.1);
  }

  public EulerIntegrator(DiffusionProcess x)
  {
    super(x);
  }

  @Override
  public synchronized EvaluationSequence
         integrate(DiffusionProcessState state, FloatInterval interval, int n, int prec)
  {
    // x is the set of values of the evaluation sequence which is a Partition
    // together with a set of values for each element of the partition

    Real x = Real.newVector(n + 1);

    interval.length(prec, T);

    RealPartition partition = interval.realPartition(n, prec);
    state.dt.set(partition.dt);

    GaussianProbabilityDistribution W                  = new GaussianProbabilityDistribution(zero,
                                                                                             state.dt.sqrt(prec,
                                                                                                           sqrtδt));

    int                             i                  = -1;
    EvaluationSequence              evaluationSequence = new EvaluationSequence(partition,
                                                                                x);

    evaluationSequence.values.stream().parallel().forEach(value -> W.sample(prec, state.randomState, value));

    state.setTime(interval.getA());
    for (Real t : partition)
    {
      Real xi = x.get(++i);
      xi.printPrecision = true;
      state.setTime(t);

      μ.evaluate(state, 1, prec, μi).mul(state.dt, prec);
      assert μi.isFinite();
      σ.evaluate(state, 1, prec, σi).mul(xi, prec);
      assert σi.isFinite();

      // coords.value = xi = previous(xi) + μi * δt + σi * Z where Z is a draw from
      // W=N(0,√(δt))
      state.setValue(μi.add(σi, prec, xi).add(state.value(), prec));

      if (verbose)
      {
        System.out.format("i=%s time=%s μi=%s σi=%s xi=%s\n state=%s\n", i, state.time(), μi, σi, xi, state);
      }
    }

    return evaluationSequence;

  }

  @Override
  public Float weakConvergenceOrder()
  {
    return one;
  }

  @Override
  public Float strongConvergenceOrder()
  {
    return half;
  }

}
