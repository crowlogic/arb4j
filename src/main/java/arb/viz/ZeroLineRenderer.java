package arb.viz;

import io.fair_acc.chartfx.axes.Axis;
import io.fair_acc.chartfx.axes.spi.AxisRange;
import io.fair_acc.chartfx.renderer.spi.AbstractRenderer;
import javafx.geometry.Orientation;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;

public class ZeroLineRenderer extends
                              AbstractRenderer<ZeroLineRenderer>
{

  public ZeroLineRenderer()
  {
    super();
  }

  @Override
  public void render()
  {
    if (getChart() == null)
      return;

    GraphicsContext gc    = getChart().getCanvas().getGraphicsContext2D();
    Axis            xAxis = getChart().getFirstAxis(Orientation.HORIZONTAL);
    Axis            yAxis = getChart().getFirstAxis(Orientation.VERTICAL);

    gc.save();
    gc.setStroke(Color.BLACK);
    gc.setLineWidth(2.0);

    // Draw bold Y-axis (x=0) - vertical line
    double zeroX = snap(xAxis.getDisplayPosition(0));
    if (zeroX >= 0 && zeroX <= getChart().getCanvas().getWidth())
    {
      gc.strokeLine(zeroX, 0, zeroX, getChart().getCanvas().getHeight());
    }

    // Draw bold X-axis (y=0) - horizontal line
    double zeroY = snap(yAxis.getDisplayPosition(0));
    if (zeroY >= 0 && zeroY <= getChart().getCanvas().getHeight())
    {
      gc.strokeLine(0, zeroY, getChart().getCanvas().getWidth(), zeroY);
    }

    gc.restore();
  }

  @Override
  public void updateAxisRange(Axis axis, AxisRange range)
  {
    // Not applicable for zero line renderer
  }

  private static double snap(final double value)
  {
    return (int) value + 0.5;
  }

  @Override
  protected ZeroLineRenderer getThis()
  {
    return this;
  }
}
