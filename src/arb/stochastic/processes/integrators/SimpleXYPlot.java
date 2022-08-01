package arb.stochastic.processes.integrators;

import java.awt.*;
import java.awt.geom.Point2D;
import java.util.*;

import de.erichseifert.gral.data.DataSeries;
import de.erichseifert.gral.data.DataTable;
import de.erichseifert.gral.graphics.Insets2D;
import de.erichseifert.gral.graphics.Label;
import de.erichseifert.gral.graphics.Orientation;
import de.erichseifert.gral.plots.XYPlot;
import de.erichseifert.gral.plots.axes.AxisRenderer;
import de.erichseifert.gral.plots.axes.LogarithmicRenderer2D;
import de.erichseifert.gral.plots.lines.DiscreteLineRenderer2D;
import de.erichseifert.gral.plots.points.*;
import de.erichseifert.gral.ui.InteractivePanel;
import de.erichseifert.gral.util.GraphicsUtils;

public class SimpleXYPlot extends
                          ExamplePanel
{
  /** Version id for serialization. */
  private static final long   serialVersionUID = -5263057758564264676L;

  /** Instance to generate random data values. */
  private static final Random random           = new Random();

  @SuppressWarnings("unchecked")
  public SimpleXYPlot()
  {
    // Generate data
    DataTable data = new DataTable(Double.class,
                                   Double.class,
                                   Double.class,
                                   Double.class,
                                   Double.class,
                                   Double.class);
    for (double x = 1.0; x <= 400.0; x *= 1.5)
    {
      double x2 = x / 5.0;
      data.add(x2,
               -Math.sqrt(x2) + 5.0,
               5.0 * Math.log10(x2),
               random.nextDouble() + 1.0,
               random.nextDouble() + 0.5,
               1.0 + 2.0 * random.nextDouble());
    }

    // Create data series
    DataSeries seriesLog = new DataSeries(data,
                                          0,
                                          2,
                                          3,
                                          4);
    DataSeries seriesLin = new DataSeries(data,
                                          0,
                                          1,
                                          5);

    // Create new xy-plot
    XYPlot     plot      = new XYPlot(seriesLog,
                                      seriesLin);

    // Format plot
    plot.setInsets(new Insets2D.Double(20.0,
                                       40.0,
                                       40.0,
                                       40.0));
    plot.setBackground(Color.WHITE);
    plot.getTitle().setText(getDescription());

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

    // Format axes
    AxisRenderer axisRendererX = new LogarithmicRenderer2D();
    AxisRenderer axisRendererY = plot.getAxisRenderer(XYPlot.AXIS_Y);
    axisRendererX.setLabel(new Label("Logarithmic axis"));
    plot.setAxisRenderer(XYPlot.AXIS_X, axisRendererX);
    // Custom tick labels
    Map<Double, String> labels = new HashMap<>();
    labels.put(2.0, "Two");
    labels.put(1.5, "OnePointFive");
    axisRendererX.setCustomTicks(labels);
    // Custom stroke for the x-axis
    BasicStroke stroke = new BasicStroke(2f);
    axisRendererX.setShapeStroke(stroke);
    Label linearAxisLabel = new Label("Linear axis");
    linearAxisLabel.setRotation(90);
    axisRendererY.setLabel(linearAxisLabel);
    // Change intersection point of Y axis
    axisRendererY.setIntersection(1.0);
    // Change tick spacing
    axisRendererX.setTickSpacing(2.0);

    // Format rendering of data points
    PointRenderer sizeablePointRenderer = new SizeablePointRenderer();
    sizeablePointRenderer.setColor(GraphicsUtils.deriveDarker(COLOR1));
    plot.setPointRenderers(seriesLin, sizeablePointRenderer);
    PointRenderer defaultPointRenderer = new DefaultPointRenderer2D();
    defaultPointRenderer.setColor(GraphicsUtils.deriveDarker(COLOR2));
    defaultPointRenderer.setErrorVisible(true);
    defaultPointRenderer.setErrorColor(COLOR2);
    plot.setPointRenderers(seriesLog, defaultPointRenderer);

    // Format data lines
    DiscreteLineRenderer2D discreteRenderer = new DiscreteLineRenderer2D();
    discreteRenderer.setColor(COLOR1);
    discreteRenderer.setStroke(new BasicStroke(3.0f,
                                               BasicStroke.CAP_ROUND,
                                               BasicStroke.JOIN_ROUND,
                                               10.0f,
                                               new float[]
                                               { 3f, 6f },
                                               0.0f));
    plot.setLineRenderers(seriesLin, discreteRenderer);
    // Custom gaps for points
    discreteRenderer.setGap(2.0);
    discreteRenderer.setGapRounded(true);
    // Custom ascending
    discreteRenderer.setAscentDirection(Orientation.VERTICAL);
    discreteRenderer.setAscendingPoint(0.5);

    // Add plot to Swing component
    add(new InteractivePanel(plot), BorderLayout.CENTER);
  }

  @Override
  public String getTitle()
  {
    return "x-y plot";
  }

  @Override
  public String getDescription()
  {
    return "Styled x-y plot with example data";
  }

  public static void main(String[] args)
  {
    new SimpleXYPlot().showInFrame();
  }
}