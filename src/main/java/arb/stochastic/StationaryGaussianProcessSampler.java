package arb.stochastic;

import java.util.*;
import java.util.stream.Stream;

import arb.*;
import arb.Float;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import arb.stochastic.processes.ComplexWhiteNoiseProcess;
import arb.viz.WindowManager;
import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.spi.DefaultNumericAxis;
import io.fair_acc.chartfx.renderer.ErrorStyle;
import io.fair_acc.chartfx.renderer.LineStyle;
import io.fair_acc.chartfx.renderer.spi.ErrorDataSetRenderer;
import io.fair_acc.dataset.spi.DoubleDataSet;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

/**
 * <h3>Stationary Gaussian Process Sampler (FFT-based)</h3>
 *
 * <p>
 * Abstract class for generating stationary Gaussian random process sample paths using the
 * fast Fourier transform (FFT). Sample paths are synthesized from statistical white
 * noise, the target power spectral density (PSD), and the inverse FFT, producing
 * time-domain signals and auxiliary quantities.x
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public abstract class StationaryGaussianProcessSampler
                                                       extends
                                                       Application
                                                       implements
                                                       AutoCloseable
{

  static final double    autocorrelationLength             = 20.0;

  static final int       bits                              = 128;

  static final double    dt                                = 0.01;

  private XYChart[]      charts;

  private boolean        dark                              = true;

  public Real            envelope;

  public double[]        frequencies;

  private boolean        light;

  final FloatInterval    timeSpan                          = new FloatInterval(0,
                                                                               1000);

  final Float            interval                          = timeSpan.length(128,
                                                                             new Float());

  final double           L                                 = interval.doubleValue();

  final int              N                                 = (int) (L / dt);

  private final boolean  N_IS_EVEN                         = N % 2 == 0;

  public final double    nyquistFrequency                  = 1.0 / (2 * dt);

  public final int       nyquistIndex                      = N / 2;

  final int              positiveFrequencyCount            = N / 2 + 1;

  private final double[] positiveFrequencies               = new double[positiveFrequencyCount];

  public final double    df                                = 1.0 / L;

  public double[]        powerSpectralDensity;

  private Complex        randomMeasure;

  public Complex         samplePath;

  public Real            samplingTimes;

  long                   seed                              = 922;

  private boolean        separateWindows                   = false;

  final FloatInterval    spectralSupport;

  private Stage[]        stages;

  private final double[] theoreticalPowerSpectralDensities = new double[positiveFrequencyCount];

  public Complex         whiteNoise;

  public StationaryGaussianProcessSampler()
  {
    spectralSupport = getSpectralSupport();
    whiteNoise      = Complex.newVector(N);
    samplePath      = Complex.newVector(N);
    envelope        = Real.newVector(N);
    samplingTimes   = Real.newVector(N);
    randomMeasure   = Complex.newVector(N);
  }

  @Override
  public void close() throws Exception
  {
    spectralSupport.close();
    whiteNoise.close();
    samplePath.close();
    envelope.close();
    samplingTimes.close();
    randomMeasure.close();
    timeSpan.close();
    interval.close();
  }

  public double[] computePowerSpectralDensity(double[] path)
  {

    try ( Complex complexPath = Complex.newVector(N); Complex fft = Complex.newVector(N); Real mag = new Real(); Real scalingFactor = Real.valueOf(dt)
                                                                                                                                          .div(N / 2,
                                                                                                                                               bits);)
    {
      for (int i = 0; i < N; i++)
      {
        complexPath.get(i).set(path[i]);
      }

      arblib.acb_dft(fft,
                     complexPath,
                     N,
                     bits);

      double[] periodogram = new double[N];

      for (int i = 0; i < N; i++)
      {
        periodogram[i] = fft.get(i)
                            .norm(bits,
                                  mag)
                            .pow(2,
                                 bits)
                            .mul(scalingFactor,
                                 bits)
                            .doubleValue();
      }
      return periodogram;
    }
  }

  void configureCharts()
  {
    Stream.of(charts = new XYChart[]
    { newTimeDomainChart(spectralSupport,
                         samplingTimes,
                         samplePath,
                         envelope),
      newRandomWhiteNoiseMeasureChart(frequencies,
                                      whiteNoise),
      newAutoCorrelationChart(this,
                              samplePath),
      newPowerSpectralDensityChart(samplePath,
                                   positiveFrequencies,
                                   frequencies,
                                   theoreticalPowerSpectralDensities,
                                   powerSpectralDensity) })
          .forEach(chart -> Charts.configureChart(chart,
                                                  light));
  }

  public void configurePowerSpectralDensityAxes(XYChart chart)
  {
    configureXAxisOfPowerSpectralDensityChart(chart);

    configureYAxisOfPowerSpectralDensityChart(chart);
  }

  public void configureXAxisOfPowerSpectralDensityChart(XYChart chart)
  {
    chart.getXAxis().setAutoRanging(false);
    chart.getXAxis().setMin(0);
    chart.getXAxis().setMax(1.0);
  }

  public void configureYAxisOfPowerSpectralDensityChart(XYChart chart)
  {
    chart.getYAxis().setAutoRanging(false);
    chart.getYAxis().setMin(0);
    chart.getYAxis().setMax(5.0);
  }

  protected Complex drawWhiteNoiseSample(ComplexWhiteNoiseProcess whiteNoiseProcess, int k)
  {
    var sample = whiteNoiseProcess.sample(bits,
                                          whiteNoise.get(k));

    if (k == nyquistIndex && N_IS_EVEN)
    {
      sample.im().zero();
    }
    return sample;
  }

  /**
   * TODO: Don't throw away the white noise used to generate the sample path, store it
   * compare/plot it against the reconstructed power spectral density
   * 
   * @return
   */
  public StationaryGaussianProcessSampler generateSamplePathFromSpectrallyColoredOrthogonalRandomMeasure()
  {
    frequencies          = generateFrequencies();
    powerSpectralDensity = getPowerSpectralDensity(frequencies);

    try ( var whiteNoiseProcess = new ComplexWhiteNoiseProcess())
    {
      var W = generateSpectrallyColoredOrthogonalRandomMeasureFromWhiteNoise(seed,
                                                                             whiteNoiseProcess);
      W.applyInverseDiscreteFourierTransform(bits,
                                             samplePath);

      var W2    = Complex.newVector(N);
      var Wdiff = Complex.newVector(N);

      samplePath.applyDiscreteFourierTransform(bits,
                                               W2);
      W.sub(W2,
            bits,
            Wdiff);
      System.out.format("Wdiff=%s\n",
                        Wdiff.sum(bits,
                                  new Complex()));

      calculateEnvelopeSamplingTimesAndValues();

      return this;

    }
  }

  protected void calculateEnvelopeSamplingTimesAndValues()
  {
    for (int i = 0; i < N; i++)
    {
      samplingTimes.get(i).set(i * dt);
      samplePath.get(i)
                .norm(bits,
                      envelope.get(i));
    }
  }

  protected XYChart[] generateAndConfigureCharts()
  {
    generateSamplePathFromSpectrallyColoredOrthogonalRandomMeasure();
    configureCharts();
    return charts;
  }

  public double[] generateFrequencies()
  {
    double[] freq = new double[N];
    for (int i = 0; i < N; i++)
    {
      freq[i] = (i <= nyquistIndex ? i : (i - N)) * df;
    }
    return freq;
  }

  /**
   * Draw sample from the {@link ComplexWhiteNoiseProcess} and color it by multiplying it by
   * the power spectral density then taking its square root and storing it in
   * {@link #randomMeasure}
   * 
   * @param theSeed
   * @param whiteNoiseProcess
   * @return
   */
  Complex generateSpectrallyColoredOrthogonalRandomMeasureFromWhiteNoise(long theSeed, ComplexWhiteNoiseProcess whiteNoiseProcess)
  {
    try ( var mag = new Real())
    {
      whiteNoiseProcess.initializeWithSeed(theSeed);

      for (int k = 0; k <= nyquistIndex; k++)
      {
        drawWhiteNoiseSample(whiteNoiseProcess,
                             k).mul(mag.set(powerSpectralDensity[k] * df).sqrt(bits),
                                    bits,
                                    randomMeasure.get(k));
      }
    }
    return randomMeasure;
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
      initializeChartWithItsOwnWindow(chart,
                                      ithStage);
    }
  }

  protected void initializeChartWithItsOwnWindow(XYChart chart, Stage ithStage)
  {
    Scene scene = new Scene(chart);
    ithStage.setScene(scene);
    ithStage.setMaximized(true);
    ithStage.setTitle(String.format("%s[seed=%s]",
                                    chart.getTitle(),
                                    seed));
    WindowManager.setStageIcon(ithStage,
                               "GaussianProcessModeller.png");

    if (dark)
    {
      WindowManager.setMoreConduciveStyle(scene);
    }

    WindowManager.installEscapeKeyCloseHandler(ithStage);
  }

  protected void initializeWindowContainingAllCharts(Stage stage)
  {
    GridPane gridPane = Charts.createGridPane(charts);
    Scene    scene    = new Scene(gridPane);
    stage.setScene(scene);
    stage.setMaximized(true);
    stage.setTitle(String.format("%s[seed=%s]",
                                 getClass().getSimpleName(),
                                 seed));
    WindowManager.setStageIcon(stage,
                               "GaussianProcessModeller.png");
    WindowManager.installEscapeKeyCloseHandler(stage);
    if (dark)
    {
      WindowManager.setMoreConduciveStyle(scene);
    }
  }

  public XYChart newAutoCorrelationChart(StationaryGaussianProcessSampler sampler, Complex samplePath)
  {
    XYChart chart = new XYChart(new DefaultNumericAxis("Δt",
                                                       ""),
                                new DefaultNumericAxis("Correlation",
                                                       ""));
    chart.setTitle("Covariance");
    int      maxLag = (int) (StationaryGaussianProcessSampler.autocorrelationLength / StationaryGaussianProcessSampler.dt) + 1;
    double[] times  = new double[maxLag];
    double[] theory = new double[maxLag];
    sampler.getKernel(times,
                      theory);
    chart.getDatasets()
         .addAll(new DoubleDataSet("Empirical").set(times,
                                                    Statistics.autocorr(samplePath.re().doubleValues(),
                                                                        maxLag)),
                 new DoubleDataSet("Theoretical Covariance " + sampler.getKernel()).set(times,
                                                                                        theory));
    chart.getYAxis().setAutoRanging(false);
    chart.getYAxis().setMin(-0.5);
    chart.getYAxis().setMax(1.05);
    chart.getXAxis().setAutoRanging(false);
    chart.getXAxis().setMin(0);
    chart.getXAxis().setMax(StationaryGaussianProcessSampler.autocorrelationLength);
    return chart;
  }

  public XYChart newPowerSpectralDensityChart(Complex samplePath, double[] positiveFrequencies, double[] frequencies, double[] theoreticalPowerSpectralDensities, double[] powerSpectralDensity)
  {
    // Chart 4: PSD
    XYChart chart = new XYChart(new DefaultNumericAxis("Frequency",
                                                       ""),
                                new DefaultNumericAxis("PSD",
                                                       ""));
    chart.setTitle("Power Spectral Density");
    double[] empiricalPowerSpectralDensity = computePowerSpectralDensity(samplePath.im().doubleValues());
    for (int i = 0; i < positiveFrequencyCount; i++)
    {
      positiveFrequencies[i]               = frequencies[i];
      theoreticalPowerSpectralDensities[i] = powerSpectralDensity[i];
    }

    var scatterPlotRenderer = newScatterChartRenderer();
    var lineRenderer        = new ErrorDataSetRenderer();

    var empiricalDataSet    = new DoubleDataSet("Empirical").set(positiveFrequencies,
                                                                 Arrays.copyOf(empiricalPowerSpectralDensity,
                                                                               positiveFrequencyCount)).setStyle(Charts.empiricialFrequencyDatasetStyle);

    var theoreticalDataSet  = new DoubleDataSet("Theoretical").set(positiveFrequencies,
                                                                   theoreticalPowerSpectralDensities).setStyle(Charts.theoreticalFrequencyDatasetStyle);
    scatterPlotRenderer.getDatasets().add(empiricalDataSet);

    lineRenderer.getDatasets().add(theoreticalDataSet);

    chart.getRenderers()
         .setAll(scatterPlotRenderer,
                 lineRenderer);

    configurePowerSpectralDensityAxes(chart);

    return chart;
  }

  public XYChart newRandomWhiteNoiseMeasureChart(double[] frequencies, Complex whiteNoise)
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

    DoubleDataSet realDataSet = new DoubleDataSet("Real").set(normalizedFrequencies,
                                                              realNoise);
    DoubleDataSet imagDataSet = new DoubleDataSet("Imaginary").set(normalizedFrequencies,
                                                                   imagNoise);

    realDataSet.setStyle(Charts.randomMeasureDatasetStyle);
    imagDataSet.setStyle(Charts.randomMeasureDatasetStyle);

    chart.getRenderers().setAll(scatterPlotRenderer);
    scatterPlotRenderer.getDatasets()
                       .addAll(realDataSet,
                               imagDataSet);

    chart.getXAxis().setAutoRanging(false);
    chart.getXAxis().setMin(0.0);
    chart.getXAxis().setMax(1.0);

    return chart;
  }

  public ErrorDataSetRenderer newScatterChartRenderer()
  {
    final ErrorDataSetRenderer renderer = new ErrorDataSetRenderer();
    renderer.setPolyLineStyle(LineStyle.NONE);
    renderer.setErrorStyle(ErrorStyle.NONE);
    renderer.setDrawMarker(true);
    renderer.setDrawBubbles(false);
    renderer.setAssumeSortedData(false);
    return renderer;
  }

  public XYChart newTimeDomainChart(FloatInterval spectralSupport, Real samplingTimes, Complex samplePath, Real envelope)
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
    chart.getDatasets()
         .addAll(inPhase,
                 quad,
                 envPos,
                 envNeg);
    return chart;
  }

  protected void processParameters()
  {
    List<String>        params = getParameters().getUnnamed();
    Map<String, String> named  = getParameters().getNamed();
    separateWindows = params.stream().anyMatch(param -> param.contains("separate") || param.contains("individual") || param.contains("sep"));
    seed            = Long.valueOf(named.getOrDefault("seed",
                                                      "214"));

    dark            = params.contains("--dark");
    light           = params.contains("--light");
    if (dark && light)
    {
      throw new IllegalArgumentException("cannot have both dark and light themes active at once");
    }
    if (!(dark || light))
    {
      light = true;
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