package arb.viz;

import java.util.ArrayList;
import java.util.stream.IntStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Float;
import arb.FloatInterval;
import arb.Real;
import arb.RealDataSet;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.AxisMode;
import io.fair_acc.chartfx.axes.spi.DefaultNumericAxis;
import io.fair_acc.chartfx.plugins.CrosshairIndicator;
import io.fair_acc.chartfx.plugins.EditAxis;
import io.fair_acc.chartfx.plugins.Screenshot;
import io.fair_acc.chartfx.plugins.TableViewer;
import io.fair_acc.chartfx.plugins.Zoomer;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.layout.StackPane;
import javafx.stage.Modality;
import javafx.stage.Stage;

/**
 * 
 * @author Stephen "Στεvε" Crowley
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FunctionPlotter implements
                             AutoCloseable
{

  public static boolean     darkStyle = true;

  public boolean            parallel  = true;

  public StackPane          root;
  public Scene              scene;
  public Stage              stage;
  public DefaultNumericAxis xAxis     = new DefaultNumericAxis();

  public DefaultNumericAxis yAxis     = new DefaultNumericAxis();

  public final XYChart      chart     = new XYChart(xAxis,
                                                    yAxis);

  boolean                   closed    = false;

  @Override
  public void close()
  {
    if (closed)
    {
      return;
    }
    closed = true;
    functions.forEach(RealFunction::close);
    Platform.runLater(stage::close);
  }

  public void configureChartPlugins()
  {
    chart.getPlugins()
         .addAll(new EditAxis(AxisMode.XY),
                 new Zoomer(),
                 new TableViewer(),
                 new CrosshairIndicator(),
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

    WindowManager.installEscapeKeyCloseHandler(stage);

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

  private static final Logger log = LoggerFactory.getLogger(FunctionPlotter.class);

  private void freeExistingDatasets()
  {
    chart.getDatasets().forEach(ds -> ((RealDataSet) ds).close());
    chart.getDatasets().clear();
  }

  public void initializeFuctions()
  {
    resampleFunctions();
    refreshFunctionDatasets();
  }

  public RealDataSet getDataset(int index)
  {
    assert index < chart.getDatasets().size()
                  && 0 <= index : String.format("0 <= index = %d < %d out of bounds",
                                                index,
                                                chart.getDatasets().size());
    return (RealDataSet) chart.getDatasets().get(index);
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
      sampleCount = Math.min(10000,
                             1 + (int) domain.length(128, new Float())
                                             .mul(resolution, 128)
                                             .doubleValue());
    }
    freeExistingDatasets();
    for (RealFunction function : functions)
    {
      RealDataSet dataset = new RealDataSet(function.toString() + " over " + domain,
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
  public final void resampleFunctions()
  {
    assert functions.size() == chart.getDatasets().size();
    IntStream functionStream = IntStream.range(0, functions.size());
    if (parallel)
    {
      functionStream = functionStream.parallel();
    }
    functionStream.forEach(i ->
    {
      RealFunction function = functions.get(i);
      RealDataSet  dataset  = (RealDataSet) chart.getDatasets().get(i);
      Real         mesh     = dataset.getRealXValues();
      Real         values   = dataset.getRealYValues();

      IntStream    sequence = IntStream.range(0, sampleCount);
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

  public static final int              precision   = 128;

  public final ArrayList<RealFunction> functions   = new ArrayList<>();

  public FloatInterval                 domain;

  public int                           sampleCount = 0;

  public int                           resolution  = 100;

  public FunctionPlotter(FloatInterval domain)
  {
    this.domain = domain;
  }

  public FunctionPlotter(FloatInterval domain, Float dt)
  {
    this.domain = domain;
    try ( Float length = domain.length(128, new Float()))
    {
      Float samplesPerUnit = length.div(dt, 128);
      this.resolution = (int) samplesPerUnit.doubleValue();
    }
  }

  /**
   * Default construct with a domain of -10..10
   */
  public FunctionPlotter()
  {
    this(new FloatInterval(-10,
                           10));
  }

}
