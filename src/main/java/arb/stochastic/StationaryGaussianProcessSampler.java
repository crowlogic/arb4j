package arb.stochastic;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import arb.Complex;
import arb.FloatInterval;
import arb.Real;
import arb.RealDataSet;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import arb.viz.WindowManager;
import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.AxisMode;
import io.fair_acc.chartfx.axes.spi.DefaultNumericAxis;
import io.fair_acc.chartfx.plugins.CrosshairIndicator;
import io.fair_acc.chartfx.plugins.EditAxis;
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
public abstract class StationaryGaussianProcessSampler extends
                                                       Application
{

  public Complex  samplePath;

  public Real     envelope;

  public Real     samplingTimes;

  public double[] frequencies;

  public double[] powerSpectralDensity;

  public Complex  whiteNoise;

  public abstract double[] getPowerSpectralDensity(double[] freq);

  long seed = 922;

  public StationaryGaussianProcessSampler generate()
  {
    frequencies          = generateFrequencies();
    powerSpectralDensity = getPowerSpectralDensity(frequencies);
    whiteNoise           = Complex.newVector(N);
    samplePath           = Complex.newVector(N);
    envelope             = Real.newVector(N);
    samplingTimes        = Real.newVector(N);

    try ( Complex randomMeasure = Complex.newVector(N); Real mag = new Real();
          ComplexWhiteNoiseProcess whiteNoise = new ComplexWhiteNoiseProcess())
    {
      whiteNoise.initializeWithSeed(seed);

      randomMeasure.get(0).zero();

      for (int k = 0; k < nyquistIndex; k++)
      {
        samplePoint(randomMeasure, mag, whiteNoise, df, k, false);
      }

      if (N % 2 == 0)
      {
        samplePoint(randomMeasure, mag, whiteNoise, df, nyquistIndex, true);
      }

      arblib.acb_dft_inverse(samplePath, randomMeasure, N, bits);

      samplePath.mul(N, bits);

      for (int i = 0; i < N; i++)
      {
        samplingTimes.get(i).set(i * dt);
        samplePath.get(i).norm(bits, envelope.get(i));
      }

      return this;

    }
  }

  protected void samplePoint(Complex randomMeasure,
                             Real mag,
                             ComplexWhiteNoiseProcess whiteNoiseProcess,
                             double df,
                             int k,
                             boolean realOnly)
  {
    var sample = whiteNoiseProcess.sample(bits, whiteNoise.get(k));

    if (realOnly)
    {
      sample.im().zero();
    }

    sample.mul(mag.set(powerSpectralDensity[k] * df).sqrt(bits), bits, randomMeasure.get(k));
  }

  private static final double L                   = 1000.0;

  final FloatInterval         spectralSupport;

  static final double         dt                  = 0.01;

  static final int            N                   = (int) (L / dt);

  static final double         MAX_AUTOCORRELATION = 20.0;

  static final int            bits                = 128;

  private boolean             separateWindows     = false;

  private boolean             dark                = true;

  private XYChart[]           charts;

  private Stage[]             stages;

  private boolean             light;

  public static final double  nyquistFrequency    = 1.0 / (2 * dt);

  public static final int     nyquistIndex        = N / 2;

  public static final double  df                  = 1.0 / L;

  public static double[] generateFrequencies()
  {
    double[] freq = new double[N];
    for (int i = 0; i < N; i++)
    {
      freq[i] = (i <= nyquistIndex ? i : (i - N)) * df;
    }
    return freq;
  }

  public StationaryGaussianProcessSampler()
  {
    spectralSupport = getSpectralSupport();
  }

  protected abstract FloatInterval getSpectralSupport();

  /**
   * TODO: see if there is a way to make the crosshair path and label render with
   * an XOR mask instead of a fixed color so it would work on all backgrounds
   * 
   * @param chart
   */
  protected void configureChart(XYChart chart)
  {
    chart.getPlugins()
         .addAll(new EditAxis(AxisMode.XY),
                 new Zoomer(),
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

  protected XYChart newAutoCorrelationChart()
  {
    XYChart chart = new XYChart(new DefaultNumericAxis("Δt",
                                                       ""),
                                new DefaultNumericAxis("Correlation",
                                                       ""));
    chart.setTitle("Covariance");
    int      maxLag = (int) (MAX_AUTOCORRELATION / dt) + 1;
    double[] times  = new double[maxLag];
    double[] theory = new double[maxLag];
    getKernel(times, theory);
    chart.getDatasets()
         .addAll(new DoubleDataSet("Empirical").set(times,
                                                    Statistics.autocorr(samplePath.re()
                                                                                  .doubleValues(),
                                                                        maxLag)),
                 new DoubleDataSet("Theoretical Covariance " + getKernel()).set(times, theory));
    chart.getYAxis().setAutoRanging(false);
    chart.getYAxis().setMin(-0.5);
    chart.getYAxis().setMax(1.05);
    chart.getXAxis().setAutoRanging(false);
    chart.getXAxis().setMin(0);
    chart.getXAxis().setMax(MAX_AUTOCORRELATION);
    return chart;
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

    final ErrorDataSetRenderer scatterPlotRenderer    = newScatterChartRenderer();

    int                        positiveFrequencyCount = frequencies.length;
    double[]                   realNoise              = new double[positiveFrequencyCount];
    double[]                   imagNoise              = new double[positiveFrequencyCount];
    double[]                   normalizedFrequencies  = new double[positiveFrequencyCount];

    for (int i = 0; i < positiveFrequencyCount; i++)
    {
      Complex element = whiteNoise.get(i);
      realNoise[i]             = element.re().doubleValue();
      imagNoise[i]             = element.im().doubleValue();
      normalizedFrequencies[i] = frequencies[i] / nyquistFrequency; // Normalize to [0, 1]
    }

    DoubleDataSet realDataSet = new DoubleDataSet("Real").set(normalizedFrequencies, realNoise);
    DoubleDataSet imagDataSet =
                              new DoubleDataSet("Imaginary").set(normalizedFrequencies, imagNoise);

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
    final ErrorDataSetRenderer renderer = new ErrorDataSetRenderer();
    renderer.setPolyLineStyle(LineStyle.NONE);
    renderer.setErrorStyle(ErrorStyle.NONE);
    renderer.setDrawMarker(true);
    renderer.setDrawBubbles(false);
    renderer.setAssumeSortedData(false);
    return renderer;
  }

  protected XYChart newPowerSpectralDensityChart()
  {
    // Chart 4: PSD
    XYChart chart = new XYChart(new DefaultNumericAxis("Frequency",
                                                       ""),
                                new DefaultNumericAxis("PSD",
                                                       ""));
    chart.setTitle("Power Spectral Density");
    int      positiveFrequencyCount          = N / 2 + 1;
    double[] positiveFrequencies             = new double[positiveFrequencyCount];
    double[] empiricalPowerSpectralDensity   =
                                           Statistics.computePowerSpectralDensity(samplePath.im()
                                                                                            .doubleValues());
    double[] theoreticalPowerSpectralDensity = new double[positiveFrequencyCount];

    for (int i = 0; i < positiveFrequencyCount; i++)
    {
      positiveFrequencies[i]             = frequencies[i];
      theoreticalPowerSpectralDensity[i] = powerSpectralDensity[i];
    }

    var scatterPlotRenderer = newScatterChartRenderer();
    var lineRenderer        = new ErrorDataSetRenderer();

    /**
     * Needs to set both because the drawLegendSymbol method uses
     * style.getLineColor() for the legend stroke color, which comes from the stroke
     * color setting in the dataset style.
     */
    var empiricalDataSet    =
                         new DoubleDataSet("Empirical").set(positiveFrequencies,
                                                            Arrays.copyOf(empiricalPowerSpectralDensity,
                                                                          positiveFrequencyCount))
                                                       .setStyle(DataSetStyleBuilder.instance()
                                                                                    .setMarkerColor("darkgoldenrod")
                                                                                    .setLineColor("darkgoldenrod")
                                                                                    .build());

    var theoryDataSet       =
                      new DoubleDataSet("Theoretical").set(positiveFrequencies,
                                                           theoreticalPowerSpectralDensity)
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
    XYChart chart = new XYChart(new DefaultNumericAxis("Time",
                                                       ""),
                                new DefaultNumericAxis("Value",
                                                       ""));

    chart.setTitle("In-Phase, Quadrature, and Envelope (±) via Hilbert Transform");

    RealDataSet inPhase = new RealDataSet("In-phase",
                                          N,
                                          spectralSupport);
    inPhase.getTimes().set(samplingTimes);
    Real inPhaseVals = inPhase.getValues();
    long ptr1        = Real.getCPtr(inPhaseVals.elements[0]);
    long ptr2        = Real.getCPtr(inPhaseVals);

    inPhaseVals.set(samplePath.re());

    RealDataSet quad = new RealDataSet("Quadrature",
                                       N,
                                       spectralSupport);

    quad.getTimes().set(samplingTimes);
    quad.getValues().set(samplePath.im());

    DoubleDataSet envPos = new DoubleDataSet("Envelope (+)").set(samplingTimes.doubleValues(),
                                                                 envelope.doubleValues());
    double[]      negEnv = new double[N];
    for (int i = 0; i < N; i++)
    {
      negEnv[i] = -envelope.get(i).doubleValue();
    }
    DoubleDataSet envNeg = new DoubleDataSet("Envelope (–)").set(samplingTimes.doubleValues(),
                                                                 negEnv);
    chart.getDatasets().addAll(inPhase, quad, envPos, envNeg);
    return chart;
  }

  @Override
  public void start(Stage stage)
  {
    processParameters();

    charts = generateAndConfigureCharts();

    if (separateWindows)
    {
      stages = new Stage[]
      { stage, new Stage(), new Stage(), new Stage() };

      for (int i = 0; i < charts.length; i++)
      {
        XYChart chart    = charts[i];
        Stage   ithStage = stages[i];
        initializeChartWithItsOwnWindow(chart, ithStage);
      }

      Stream.of(stages).forEach(Stage::show);
    }
    else
    {
      GridPane gridPane = createGridPane(charts);
      Scene    scene    = new Scene(gridPane);
      stage.setScene(scene);
      stage.setMaximized(true);
      stage.setTitle(String.format("%s[seed=%s]", getClass().getSimpleName(), seed));
      WindowManager.setStageIcon(stage, "GaussianProcessModeller.png");
      WindowManager.installEscapeKeyCloseHandler(stage);
      if (dark)
      {
        WindowManager.setMoreConduciveStyle(scene);
      }
      stage.show();

    }
  }

  protected void initializeChartWithItsOwnWindow(XYChart chart, Stage ithStage)
  {
    Scene scene = new Scene(chart);
    ithStage.setScene(scene);
    ithStage.setMaximized(true);
    ithStage.setTitle(String.format("%s[seed=%s]", chart.getTitle(), seed));
    WindowManager.setStageIcon(ithStage, "GaussianProcessModeller.png");

    if (dark)
    {
      WindowManager.setMoreConduciveStyle(scene);
    }

    WindowManager.installEscapeKeyCloseHandler(ithStage);
  }

  protected void processParameters()
  {
    List<String>        params = getParameters().getUnnamed();
    Map<String, String> named  = getParameters().getNamed();
    separateWindows = params.stream()
                            .anyMatch(param -> param.contains("separate")
                                          || param.contains("individual"));
    seed            = Long.valueOf(named.getOrDefault("seed", "777"));

    dark            = params.contains("--dark");
    light           = params.contains("--light");
    if (dark && light)
    {
      throw new IllegalArgumentException("cannot have both dark and light themes active at once");
    }
    if (!(dark || light))
    {
      dark = true;
    }
  }

  protected XYChart[] generateAndConfigureCharts()
  {
    generate();

    Stream.of(charts = new XYChart[]
    { newTimeDomainChart(),
      newRandomWhiteNoiseMeasureChart(),
      newAutoCorrelationChart(),
      newPowerSpectralDensityChart() }).forEach(this::configureChart);

    return charts;
  }

  public abstract RealFunction getKernel();

}