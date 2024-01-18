package arb.viz;

import arb.functions.real.FunctionSampler;
import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.AxisMode;
import io.fair_acc.chartfx.axes.spi.DefaultNumericAxis;
import io.fair_acc.chartfx.plugins.DataPointTooltip;
import io.fair_acc.chartfx.plugins.EditAxis;
import io.fair_acc.chartfx.plugins.Zoomer;
import io.fair_acc.chartfx.renderer.spi.ErrorDataSetRenderer;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

@SuppressWarnings(
{ "unused" })
public class FunctionPlotter extends
                             FunctionSampler
{

  @Override
  public void close()
  {
  }

  public Stage               stage;
  private StackPane          root;
  private Scene              scene;
  public boolean             darkStyle = false;

  private DefaultNumericAxis xAxis     = new DefaultNumericAxis();
  private DefaultNumericAxis yAxis     = new DefaultNumericAxis();
  public final XYChart       chart     = new XYChart(xAxis,
                                                     yAxis);

  boolean drawMarkers = false;

  public Stage createScene()
  {
    Platform.setImplicitExit(drawMarkers);
    stage = new Stage();
    initializeFuctions();
    root = new StackPane();
    configureChartPlugins();
    root.getChildren().add(chart);
    ErrorDataSetRenderer renderer = (ErrorDataSetRenderer) (chart.getRenderers().get(0));
    renderer.setDrawMarker(drawMarkers);
        
    scene = new Scene(root,
                      1500,
                      750);
    if (darkStyle)
    {
      scene.getStylesheets().add("dark-theme.css");
    }
    Platform.runLater(() ->
    {
      set(stage, evt ->
      {
        /**
         * Called when there is an external request to close this {@code Window}. The
         * installed event handler can prevent window closing by consuming the received
         * event.
         */
      });
    });
    return stage;
  }

  public void configureChartPlugins()
  {
    chart.getPlugins().addAll(new EditAxis(AxisMode.XY), new DataPointTooltip(), new Zoomer());
  }

  public void initializeFuctions()
  {
    refreshFunctionDatasets();
    resampleFunctions(false);
  }

  public void set(Stage primaryStage, javafx.event.EventHandler<WindowEvent> onCloseRequestHandler)
  {
    primaryStage.setTitle(this.getClass().getSimpleName());
    primaryStage.setScene(scene);
    primaryStage.setOnCloseRequest(onCloseRequestHandler);
    primaryStage.show();
  }

  private void updateLegend()
  {
    chart.getLegend().updateLegend(chart.getRenderers(), true);
  }

  @Override
  public void refreshFunctionDatasets()
  {
    super.refreshFunctionDatasets();
    chart.getDatasets().addAll(dataSets);
  }

}
