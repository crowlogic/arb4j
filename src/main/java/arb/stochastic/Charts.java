package arb.stochastic;

import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.AxisMode;
import io.fair_acc.chartfx.plugins.*;
import io.fair_acc.dataset.utils.DataSetStyleBuilder;
import javafx.scene.Node;
import javafx.scene.layout.*;

public class Charts
{

  /**
   * TODO: see if there is a way to make the crosshair path and label render with
   * an XOR mask instead of a fixed color so it would work on all backgrounds
   * 
   * @param chart
   */
  public static void configureChart(XYChart chart, boolean light)
  {
    chart.getPlugins().addAll(new EditAxis(AxisMode.XY), new Zoomer(), new Screenshot(), new TableViewer(), new CrosshairIndicator());
    chart.getRenderers().forEach(renderer -> renderer.getAxes().addAll(chart.getAxes()));
    chart.getStylesheets().add(String.format("data:text/css,.chart-crosshair-path { -fx-stroke: %s; -fx-stroke-width: 2; }", light ? "black" : "white"));
    chart.getStylesheets().add(String.format("data:text/css,.chart-crosshair-label { -fx-fill: %s; -fx-font-size: 16px; }", light ? "orange" : "yellow"));
  }

  public static GridPane createGridPane(XYChart[] charts)
  {
    return createGridPane(charts, null, null);
  }

  public static GridPane createGridPane(XYChart[] charts, Node covarianceWrapper)
  {
    return createGridPane(charts, covarianceWrapper, null);
  }

  /**
   * Build the 2x2 chart grid. When {@code covarianceWrapper} is non-null, it
   * is placed in the bottom-left cell instead of the bare {@code charts[2]}
   * chart, so the covariance chart can be sandwiched under a control bar
   * (length entry + refresh button) without changing the grid layout.
   *
   * @param charts            the four charts in panel order: top-left,
   *                          top-right, bottom-left, bottom-right
   * @param covarianceWrapper optional Node that already contains
   *                          {@code charts[2]} as a child; when non-null,
   *                          this is what gets placed in the grid in the
   *                          bottom-left cell
   */
  public static GridPane createGridPane(XYChart[] charts, Node covarianceWrapper, Node psdWrapper)
  {
    GridPane gridPane = new GridPane();
    gridPane.setHgap(10);
    gridPane.setVgap(10);

    var col1 = new ColumnConstraints();
    col1.setPercentWidth(50);
    var col2 = new ColumnConstraints();
    col2.setPercentWidth(50);
    gridPane.getColumnConstraints().addAll(col1, col2);

    var row1 = new RowConstraints();
    row1.setPercentHeight(50);
    var row2 = new RowConstraints();
    row2.setPercentHeight(50);
    gridPane.getRowConstraints().addAll(row1, row2);

    for (XYChart chart : charts)
    {
      chart.setPrefSize(10000, 10000);
      GridPane.setHgrow(chart, Priority.ALWAYS);
      GridPane.setVgrow(chart, Priority.ALWAYS);
    }

    Node bottomLeft  = covarianceWrapper != null ? covarianceWrapper : charts[2];
    Node bottomRight = psdWrapper        != null ? psdWrapper        : charts[3];
    GridPane.setHgrow(bottomLeft,  Priority.ALWAYS);
    GridPane.setVgrow(bottomLeft,  Priority.ALWAYS);
    GridPane.setHgrow(bottomRight, Priority.ALWAYS);
    GridPane.setVgrow(bottomRight, Priority.ALWAYS);

    gridPane.add(charts[0],   0, 0);
    gridPane.add(charts[1],   1, 0);
    gridPane.add(bottomLeft,  0, 1);
    gridPane.add(bottomRight, 1, 1);

    return gridPane;
  }

  /**
   * Needs to set both because the drawLegendSymbol method in chartfx uses
   * {@link DataSetStyleBuilder#setMarkerColor(String)} as well as
   * {@link DataSetStyleBuilder#setLineColor(String)}
   */
  public static final String empiricialFrequencyDatasetStyle  = DataSetStyleBuilder.instance()
                                                                                   .setMarkerColor("darkgoldenrod")
                                                                                   .setLineColor("darkgoldenrod")
                                                                                   .setMarkerSize(2)
                                                                                   .build();
  public static final String randomMeasureDatasetStyle        = DataSetStyleBuilder.instance().setMarkerType("circle").setMarkerSize(2).build();
  public static final String theoreticalFrequencyDatasetStyle = DataSetStyleBuilder.instance().setLineWidth(2).build();

}
