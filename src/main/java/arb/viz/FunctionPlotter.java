package arb.viz;

import static java.util.stream.Collectors.toList;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.FunctionSampler;
import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.AxisMode;
import io.fair_acc.chartfx.axes.spi.DefaultNumericAxis;
import io.fair_acc.chartfx.plugins.DataPointTooltip;
import io.fair_acc.chartfx.plugins.EditAxis;
import io.fair_acc.chartfx.plugins.Zoomer;
import io.fair_acc.chartfx.renderer.spi.ErrorDataSetRenderer;
import javafx.application.Platform;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
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

  public Stage createScene()
  {
    Platform.setImplicitExit(false);
    stage = new Stage();
    initializeFuctions();
    root = new StackPane();
    configureChartPlugins();
    root.getChildren().add(chart);
    for (var renderer : chart.getRenderers()
                             .stream()
                             .filter(renderer -> renderer instanceof ErrorDataSetRenderer)
                             .collect(toList()))
    {
      ErrorDataSetRenderer ballDataRenderer = (ErrorDataSetRenderer) renderer;
      ballDataRenderer.setDrawMarker(false);
    }

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
    resampleFunctions(parallel);
  }

  public boolean parallel = false;

  public void set(Stage primaryStage, EventHandler<WindowEvent> onCloseRequestHandler)
  {
    primaryStage.setTitle(this.getClass().getSimpleName());
    primaryStage.setScene(scene);
    primaryStage.setOnCloseRequest(onCloseRequestHandler);
    primaryStage.show();
  }

  public void updateLegend()
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
