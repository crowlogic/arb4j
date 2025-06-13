package arb.stochastic;

import java.util.Arrays;
import java.util.Random;

import arb.Complex;
import arb.Real;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
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
import io.fair_acc.chartfx.renderer.ErrorStyle;
import io.fair_acc.chartfx.renderer.LineStyle;
import io.fair_acc.chartfx.renderer.spi.ErrorDataSetRenderer;
import io.fair_acc.dataset.spi.DoubleDataSet;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.ColumnConstraints;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.scene.layout.RowConstraints;
import javafx.stage.Stage;

/**
 * Base class for Gaussian process samplers providing common functionality for
 * visualization, autocorrelation calculation, and spectral analysis.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class StationaryGaussianProcessSampler extends
                                             Application
{

  private static final double L            = 500.0;
  static final double         STEP_SIZE    = 0.01;
  static final int            N            = (int) (L / STEP_SIZE);
  static final double         LAGS_TO_SHOW = 20.0;

  static final int            bits         = 128;

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
    try ( Complex complexPath = Complex.newVector(N); Complex fft = Complex.newVector(N); Real mag = new Real();
          Real scalingFactor = Real.valueOf(STEP_SIZE).div(N / 2, bits))
    {

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

  private boolean        separateWindows = false;
  private boolean        dark            = false;
  protected final Random random          = new Random();

  public StationaryGaussianProcessSampler()
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
    // Legacy method for backward compatibility
    GridPane gridPane = new GridPane();
    gridPane.setHgap(10);
    gridPane.setVgap(10);

    ColumnConstraints col1 = new ColumnConstraints();
    col1.setPercentWidth(50);
    ColumnConstraints col2 = new ColumnConstraints();
    col2.setPercentWidth(50);
    gridPane.getColumnConstraints().addAll(col1, col2);

    RowConstraints row1 = new RowConstraints();
    row1.setPercentHeight(50);
    RowConstraints row2 = new RowConstraints();
    row2.setPercentHeight(50);
    gridPane.getRowConstraints().addAll(row1, row2);

    for (int i = 0; i < Math.min(4, charts.length); i++)
    {
      XYChart chart = charts[i];
      configureChart(chart);
      chart.setPrefSize(10000, 10000);
      GridPane.setHgrow(chart, Priority.ALWAYS);
      GridPane.setVgrow(chart, Priority.ALWAYS);

      gridPane.add(chart, i % 2, i / 2);
    }

    return gridPane;
  }

  protected XYChart newAutocorrelationChart(Spectra result)
  {
    XYChart chart3 = new XYChart(new DefaultNumericAxis("Lag",
                                                        ""),
                                 new DefaultNumericAxis("Correlation",
                                                        ""));
    chart3.setTitle("Covariance Verification");
    int      maxLag = (int) (LAGS_TO_SHOW / STEP_SIZE) + 1;
    double[] lags   = new double[maxLag];
    double[] theory = new double[maxLag];
    getKernel(maxLag, lags, theory);
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
  
  public abstract void getKernel(int maxLag, double[] lags, double[] theory);
  
  protected XYChart newSpectralIncrementChart(Spectra result)
  {
    XYChart chart = new XYChart(new DefaultNumericAxis("Frequency λ",
                                                       ""),
                                new DefaultNumericAxis("Spectral Increment",
                                                       ""));
    chart.setTitle("Spectral Increments dU(λ) and dV(λ)");

    // Configure proper scatter plot renderer
    final ErrorDataSetRenderer scatterRenderer = new ErrorDataSetRenderer();
    scatterRenderer.setPolyLineStyle(LineStyle.NONE);
    scatterRenderer.setErrorStyle(ErrorStyle.NONE);
    scatterRenderer.setDrawMarker(true);
    scatterRenderer.setAssumeSortedData(false);

    chart.getRenderers().clear();
    chart.getRenderers().add(scatterRenderer);

    int      len        = result.uProcess.length - 1;
    double[] freqMid    = new double[len];
    double[] uIncrement = new double[len];
    double[] vIncrement = new double[len];

    for (int i = 0; i < len; i++)
    {
      freqMid[i]    = (result.posFreq[i] + result.posFreq[i + 1]) * 0.5;
      uIncrement[i] = result.uProcess[i + 1] - result.uProcess[i];
      vIncrement[i] = result.vProcess[i + 1] - result.vProcess[i];
    }

    DoubleDataSet uDataSet = new DoubleDataSet("dU(λ)").set(freqMid, uIncrement);
    DoubleDataSet vDataSet = new DoubleDataSet("dV(λ)").set(freqMid, vIncrement);

    scatterRenderer.getDatasets().addAll(uDataSet, vDataSet);

    chart.getXAxis().setAutoRanging(false);
    chart.getXAxis().setMin(0);
    chart.getXAxis().setMax(1.0);

    return chart;
  }

  protected XYChart newNoiseChart(Spectra result)
  {
    XYChart chart2 = new XYChart(new DefaultNumericAxis("Frequency",
                                                        ""),
                                 new DefaultNumericAxis("Amplitude",
                                                        ""));
    chart2.setTitle("White Noise Components");

    // Configure proper scatter plot renderer
    final ErrorDataSetRenderer scatterRenderer = new ErrorDataSetRenderer();
    scatterRenderer.setPolyLineStyle(LineStyle.NONE);
    scatterRenderer.setErrorStyle(ErrorStyle.NONE);
    scatterRenderer.setDrawMarker(true);
    scatterRenderer.setAssumeSortedData(false);

    chart2.getRenderers().clear();
    chart2.getRenderers().add(scatterRenderer);

    int      posFreqCount = result.posFreq.length;
    double[] realNoise    = new double[posFreqCount];
    double[] imagNoise    = new double[posFreqCount];

    for (int i = 0; i < posFreqCount; i++)
    {
      realNoise[i] = result.whiteNoise.get(i).re().doubleValue();
      imagNoise[i] = result.whiteNoise.get(i).im().doubleValue();
    }

    DoubleDataSet realDataSet = new DoubleDataSet("Real").set(result.posFreq, realNoise);
    DoubleDataSet imagDataSet = new DoubleDataSet("Imag").set(result.posFreq, imagNoise);

    scatterRenderer.getDatasets().addAll(realDataSet, imagDataSet);

    chart2.getXAxis().setAutoRanging(false);
    chart2.getXAxis().setMin(0);
    chart2.getXAxis().setMax(1.0);

    return chart2;
  }

  protected XYChart newPowerSpectralDensityChart(Spectra result)
  {
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
          .addAll(new DoubleDataSet("Empirical").set(freqPos, Arrays.copyOf(empPSD, posFreqCount)),
                  new DoubleDataSet("Theory").set(freqPos, theoryPSD));
    chart4.getXAxis().setAutoRanging(false);
    chart4.getXAxis().setMin(0);
    chart4.getXAxis().setMax(1.0);
    return chart4;
  }

  protected XYChart newTimeDomainChart(Spectra result)
  {
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

  protected void showGridLayout(Stage primaryStage, XYChart[] charts)
  {
    GridPane gridPane = new GridPane();
    gridPane.setHgap(5);
    gridPane.setVgap(5);

    // 3x2 grid for 6 charts
    ColumnConstraints col1 = new ColumnConstraints();
    col1.setPercentWidth(33.33);
    ColumnConstraints col2 = new ColumnConstraints();
    col2.setPercentWidth(33.33);
    ColumnConstraints col3 = new ColumnConstraints();
    col3.setPercentWidth(33.33);
    gridPane.getColumnConstraints().addAll(col1, col2, col3);

    RowConstraints row1 = new RowConstraints();
    row1.setPercentHeight(50);
    RowConstraints row2 = new RowConstraints();
    row2.setPercentHeight(50);
    gridPane.getRowConstraints().addAll(row1, row2);

    for (XYChart chart : charts)
    {
      configureChart(chart);
      GridPane.setHgrow(chart, Priority.ALWAYS);
      GridPane.setVgrow(chart, Priority.ALWAYS);
    }

    gridPane.add(charts[0], 0, 0); // Time domain
    gridPane.add(charts[1], 1, 0); // Orthogonal processes
    gridPane.add(charts[2], 2, 0); // Autocorrelation
    gridPane.add(charts[3], 0, 1); // PSD
    gridPane.add(charts[4], 1, 1); // Spectral increments
    gridPane.add(charts[5], 2, 1); // Noise

    Scene scene = new Scene(gridPane);
    primaryStage.setScene(scene);
    primaryStage.setMaximized(true);
    primaryStage.show();

    if (dark)
    {
      WindowManager.setMoreConduciveStyle(scene);
    }
  }

  protected void showSeparateWindows(Stage primaryStage, XYChart[] charts)
  {
    Stage[]  stages =
    { primaryStage, new Stage(), new Stage(), new Stage(), new Stage(), new Stage() };
    String[] titles =
    { "Time Domain Analysis", "Orthogonal Processes", "Autocorrelation", "Power Spectral Density",
      "Spectral Increments", "Noise Components" };

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

  protected XYChart newOrthogonalProcessChart(Spectra result)
  {
    XYChart chart = new XYChart(new DefaultNumericAxis("Frequency λ",
                                                       ""),
                                new DefaultNumericAxis("Process Value",
                                                       ""));
    chart.setTitle("Orthogonal Processes U(λ) and V(λ)");

    // Configure proper scatter plot renderer
    final ErrorDataSetRenderer scatterRenderer = new ErrorDataSetRenderer();
    scatterRenderer.setPolyLineStyle(LineStyle.NONE);
    scatterRenderer.setErrorStyle(ErrorStyle.NONE);
    scatterRenderer.setDrawMarker(true);
    scatterRenderer.setAssumeSortedData(false);

    chart.getRenderers().clear();
    chart.getRenderers().add(scatterRenderer);

    DoubleDataSet uDataSet = new DoubleDataSet("U(λ) - Cosine Component").set(result.posFreq, result.uProcess);
    DoubleDataSet vDataSet = new DoubleDataSet("V(λ) - Sine Component").set(result.posFreq, result.vProcess);

    scatterRenderer.getDatasets().addAll(uDataSet, vDataSet);

    chart.getXAxis().setAutoRanging(false);
    chart.getXAxis().setMin(0);
    chart.getXAxis().setMax(1.0);

    return chart;
  }

  /**
   * Process-specific visualization setup - uses inherited orthogonal process
   * functionality.
   */
  @Override
  public void start(Stage primaryStage)
  {
    Spectra   result = generate();
    XYChart[] charts =
    { newTimeDomainChart(result), newOrthogonalProcessChart(result), newAutocorrelationChart(result),
      newPowerSpectralDensityChart(result), newSpectralIncrementChart(result), newNoiseChart(result) };

    if (getParameters().getUnnamed().contains("--separate-windows"))
    {
      showSeparateWindows(primaryStage, charts);
    }
    else
    {
      showGridLayout(primaryStage, charts);
    }
  }

  /**
   * Generic implementation of orthogonal process extraction that works for any
   * Gaussian process.
   */
  public Spectra generate()
  {
    double[] freq = generateFrequencies(N, STEP_SIZE);
    double[] psd  = getPowerSpectralDensity(freq);

    try ( Complex complexSignal = Complex.newVector(N); Complex whiteNoise = Complex.newVector(N);
          Real mag = new Real(); Complex ifft = Complex.newVector(N); Real env = new Real())
    {

      int      nyquistIndex = N / 2;
      double   df           = 1.0 / (N * STEP_SIZE);

      // Arrays for orthogonal processes (available to all Gaussian processes)
      double[] uProcess     = new double[nyquistIndex + 1];
      double[] vProcess     = new double[nyquistIndex + 1];
      double[] posFreq      = new double[nyquistIndex + 1];

      // Zero frequency component
      complexSignal.get(0).zero();
      uProcess[0] = 0.0;
      vProcess[0] = 0.0;
      posFreq[0]  = 0.0;

      // Generate signal and extract orthogonal processes
      for (int k = 1; k < nyquistIndex; k++)
      {
        mag.set(psd[k] * df).sqrt(bits);
        var element = whiteNoise.get(k);
        element.re().set(random.nextGaussian());
        element.im().set(random.nextGaussian());
        complexSignal.get(k).set(element).mul(mag, bits);

        // Extract orthogonal processes (universal for all Gaussian processes)
        uProcess[k] = complexSignal.get(k).re().doubleValue();
        vProcess[k] = complexSignal.get(k).im().doubleValue();
        posFreq[k]  = freq[k];

        // Hermitian symmetry for real-valued output
        complexSignal.get(N - k).set(complexSignal.get(k)).conj();
      }

      // Nyquist frequency handling
      if (N % 2 == 0)
      {
        double dW = random.nextGaussian();
        whiteNoise.get(nyquistIndex).set(dW);
        complexSignal.get(nyquistIndex).set(Math.sqrt(psd[nyquistIndex] * df) * dW);

        uProcess[nyquistIndex] = complexSignal.get(nyquistIndex).re().doubleValue();
        vProcess[nyquistIndex] = 0.0;
        posFreq[nyquistIndex]  = freq[nyquistIndex];
      }

      // Inverse FFT
      arblib.acb_dft_inverse(ifft, complexSignal, N, bits);
      ifft.mul(N, bits);

      // Extract time domain paths
      double[] path     = new double[N];
      double[] pathQuad = new double[N];
      double[] envelope = new double[N];
      double[] t        = new double[N];

      for (int i = 0; i < N; i++)
      {
        Complex element = ifft.get(i);
        path[i]     = element.re().doubleValue();
        pathQuad[i] = element.im().doubleValue();
        envelope[i] = element.norm(bits, env).doubleValue();
        t[i]        = i * STEP_SIZE;
      }

      return new Spectra(path,
                         pathQuad,
                         envelope,
                         t,
                         freq,
                         psd,
                         whiteNoise,
                         uProcess,
                         vProcess,
                         posFreq);
    }
  }

  /**
   * Must be implemented by concrete process types (RandomWave,
   * Ornstein-Uhlenbeck, etc.)
   */
  public abstract double[] getPowerSpectralDensity(double[] freq);
}
