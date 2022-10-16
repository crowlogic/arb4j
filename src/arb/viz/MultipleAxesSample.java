package arb.viz;

import de.gsi.chart.XYChart;
import de.gsi.chart.axes.spi.DefaultNumericAxis;
import de.gsi.chart.plugins.DataPointTooltip;
import de.gsi.chart.plugins.EditAxis;
import de.gsi.chart.plugins.Zoomer;
import de.gsi.chart.renderer.Renderer;
import de.gsi.chart.renderer.spi.ErrorDataSetRenderer;
import de.gsi.chart.ui.geometry.Side;
import de.gsi.dataset.testdata.spi.CosineFunction;
import de.gsi.dataset.testdata.spi.GaussFunction;
import de.gsi.dataset.testdata.spi.RandomWalkFunction;
import de.gsi.dataset.testdata.spi.SineFunction;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.scene.Scene;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;

public class MultipleAxesSample extends
                                Application
{
  public static void main(final String[] args)
  {
    Application.launch(args);
  }

  @Override
  public void start(final Stage primaryStage)
  {

    final BorderPane           root           = new BorderPane();
    final Scene                scene          = new Scene(root,
                                                          800,
                                                          600);
    final ErrorDataSetRenderer errorRenderer2 = new ErrorDataSetRenderer();
    final ErrorDataSetRenderer errorRenderer3 = new ErrorDataSetRenderer();

    final XYChart              chart          = configureChart(errorRenderer2, errorRenderer3);

    configureDatasets(chart.getRenderers().get(0), errorRenderer2, errorRenderer3);

    setTheScene(primaryStage, root, scene, chart);
  }

  private void setTheScene(final Stage primaryStage, final BorderPane root, final Scene scene, final XYChart chart)
  {
    scene.getStylesheets().add("dark-theme.css");
    root.setCenter(chart);
    primaryStage.setTitle(this.getClass().getSimpleName());
    primaryStage.setScene(scene);
    primaryStage.setOnCloseRequest(evt -> Platform.exit());
    primaryStage.show();
  }

  private static final int sampleCount = 10000; // default:

  private static void configureDatasets(final Renderer renderer1, final Renderer renderer2, final Renderer renderer3)
  {
    renderer1.getDatasets()
             .setAll(new RandomWalkFunction("random walk",
                                            MultipleAxesSample.sampleCount));
    renderer2.getDatasets()
             .setAll(new CosineFunction("cosy",
                                        MultipleAxesSample.sampleCount,
                                        true),
                     new SineFunction("siny",
                                      MultipleAxesSample.sampleCount,
                                      true));
    renderer3.getDatasets()
             .setAll(new GaussFunction("gaussy",
                                       MultipleAxesSample.sampleCount));
  }

  private XYChart configureChart(final ErrorDataSetRenderer errorRenderer2,
                                 final ErrorDataSetRenderer errorRenderer3)
  {
    final DefaultNumericAxis xAxis1 = new DefaultNumericAxis("x axis");
    xAxis1.setAnimated(false);
    final DefaultNumericAxis xAxis2 = new DefaultNumericAxis("x axis2");
    xAxis2.setSide(Side.TOP);
    xAxis2.setAnimated(false);
    final DefaultNumericAxis yAxis1 = new DefaultNumericAxis("Y1",
                                                             "random");
    yAxis1.setAnimated(false);
    final DefaultNumericAxis yAxis2 = new DefaultNumericAxis("Y2",
                                                             "sine/cosine");
    // yAxis2.setSide(Side.LEFT); // unusual but possible case
    yAxis2.setSide(Side.RIGHT);
    yAxis2.setAnimated(false);
    final DefaultNumericAxis yAxis3 = new DefaultNumericAxis("Y3",
                                                             "gauss");
    yAxis3.setSide(Side.RIGHT);
    yAxis3.invertAxis(true);
    yAxis3.setAnimated(false);
    final XYChart chart = new XYChart(xAxis1,
                                      yAxis1);

    errorRenderer2.getAxes().add(yAxis2);
    errorRenderer3.getAxes().addAll(xAxis2, yAxis3);
    chart.getRenderers().addAll(errorRenderer2, errorRenderer3);

    chart.getPlugins().add(new DataPointTooltip());
    final Zoomer zoom = new Zoomer();
    // add axes that shall be excluded from the zoom action
    zoom.omitAxisZoomList().add(yAxis3);
    // alternatively (uncomment):
    Zoomer.setOmitZoom(xAxis2, true);
    chart.getPlugins().add(zoom);

    chart.getPlugins().add(new EditAxis());
    return chart;
  }
}
