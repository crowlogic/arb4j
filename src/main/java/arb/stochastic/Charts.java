package arb.stochastic;

import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.AxisMode;
import io.fair_acc.chartfx.plugins.*;
import io.fair_acc.dataset.utils.DataSetStyleBuilder;
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
    chart.getPlugins()
         .addAll(new EditAxis(AxisMode.XY),
                 new Zoomer(),
                 new Screenshot(),
                 new TableViewer(),
                 new CrosshairIndicator());
    chart.getRenderers().forEach(renderer -> renderer.getAxes().addAll(chart.getAxes()));
    chart.getStylesheets()
         .add(String.format("data:text/css,.chart-crosshair-path { -fx-stroke: %s; -fx-stroke-width: 2; }",
                            light ? "black" : "white"));
    chart.getStylesheets()
         .add(String.format("data:text/css,.chart-crosshair-label { -fx-fill: %s; -fx-font-size: 16px; }",
                            light ? "orange" : "yellow"));
  }

  public static GridPane createGridPane(XYChart[] charts)
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

    gridPane.add(charts[0], 0, 0);
    gridPane.add(charts[1], 1, 0);
    gridPane.add(charts[2], 0, 1);
    gridPane.add(charts[3], 1, 1);

    return gridPane;
  }

  /**
   * Needs to set both because the drawLegendSymbol method in chartfx uses
   * {@link DataSetStyleBuilder#setMarkerColor(String)} as well as
   * {@link DataSetStyleBuilder#setLineColor(String)}
   */
  static final String empiricialFrequencyDatasetStyle  =
                                                      DataSetStyleBuilder.instance()
                                                                         .setMarkerColor("darkgoldenrod")
                                                                         .setLineColor("darkgoldenrod")
                                                                         .build();
  static final String randomMeasureDatasetStyle        = DataSetStyleBuilder.instance()
                                                                            .setMarkerType("circle")
                                                                            .setMarkerSize(2)
                                                                            .build();
  static final String theoreticalFrequencyDatasetStyle = DataSetStyleBuilder.instance()
                                                                            .setLineWidth(2)
                                                                            .build();

}
