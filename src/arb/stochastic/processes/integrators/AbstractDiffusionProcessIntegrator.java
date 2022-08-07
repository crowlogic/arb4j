package arb.stochastic.processes.integrators;

import java.awt.*;
import java.awt.geom.Point2D;
import java.lang.ref.Cleaner.Cleanable;

import javax.swing.JFrame;

import arb.Float;
import arb.Real;
import arb.dynamical.systems.*;
import arb.stochastic.processes.ContinuousTimeState;
import arb.stochastic.processes.DiffusionProcess;
import arb.stochastic.processes.DiffusionProcessState;
import arb.utensils.Utilities;
import de.erichseifert.gral.data.DataSeries;
import de.erichseifert.gral.data.DataTable;
import de.erichseifert.gral.graphics.Insets2D;
import de.erichseifert.gral.graphics.Label;
import de.erichseifert.gral.plots.XYPlot;
import de.erichseifert.gral.plots.axes.AxisRenderer;
import de.erichseifert.gral.plots.axes.LinearRenderer2D;
import de.erichseifert.gral.plots.lines.AbstractLineRenderer2D;
import de.erichseifert.gral.plots.lines.SmoothLineRenderer2D;
import de.erichseifert.gral.ui.InteractivePanel;

public abstract class AbstractDiffusionProcessIntegrator<S extends ContinuousTimeState, D extends DiffusionProcess<S>>
                                                        implements
                                                        DiffusionProcessIntegrator<S, D>,
                                                        AutoCloseable,
                                                        Cleanable
{
  protected static final Color COLOR1 = new Color(55,
                                                  170,
                                                  200);

  protected static final Color COLOR2 = new Color(200,
                                                  80,
                                                  75);
  protected static void print(DataTable data)
  {
    DataSeries linearSeries = new DataSeries(data,
                                             0,
                                             1);
  
    // Create new xy-plot
    XYPlot     plot         = new XYPlot(linearSeries);
  
    formatPlot(plot);
  
    formatAxes(plot);
  
    formatDataLines(linearSeries, plot);
  
    // Add plot to Swing component
    Utilities.openInJFrame(new InteractivePanel(plot),
                           1900,
                           800,
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
    plot.setBackground(Color.GRAY);
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

  protected static void formatAxes(XYPlot plot)
  {
    // Format axes
    AxisRenderer axisRendererX = new LinearRenderer2D();
    AxisRenderer axisRendererY = plot.getAxisRenderer(XYPlot.AXIS_Y);
    axisRendererX.setTickColor(Color.WHITE);
    axisRendererX.setMinorTickColor(Color.white);
    axisRendererY.setTickColor(Color.WHITE);
    axisRendererY.setMinorTickColor(Color.white);
    axisRendererY.setShapeColor(Color.white);
    axisRendererX.setShapeColor(Color.white);
    axisRendererX.setLabel(new Label("Time t"));
    plot.setAxisRenderer(XYPlot.AXIS_X, axisRendererX);
  
    // Custom stroke for the x-axis
    BasicStroke stroke = new BasicStroke(0.1f);
    axisRendererX.setShapeStroke(stroke);
  
    Label linearAxisLabel = new Label("Value Xₜ");
    linearAxisLabel.setRotation(90);
  
    axisRendererY.setLabel(linearAxisLabel);
    // Change intersection point of Y axis
    axisRendererY.setIntersection(1.0);
    axisRendererY.setTicksAutoSpaced(true);
    axisRendererX.setTicksAutoSpaced(false);
    // Change tick spacing
    axisRendererX.setTickSpacing(0.1);
  }

  public S        state;
  public D        X;
  public boolean  verbose = false;

  protected Float T       = new Float();
  protected Real  μi      = new Real();
  protected Real  σi      = Real.newVector(2);
  protected Real  sqrtdt  = new Real();

  public AbstractDiffusionProcessIntegrator(D x)
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
    sqrtdt.close();
  }
}