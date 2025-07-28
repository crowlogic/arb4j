package arb.stochastic;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import arb.Complex;
import arb.Float;
import arb.FloatInterval;
import arb.Real;
import arb.RealDataSet;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import arb.stochastic.processes.ComplexWhiteNoiseProcess;
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
 * <h3>Stationary Gaussian Process Sampler (FFT-based)</h3>
 *
 * <p>
 * Abstract class for generating stationary Gaussian random process sample paths
 * using the fast Fourier transform (FFT). Sample paths are synthesized from
 * statistical white noise, the target power spectral density (PSD), and the
 * inverse FFT, producing time-domain signals and auxiliary quantities.
 * </p>
 *
 * <h4>Frequency Components: DC and Nyquist in FFTs</h4>
 *
 * <ul>
 * <li><strong>DC Component (Zero Frequency):</strong> The DC component (0 Hz,
 * mean of the process) is located at index <code>nyquistIndex</code> in the
 * frequency array, where <code>nyquistIndex = N/2</code> for even
 * <code>N</code> and <code>(N-1)/2</code> for odd <code>N</code>.
 * <code>frequencies[nyquistIndex] == 0</code> for both cases.</li>
 * <li><strong>Nyquist Frequency:</strong> For even <code>N</code>, the Nyquist
 * frequency bin is at index 0 (<code>frequencies[0] == +1/(2dt)</code>) and is
 * unique and real-valued. For odd <code>N</code>, there is no index
 * corresponding to the Nyquist frequency.</li>
 * </ul>
 *
 * <h4>Special Doubling for Odd N</h4>
 * <ul>
 * <li>For odd <code>N</code>, there is an unpaired central frequency index at
 * <code>nyquistIndex = (N-1)/2</code>. This bin sits at the center of the
 * frequency array and corresponds to the highest positive frequency less than
 * the Nyquist frequency. Because there is no opposite-frequency partner (no
 * negative counterpart), in spectral synthesis and when constructing the
 * one-sided spectrum, this special bin's amplitude is doubled to properly
 * account for both positive and "would-be" negative frequency contributions in
 * the time-domain signal. This ensures that total signal energy and variance
 * are correct.</li>
 * </ul>
 *
 * <h4>Indexing and Frequency Range</h4>
 * <ul>
 * <li>The frequency array is organized so that positive frequencies occupy
 * indices less than <code>nyquistIndex</code>, zero frequency (DC) is at
 * <code>nyquistIndex</code>, and the remainder of the positive frequency range
 * fills the upper part of the array.</li>
 * <li>Specifically:
 * <ul>
 * <li>For even <code>N</code>: <code>frequencies[0] = +1/(2dt)</code>,
 * <code>frequencies[nyquistIndex] = 0</code>.</li>
 * <li>For odd <code>N</code>: <code>frequencies[nyquistIndex] = 0</code>; the
 * maximum positive frequency is less than the Nyquist frequency, and this
 * central index is doubled as described above.</li>
 * </ul>
 * </li>
 * </ul>
 *
 * <h4>Mathematical Properties</h4>
 * <ul>
 * <li>The FFT of real-valued signals exhibits Hermitian symmetry:
 * <code>X(-ν) = X(ν)*</code>. The DC and Nyquist bins (when present) are
 * strictly real-valued. The unpaired central bin for odd <code>N</code> is also
 * real-valued.</li>
 * <li>When mapping to a one-sided spectrum, the DC and Nyquist bins for even
 * <code>N</code>, and the unpaired central bin for odd <code>N</code>, are
 * unique and not paired. Both the DC and (for odd <code>N</code>) the unpaired
 * central bin must NOT be doubled in energy, except that for spectral
 * synthesis, the central bin's amplitude is multiplied by two to account for
 * the lack of a conjugate partner.</li>
 * </ul>
 *
 *
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */

public abstract class StationaryGaussianProcessSampler extends
                                                       Application implements
                                                       AutoCloseable
{

  @Override
  public void close() throws Exception
  {
    spectralSupport.close();
    whiteNoise.close();
    samplePath.close();
    envelope.close();
    samplingTimes.close();
    randomMeasure.close();
  }

  static final double          autocorrelationLength            = 20.0;

  static final int             bits                             = 128;

  static final double          dt                               = 0.01;

  /**
   * Needs to set both because the drawLegendSymbol method in chartfx uses
   * {@link DataSetStyleBuilder#setMarkerColor(String)} as well as
   * {@link DataSetStyleBuilder#setLineColor(String)}
   */
  private static final String  empiricialFrequencyDatasetStyle  =
                                                               DataSetStyleBuilder.instance()
                                                                                  .setMarkerColor("darkgoldenrod")
                                                                                  .setLineColor("darkgoldenrod")
                                                                                  .build();

  static final FloatInterval   timeSpan                         = new FloatInterval(0,
                                                                                    1000);

  static final double          L                                =
                                 timeSpan.length(128, new Float()).doubleValue();

  public static final double   df                               = 1.0 / L;

  static final int             N                                = (int) (L / dt);

  private static final boolean N_IS_EVEN                        = N % 2 == 0;

  public static final double   nyquistFrequency                 = 1.0 / (2 * dt);

  public static final int      nyquistIndex                     = N / 2;

  private static final int     positiveFrequencyCount           = N / 2 + 1;

  private static final String  randomMeasureDatasetStyle        =
                                                         DataSetStyleBuilder.instance()
                                                                            .setMarkerType("circle")
                                                                            .setMarkerSize(2)
                                                                            .build();

  private static final String  theoreticalFrequencyDatasetStyle =
                                                                DataSetStyleBuilder.instance()
                                                                                   .setLineWidth(2)
                                                                                   .build();

  public static double[] generateFrequencies()
  {
    double[] freq = new double[N];
    for (int i = 0; i < N; i++)
    {
      freq[i] = (i <= nyquistIndex ? i : (i - N)) * df;
    }
    return freq;
  }

  private XYChart[]      charts;

  private boolean        dark                              = true;

  public Real            envelope;

  public double[]        frequencies;

  private boolean        light;

  private final double[] positiveFrequencies               = new double[positiveFrequencyCount];

  public double[]        powerSpectralDensity;

  public Complex         samplePath;

  public Real            samplingTimes;

  long                   seed                              = 922;

  private boolean        separateWindows                   = false;

  final FloatInterval    spectralSupport;

  private Stage[]        stages;

  private final double[] theoreticalPowerSpectralDensities = new double[positiveFrequencyCount];

  public Complex         whiteNoise;

  private Complex        randomMeasure;

  public StationaryGaussianProcessSampler()
  {
    spectralSupport = getSpectralSupport();
    whiteNoise      = Complex.newVector(N);
    samplePath      = Complex.newVector(N);
    envelope        = Real.newVector(N);
    samplingTimes   = Real.newVector(N);
    randomMeasure   = Complex.newVector(N);
  }

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

  public StationaryGaussianProcessSampler generate()
  {
    frequencies          = generateFrequencies();
    powerSpectralDensity = getPowerSpectralDensity(frequencies);

    try ( Real mag = new Real();
          ComplexWhiteNoiseProcess whiteNoiseProcess = new ComplexWhiteNoiseProcess())
    {
      whiteNoiseProcess.initializeWithSeed(seed);

      for (int k = 0; k <= nyquistIndex; k++)
      {
        drawWhiteNoiseSample(whiteNoiseProcess, k).mul(mag.set(powerSpectralDensity[k] * df)
                                                          .sqrt(bits),
                                                       bits,
                                                       randomMeasure.get(k));
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

  protected Complex drawWhiteNoiseSample(ComplexWhiteNoiseProcess whiteNoiseProcess, int k)
  {
    var sample = whiteNoiseProcess.sample(bits, whiteNoise.get(k));

    if (k == nyquistIndex && N_IS_EVEN)
    {
      sample.im().zero();
    }
    return sample;
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

  /**
   * FIXME: Use {@link FloatInterval} and
   * {@link RealFunction#quantize(FloatInterval, int, int, boolean)}
   * 
   * @param times
   * @param values
   */
  public abstract void getKernel(double[] times, double[] values);

  public abstract double[] getPowerSpectralDensity(double[] freq);

  protected abstract FloatInterval getSpectralSupport();

  protected void initializeChartsInTheirOwnWindows(Stage stage)
  {
    stages = new Stage[]
    { stage, new Stage(), new Stage(), new Stage() };

    for (int i = 0; i < charts.length; i++)
    {
      XYChart chart    = charts[i];
      Stage   ithStage = stages[i];
      initializeChartWithItsOwnWindow(chart, ithStage);
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

  protected void initializeWindowContainingAllCharts(Stage stage)
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
  }

  protected XYChart newAutoCorrelationChart()
  {
    XYChart chart = new XYChart(new DefaultNumericAxis("Δt",
                                                       ""),
                                new DefaultNumericAxis("Correlation",
                                                       ""));
    chart.setTitle("Covariance");
    int      maxLag = (int) (autocorrelationLength / dt) + 1;
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
    chart.getXAxis().setMax(autocorrelationLength);
    return chart;
  }

  protected XYChart newPowerSpectralDensityChart()
  {
    // Chart 4: PSD
    XYChart chart = new XYChart(new DefaultNumericAxis("Frequency",
                                                       ""),
                                new DefaultNumericAxis("PSD",
                                                       ""));
    chart.setTitle("Power Spectral Density");
    double[] empiricalPowerSpectralDensity =
                                           Statistics.computePowerSpectralDensity(samplePath.im()
                                                                                            .doubleValues());
    for (int i = 0; i < positiveFrequencyCount; i++)
    {
      positiveFrequencies[i]               = frequencies[i];
      theoreticalPowerSpectralDensities[i] = powerSpectralDensity[i];
    }

    var scatterPlotRenderer = newScatterChartRenderer();
    var lineRenderer        = new ErrorDataSetRenderer();

    var empiricalDataSet    =
                         new DoubleDataSet("Empirical").set(positiveFrequencies,
                                                            Arrays.copyOf(empiricalPowerSpectralDensity,
                                                                          positiveFrequencyCount))
                                                       .setStyle(empiricialFrequencyDatasetStyle);

    var theoryDataSet       =
                      new DoubleDataSet("Theoretical").set(positiveFrequencies,
                                                           theoreticalPowerSpectralDensities)
                                                      .setStyle(theoreticalFrequencyDatasetStyle);
    scatterPlotRenderer.getDatasets().add(empiricalDataSet);

    lineRenderer.getDatasets().add(theoryDataSet);

    chart.getRenderers().setAll(scatterPlotRenderer, lineRenderer);

    configureXAxisOfPowerSpectralDensityChart(chart);

    configureYAxisOfPowerSpectralDensityChart(chart);

    return chart;
  }

  protected void configureYAxisOfPowerSpectralDensityChart(XYChart chart)
  {
    chart.getYAxis().setAutoRanging(false);
    chart.getYAxis().setMin(0);
    chart.getYAxis().setMax(5.0);
  }

  protected void configureXAxisOfPowerSpectralDensityChart(XYChart chart)
  {
    chart.getXAxis().setAutoRanging(false);
    chart.getXAxis().setMin(0);
    chart.getXAxis().setMax(1.0);
  }

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

    realDataSet.setStyle(randomMeasureDatasetStyle);
    imagDataSet.setStyle(randomMeasureDatasetStyle);

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

  protected XYChart newTimeDomainChart()
  {
    XYChart chart = new XYChart(new DefaultNumericAxis("Time",
                                                       "?"),
                                new DefaultNumericAxis("Level",
                                                       "?"));

    chart.setTitle("In-Phase, Quadrature, and Envelope (±) via Hilbert Transform");

    RealDataSet inPhase = new RealDataSet("In-phase",
                                          N,
                                          spectralSupport);
    inPhase.getTimes().set(samplingTimes);
    inPhase.getValues().set(samplePath.re());

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

  @Override
  public void start(Stage stage)
  {
    processParameters();

    charts = generateAndConfigureCharts();

    if (separateWindows)
    {
      initializeChartsInTheirOwnWindows(stage);
      Stream.of(stages).forEach(Stage::show);
    }
    else
    {
      initializeWindowContainingAllCharts(stage);
      stage.show();

    }
  }

}