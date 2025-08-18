package arb.stochastic;

import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import arb.Complex;
import arb.Float;
import arb.FloatInterval;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import arb.stochastic.processes.ComplexWhiteNoiseProcess;
import arb.viz.WindowManager;
import io.fair_acc.chartfx.XYChart;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

/**
 * <h3>Stationary Gaussian Process Sampler (FFT-based)</h3>
 *
 * <p>
 * Abstract class for generating stationary Gaussian random process sample paths
 * using the fast Fourier transform (FFT). Sample paths are synthesized from
 * statistical white noise, the target power spectral density (PSD), and the
 * inverse FFT, producing time-domain signals and auxiliary quantities.
 *
 * Dumbassed contradictory AI generated bullshit removed until I get the
 * wherewithal to fucking write the shit myself. Fuck you bill gates and balmer
 * you fucking fat old nerd!! AI will never do shit and if your code is being
 * written by AI now then that shit is truly fucked and its no surprise given
 * your bullshit nearly crippled the fucking united states of america in the
 * crowdstrike incident of July 19th 2024
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

  static final double          autocorrelationLength  = 20.0;

  static final int             bits                   = 128;

  static final double          dt                     = 0.01;

  static final FloatInterval   timeSpan               = new FloatInterval(0,
                                                                          1000);

  static final double          L                      =
                                 timeSpan.length(128, new Float()).doubleValue();

  public static final double   df                     = 1.0 / L;

  static final int             N                      = (int) (L / dt);

  private static final boolean N_IS_EVEN              = N % 2 == 0;

  public static final double   nyquistFrequency       = 1.0 / (2 * dt);

  public static final int      nyquistIndex           = N / 2;

  static final int             positiveFrequencyCount = N / 2 + 1;

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

  public StationaryGaussianProcessSampler generate()
  {
    frequencies          = generateFrequencies();
    powerSpectralDensity = getPowerSpectralDensity(frequencies);

    try ( ComplexWhiteNoiseProcess whiteNoiseProcess = new ComplexWhiteNoiseProcess())
    {
      var W = generateRandomWhiteNoiseMeasureFromSeed(seed, whiteNoiseProcess);
      W.applyInverseDiscreteFourierTransform(bits, samplePath).mul(N, bits);

      assert samplingTimes.size() == N : String.format("samplingTimes.size=%d != N = %d",
                                                       samplingTimes.size(),
                                                       N);
      for (int i = 0; i < N; i++)
      {
        samplingTimes.get(i).set(i * dt);
        samplePath.get(i).norm(bits, envelope.get(i));
      }

      return this;

    }
  }

  Complex generateRandomWhiteNoiseMeasureFromSeed(long theSeed,
                                                  ComplexWhiteNoiseProcess whiteNoiseProcess)
  {
    try ( Real mag = new Real())
    {
      whiteNoiseProcess.initializeWithSeed(theSeed);

      for (int k = 0; k <= nyquistIndex; k++)
      {
        drawWhiteNoiseSample(whiteNoiseProcess, k).mul(mag.set(powerSpectralDensity[k] * df)
                                                          .sqrt(bits),
                                                       bits,
                                                       randomMeasure.get(k));
      }
    }
    return randomMeasure;
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
    configureCharts();
    return charts;
  }

  void configureCharts()
  {
    Stream.of(charts = new XYChart[]
    { Charts.newTimeDomainChart(spectralSupport, samplingTimes, samplePath, envelope),
      Charts.newRandomWhiteNoiseMeasureChart(frequencies, whiteNoise),
      Charts.newAutoCorrelationChart(this, samplePath),
      Charts.newPowerSpectralDensityChart(samplePath,
                                          positiveFrequencies,
                                          frequencies,
                                          theoreticalPowerSpectralDensities,
                                          powerSpectralDensity) })
          .forEach(chart -> Charts.configureChart(chart, light));
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
    GridPane gridPane = Charts.createGridPane(charts);
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