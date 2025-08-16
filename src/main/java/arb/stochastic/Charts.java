package arb.stochastic;

import arb.Complex;
import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.AxisMode;
import io.fair_acc.chartfx.axes.spi.DefaultNumericAxis;
import io.fair_acc.chartfx.plugins.CrosshairIndicator;
import io.fair_acc.chartfx.plugins.EditAxis;
import io.fair_acc.chartfx.plugins.Screenshot;
import io.fair_acc.chartfx.plugins.TableViewer;
import io.fair_acc.chartfx.plugins.Zoomer;
import io.fair_acc.chartfx.renderer.ErrorStyle;
import io.fair_acc.chartfx.renderer.LineStyle;
import io.fair_acc.chartfx.renderer.spi.ErrorDataSetRenderer;
import io.fair_acc.dataset.spi.DoubleDataSet;
import javafx.scene.layout.ColumnConstraints;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.scene.layout.RowConstraints;

public class Charts
{

  public static XYChart newRandomWhiteNoiseMeasureChart(double[] frequencies, Complex whiteNoise)
  {
    XYChart chart = new XYChart(new DefaultNumericAxis("Frequency",
                                                       ""),
                                new DefaultNumericAxis("Measure",
                                                       ""));
    chart.setTitle("Random White Noise Measure");
  
    final ErrorDataSetRenderer scatterPlotRenderer    = Charts.newScatterChartRenderer();
  
    int                        positiveFrequencyCount = frequencies.length;
    double[]                   realNoise              = new double[positiveFrequencyCount];
    double[]                   imagNoise              = new double[positiveFrequencyCount];
    double[]                   normalizedFrequencies  = new double[positiveFrequencyCount];
  
    for (int i = 0; i < positiveFrequencyCount; i++)
    {
      Complex element = whiteNoise.get(i);
      realNoise[i]             = element.re().doubleValue();
      imagNoise[i]             = element.im().doubleValue();
      normalizedFrequencies[i] = frequencies[i] / StationaryGaussianProcessSampler.nyquistFrequency; // Normalize to [0, 1]
    }
  
    DoubleDataSet realDataSet = new DoubleDataSet("Real").set(normalizedFrequencies, realNoise);
    DoubleDataSet imagDataSet =
                              new DoubleDataSet("Imaginary").set(normalizedFrequencies, imagNoise);
  
    realDataSet.setStyle(StationaryGaussianProcessSampler.randomMeasureDatasetStyle);
    imagDataSet.setStyle(StationaryGaussianProcessSampler.randomMeasureDatasetStyle);
  
    chart.getRenderers().setAll(scatterPlotRenderer);
    scatterPlotRenderer.getDatasets().addAll(realDataSet, imagDataSet);
  
    chart.getXAxis().setAutoRanging(false);
    chart.getXAxis().setMin(0.0);
    chart.getXAxis().setMax(1.0);
  
    return chart;
  }

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

  public static void configureYAxisOfPowerSpectralDensityChart(XYChart chart)
  {
    chart.getYAxis().setAutoRanging(false);
    chart.getYAxis().setMin(0);
    chart.getYAxis().setMax(5.0);
  }

  public static void configureXAxisOfPowerSpectralDensityChart(XYChart chart)
  {
    chart.getXAxis().setAutoRanging(false);
    chart.getXAxis().setMin(0);
    chart.getXAxis().setMax(1.0);
  }

  public static ErrorDataSetRenderer newScatterChartRenderer()
  {
    final ErrorDataSetRenderer renderer = new ErrorDataSetRenderer();
    renderer.setPolyLineStyle(LineStyle.NONE);
    renderer.setErrorStyle(ErrorStyle.NONE);
    renderer.setDrawMarker(true);
    renderer.setDrawBubbles(false);
    renderer.setAssumeSortedData(false);
    return renderer;
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

}
