package arb.applications;

import java.util.*;
import java.util.stream.Stream;

import arb.*;
import arb.Float;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import arb.stochastic.Charts;
import arb.stochastic.processes.ComplexWhiteNoiseProcess;
import arb.viz.WindowManager;
import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.spi.DefaultNumericAxis;
import io.fair_acc.chartfx.renderer.ErrorStyle;
import io.fair_acc.chartfx.renderer.LineStyle;
import io.fair_acc.chartfx.renderer.spi.ErrorDataSetRenderer;
import io.fair_acc.dataset.spi.DoubleDataSet;
import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.stage.Stage;

/**
 * <h3>Stationary Gaussian Process Sampler (FFT-based)</h3>
 *
 * <p>
 * Abstract class for generating stationary Gaussian random process sample paths
 * using the fast Fourier transform (FFT). Sample paths are synthesized from
 * statistical white noise, the target power spectral density (PSD), and the
 * inverse FFT, producing time-domain signals and auxiliary quantities.x
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class StationaryGaussianProcessSampler extends
                                                       Application implements
                                                       AutoCloseable
{

  /**
   * Maximum lag (in time-units of the t-grid) over which the empirical
   * autocovariance and the theoretical-kernel overlay are computed and
   * displayed in the covariance chart. Mutable so the GUI control can
   * extend the lag horizon at runtime; the refresh button rebuilds the
   * datasets and updates the chart in place. Default 25.0.
   */
  protected double              autocorrelationLength             = 25.0;

  /**
   * The single covariance XYChart created by
   * {@link #newAutoCorrelationChart(StationaryGaussianProcessSampler, Complex)}.
   * Held so the refresh handler can mutate its datasets and x-axis upper
   * bound after the user changes the length.
   */
  private XYChart               covarianceChart;

  /**
   * The single PSD XYChart created by
   * {@link #newPowerSpectralDensityChart(Complex, double[], double[], double[], double[])}.
   * Held so the refresh handler can rebuild the DFT-of-autocov overlay when
   * the user changes the autocorrelation length, since that overlay is
   * derived from the same lag horizon as the covariance chart.
   */
  private XYChart               psdChart;

  static final int              bits                              = 128;

  /**
   * Time-domain step size. Instance field (not static) so subclasses can
   * choose their own grid via the {@link #StationaryGaussianProcessSampler(FloatInterval, double)}
   * constructor while existing subclasses continue to see the historical
   * default of 0.01 through the no-arg constructor.
   */
  protected final double        dt;

  private XYChart[]             charts;

  private boolean               dark                              = true;

  public Real                   envelope;

  public double[]               frequencies;

  private boolean               light;

  final FloatInterval           timeSpan;

  final Float                   interval;

  final double                  L;

  final int                     N;

  private final boolean         N_IS_EVEN;

  public final double           nyquistFrequency;

  public final int              nyquistIndex;

  final int                     positiveFrequencyCount;

  private final double[]        positiveFrequencies;

  public final double           df;

  public double[]               powerSpectralDensity;

  protected Complex             randomMeasure;

  public Complex                samplePath;

  public Real                   samplingTimes;

  long                          seed                              = 922;

  private boolean               separateWindows                   = false;

  final FloatInterval           spectralSupport;

  private Stage[]               stages;

  private final double[]        theoreticalPowerSpectralDensities;

  public Complex                whiteNoise;

  /**
   * Construct with the historical defaults: timeSpan = [0, 1000], dt = 0.01.
   * Used by all existing subclasses that drive the seed-based
   * {@link #generateSamplePathFromSpectrallyColoredOrthogonalRandomMeasure}
   * pipeline.
   */
  public StationaryGaussianProcessSampler()
  {
    this(new FloatInterval(0, 1000), 0.01);
  }

  /**
   * Construct with a caller-chosen time interval and step. Lets path-based
   * subclasses (those that supply a precomputed stationary sample path via
   * {@link #ingestPrecomputedSamplePath(Complex)}) work on grids other than
   * the historical [0, 1000] @ dt = 0.01.
   *
   * @param timeSpan time-domain support of the sample path; length L = upper - lower
   * @param dt       uniform spacing between consecutive samples; N = round(L/dt)
   */
  protected StationaryGaussianProcessSampler(FloatInterval timeSpan, double dt)
  {
    this.timeSpan               = timeSpan;
    this.dt                     = dt;
    this.interval               = timeSpan.length(128, new Float());
    this.L                      = interval.doubleValue();
    this.N                      = (int) (L / dt);
    this.N_IS_EVEN              = N % 2 == 0;
    this.nyquistFrequency       = 1.0 / (2 * dt);
    this.nyquistIndex           = N / 2;
    this.positiveFrequencyCount = N / 2 + 1;
    this.positiveFrequencies    = new double[positiveFrequencyCount];
    this.df                     = 1.0 / L;
    this.theoreticalPowerSpectralDensities = new double[positiveFrequencyCount];

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

  void configureCharts()
  {
    covarianceChart = newAutoCorrelationChart(this, samplePath);
    psdChart        = newPowerSpectralDensityChart(samplePath, positiveFrequencies, frequencies, theoreticalPowerSpectralDensities, powerSpectralDensity);
    Stream.of(charts = new XYChart[]
    { newTimeDomainChart(spectralSupport, samplingTimes, samplePath, envelope),
      newRandomWhiteNoiseMeasureChart(frequencies, whiteNoise),
      covarianceChart,
      psdChart })
          .forEach(chart -> Charts.configureChart(chart, light));
  }

  public void configurePowerSpectralDensityAxes(XYChart chart)
  {
    configureXAxisOfPowerSpectralDensityChart(chart);

    configureYAxisOfPowerSpectralDensityChart(chart);
  }

  public void configureXAxisOfPowerSpectralDensityChart(XYChart chart)
  {
    chart.getXAxis().setAutoRanging(true);
  }

  public void configureYAxisOfPowerSpectralDensityChart(XYChart chart)
  {
    chart.getYAxis().setAutoRanging(true);
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

  /**
   * TODO: Don't throw away the white noise used to generate the sample path,
   * store it compare/plot it against the reconstructed power spectral density
   * 
   * @return
   */
  public StationaryGaussianProcessSampler generateSamplePathFromSpectrallyColoredOrthogonalRandomMeasure()
  {
    frequencies          = generateFrequencies();
    powerSpectralDensity = getPowerSpectralDensity(frequencies);

    try ( var whiteNoiseProcess = new ComplexWhiteNoiseProcess())
    {
      var W = generateSpectrallyColoredOrthogonalRandomMeasureFromWhiteNoise(seed, whiteNoiseProcess);
      // Inverse DFT (arb convention includes 1/N), then re-scale by N so the
      // synthesized path uses the unnormalized inverse Σ_k W[k] exp(+2πi·k·n/N).
      // This preserves the historical amplitude of the seed-mode samplePath that
      // BandLimitedWhiteNoiseSampler and RandomWaveSampler are calibrated against.
      W.applyInverseDiscreteFourierTransform(bits, samplePath).mul(N, bits);

      var W2    = Complex.newVector(N);
      var Wdiff = Complex.newVector(N);

      // Forward DFT then divide by N inverts the unnormalized inverse above so that W2 ≈ W.
      samplePath.applyDiscreteFourierTransform(bits, W2).div(N, bits);
      W.sub(W2, bits, Wdiff);

      calculateEnvelopeSamplingTimesAndValues();

      return this;

    }
  }

  protected void calculateEnvelopeSamplingTimesAndValues()
  {
    for (int i = 0; i < N; i++)
    {
      samplingTimes.get(i).set(i * dt);
      samplePath.get(i).norm(bits, envelope.get(i));
    }
  }

  protected XYChart[] generateAndConfigureCharts()
  {
    prepareSamplePath();
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
   * Draw sample from the {@link ComplexWhiteNoiseProcess} and color it by
   * multiplying it by the power spectral density then taking its square root and
   * storing it in {@link #randomMeasure}
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
        drawWhiteNoiseSample(whiteNoiseProcess, k).mul(mag.set(powerSpectralDensity[k] * df).sqrt(bits), bits, randomMeasure.get(k));
      }
    }
    return randomMeasure;
  }

  /**
   * Theoretical kernel of the process, used as a label/overlay on the
   * autocorrelation chart. Path-based subclasses (those that ingest a
   * precomputed sample path and have no closed-form kernel) may return
   * {@code null}; the chart label then falls back to the class name.
   */
  public RealFunction getKernel()
  {
    return null;
  }

  /**
   * Theoretical autocovariance K(Δt) sampled on the lag grid, written into
   * {@code values} aligned with {@code times[i] = i*dt}. Default writes
   * zeros; path-based subclasses leave it as zeros (the chart still renders
   * the empirical autocorrelation series).
   *
   * FIXME: Use {@link FloatInterval} and
   * {@link RealFunction#quantize(FloatInterval, int, int, boolean)}
   * 
   * @param times  filled with i*dt for i = 0..times.length-1
   * @param values filled with theoretical K(times[i]); zeros if no theory
   */
  public void getKernel(double[] times, double[] values)
  {
    assert times.length == values.length;
    for (int i = 0; i < times.length; i++)
    {
      times[i]  = i * dt;
      values[i] = 0.0;
    }
  }

  /**
   * Theoretical power spectral density at the requested frequencies. Used
   * (a) by the seed-based pipeline to color the white noise and (b) as the
   * theoretical overlay on the PSD chart. Path-based subclasses without a
   * closed-form PSD return zeros, in which case the empirical PSD computed
   * by {@link #ingestPrecomputedSamplePath(Complex)} drives the chart.
   */
  public double[] getPowerSpectralDensity(double[] freq)
  {
    return new double[freq.length];
  }

  /**
   * Closed support of the spectral density on the frequency axis, used to
   * size the time-domain chart. Defaults to [-nyquistFrequency, +nyquistFrequency].
   */
  protected FloatInterval getSpectralSupport()
  {
    return new FloatInterval(-nyquistFrequency, nyquistFrequency);
  }

  /**
   * Hook chosen by subclass to populate {@link #samplePath},
   * {@link #randomMeasure}, {@link #frequencies}, and
   * {@link #powerSpectralDensity}. Default implementation runs the
   * seed-based pipeline
   * {@link #generateSamplePathFromSpectrallyColoredOrthogonalRandomMeasure}.
   * Path-based subclasses override to call
   * {@link #ingestPrecomputedSamplePath(Complex)}.
   */
  protected void prepareSamplePath()
  {
    generateSamplePathFromSpectrallyColoredOrthogonalRandomMeasure();
  }

  /**
   * Path-based entry: take a precomputed stationary sample path on the
   * sampler's uniform t-grid, copy it into {@link #samplePath}, derive the
   * orthogonal random measure W = DFT(samplePath) (unnormalized forward,
   * arb convention via {@link Complex#applyDiscreteFourierTransform}), and
   * compute the empirical power spectral density |W[k]|² · dt / (N/2) into
   * {@link #powerSpectralDensity}.
   *
   * The empirical PSD lives on the same shifted-DC frequency grid as the
   * seed-based pipeline (negative frequencies wrap into [N/2+1, N-1]),
   * matching {@link #generateFrequencies()}.
   *
   * Round-trip: {@code applyInverseDiscreteFourierTransform(randomMeasure) ≡ samplePath}
   * to working precision, exercised by
   * {@code StationaryGaussianProcessSamplerTest#testIngestRoundTrip}.
   *
   * @param precomputed length-N Complex vector with samplePath[i] = F(i*dt + t0)
   * @return this
   */
  public StationaryGaussianProcessSampler ingestPrecomputedSamplePath(Complex precomputed)
  {
    assert precomputed.size() == N
           : String.format("precomputed.size=%d != N=%d", precomputed.size(), N);

    frequencies          = generateFrequencies();
    powerSpectralDensity = new double[N];

    for (int i = 0; i < N; i++)
    {
      samplePath.get(i).set(precomputed.get(i));
    }

    // randomMeasure[k] = Σ_n samplePath[n] · exp(-2πi·k·n/N) (arb convention,
    // unnormalized forward DFT). Pairs with the standard 1/N inverse so that
    // applyInverseDiscreteFourierTransform(randomMeasure) ≡ samplePath exactly.
    samplePath.applyDiscreteFourierTransform(bits, randomMeasure);

    try ( Real mag = new Real(); Real binPower = new Real(); Real scaling = new Real(); Real dtScratch = new Real())
    {
      dtScratch.set(dt).div(N / 2, bits, scaling);
      for (int k = 0; k < N; k++)
      {
        // Periodogram normalisation |X[k]|² · dt / (N/2); PSD lives on the
        // same shifted-DC frequency axis as generateFrequencies().
        randomMeasure.get(k).norm(bits, mag).pow(2, bits, binPower);
        binPower.mul(scaling, bits, binPower);
        powerSpectralDensity[k] = binPower.doubleValue();
      }
    }

    calculateEnvelopeSamplingTimesAndValues();
    return this;
  }

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
    BorderPane covariancePane = wrapCovarianceChartWithLengthControls();
    GridPane   gridPane       = Charts.createGridPane(charts, covariancePane);
    Scene      scene          = new Scene(gridPane);
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

  public XYChart newAutoCorrelationChart(StationaryGaussianProcessSampler sampler, Complex samplePath)
  {
    XYChart chart = new XYChart(new DefaultNumericAxis("Δt",
                                                       ""),
                                new DefaultNumericAxis("Correlation",
                                                       ""));
    chart.setTitle("Covariance");
    populateAutoCorrelationDatasets(chart, sampler, samplePath);
    chart.getYAxis().setAutoRanging(false);
    chart.getYAxis().setMin(-0.5);
    chart.getYAxis().setMax(1.05);
    chart.getXAxis().setAutoRanging(false);
    chart.getXAxis().setMin(0);
    chart.getXAxis().setMax(sampler.autocorrelationLength);
    return chart;
  }

  /**
   * Rebuild the covariance chart's three series:
   * <ol>
   *   <li>Time-domain unbiased empirical autocorrelation ρ(k) = 1 − γ(k)/(2·C(0))
   *       computed via {@link Real#autocorrelation(int, int, Real, Real, Real)}.</li>
   *   <li>Theoretical kernel overlay K(k·dt)/K(0) when a kernel is available
   *       via {@link #getKernel(double[], double[])}; zeros otherwise.</li>
   *   <li>Frequency-domain cross-check: bias-corrected IDFT of the
   *       periodogram. From the unnormalised forward DFT X[k] of the real
   *       path, |X[k]|² is the periodogram; its inverse DFT is the biased
   *       autocovariance ·N. Dividing lag k by (N−k) and normalising by
   *       lag-zero gives an unbiased autocorrelation estimator that should
   *       agree with series 1.</li>
   * </ol>
   * All arithmetic stays in {@link Real}/{@link Complex}; conversion to
   * {@code double[]} happens only at the {@link DoubleDataSet#set} boundary.
   */
  void populateAutoCorrelationDatasets(XYChart chart, StationaryGaussianProcessSampler sampler, Complex samplePath)
  {
    int    maxLag = (int) (sampler.autocorrelationLength / sampler.dt) + 1;
    if (maxLag > sampler.N)
    {
      maxLag = sampler.N;
    }
    int    pathLen     = sampler.N;
    int    workingBits = bits;
    double timeStep    = sampler.dt;

    Real   realPath    = samplePath.re();

    try ( Real    yScratch      = Real.newVector(pathLen, "y");
          Real    gamma         = Real.newVector(maxLag, "γ");
          Real    squares       = Real.newVector(pathLen, "Z²");
          Real    rho           = Real.newVector(maxLag, "ρ");
          Complex complexPath   = Complex.newVector(pathLen);
          Complex spectrum      = Complex.newVector(pathLen);
          Complex periodogram   = Complex.newVector(pathLen);
          Complex biasedAutocov = Complex.newVector(pathLen);
          Real    lagZero       = new Real();
          Real    biasFactor    = new Real();
          Real    rhoFromFft    = Real.newVector(maxLag, "ρ̂"))
    {
      realPath.autocorrelation(maxLag, workingBits, yScratch, gamma, squares, rho);

      for (int i = 0; i < pathLen; i++)
      {
        complexPath.get(i).set(realPath.get(i));
      }
      complexPath.applyDiscreteFourierTransform(workingBits, spectrum);
      try ( Real magnitude = new Real())
      {
        for (int k = 0; k < pathLen; k++)
        {
          spectrum.get(k).norm(workingBits, magnitude).pow(2, workingBits, periodogram.get(k).re());
          periodogram.get(k).im().zero();
        }
      }
      periodogram.applyInverseDiscreteFourierTransform(workingBits, biasedAutocov);

      lagZero.set(biasedAutocov.get(0).re());
      for (int k = 0; k < maxLag; k++)
      {
        biasFactor.set((double) pathLen / (double) (pathLen - k));
        biasedAutocov.get(k).re().mul(biasFactor, workingBits, rhoFromFft.get(k));
        rhoFromFft.get(k).div(lagZero, workingBits, rhoFromFft.get(k));
      }

      double[] times             = new double[maxLag];
      double[] theory            = new double[maxLag];
      double[] empiricalRho      = new double[maxLag];
      double[] empiricalRhoFft   = new double[maxLag];
      sampler.getKernel(times, theory);
      for (int k = 0; k < maxLag; k++)
      {
        times[k]           = k * timeStep;
        empiricalRho[k]    = rho.get(k).doubleValue();
        empiricalRhoFft[k] = rhoFromFft.get(k).doubleValue();
      }

      var    kernelFn    = sampler.getKernel();
      String theoryLabel = kernelFn == null ? "Theoretical Covariance (none)"
                                            : "Theoretical Covariance " + kernelFn;
      chart.getDatasets().clear();
      chart.getDatasets().addAll(new DoubleDataSet("Empirical (unbiased)").set(times, empiricalRho),
                                 new DoubleDataSet("Empirical (IDFT of periodogram, bias-corrected)").set(times, empiricalRhoFft),
                                 new DoubleDataSet(theoryLabel).set(times, theory));
    }
  }

  /**
   * Build the covariance chart's container: a horizontal control bar with
   * a length entry field and a refresh button on top, the chart filling
   * the remaining space below. The button reads the field, updates
   * {@link #autocorrelationLength}, recomputes the empirical and
   * theoretical datasets, and stretches the chart's x-axis upper bound
   * to match. Bad input is silently rejected; values larger than the
   * usable lag horizon (N - 1) * dt are clamped down to it.
   */
  protected BorderPane wrapCovarianceChartWithLengthControls()
  {
    Label     lengthLabel = new Label("Autocorrelation length:");
    TextField lengthField = new TextField(String.valueOf(autocorrelationLength));
    lengthField.setPrefColumnCount(8);
    Button    refresh     = new Button("Refresh");
    Runnable  doRefresh   = () ->
    {
      String text = lengthField.getText();
      double parsed;
      try
      {
        parsed = Double.parseDouble(text);
      }
      catch (NumberFormatException nfe)
      {
        return;
      }
      if (!Double.isFinite(parsed) || parsed <= 0)
      {
        return;
      }
      double maxLength = (N - 1) * dt;
      if (parsed > maxLength)
      {
        parsed = maxLength;
        lengthField.setText(String.valueOf(parsed));
      }
      autocorrelationLength = parsed;
      populateAutoCorrelationDatasets(covarianceChart, this, samplePath);
      covarianceChart.getXAxis().setMax(autocorrelationLength);
      populatePowerSpectralDensityDatasets(psdChart, this, samplePath);
    };
    refresh.setOnAction(e -> doRefresh.run());
    lengthField.setOnAction(e -> doRefresh.run());
    HBox controls = new HBox(8, lengthLabel, lengthField, refresh);
    controls.setAlignment(Pos.CENTER_LEFT);
    controls.setPadding(new Insets(4, 8, 4, 8));
    BorderPane pane = new BorderPane();
    pane.setTop(controls);
    pane.setCenter(covarianceChart);
    return pane;
  }

  public XYChart newPowerSpectralDensityChart(Complex samplePath,
                                              double[] positiveFrequencies,
                                              double[] frequencies,
                                              double[] theoreticalPowerSpectralDensities,
                                              double[] powerSpectralDensity)
  {
    XYChart chart = new XYChart(new DefaultNumericAxis("Frequency",
                                                       ""),
                                new DefaultNumericAxis("ln(1 + PSD)",
                                                       ""));
    chart.setTitle("Power Spectral Density");
    for (int i = 0; i < positiveFrequencyCount; i++)
    {
      positiveFrequencies[i]               = frequencies[i];
      theoreticalPowerSpectralDensities[i] = powerSpectralDensity[i];
    }
    populatePowerSpectralDensityDatasets(chart, this, samplePath);
    configurePowerSpectralDensityAxes(chart);
    return chart;
  }

  /**
   * Rebuild the PSD chart's three series in {@code ln(1 + PSD)} units:
   * <ol>
   *   <li>Empirical periodogram from the in-phase channel of the sample
   *       path: P[k] = |X[k]|² · dt / (N/2), with X[k] the unnormalised
   *       forward DFT of the real path.</li>
   *   <li>Theoretical PSD as supplied by
   *       {@link #getPowerSpectralDensity(double[])} on the positive
   *       half of the frequency axis.</li>
   *   <li>Frequency-domain cross-check: forward DFT of the unbiased
   *       empirical autocovariance built from
   *       {@link Real#autocovariance(int, int, Real, Real, Real)} over the
   *       full lag horizon {@code maxLag = autocorrelationLength/dt}, with
   *       Hermitian symmetry C(−k) = C(k) populated at index N−k. Same
   *       periodogram normalisation · dt/(N/2) is applied so the units
   *       match.</li>
   * </ol>
   * All arithmetic in arb types; conversion to {@code double[]} only at
   * the {@link DoubleDataSet#set} boundary.
   */
  void populatePowerSpectralDensityDatasets(XYChart chart, StationaryGaussianProcessSampler sampler, Complex samplePath)
  {
    int    pathLen     = sampler.N;
    int    posCount    = sampler.positiveFrequencyCount;
    int    workingBits = bits;
    int    maxLag      = (int) (sampler.autocorrelationLength / sampler.dt) + 1;
    if (maxLag > pathLen)
    {
      maxLag = pathLen;
    }

    Real    realPath = samplePath.re();

    try ( Complex complexPath        = Complex.newVector(pathLen);
          Complex spectrum           = Complex.newVector(pathLen);
          Real    empiricalPsd       = Real.newVector(pathLen, "P");
          Real    yScratch           = Real.newVector(pathLen, "y");
          Real    gamma              = Real.newVector(maxLag, "γ");
          Real    squares            = Real.newVector(pathLen, "Z²");
          Real    autocovUnbiased    = Real.newVector(maxLag, "C");
          Complex autocovExtended    = Complex.newVector(pathLen);
          Complex autocovSpectrum    = Complex.newVector(pathLen);
          Real    scaling            = new Real();
          Real    one                = new Real();
          Real    log1pEmpirical     = Real.newVector(posCount, "ln(1+P)");
          Real    log1pTheoretical   = Real.newVector(posCount, "ln(1+T)");
          Real    log1pFromAutocov   = Real.newVector(posCount, "ln(1+Â)");
          Real    dtScratch          = new Real();
          Real    binTmp             = new Real())
    {
      one.set(1);
      dtScratch.set(sampler.dt).div(pathLen / 2, workingBits, scaling);

      for (int i = 0; i < pathLen; i++)
      {
        complexPath.get(i).set(realPath.get(i));
      }
      complexPath.applyDiscreteFourierTransform(workingBits, spectrum);
      try ( Real magnitude = new Real())
      {
        for (int k = 0; k < pathLen; k++)
        {
          spectrum.get(k).norm(workingBits, magnitude).pow(2, workingBits, empiricalPsd.get(k));
          empiricalPsd.get(k).mul(scaling, workingBits, empiricalPsd.get(k));
        }
      }

      realPath.autocovariance(maxLag, workingBits, yScratch, gamma, squares, autocovUnbiased);
      for (int i = 0; i < pathLen; i++)
      {
        autocovExtended.get(i).zero();
      }
      for (int k = 0; k < maxLag; k++)
      {
        autocovExtended.get(k).set(autocovUnbiased.get(k));
        if (k > 0 && pathLen - k < pathLen)
        {
          autocovExtended.get(pathLen - k).set(autocovUnbiased.get(k));
        }
      }
      autocovExtended.applyDiscreteFourierTransform(workingBits, autocovSpectrum);

      for (int k = 0; k < posCount; k++)
      {
        empiricalPsd.get(k).add(one, workingBits, binTmp).log(workingBits, log1pEmpirical.get(k));

        binTmp.set(sampler.theoreticalPowerSpectralDensities[k]);
        binTmp.add(one, workingBits, binTmp).log(workingBits, log1pTheoretical.get(k));

        autocovSpectrum.get(k).re().mul(scaling, workingBits, binTmp);
        binTmp.add(one, workingBits, binTmp).log(workingBits, log1pFromAutocov.get(k));
      }

      double[] freqAxis        = new double[posCount];
      double[] empiricalDouble = new double[posCount];
      double[] theoryDouble    = new double[posCount];
      double[] autocovDouble   = new double[posCount];
      for (int k = 0; k < posCount; k++)
      {
        freqAxis[k]        = sampler.positiveFrequencies[k];
        empiricalDouble[k] = log1pEmpirical.get(k).doubleValue();
        theoryDouble[k]    = log1pTheoretical.get(k).doubleValue();
        autocovDouble[k]   = log1pFromAutocov.get(k).doubleValue();
      }

      var scatterPlotRenderer = newScatterChartRenderer();
      var lineRenderer        = new ErrorDataSetRenderer();
      var autocovRenderer     = new ErrorDataSetRenderer();

      var empiricalDataSet    = new DoubleDataSet("Empirical").set(freqAxis, empiricalDouble)
                                                              .setStyle(Charts.empiricialFrequencyDatasetStyle);
      var theoreticalDataSet  = new DoubleDataSet("Theoretical").set(freqAxis, theoryDouble)
                                                                .setStyle(Charts.theoreticalFrequencyDatasetStyle);
      var autocovDataSet      = new DoubleDataSet("DFT of unbiased autocov").set(freqAxis, autocovDouble);

      scatterPlotRenderer.getDatasets().add(empiricalDataSet);
      lineRenderer.getDatasets().add(theoreticalDataSet);
      autocovRenderer.getDatasets().add(autocovDataSet);

      chart.getRenderers().setAll(scatterPlotRenderer, lineRenderer, autocovRenderer);
    }
  }

  public XYChart newRandomWhiteNoiseMeasureChart(double[] frequencies, Complex whiteNoise)
  {
    XYChart chart = new XYChart(new DefaultNumericAxis("Frequency",
                                                       ""),
                                new DefaultNumericAxis("Measure",
                                                       ""));
    chart.setTitle("Random White Noise Measure");

    final ErrorDataSetRenderer scatterPlotRenderer    = newScatterChartRenderer();

    int                        frequencyCount = frequencies.length;
    double[]                   realNoise      = new double[frequencyCount];
    double[]                   imagNoise      = new double[frequencyCount];

    for (int i = 0; i < frequencyCount; i++)
    {
      Complex element = whiteNoise.get(i);
      realNoise[i] = element.re().doubleValue();
      imagNoise[i] = element.im().doubleValue();
    }

    DoubleDataSet realDataSet = new DoubleDataSet("Real").set(frequencies, realNoise);
    DoubleDataSet imagDataSet = new DoubleDataSet("Imaginary").set(frequencies, imagNoise);

    realDataSet.setStyle(Charts.randomMeasureDatasetStyle);
    imagDataSet.setStyle(Charts.randomMeasureDatasetStyle);

    chart.getRenderers().setAll(scatterPlotRenderer);
    scatterPlotRenderer.getDatasets().addAll(realDataSet, imagDataSet);

    chart.getXAxis().setAutoRanging(true);

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

    DoubleDataSet envPos = new DoubleDataSet("Envelope (+)").set(samplingTimes.doubleValues(), envelope.doubleValues());
    double[]      negEnv = new double[N];
    for (int i = 0; i < N; i++)
    {
      negEnv[i] = -envelope.get(i).doubleValue();
    }
    DoubleDataSet envNeg = new DoubleDataSet("Envelope (–)").set(samplingTimes.doubleValues(), negEnv);
    chart.getDatasets().addAll(inPhase, quad, envPos, envNeg);
    return chart;
  }

  protected void processParameters()
  {
    List<String>        params = getParameters().getUnnamed();
    Map<String, String> named  = getParameters().getNamed();
    separateWindows = params.stream().anyMatch(param -> param.contains("separate") || param.contains("individual") || param.contains("sep"));
    seed            = Long.valueOf(named.getOrDefault("seed", "214"));

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