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
  private static final int sampleCount = 10000;

  public static void main(final String[] args)
  {
    Application.launch(args);
  }

  private Renderer           renderer1;
  private Renderer           renderer2;
  private Renderer           renderer3;
  private DefaultNumericAxis xAxis1;
  private DefaultNumericAxis xAxis2;
  private DefaultNumericAxis yAxis1;
  private DefaultNumericAxis yAxis2;
  private DefaultNumericAxis yAxis3;

  private XYChart            chart;

  private void configureDatasets()
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

  private void configurePlugins()
  {
    chart.getPlugins().add(new DataPointTooltip());
    final Zoomer zoom = new Zoomer();
    zoom.omitAxisZoomList().add(yAxis3);
    Zoomer.setOmitZoom(xAxis2, true);
    chart.getPlugins().add(zoom);
    chart.getPlugins().add(new EditAxis());
  }

  private void configureRenderers()
  {
    renderer2 = new ErrorDataSetRenderer();
    renderer2.getAxes().add(yAxis2);
    renderer3 = new ErrorDataSetRenderer();
    renderer3.getAxes().addAll(xAxis2, yAxis3);
    chart.getRenderers().addAll(renderer2, renderer3);
  }

  private void setStage(final Stage primaryStage, final BorderPane root, final Scene scene, final XYChart chart)
  {
    root.setCenter(chart);

    primaryStage.setTitle(getClass().getSimpleName());
    primaryStage.setScene(scene);
    primaryStage.setOnCloseRequest(evt -> Platform.exit());
    primaryStage.show();
  }

  @Override
  public void start(final Stage primaryStage)
  {

    final BorderPane root  = new BorderPane();
    final Scene      scene = new Scene(root,
                                       800,
                                       600);
    scene.getStylesheets().add("dark-theme.css");

    xAxis1 = new DefaultNumericAxis("x axis");
    xAxis1.setAnimated(false);
    xAxis2 = new DefaultNumericAxis("x axis2");
    xAxis2.setSide(Side.TOP);
    xAxis2.setAnimated(false);
    yAxis1 = new DefaultNumericAxis("Y1",
                                    "random");
    yAxis1.setAnimated(false);
    yAxis2 = new DefaultNumericAxis("Y2",
                                    "sine/cosine");
    // yAxis2.setSide(Side.LEFT); // unusual but possible case
    yAxis2.setSide(Side.RIGHT);
    yAxis2.setAnimated(false);
    yAxis3 = new DefaultNumericAxis("Y3",
                                    "gauss");
    yAxis3.setSide(Side.RIGHT);
    yAxis3.invertAxis(true);
    yAxis3.setAnimated(false);
    chart = new XYChart(xAxis1,
                        yAxis1);

    configureRenderers();

    configurePlugins();
    renderer1 = chart.getRenderers().get(0);
    configureDatasets();

    setStage(primaryStage, root, scene, chart);
  }
}
