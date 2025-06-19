package arb.stochastic;

import java.util.Arrays;

import arb.*;
import arb.functions.real.RealFunction;
import arb.viz.WindowManager;
import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.AxisMode;
import io.fair_acc.chartfx.axes.spi.DefaultNumericAxis;
import io.fair_acc.chartfx.plugins.*;
import io.fair_acc.chartfx.renderer.ErrorStyle;
import io.fair_acc.chartfx.renderer.LineStyle;
import io.fair_acc.chartfx.renderer.spi.ErrorDataSetRenderer;
import io.fair_acc.dataset.spi.DoubleDataSet;
import io.fair_acc.dataset.utils.DataSetStyleBuilder;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.*;
import javafx.stage.Stage;

/**
 * 
 * <h3>FFT Nyquist Frequency Handling</h3>
 * 
 * <p>
 * The special handling of the Nyquist frequency in FFT operations stems from
 * fundamental mathematical properties of the discrete Fourier transform,
 * particularly for real-valued input signals.
 * </p>
 * 
 * <h4>Hermitian Symmetry and Mathematical Constraints</h4>
 * 
 * <p>
 * For real-valued input signals, the DFT exhibits Hermitian symmetry:
 * <code>X(-ν) = X(ν)*</code>, where <code>*</code> denotes complex conjugation.
 * At the Nyquist frequency (<code>ν = 1/2</code>), this symmetry condition
 * becomes:
 * </p>
 * 
 * <p>
 * <code>X(1/2) = X(-1/2) = X(1/2)*</code>
 * </p>
 * 
 * <p>
 * This mathematical constraint forces the imaginary component to zero:
 * <code>Im{X(1/2)} = (X(1/2) - X(1/2)*)/2i = 0</code>.
 * </p>
 * 
 * <h4>Basis Function Properties</h4>
 * 
 * <p>
 * The complex exponential basis function at the Nyquist frequency is purely
 * real. For an N-point FFT, the Nyquist frequency corresponds to the sequence
 * <code>[1, -1, 1, -1, ...]</code>, which alternates between +1 and -1. Unlike
 * other frequency bins that involve complex exponentials with both real and
 * imaginary components, the Nyquist frequency basis function cannot represent
 * phase information—it can only be scaled or sign-flipped, never phase-shifted.
 * </p>
 * 
 * <h4>Even vs. Odd Length FFTs</h4>
 * 
 * <p>
 * The treatment differs significantly based on whether N is even or odd:
 * </p>
 * 
 * <p>
 * <strong>Even N</strong>: Contains exactly one bin at the Nyquist frequency
 * (<code>k = N/2</code>). This bin represents both <code>+f_Nyquist</code> and
 * <code>-f_Nyquist</code> since
 * <code>exp(-j2π(0.5)n) = exp(-j2π(-0.5)n)</code>.
 * </p>
 * 
 * <p>
 * <strong>Odd N</strong>: No bin exists exactly at the Nyquist frequency since
 * <code>k/N</code> can never equal 0.5 when N is odd. The frequency bins are
 * distributed symmetrically around DC without a central Nyquist bin.
 * </p>
 * 
 * <h4>Spectral Conversion Implications</h4>
 * 
 * <p>
 * When converting from two-sided to single-sided amplitude spectra, the Nyquist
 * frequency (along with DC) is not multiplied by 2 like other positive
 * frequencies. This occurs because the Nyquist frequency lacks a complex
 * conjugate pair in the negative frequency domain—it represents a unique,
 * purely real frequency component.
 * </p>
 * 
 * <p>
 * The special handling ensures mathematical consistency with the underlying
 * continuous Fourier transform properties and prevents spectral artifacts that
 * would arise from treating the Nyquist frequency identically to other
 * frequency bins.
 * </p>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 **/
public abstract class GaussianProcessSampler extends
                                             Application
{

  public double[] inPhaseSamplePath;

  public double[] quadratureSamplePath;

  public double[] envelope;

  public double[] samplingTimes;

  public double[] frequencies;

  public double[] powerSpectralDensity;

  public Complex  whiteNoise;

  public abstract double[] getPowerSpectralDensity(double[] freq);

  long seed = 777;

  public GaussianProcessSampler generate()
  {
    frequencies          = generateFrequencies(N, STEP_SIZE);
    powerSpectralDensity = getPowerSpectralDensity(frequencies);
    whiteNoise           = Complex.newVector(N);
    inPhaseSamplePath    = new double[N];
    quadratureSamplePath = new double[N];
    envelope             = new double[N];
    samplingTimes        = new double[N];

    try ( Complex randomMeasure = Complex.newVector(N); Real mag = new Real();
          Complex ifft = Complex.newVector(N); Real env = new Real(); Real rnd = new Real();
          RealWhiteNoiseProcess whiteNoiseProcess = new RealWhiteNoiseProcess())
    {
      whiteNoiseProcess.initializeWithSeed(seed);

      randomMeasure.get(0).zero();

      int    nyquistIndex = N / 2;
      double df           = 1.0 / (N * STEP_SIZE);

      for (int k = 1; k < nyquistIndex; k++)
      {
        samplePoint(randomMeasure, mag, whiteNoiseProcess, df, k, false);
      }

      if (N % 2 == 0)
      {
        samplePoint(randomMeasure, mag, whiteNoiseProcess, df, nyquistIndex, true);
      }

      arblib.acb_dft_inverse(ifft, randomMeasure, N, bits);

      ifft.mul(N, bits);

      for (int i = 0; i < N; i++)
      {
        Complex element = ifft.get(i);
        samplingTimes[i]        = i * STEP_SIZE;
        inPhaseSamplePath[i]    = element.re().doubleValue();
        quadratureSamplePath[i] = element.im().doubleValue();
        envelope[i]             = element.norm(bits, env).doubleValue();
      }

      return this;

    }
  }

  protected void samplePoint(Complex randomMeasure,
                             Real mag,
                             RealWhiteNoiseProcess whiteNoiseProcess,
                             double df,
                             int k,
                             boolean realOnly)
  {
    var sample = whiteNoise.get(k);
    whiteNoiseProcess.sample(bits, sample.re());
    if (realOnly)
    {
      sample.im().zero();
    }
    else
    {
      whiteNoiseProcess.sample(bits, sample.im());
    }

    randomMeasure.get(k).set(sample).mul(mag.set(powerSpectralDensity[k] * df).sqrt(bits), bits);
  }

  /**
   * TODO: Replace with {@link Real#variance(int, Real)}
   * 
   * @param x
   * @return
   */
  public static double variance(double[] x)
  {
    return Arrays.stream(x).map(y -> y * y).average().getAsDouble();
  }

  /**
   * TODO: replace with {@link Real#structure(int, int, Real)} which is a
   * collection of {@link Real#gammaVariance(int, int, Real)}s evaluatedat the
   * given times (evenly spaced).
   * 
   * 
   * Need to add varianceStructureFunction function to {@link RealFunction} which
   * will accept an interval of which to quantize before calculating the
   * associated {@link Real#structure(int, int)} of it
   * 
   * @param x
   * @param maxLagSteps
   * @return
   */
  public static double[] autocorr(double[] x, int maxLagSteps)
  {
    int    n   = x.length;

    double var = variance(x);

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

    try ( Complex complexPath = Complex.newVector(N); Complex fft = Complex.newVector(N);
          Real mag = new Real(); Real scalingFactor = Real.valueOf(STEP_SIZE).div(N / 2, bits);)
    {
      for (int i = 0; i < N; i++)
      {
        complexPath.get(i).set(path[i]);
      }

      arblib.acb_dft(fft, complexPath, N, bits);

      double[] periodogram = new double[N];

      for (int i = 0; i < N; i++)
      {
        periodogram[i] = fft.get(i)
                            .norm(bits, mag)
                            .pow(2, bits)
                            .mul(scalingFactor, bits)
                            .doubleValue();
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
                 new Zoomer(),
                 new TableViewer(),
                 new CrosshairIndicator());
    chart.getRenderers().forEach(renderer -> renderer.getAxes().addAll(chart.getAxes()));
    chart.getStylesheets()
         .add("data:text/css,.chart-crosshair-path { -fx-stroke: white; -fx-stroke-width: 2; }");
    chart.getStylesheets()
         .add("data:text/css,.chart-crosshair-label { -fx-fill:yellow; -fx-font-size: 16px; }");
  }

  protected GridPane createGridPane(XYChart[] charts)
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

  protected XYChart newAutocorrelationChart()
  {
    XYChart chart3 = new XYChart(new DefaultNumericAxis("Δt",
                                                        ""),
                                 new DefaultNumericAxis("Correlation",
                                                        ""));
    chart3.setTitle("Covariance");
    int      maxLag = (int) (LAGS_TO_SHOW / STEP_SIZE) + 1;
    double[] lags   = new double[maxLag];
    double[] theory = new double[maxLag];
    getKernel(lags, theory);
    chart3.getDatasets()
          .addAll(new DoubleDataSet("Empirical").set(lags, autocorr(inPhaseSamplePath, maxLag)),
                  new DoubleDataSet("Theoretical").set(lags, theory));
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
   * @param times
   * @param values
   */
  public abstract void getKernel(double[] times, double[] values);

  protected XYChart newRandomWhiteNoiseMeasureChart()
  {
    XYChart chart = new XYChart(new DefaultNumericAxis("Frequency",
                                                       ""),
                                new DefaultNumericAxis("Measure",
                                                       ""));
    chart.setTitle("Random White Noise Measure");

    final ErrorDataSetRenderer scatterPlotRenderer = newScatterChartRenderer();

    int                        posFreqCount        = frequencies.length;
    double[]                   realNoise           = new double[posFreqCount];
    double[]                   imagNoise           = new double[posFreqCount];
    double[]                   normalizedFreq      = new double[posFreqCount];
    double                     nyquistFreq         = 1.0 / (2 * STEP_SIZE);    // 50 Hz

    for (int i = 0; i < posFreqCount; i++)
    {
      Complex element = whiteNoise.get(i);
      realNoise[i]      = element.re().doubleValue();
      imagNoise[i]      = element.im().doubleValue();
      normalizedFreq[i] = frequencies[i] / nyquistFreq; // Normalize to [0, 1]
    }

    DoubleDataSet realDataSet = new DoubleDataSet("Real").set(normalizedFreq, realNoise);
    DoubleDataSet imagDataSet = new DoubleDataSet("Imag").set(normalizedFreq, imagNoise);

    String        style       = DataSetStyleBuilder.instance()
                                                   .setMarkerType("circle")
                                                   .setMarkerSize(2)
                                                   .build();
    realDataSet.setStyle(style);
    imagDataSet.setStyle(style);

    chart.getRenderers().setAll(scatterPlotRenderer);
    scatterPlotRenderer.getDatasets().addAll(realDataSet, imagDataSet);

    chart.getXAxis().setAutoRanging(false);
    chart.getXAxis().setMin(0.0);
    chart.getXAxis().setMax(1.0);

    return chart;
  }

  protected ErrorDataSetRenderer newScatterChartRenderer()
  {
    final ErrorDataSetRenderer errorRenderer2 = new ErrorDataSetRenderer();
    errorRenderer2.setPolyLineStyle(LineStyle.NONE);
    errorRenderer2.setErrorStyle(ErrorStyle.NONE);
    errorRenderer2.setDrawMarker(true);
    errorRenderer2.setDrawBubbles(false);
    errorRenderer2.setAssumeSortedData(false);
    return errorRenderer2;
  }

  protected XYChart newPowerSpectralDensityChart()
  {
    // Chart 4: PSD
    XYChart chart = new XYChart(new DefaultNumericAxis("Frequency",
                                                       ""),
                                new DefaultNumericAxis("PSD",
                                                       ""));
    chart.setTitle("Power Spectral Density");
    int      posFreqCount = N / 2 + 1;
    double[] freqPos      = new double[posFreqCount];
    double[] empPSD       = computePowerSpectralDensity(inPhaseSamplePath);
    double[] theoryPSD    = new double[posFreqCount];

    for (int i = 0; i < posFreqCount; i++)
    {
      freqPos[i]   = frequencies[i];
      theoryPSD[i] = powerSpectralDensity[i];
    }

    final ErrorDataSetRenderer scatterPlotRenderer = newScatterChartRenderer();
    final ErrorDataSetRenderer lineRenderer        = new ErrorDataSetRenderer();

    /**
     * Needs to set both because the chartfx developers can't design APIs worth a
     * damn for whatever reason. The drawLegendSymbol method uses
     * style.getLineColor() for the legend stroke color, which comes from the stroke
     * color setting in the dataset style.
     */
    DoubleDataSet              empiricalDataSet    =
                                                new DoubleDataSet("Empirical").set(freqPos,
                                                                                   Arrays.copyOf(empPSD,
                                                                                                 posFreqCount))
                                                                              .setStyle(DataSetStyleBuilder.instance()
                                                                                                           .setMarkerColor("darkgoldenrod")
                                                                                                           .setLineColor("darkgoldenrod")
                                                                                                           .build());

    DoubleDataSet              theoryDataSet       =
                                             new DoubleDataSet("Theoretical").set(freqPos,
                                                                                  theoryPSD)
                                                                             .setStyle(DataSetStyleBuilder.instance()
                                                                                                          .setLineWidth(2)
                                                                                                          .build());
    scatterPlotRenderer.getDatasets().add(empiricalDataSet);

    lineRenderer.getDatasets().add(theoryDataSet);

    chart.getRenderers().setAll(scatterPlotRenderer, lineRenderer);

    chart.getXAxis().setAutoRanging(false);
    chart.getXAxis().setMin(0);
    chart.getXAxis().setMax(1.0);

    chart.getYAxis().setAutoRanging(false);
    chart.getYAxis().setMin(0);
    chart.getYAxis().setMax(5.0);

    return chart;
  }

  protected XYChart newTimeDomainChart()
  {
    XYChart chart1 = new XYChart(new DefaultNumericAxis("Time",
                                                        ""),
                                 new DefaultNumericAxis("Value",
                                                        ""));

    chart1.setTitle("In-Phase, Quadrature, and Envelope (±) via Hilbert Transform");

    DoubleDataSet inPhase = new DoubleDataSet("In-phase").set(samplingTimes, inPhaseSamplePath);
    DoubleDataSet quad    =
                       new DoubleDataSet("Quadrature").set(samplingTimes, quadratureSamplePath);
    DoubleDataSet envPos  = new DoubleDataSet("Envelope (+)").set(samplingTimes, envelope);
    double[]      negEnv  = new double[N];
    for (int i = 0; i < N; i++)
    {
      negEnv[i] = -envelope[i];
    }
    DoubleDataSet envNeg = new DoubleDataSet("Envelope (–)").set(samplingTimes, negEnv);
    chart1.getDatasets().addAll(inPhase, quad, envPos, envNeg);
    return chart1;
  }

  @Override
  public void start(Stage stage)
  {
    generate();
    XYChart[] charts =
    { newTimeDomainChart(),
      newRandomWhiteNoiseMeasureChart(),
      newAutocorrelationChart(),
      newPowerSpectralDensityChart() };

    Arrays.stream(charts).forEach(this::configureChart);

    separateWindows = getParameters().getUnnamed().contains("--separate-windows");

    if (separateWindows)
    {
      Stage[] stages =
      { stage, new Stage(), new Stage(), new Stage() };

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
        WindowManager.installEscapeKeyCloseHandler(stages[i]);

      }
      stage.show();
    }
    else
    {
      GridPane gridPane = createGridPane(charts);
      Scene    scene    = new Scene(gridPane);
      stage.setScene(scene);
      stage.setMaximized(true);
      stage.setTitle(getClass().getSimpleName());
      stage.show();
      WindowManager.installEscapeKeyCloseHandler(stage);

      if (dark)
      {
        WindowManager.setMoreConduciveStyle(scene);
      }
    }
  }

}