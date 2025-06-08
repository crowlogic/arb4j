package arb.stochastic;

import arb.Complex;
import arb.Real;
import arb.arblib;
import arb.viz.WindowManager;
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
import javafx.scene.Scene;
import javafx.scene.layout.ColumnConstraints;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.scene.layout.RowConstraints;
import javafx.stage.Stage;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 **/
public abstract class AbstractGaussianProcessSampler extends
                                                     Application
{

  public static double variance(double[] x, int n)
  {
    double var = 0.0;
    for (double val : x)
    {
      var += val * val;
    }
    var /= n;
    return var;
  }

  public static double[] autocorr(double[] x, int maxLagSteps)
  {
    int    n   = x.length;

    double var = variance(x, n);

    if (var < 1e-10)
    {
      return new double[maxLagSteps];
    }

    double[] acorr = new double[maxLagSteps];
    for (int k = 0; k < maxLagSteps; k++)
    {
      if (k == 0)
      {
        acorr[k] = 1.0;
      }
      else if (n - k > 0)
      {
        double cov = 0.0;
        for (int i = 0; i < n - k; i++)
        {
          cov += x[i] * x[i + k];
        }
        acorr[k] = (cov / (n - k)) / var;
      }
    }
    return acorr;
  }

  public static double[] computePowerSpectralDensity(double[] path)
  {
    // double mean = Arrays.stream(path).average().getAsDouble();

    try ( Complex complexPath = Complex.newVector(N); Complex fft = Complex.newVector(N); Real mag = new Real();
          Real scalingFactor = Real.valueOf(STEP_SIZE).div(N / 2, bits);)
    {
      // complexPath.sub(mean,bits);
      for (int i = 0; i < N; i++)
      {
        complexPath.get(i).set(path[i]);
      }

      arblib.acb_dft(fft, complexPath, N, bits);

      double[] periodogram = new double[N];

      for (int i = 0; i < N; i++)
      {
        periodogram[i] = fft.get(i).norm(bits, mag).pow(2, bits).mul(scalingFactor, bits).doubleValue();
      }
      return periodogram;
    }
  }

  public static double[] generateFrequencies(int nPoints, double dt)
  {
    double[] freq = new double[nPoints];
    double   df   = 1.0 / (nPoints * dt);
    for (int i = 0; i < nPoints; i++)
    {
      freq[i] = i <= nPoints / 2 ? i * df : (i - nPoints) * df;
    }
    return freq;
  }

  private static final double L            = 500.0;

  static final double         STEP_SIZE    = 0.01;

  static final int            N            = (int) (L / STEP_SIZE);

  static final double         LAGS_TO_SHOW = 20.0;

  static final int            bits         = 128;

  public static class Spectra
  {
    public final double[] path, pathQuad, envelope, t, freq, psd;
    public Complex        whiteNoise;

    public Spectra(double[] path,
                   double[] pathQuad,
                   double[] envelope,
                   double[] t,
                   double[] freq,
                   double[] psd,
                   Complex whiteNoise)
    {
      this.path       = path;
      this.pathQuad   = pathQuad;
      this.envelope   = envelope;
      this.t          = t;
      this.freq       = freq;
      this.psd        = psd;
      this.whiteNoise = whiteNoise;
    }
  }

  private boolean separateWindows = false;

  private boolean dark = false;

  public AbstractGaussianProcessSampler()
  {
    super();
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
    double[] empPSD       = computePowerSpectralDensity(result.path);
    double[] theoryPSD    = new double[posFreqCount];

    for (int i = 0; i < posFreqCount; i++)
    {
      freqPos[i]   = result.freq[i];
      theoryPSD[i] = result.psd[i];
    }

    chart4.getDatasets()
          .addAll(new DoubleDataSet("Empirical").set(freqPos, java.util.Arrays.copyOf(empPSD, posFreqCount)),
                  new DoubleDataSet("Theory").set(freqPos, theoryPSD));
    chart4.getXAxis().setAutoRanging(false);
    chart4.getXAxis().setMin(0);
    chart4.getXAxis().setMax(1.0);
    return chart4;
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

  @Override
  public void start(Stage primaryStage)
  {
    Spectra   result = generate();
    XYChart[] charts =
    { newTimeDomainChart(result), newNoiseChart(result), newAutocorrelationChart(result),
      newPowerSpectralDensityChart(result) };

    separateWindows = getParameters().getUnnamed().contains("--separate-windows");

    if (separateWindows)
    {
      Stage[]  stages =
      { primaryStage, new Stage(), new Stage(), new Stage() };
      String[] titles =
      { "Time Domain Analysis", "Noise Components", "Autocorrelation", "Power Spectral Density" };

      for (int i = 0; i < charts.length; i++)
      {
        configureChart(charts[i]);
        Scene scene = new Scene(charts[i]);
        stages[i].setScene(scene);
        stages[i].setTitle(titles[i]);
        stages[i].setMaximized(true);
        if (dark)
        {
          WindowManager.setMoreConduciveStyle(scene);
        }
        if (i > 0)
        {
          stages[i].show();
        }
      }
      primaryStage.show();
    }
    else
    {
      GridPane gridPane = createGridPane(charts);
      Scene    scene    = new Scene(gridPane);
      primaryStage.setScene(scene);
      primaryStage.setMaximized(true);
      primaryStage.show();
      if (dark)
      {
        WindowManager.setMoreConduciveStyle(scene);
      }
    }
  }

  protected abstract Spectra generate();

}