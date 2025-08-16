package arb.stochastic;

import arb.Complex;
import arb.viz.WindowManager;
import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.spi.DefaultNumericAxis;
import io.fair_acc.chartfx.renderer.spi.ErrorDataSetRenderer;
import io.fair_acc.dataset.spi.DoubleDataSet;

public class Charts
{

  public static XYChart newRandomWhiteNoiseMeasureChart(double[] frequencies, Complex whiteNoise)
  {
    XYChart chart = new XYChart(new DefaultNumericAxis("Frequency",
                                                       ""),
                                new DefaultNumericAxis("Measure",
                                                       ""));
    chart.setTitle("Random White Noise Measure");
  
    final ErrorDataSetRenderer scatterPlotRenderer    = WindowManager.newScatterChartRenderer();
  
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

}
