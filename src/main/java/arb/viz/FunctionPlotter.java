package arb.viz;

import java.util.stream.IntStream;

import arb.Float;
import arb.Real;
import arb.RealTwoDimensionalDataSet;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.FunctionSampler;
import arb.functions.real.RealFunction;
import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.AxisMode;
import io.fair_acc.chartfx.axes.spi.DefaultNumericAxis;
import io.fair_acc.chartfx.plugins.*;
import io.fair_acc.chartfx.renderer.spi.ErrorDataSetRenderer;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.StackPane;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FunctionPlotter extends
                             FunctionSampler
{

  public boolean            darkStyle = false;

  public boolean            parallel  = true;

  public StackPane          root;
  public Scene              scene;
  public Stage              stage;
  public DefaultNumericAxis xAxis     = new DefaultNumericAxis();

  public DefaultNumericAxis yAxis     = new DefaultNumericAxis();

  public final XYChart      chart     = new XYChart(xAxis,
                                                    yAxis);

  @Override
  public void close()
  {
    super.close();
    Platform.runLater(stage::close);
  }

  public void configureChartPlugins()
  {
    chart.getPlugins()
         .addAll(new EditAxis(AxisMode.XY),
                 new DataPointTooltip(),
                 new Zoomer(),
                 new TableViewer(),
                 new ColormapSelector(),
                 new Screenshot());

  }

  public Stage createScene()
  {
    stage = new Stage();
    initializeFuctions();
    root = new StackPane();
    configureChartPlugins();
    root.getChildren().add(chart);
    stage.initModality(Modality.WINDOW_MODAL);
    chart.getRenderers().stream().filter(renderer -> renderer instanceof ErrorDataSetRenderer).forEach(renderer ->
    {
      ErrorDataSetRenderer ballDataRenderer = (ErrorDataSetRenderer) renderer;
      ballDataRenderer.addAxes(xAxis, yAxis);
      ballDataRenderer.setDrawMarker(false);
    });

    scene = new Scene(root,
                      1500,
                      750);

    if (darkStyle)
    {
      WindowManager.setMoreConduciveStyle(scene);
    }
    stage.setTitle(this.getClass().getSimpleName());
    stage.setScene(scene);
    stage.setOnCloseRequest((evt) ->
    {
      evt.consume();
      stage.hide();
    });

    scene.addEventFilter(KeyEvent.KEY_PRESSED, event ->
    {
      if (event.getCode() == KeyCode.ESCAPE)
      {
        stage.fireEvent(new WindowEvent(stage,
                                        WindowEvent.WINDOW_CLOSE_REQUEST));
      }
    });

    stage.showingProperty().addListener((obs, old, newthing) ->
    {
      if (newthing.booleanValue())
      {
        Platform.runLater(this::toFront);
      }
    });
    stage.show();

    return stage;
  }

  private void freeExistingDatasets()
  {
    chart.getDatasets().forEach(ds -> ((RealTwoDimensionalDataSet) ds).close());
    chart.getDatasets().clear();
  }

  public void initializeFuctions()
  {
    resampleFunctions(parallel);
    refreshFunctionDatasets();
  }

  public RealTwoDimensionalDataSet getDataset(int index)
  {
    assert index < chart.getDatasets().size() && 0 <= index : String.format("0 <= index = %d < %d out of bounds",
                                                                            index,
                                                                            chart.getDatasets().size());
    return (RealTwoDimensionalDataSet) chart.getDatasets().get(index);
  }

  /**
   * Refresh the data sets associated with the functions.
   *
   * This method recalculates the sample count (if necessary), clears the current
   * data sets and then regenerates them for each function.
   */
  public void refreshFunctionDatasets()
  {
    if (sampleCount <= 0)
    {
      sampleCount = Math.min(10000, 1 + (int) domain.length(128, new Float()).mul(resolution, 128).doubleValue());
    }
    freeExistingDatasets();
    for (RealFunction function : functions)
    {
      RealTwoDimensionalDataSet dataset = new RealTwoDimensionalDataSet(function.toString() + " over " + domain,
                                                                        sampleCount,
                                                                        domain);
      domain.generateRealPartition(precision, false, dataset.getRealXValues());
      chart.getDatasets().add(dataset);
    }
  }

  /**
   * Resample all functions in the list.
   *
   * This method goes through the list of functions and resamples each one,
   * updating the corresponding data set with the new samples.
   *
   * @param parallel A boolean that indicates if the process should be
   *                 parallelized.
   */
  @SuppressWarnings("resource")
  public final void resampleFunctions(boolean parallel)
  {
    assert functions.size() == chart.getDatasets().size();
    IntStream functionStream = IntStream.range(0, functions.size());
    if (parallel)
    {
      functionStream = functionStream.parallel();
    }
    functionStream.forEach(i ->
    {
      RealFunction              function = functions.get(i);
      RealTwoDimensionalDataSet dataset  = (RealTwoDimensionalDataSet) chart.getDatasets().get(i);
      Real                      mesh     = dataset.getRealXValues();
      Real                      values   = dataset.getRealYValues();

      IntStream                 sequence = IntStream.range(0, sampleCount);
      if (parallel)
      {
        sequence = sequence.parallel();
      }
      sequence.forEach(n -> function.evaluate(mesh.get(n), 1, precision, values.get(n)));
      dataset.setName(function.toString());
    });
  }

  public void hide()
  {
    assert stage != null : "stage is null";
    Platform.runLater(() -> stage.hide());
  }

  public void show()
  {
    assert stage != null : "stage is null";
    Platform.runLater(() ->
    {
      stage.show();
      toFront();
    });
  }

  public void toFront()
  {
    WindowManager.bringToFront(stage);
  }

  @Override
  public String toString()
  {
    return String.format("FunctionPlotter[%s]", chart.getDatasets());
  }

  public void updateLegend()
  {
    chart.getLegend().updateLegend(chart.getRenderers(), true);

  }

}
