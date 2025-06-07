package arb;

import java.util.Random;

import arb.RandomWaveSampler.Spectra;
import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.AxisMode;
import io.fair_acc.chartfx.axes.spi.DefaultNumericAxis;
import io.fair_acc.chartfx.plugins.ColormapSelector;
import io.fair_acc.chartfx.plugins.DataPointTooltip;
import io.fair_acc.chartfx.plugins.EditAxis;
import io.fair_acc.chartfx.plugins.Screenshot;
import io.fair_acc.chartfx.plugins.TableViewer;
import io.fair_acc.chartfx.plugins.Zoomer;
import io.fair_acc.dataset.spi.DoubleDataSet;
import javafx.application.Application;
import javafx.scene.layout.ColumnConstraints;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.scene.layout.RowConstraints;

public abstract class GaussianProcessSampler extends
                                             Application
{

  private static final double L            = 500.0;

  static final double         STEP_SIZE    = 0.01;

  static final int            N            = (int) (L / STEP_SIZE);

  static final double         LAGS_TO_SHOW = 20.0;

  protected final Random        random       = new Random();

  static final int            bits         = 128;

  public GaussianProcessSampler()
  {
    super();
  }

  protected GridPane createGridPane(XYChart[] charts)
  {
    GridPane gridPane = new GridPane();
    gridPane.setHgap(10);
    gridPane.setVgap(10);

    // Fixed column constraints
    ColumnConstraints col1 = new ColumnConstraints();
    col1.setPercentWidth(50);
    ColumnConstraints col2 = new ColumnConstraints();
    col2.setPercentWidth(50);
    gridPane.getColumnConstraints().addAll(col1, col2);

    // Fixed row constraints
    RowConstraints row1 = new RowConstraints();
    row1.setPercentHeight(50);
    RowConstraints row2 = new RowConstraints();
    row2.setPercentHeight(50);
    gridPane.getRowConstraints().addAll(row1, row2);

    for (XYChart chart : charts)
    {
      configureChart(chart);
      chart.setPrefSize(10000, 10000);
      GridPane.setHgrow(chart, Priority.ALWAYS); // Add horizontal grow
      GridPane.setVgrow(chart, Priority.ALWAYS); // Add vertical grow
    }

    gridPane.add(charts[0], 0, 0);
    gridPane.add(charts[1], 1, 0);
    gridPane.add(charts[2], 0, 1);
    gridPane.add(charts[3], 1, 1);

    return gridPane;
  }

  protected XYChart newPowerSpectralDensityChart(Spectra result)
  {
    // Chart 4: PSD
    XYChart chart4 = new XYChart(new DefaultNumericAxis("Frequency",
                                                        ""),
                                 new DefaultNumericAxis("PSD",
                                                        ""));
    chart4.setTitle("PSD Comparison");
    int      posFreqCount = N / 2 + 1;
    double[] freqPos      = new double[posFreqCount];
    double[] empPSD       = computeEmpiricalPSD(result.path);
    double[] theoryPSD    = new double[posFreqCount];
    double   df           = 1.0 / (N * STEP_SIZE);

    for (int i = 0; i < posFreqCount; i++)
    {
      freqPos[i]   = result.freq[i];
      theoryPSD[i] = result.psd[i];
    }

    chart4.getDatasets()
          .addAll(new DoubleDataSet("Empirical").set(freqPos, java.util.Arrays.copyOf(empPSD, posFreqCount)),
                  new DoubleDataSet("Theory").set(freqPos, theoryPSD));
    chart4.getXAxis().setAutoRanging(false);
    chart4.getXAxis().setMin(-1.0);
    chart4.getXAxis().setMax(1.0);
    return chart4;
  }

  protected abstract double[] computeEmpiricalPSD(double[] path);

  protected XYChart newAutocorrelationChart(Spectra result)
  {
    // Chart 3: Autocorrelation
    XYChart chart3 = new XYChart(new DefaultNumericAxis("Lag",
                                                        ""),
                                 new DefaultNumericAxis("Correlation",
                                                        ""));
    chart3.setTitle("Covariance Verification");
    int      maxLag = (int) (LAGS_TO_SHOW / STEP_SIZE) + 1;
    double[] lags   = new double[maxLag];
    double[] theory = new double[maxLag];
    try ( Real val = new Real())
    {
      for (int i = 0; i < maxLag; i++)
      {
        lags[i]   = i * STEP_SIZE;
        theory[i] = val.set(2 * Math.PI * lags[i]).J0(128, val).doubleValue();
      }
    }
    chart3.getDatasets()
          .addAll(new DoubleDataSet("Empirical").set(lags, autocorr(result.path, maxLag)),
                  new DoubleDataSet("Theory").set(lags, theory));
    chart3.getYAxis().setAutoRanging(false);
    chart3.getYAxis().setMin(-0.5);
    chart3.getYAxis().setMax(1.05);
    chart3.getXAxis().setAutoRanging(false);
    chart3.getXAxis().setMin(0);
    chart3.getXAxis().setMax(LAGS_TO_SHOW);
    return chart3;
  }

  protected abstract double[] autocorr(double[] path, int maxLag);

  protected XYChart newNoiseChart(Spectra result)
  {
    // Chart 2: Noise components
    XYChart chart2 = new XYChart(new DefaultNumericAxis("Index",
                                                        ""),
                                 new DefaultNumericAxis("Value",
                                                        ""));
    chart2.setTitle("White Noise Components");
    int      nShow   = Math.min(200, N);
    double[] indices = new double[nShow];
    for (int i = 0; i < nShow; i++)
      indices[i] = i;
    chart2.getDatasets()
          .addAll(new DoubleDataSet("Real").set(indices,
                                                java.util.Arrays.copyOf(result.whiteNoise.re().doubleValues(), nShow)),
                  new DoubleDataSet("Imag").set(indices,
                                                java.util.Arrays.copyOf(result.whiteNoise.im().doubleValues(), nShow)));
    return chart2;
  }

  protected XYChart newTimeDomainChart(Spectra result)
  {
    // Chart 1: Time domain
    XYChart chart1 = new XYChart(new DefaultNumericAxis("Time",
                                                        ""),
                                 new DefaultNumericAxis("Value",
                                                        ""));

    chart1.setTitle("In-Phase, Quadrature, and Envelope (±) via Hilbert Transform");

    DoubleDataSet inPhase = new DoubleDataSet("In-phase").set(result.t, result.path);
    DoubleDataSet quad    = new DoubleDataSet("Quadrature").set(result.t, result.pathQuad);
    DoubleDataSet envPos  = new DoubleDataSet("Envelope (+)").set(result.t, result.envelope);
    double[]      negEnv  = new double[N];
    for (int i = 0; i < N; i++)
      negEnv[i] = -result.envelope[i];
    DoubleDataSet envNeg = new DoubleDataSet("Envelope (–)").set(result.t, negEnv);
    chart1.getDatasets().addAll(inPhase, quad, envPos, envNeg);
    return chart1;
  }

  protected void configureChart(XYChart chart)
  {
    chart.getPlugins()
         .addAll(new EditAxis(AxisMode.XY),
                 new DataPointTooltip(),
                 new Zoomer(),
                 new TableViewer(),
                 new ColormapSelector(),
                 new Screenshot());

  }

}