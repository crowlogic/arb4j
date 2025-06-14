package arb.stochastic;

import java.util.Arrays;
import java.util.Random;

import arb.Complex;
import arb.FloatInterval;
import arb.Real;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
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
import io.fair_acc.dataset.utils.DataSetStyleBuilder;
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
public abstract class GaussianProcessSampler extends
                                             Application
{

  protected final Random random = new Random();

  public abstract double[] getPowerSpectralDensity(double[] freq);

  public Spectra generate()
  {
    double[] freq = generateFrequencies(N, STEP_SIZE);
    double[] psd  = getPowerSpectralDensity(freq);

    try ( Complex complexSignal = Complex.newVector(N); Complex whiteNoise = Complex.newVector(N);
          Real mag = new Real(); Complex ifft = Complex.newVector(N); Real env = new Real())
    {
      complexSignal.get(0).zero();

      int    nyquistIndex = N / 2;
      double df           = 1.0 / (N * STEP_SIZE);

      for (int k = 1; k < nyquistIndex; k++)
      {
        mag.set(psd[k] * df).sqrt(bits);
        var element = whiteNoise.get(k);
        element.re().set(random.nextGaussian());
        element.im().set(random.nextGaussian());
        complexSignal.get(k).set(element).mul(mag, bits);
      }

      if (N % 2 == 0)
      {
        double dW = random.nextGaussian();
        whiteNoise.get(nyquistIndex).set(dW);
        complexSignal.get(nyquistIndex).set(Math.sqrt(psd[nyquistIndex] * df) * dW);
      }

      arblib.acb_dft_inverse(ifft, complexSignal, N, bits);

      ifft.mul(N, bits);

      double[] path = new double[N], pathQuad = new double[N], envelope = new double[N];

      for (int i = 0; i < N; i++)
      {
        Complex element = ifft.get(i);
        path[i]     = element.re().doubleValue();
        pathQuad[i] = element.im().doubleValue();
        envelope[i] = element.norm(bits, env).doubleValue();
      }

      double[] t = new double[N];
      for (int i = 0; i < N; i++)
      {
        t[i] = i * STEP_SIZE;
      }

      return new Spectra(path,
                         pathQuad,
                         envelope,
                         t,
                         freq,
                         psd,
                         whiteNoise);

    }
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

  private static final double L               = 1000.0;

  static final double         STEP_SIZE       = 0.01;

  static final int            N               = (int) (L / STEP_SIZE);

  static final double         LAGS_TO_SHOW    = 20.0;

  static final int            bits            = 128;

  private boolean             separateWindows = false;

  private boolean             dark            = true;

  public GaussianProcessSampler()
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
    chart.getRenderers().forEach(renderer -> renderer.getAxes().addAll(chart.getAxes()));
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
    chart3.setTitle("Covariance");
    int      maxLag = (int) (LAGS_TO_SHOW / STEP_SIZE) + 1;
    double[] lags   = new double[maxLag];
    double[] theory = new double[maxLag];
    getKernel(lags, theory);
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

  /**
   * FIXME: Use {@link FloatInterval} and
   * {@link RealFunction#quantize(FloatInterval, int, int, boolean)}
   * 
   * @param lags
   * @param theory
   */
  public abstract void getKernel(double[] lags, double[] theory);

  protected XYChart newNoiseChart(Spectra result)
  {
    XYChart chart2 = new XYChart(new DefaultNumericAxis("Frequency",
                                                        ""),
                                 new DefaultNumericAxis("Amplitude",
                                                        ""));
    chart2.setTitle("Random White Noise Measure");

    final ErrorDataSetRenderer errorRenderer2 = new ErrorDataSetRenderer();
    errorRenderer2.setPolyLineStyle(LineStyle.NONE);
    errorRenderer2.setErrorStyle(ErrorStyle.NONE);
    errorRenderer2.setDrawMarker(true);
    errorRenderer2.setDrawBubbles(false);
    errorRenderer2.setAssumeSortedData(false);

    int      posFreqCount = result.freq.length;
    double[] realNoise    = new double[posFreqCount];
    double[] imagNoise    = new double[posFreqCount];

    for (int i = 0; i < posFreqCount; i++)
    {
      Complex element = result.whiteNoise.get(i);
      realNoise[i] = element.re().doubleValue();
      imagNoise[i] = element.im().doubleValue();
    }

    DoubleDataSet realDataSet = new DoubleDataSet("Real").set(result.freq, realNoise);
    DoubleDataSet imagDataSet = new DoubleDataSet("Imag").set(result.freq, imagNoise);

    // Method from ScatterAndBubbleRendererSample - use DataSetStyleBuilder
    realDataSet.setStyle(DataSetStyleBuilder.instance().setMarkerType("circle").setMarkerSize(2).build());
    imagDataSet.setStyle(DataSetStyleBuilder.instance().setMarkerType("circle").setMarkerSize(2).build());

    chart2.getRenderers().clear();
    chart2.getRenderers().add(errorRenderer2);
    errorRenderer2.getDatasets().addAll(realDataSet, imagDataSet);

    chart2.getXAxis().setAutoRanging(false);
    chart2.getXAxis().setMin(0);
    chart2.getXAxis().setMax(1.0);

    return chart2;
  }

  protected XYChart newPowerSpectralDensityChart(Spectra result)
  {
    // Chart 4: PSD
    XYChart chart4 = new XYChart(new DefaultNumericAxis("Frequency",
                                                        ""),
                                 new DefaultNumericAxis("PSD",
                                                        ""));
    chart4.setTitle("Power Spectral Density");
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

    Arrays.stream(charts).forEach(this::configureChart);

    separateWindows = getParameters().getUnnamed().contains("--separate-windows");

    if (separateWindows)
    {
      Stage[] stages =
      { primaryStage, new Stage(), new Stage(), new Stage() };

      for (int i = 0; i < charts.length; i++)
      {
        XYChart chart = charts[i];

        Scene   scene = new Scene(chart);
        stages[i].setScene(scene);
        stages[i].setTitle(chart.getTitle());
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

}