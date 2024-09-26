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
import javafx.scene.Scene;
import javafx.scene.layout.StackPane;
import javafx.stage.Modality;
import javafx.stage.Stage;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FunctionPlotter extends
                             FunctionSampler
{

  public void toFront()
  {
    WindowManager.bringToFront(stage);
  }

  @Override
  public void close()
  {
    Platform.runLater(() -> stage.close());
  }

  public Stage              stage;
  public StackPane          root;
  public Scene              scene;
  public boolean            darkStyle = true;

  public DefaultNumericAxis xAxis     = new DefaultNumericAxis();
  public DefaultNumericAxis yAxis     = new DefaultNumericAxis();
  public final XYChart      chart     = new XYChart(xAxis,
                                                    yAxis);

  public Stage createScene()
  {
    stage = new Stage();
    initializeFuctions();
    root = new StackPane();
    configureChartPlugins();
    root.getChildren().add(chart);
    stage.initModality(Modality.WINDOW_MODAL);
    for (var renderer : chart.getRenderers()
                             .stream()
                             .filter(renderer -> renderer instanceof ErrorDataSetRenderer)
                             .collect(toList()))
    {
      ErrorDataSetRenderer ballDataRenderer = (ErrorDataSetRenderer) renderer;
      ballDataRenderer.addAxes(xAxis, yAxis);
      ballDataRenderer.setDrawMarker(false);
    }

    scene = new Scene(root,
                      1500,
                      750);

    if (darkStyle)
    {
      scene.getStylesheets().add("dark-theme.css");
    }
    stage.setTitle(this.getClass().getSimpleName());
    stage.setScene(scene);
    stage.setOnCloseRequest((evt) ->
    {
      evt.consume();
      stage.hide();
    });

    stage.showingProperty().addListener((obs, old, newthing) ->
    {
      if (newthing.booleanValue())
      {
        Platform.runLater(() ->
        {
          toFront();
        });
      }
    });
    stage.show();

//    toFront();

    return stage;
  }

  public void configureChartPlugins()
  {
    chart.getPlugins().addAll(new EditAxis(AxisMode.XY), new DataPointTooltip(), new Zoomer());
    // new CrosshairIndicator()
  }

  public void initializeFuctions()
  {
    resampleFunctions(parallel);
    refreshFunctionDatasets();
  }

  public boolean parallel = true;

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
