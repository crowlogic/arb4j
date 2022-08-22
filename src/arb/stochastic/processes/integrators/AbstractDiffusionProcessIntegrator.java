package arb.stochastic.processes.integrators;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.RadialGradientPaint;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.geom.Point2D;
import java.lang.ref.Cleaner.Cleanable;

import javax.swing.JFrame;

import arb.Float;
import arb.Real;
import arb.stochastic.processes.ContinuousTimeState;
import arb.stochastic.processes.DiffusionProcess;
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
  public static final class KeyHandler implements
                                       KeyListener
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
  }

  protected static final Color COLOR1 = new Color(55,
                                                  170,
                                                  200);

  protected static final Color COLOR2 = new Color(200,
                                                  80,
                                                  75);

  public static void print(String title, DataTable data)
  {
    DataSeries linearSeries = new DataSeries(data,
                                             0,
                                             1);

    // Create new xy-plot
    XYPlot     plot         = new XYPlot(linearSeries);

    formatPlot(title, plot);

    formatAxes(plot);

    formatDataLines(linearSeries, plot, COLOR1);

    // Add plot to Swing component
    Utilities.openInJFrame(new InteractivePanel(plot), 1900, 800, title, JFrame.EXIT_ON_CLOSE)
             .addKeyListener(new KeyHandler());

  }

  protected static void formatPlot(String title, XYPlot plot)
  {

    formatAxes(plot);
    // Format plot
    plot.setInsets(new Insets2D.Double(20.0,
                                       40.0,
                                       40.0,
                                       40.0));
    plot.setBackground(Color.GRAY);
    plot.getTitle().setText(title);

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

  protected static void formatDataLines(DataSeries seriesLin, XYPlot plot, Color color)
  {
    // Format data lines
    AbstractLineRenderer2D discreteRenderer = new SmoothLineRenderer2D();
    discreteRenderer.setColor(color);
    discreteRenderer.setGap(0);

    discreteRenderer.setStroke(new BasicStroke(3.5f,
                                               BasicStroke.CAP_BUTT,
                                               BasicStroke.JOIN_MITER));

    plot.setLineRenderers(seriesLin, discreteRenderer);

  }

  protected static void formatAxes(XYPlot plot)
  {
    // Format axes
    AxisRenderer axisRendererY = plot.getAxisRenderer(XYPlot.AXIS_Y);
    AxisRenderer axisRendererX = new LinearRenderer2D();
    axisRendererY.setTickColor(Color.WHITE);
    axisRendererY.setMinorTickColor(Color.white);
    axisRendererY.setShapeColor(Color.white);

    axisRendererX.setTickColor(Color.WHITE);
    axisRendererX.setMinorTickColor(Color.white);
    axisRendererX.setShapeColor(Color.white);
    axisRendererX.setLabel(new Label("Time t"));
    plot.setAxisRenderer(XYPlot.AXIS_X, axisRendererX);
    // plot.setAxisRenderer(XYPlot.AXIS_Y2, axisRendererY2);
    // Custom stroke for the x-axis
    BasicStroke stroke = new BasicStroke(0.2f);
    axisRendererX.setShapeStroke(stroke);

    Label spotPriceLabel = new Label("Value Sₜ");
    spotPriceLabel.setRotation(90);

    Label varianceLabel = new Label("Variance Vₜ");
    varianceLabel.setRotation(90);

    axisRendererY.setLabel(spotPriceLabel);

    axisRendererY.setTicksAutoSpaced(true);

//    axisRendererY2.setLabel(varianceLabel);
//
//    axisRendererY2.setTicksAutoSpaced(true);

    axisRendererX.setTicksAutoSpaced(false);
    // Change tick spacing
    axisRendererX.setTickSpacing(0.1);
  }

  public S        state;
  public D        diffusionProcess;
  public boolean  verbose = false;

  protected Float T       = new Float();
  protected Real  μi      = new Real();
  protected Real  σi      = Real.newVector(2);
  protected Real  sqrtdt  = new Real();

  public AbstractDiffusionProcessIntegrator(D x)
  {
    diffusionProcess  = x;
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