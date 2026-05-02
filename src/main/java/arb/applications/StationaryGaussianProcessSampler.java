package arb.applications;

import java.util.*;
import java.util.stream.Stream;

import arb.*;
import arb.Float;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import arb.stochastic.Charts;
import arb.stochastic.Statistics;
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
import javafx.scene.control.CheckBox;
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
   * Whether the PSD chart's x-axis spans the full {@link #spectralSupport}
   * (negative + positive frequencies) or only the non-negative half.
   * For a real-valued process the periodogram is symmetric about zero, so
   * the negative half is redundant; default is non-negative-only.
   */
  protected boolean             showNegativeFrequencies           = false;

  /**
   * The single covariance XYChart created by
   * {@link #newAutoCorrelationChart(StationaryGaussianProcessSampler, Complex)}.
   * Held so the refresh handler can mutate its datasets and x-axis upper
   * bound after the user changes the length.
   */
  private XYChart               covarianceChart;

  private XYChart               timeDomainChart;

  private XYChart               whiteNoiseChart;

  private XYChart               powerSpectralDensityChart;

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

  public Real                   frequencies;

  private boolean               light;

  FloatInterval                 timeSpan;

  Float                         interval;

  double                        L;

  int                           N;

  private boolean               N_IS_EVEN;

  public double                 nyquistFrequency;

  public int                    nyquistIndex;

  int                           positiveFrequencyCount;

  private Real                  positiveFrequencies;

  public double                 df;

  public Real                   powerSpectralDensity;

  protected Complex             randomMeasure;

  public Complex                samplePath;

  public Real                   samplingTimes;

  long                          seed                              = 922;

  private boolean               separateWindows                   = false;

  final FloatInterval           spectralSupport;

  private Stage[]               stages;

  private Real                  theoreticalPowerSpectralDensities;

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
    this.positiveFrequencies    = Real.newVector(positiveFrequencyCount);
    this.df                     = 1.0 / L;
    this.theoreticalPowerSpectralDensities = Real.newVector(positiveFrequencyCount);

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
    if (frequencies != null)                       frequencies.close();
    if (positiveFrequencies != null)               positiveFrequencies.close();
    if (powerSpectralDensity != null)              powerSpectralDensity.close();
    if (theoreticalPowerSpectralDensities != null) theoreticalPowerSpectralDensities.close();
  }

  /**
   * Reallocate every grid-sized native vector and double[] table for a new
   * total time-span L (dt unchanged), regenerate the sample path, and refresh
   * each of the four chart panes in place. N becomes (int)(newL/dt). Closes
   * and replaces timeSpan, interval, whiteNoise, samplePath, envelope,
   * samplingTimes, randomMeasure, positiveFrequencies, theoreticalPowerSpectralDensities;
   * frequencies and powerSpectralDensity are re-populated by the sampler's
   * prepareSamplePath() (either generateSamplePathFromSpectrallyColoredOrthogonalRandomMeasure
   * for seed-based subclasses or ingestPrecomputedSamplePath for path-based
   * subclasses).
   */
  public void resize(double newL)
  {
    if (!Double.isFinite(newL) || newL <= 0)
    {
      return;
    }
    try
    {
      double t0 = timeSpan.getA().doubleValue();
      whiteNoise.close();
      samplePath.close();
      envelope.close();
      samplingTimes.close();
      randomMeasure.close();
      timeSpan.close();
      interval.close();

      this.timeSpan               = new FloatInterval(t0, t0 + newL);
      this.interval               = timeSpan.length(128, new Float());
      this.L                      = interval.doubleValue();
      this.N                      = (int) (L / dt);
      this.N_IS_EVEN              = N % 2 == 0;
      this.nyquistFrequency       = 1.0 / (2 * dt);
      this.nyquistIndex           = N / 2;
      this.positiveFrequencyCount = N / 2 + 1;
      if (this.positiveFrequencies != null) this.positiveFrequencies.close();
      this.positiveFrequencies    = Real.newVector(positiveFrequencyCount);
      this.df                     = 1.0 / L;
      if (this.theoreticalPowerSpectralDensities != null) this.theoreticalPowerSpectralDensities.close();
      this.theoreticalPowerSpectralDensities = Real.newVector(positiveFrequencyCount);
      this.whiteNoise             = Complex.newVector(N);
      this.samplePath             = Complex.newVector(N);
      this.envelope               = Real.newVector(N);
      this.samplingTimes          = Real.newVector(N);
      this.randomMeasure          = Complex.newVector(N);

      prepareSamplePath();
      // Refresh positiveFrequencies and theoreticalPowerSpectralDensities tables
      // (filled inside the chart factory the first time around; recompute here).
      for (int i = 0; i < positiveFrequencyCount; i++)
      {
        positiveFrequencies              .get(i).set(frequencies          .get(i));
        theoreticalPowerSpectralDensities.get(i).set(powerSpectralDensity .get(i));
      }
      populateTimeDomainDatasets(timeDomainChart, spectralSupport, samplingTimes, samplePath, envelope);
      populateRandomWhiteNoiseMeasureDatasets(whiteNoiseChart, frequencies, whiteNoise);
      populateAutoCorrelationDatasets(covarianceChart, this, samplePath);
      populatePowerSpectralDensityDatasets(powerSpectralDensityChart);
    }
    catch (Exception e)
    {
      throw new RuntimeException("resize failed for L=" + newL, e);
    }
  }

  protected HBox buildSampleLengthControlBar()
  {
    Label     lengthLabel = new Label("Sample length L:");
    TextField lengthField = new TextField(String.valueOf(L));
    lengthField.setPrefColumnCount(10);
    Button    apply       = new Button("Apply");
    Runnable  doApply     = () ->
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
      resize(parsed);
      lengthField.setText(String.valueOf(L));
    };
    apply.setOnAction(e -> doApply.run());
    lengthField.setOnAction(e -> doApply.run());

    CheckBox negFreqToggle = new CheckBox("Show negative frequencies");
    negFreqToggle.setSelected(showNegativeFrequencies);
    negFreqToggle.selectedProperty().addListener((obs, oldVal, newVal) ->
    {
      showNegativeFrequencies = newVal;
      if (whiteNoiseChart           != null) configureFrequencyAxis(whiteNoiseChart);
      if (powerSpectralDensityChart != null) configureFrequencyAxis(powerSpectralDensityChart);
    });

    HBox bar = new HBox(8, lengthLabel, lengthField, apply, negFreqToggle);
    bar.setAlignment(Pos.CENTER_LEFT);
    bar.setPadding(new Insets(4, 8, 4, 8));
    return bar;
  }

  /**
   * Periodogram of {@code path} on the wrap-around DFT frequency grid.
   * Result is a {@link Real} vector of length {@link #N}; cell k holds
   * {@code |X[k]|² · dt / (N/2)} where X = unnormalized forward DFT of
   * the path. The radius of each cell is left at zero — callers that
   * want statistical confidence widths on the bins set them explicitly.
   */
  public Real computePowerSpectralDensity(Real path)
  {
    Real periodogram = Real.newVector(N);
    try ( Complex complexPath = Complex.newVector(N); Complex fft = Complex.newVector(N); Real mag = new Real();
          Real scalingFactor = Real.valueOf(dt).div(N / 2, bits);)
    {
      for (int i = 0; i < N; i++)
      {
        complexPath.get(i).re().set(path.get(i));
        complexPath.get(i).im().zero();
      }

      arblib.acb_dft(fft, complexPath, N, bits);

      for (int i = 0; i < N; i++)
      {
        fft.get(i).norm(bits, mag).pow(2, bits).mul(scalingFactor, bits, periodogram.get(i));
      }
    }
    return periodogram;
  }

  void configureCharts()
  {
    timeDomainChart           = newTimeDomainChart(spectralSupport, samplingTimes, samplePath, envelope);
    whiteNoiseChart           = newRandomWhiteNoiseMeasureChart(frequencies, whiteNoise);
    covarianceChart           = newAutoCorrelationChart(this, samplePath);
    powerSpectralDensityChart = newPowerSpectralDensityChart(samplePath, positiveFrequencies, frequencies, theoreticalPowerSpectralDensities, powerSpectralDensity);
    Stream.of(charts = new XYChart[]
    { timeDomainChart, whiteNoiseChart, covarianceChart, powerSpectralDensityChart })
          .forEach(chart -> Charts.configureChart(chart, light));
  }

  public void configurePowerSpectralDensityAxes(XYChart chart)
  {
    configureXAxisOfPowerSpectralDensityChart(chart);

    configureYAxisOfPowerSpectralDensityChart(chart);
  }

  public void configureXAxisOfPowerSpectralDensityChart(XYChart chart)
  {
    configureFrequencyAxis(chart);
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

  public Real generateFrequencies()
  {
    Real freq = Real.newVector(N);
    try ( Real dfR = Real.valueOf(df); Real kR = new Real())
    {
      for (int i = 0; i < N; i++)
      {
        kR.set(i <= nyquistIndex ? i : (i - N));
        kR.mul(dfR, bits, freq.get(i));
      }
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

      try ( Real dfR = Real.valueOf(df))
      {
        for (int k = 0; k <= nyquistIndex; k++)
        {
          mag.set(powerSpectralDensity.get(k)).mul(dfR, bits).sqrt(bits);
          drawWhiteNoiseSample(whiteNoiseProcess, k).mul(mag, bits, randomMeasure.get(k));
        }
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
  public void getKernel(Real times, Real values)
  {
    assert times.size() == values.size();
    for (int i = 0; i < times.size(); i++)
    {
      times.get(i).set(i * dt);
      values.get(i).zero();
    }
  }

  /**
   * Theoretical power spectral density at the requested frequencies. Used
   * (a) by the seed-based pipeline to color the white noise and (b) as the
   * theoretical overlay on the PSD chart. Path-based subclasses without a
   * closed-form PSD return zeros, in which case the empirical PSD computed
   * by {@link #ingestPrecomputedSamplePath(Complex)} drives the chart.
   */
  public Real getPowerSpectralDensity(Real freq)
  {
    return Real.newVector(freq.size());
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

    if (frequencies != null) frequencies.close();
    frequencies          = generateFrequencies();
    if (powerSpectralDensity != null) powerSpectralDensity.close();
    powerSpectralDensity = Real.newVector(N);

    for (int i = 0; i < N; i++)
    {
      samplePath.get(i).set(precomputed.get(i));
    }

    // randomMeasure[k] = Σ_n samplePath[n] · exp(-2πi·k·n/N) (arb convention,
    // unnormalized forward DFT). Pairs with the standard 1/N inverse so that
    // applyInverseDiscreteFourierTransform(randomMeasure) ≡ samplePath exactly.
    samplePath.applyDiscreteFourierTransform(bits, randomMeasure);

    try ( Real mag = new Real();
          Real scalingFactor = Real.valueOf(dt).div(N / 2, bits))
    {
      for (int k = 0; k < N; k++)
      {
        // Periodogram normalization consistent with computePowerSpectralDensity:
        // |X[k]|² · dt / (N/2). PSD lives on the same shifted-DC frequency
        // axis as generateFrequencies().
        randomMeasure.get(k).norm(bits, mag).pow(2, bits).mul(scalingFactor, bits, powerSpectralDensity.get(k));
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
    BorderPane root           = new BorderPane();
    root.setTop(buildSampleLengthControlBar());
    root.setCenter(gridPane);
    Scene      scene          = new Scene(root);
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
                                new DefaultNumericAxis("Covariance",
                                                       ""));
    chart.setTitle("Covariance");
    populateAutoCorrelationDatasets(chart, sampler, samplePath);
    // Autocovariance is no longer normalized to a unit peak, so the
    // y-axis must adapt to the actual signal amplitude.  Lag-0 is
    // C(0) = ⟨Z²⟩ — for raw Hardy Z on [0, L] this can be tens or more.
    chart.getYAxis().setAutoRanging(true);
    chart.getXAxis().setAutoRanging(false);
    chart.getXAxis().setMin(0);
    chart.getXAxis().setMax(sampler.autocorrelationLength);
    return chart;
  }

  /**
   * Replace the empirical and theoretical-kernel datasets on the covariance
   * chart using the current value of {@link #autocorrelationLength}, and
   * write the lag grid into a length-{@code maxLag} array. The empirical
   * lag count is clamped at the path length N so the autocorr estimator
   * never runs past the data; the theoretical-kernel array is filled at
   * the same length via {@link #getKernel(double[], double[])}.
   */
  void populateAutoCorrelationDatasets(XYChart chart, StationaryGaussianProcessSampler sampler, Complex samplePath)
  {
    int maxLag = (int) (sampler.autocorrelationLength / sampler.dt) + 1;
    if (maxLag > sampler.N)
    {
      maxLag = sampler.N;
    }
    var    kernelFn    = sampler.getKernel();
    String theoryLabel = kernelFn == null ? "Theoretical Covariance (none)"
                                          : "Theoretical Covariance " + kernelFn;

    // Arb-typed empirical autocovariance: C(k) = (1/(N-k)) Σ Z[i] Z[i+k],
    // no division by variance, lag-0 = ⟨Z²⟩. Computed at the working bit
    // precision via Real.autocovariance and the theoretical kernel is
    // sampled into a Real vector by sampler.getKernel(times, theory);
    // both are cast to double[] only at the chart-feeding edge.
    double[] timesD;
    double[] empiricalD;
    double[] theoryD;
    try (Real times = Real.newVector(maxLag);
         Real theory = Real.newVector(maxLag);
         Real cov = Real.newVector(maxLag))
    {
      sampler.getKernel(times, theory);
      samplePath.re().autocovariance(maxLag, bits, cov);
      timesD     = times.doubleValues();
      empiricalD = cov.doubleValues();
      theoryD    = theory.doubleValues();
    }
    chart.getDatasets().clear();
    chart.getDatasets().addAll(new DoubleDataSet("Empirical").set(timesD, empiricalD),
                               new DoubleDataSet(theoryLabel).set(timesD, theoryD));
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
                                              Real positiveFrequencies,
                                              Real frequencies,
                                              Real theoreticalPowerSpectralDensities,
                                              Real powerSpectralDensity)
  {
    // Chart 4: PSD
    XYChart chart = new XYChart(new DefaultNumericAxis("Frequency",
                                                       ""),
                                new DefaultNumericAxis("ln(1 + PSD)",
                                                       ""));
    chart.setTitle("Power Spectral Density");
    for (int i = 0; i < positiveFrequencyCount; i++)
    {
      positiveFrequencies              .get(i).set(frequencies         .get(i));
      theoreticalPowerSpectralDensities.get(i).set(powerSpectralDensity.get(i));
    }
    chart.getRenderers().setAll(newPeriodogramErrorBarRenderer(), new ErrorDataSetRenderer());
    configurePowerSpectralDensityAxes(chart);
    populatePowerSpectralDensityDatasets(chart);
    return chart;
  }

  /**
   * Indicative χ²_2 interquartile range divisors. The single-realization
   * periodogram is χ²_2 about the true PSD; the IQR endpoints are
   * 2/χ²_{2,0.75} and 2/χ²_{2,0.25}, giving lower Ŝ/3.476 and upper
   * Ŝ/0.7213. A factor of ≈50 narrower than the 95% CI, so the bars
   * visually communicate per-bin scale on the chart instead of saturating
   * the y axis.
   */
  static final double CHI2_2_LOWER = 3.4759;   // 2/χ²_{2,0.25}

  /** Upper IQR divisor: 2/χ²_{2,0.75} = 2/2.7726. */
  static final double CHI2_2_UPPER = 0.72134;

  void populatePowerSpectralDensityDatasets(XYChart chart)
  {
    // Empirical PSD computed end-to-end in arb precision; only the per-cell
    // doubleValue() at the dataset edge crosses into double.
    Real        empiricalPSD = computePowerSpectralDensity(samplePath.re());
    RealDataSet empiricalDS  = new RealDataSet("Empirical",
                                               positiveFrequencyCount,
                                               spectralSupport,
                                               true);                  // asymmetric χ²_2 bars
    Complex     empY         = empiricalDS.getComplexYValues();
    double[] xs              = new double[positiveFrequencyCount];
    double[] theoreticalLog1p = new double[positiveFrequencyCount];

    try ( Real one    = Real.valueOf(1.0);
          Real chi2Lo = Real.valueOf(CHI2_2_LOWER);
          Real chi2Hi = Real.valueOf(CHI2_2_UPPER);
          Real lo     = new Real();
          Real hi     = new Real();
          Real tmp    = new Real();
          Real ln1pLo = new Real();
          Real ln1pHi = new Real();
          Real ln1pCt = new Real())
    {
      for (int i = 0; i < positiveFrequencyCount; i++)
      {
        xs[i] = positiveFrequencies.get(i).doubleValue();

        Real bin = empiricalPSD.get(i);                                // Ŝ_k
        bin.div(chi2Lo, bits, lo);                                     // Ŝ/3.689
        bin.div(chi2Hi, bits, hi);                                     // Ŝ/0.0506

        bin.add(one, bits, tmp).log(bits, ln1pCt);                     // ln(1+Ŝ)
        lo .add(one, bits, tmp).log(bits, ln1pLo);                     // ln(1+Ŝ/3.689)
        hi .add(one, bits, tmp).log(bits, ln1pHi);                     // ln(1+Ŝ/0.0506)

        // x row
        empiricalDS.getRealXValues().get(i).set(positiveFrequencies.get(i));

        // y center: ln(1+Ŝ) into re().getMid()
        empY.get(i).re().set(ln1pCt);

        // +error distance into re().getRad()
        ln1pHi.sub(ln1pCt, bits, tmp);
        empY.get(i).re().getRad().set(Math.max(0.0, tmp.doubleValue()));

        // −error distance into im().getRad()
        ln1pCt.sub(ln1pLo, bits, tmp);
        empY.get(i).im().getRad().set(Math.max(0.0, tmp.doubleValue()));

        // Theoretical curve
        theoreticalPowerSpectralDensities.get(i).add(one, bits, tmp).log(bits, ln1pCt);
        theoreticalLog1p[i] = Math.max(0.0, ln1pCt.doubleValue());
      }
    }
    finally
    {
      empiricalPSD.close();
    }

    empiricalDS.setStyle(Charts.empiricialFrequencyDatasetStyle);
    var theoreticalDataSet = new DoubleDataSet("Theoretical").set(xs, theoreticalLog1p)
                                                             .setStyle(Charts.theoreticalFrequencyDatasetStyle);
    var renderers = chart.getRenderers();
    ((ErrorDataSetRenderer) renderers.get(0)).getDatasets().setAll(empiricalDS);
    ((ErrorDataSetRenderer) renderers.get(1)).getDatasets().setAll(theoreticalDataSet);
  }

  /**
   * Renderer for the empirical periodogram: marker per bin plus the
   * asymmetric χ²_2 95% confidence bar. {@link ErrorStyle#ERRORBARS}
   * tells the renderer to query the dataset's {@code DataSetError}
   * surface (which {@link RealDataSet} implements when constructed in
   * asymmetric mode).
   */
  public ErrorDataSetRenderer newPeriodogramErrorBarRenderer()
  {
    final ErrorDataSetRenderer renderer = new ErrorDataSetRenderer();
    renderer.setPolyLineStyle(LineStyle.NONE);
    renderer.setErrorStyle(ErrorStyle.ERRORBARS);
    renderer.setDrawMarker(true);
    renderer.setDrawBubbles(false);
    renderer.setAssumeSortedData(false);
    return renderer;
  }

  public XYChart newRandomWhiteNoiseMeasureChart(Real frequencies, Complex whiteNoise)
  {
    XYChart chart = new XYChart(new DefaultNumericAxis("Frequency",
                                                       ""),
                                new DefaultNumericAxis("Measure",
                                                       ""));
    chart.setTitle("Random White Noise Measure");
    chart.getRenderers().setAll(newScatterChartRenderer());
    populateRandomWhiteNoiseMeasureDatasets(chart, frequencies, whiteNoise);
    configureFrequencyAxis(chart);
    return chart;
  }

  /**
   * Apply the current value of {@link #showNegativeFrequencies} to a
   * frequency-axis chart. Used for both the white-noise measure chart
   * and the PSD chart, since they share the same x-axis semantics:
   * full {@link #spectralSupport} when negatives are shown, only the
   * non-negative half otherwise.
   */
  protected void configureFrequencyAxis(XYChart chart)
  {
    chart.getXAxis().setAutoRanging(false);
    double xMin = showNegativeFrequencies ? spectralSupport.getA().doubleValue() : 0.0;
    double xMax = spectralSupport.getB().doubleValue();
    chart.getXAxis().setMin(xMin);
    chart.getXAxis().setMax(xMax);
  }

  void populateRandomWhiteNoiseMeasureDatasets(XYChart chart, Real frequencies, Complex whiteNoise)
  {
    int      frequencyCount = frequencies.size();
    double[] xs             = new double[frequencyCount];
    double[] realNoise      = new double[frequencyCount];
    double[] imagNoise      = new double[frequencyCount];
    for (int i = 0; i < frequencyCount; i++)
    {
      Complex element = whiteNoise.get(i);
      xs[i]        = frequencies.get(i).doubleValue();
      realNoise[i] = element.re().doubleValue();
      imagNoise[i] = element.im().doubleValue();
    }
    DoubleDataSet realDataSet = new DoubleDataSet("Real").set(xs, realNoise);
    DoubleDataSet imagDataSet = new DoubleDataSet("Imaginary").set(xs, imagNoise);
    realDataSet.setStyle(Charts.randomMeasureDatasetStyle);
    imagDataSet.setStyle(Charts.randomMeasureDatasetStyle);
    var renderer = (ErrorDataSetRenderer) chart.getRenderers().get(0);
    renderer.getDatasets().setAll(realDataSet, imagDataSet);
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
    populateTimeDomainDatasets(chart, spectralSupport, samplingTimes, samplePath, envelope);
    return chart;
  }

  void populateTimeDomainDatasets(XYChart chart, FloatInterval spectralSupport, Real samplingTimes, Complex samplePath, Real envelope)
  {
    RealDataSet inPhase = new RealDataSet("In-phase", N, spectralSupport);
    inPhase.getTimes().set(samplingTimes);
    inPhase.getValues().set(samplePath.re());
    RealDataSet quad = new RealDataSet("Quadrature", N, spectralSupport);
    quad.getTimes().set(samplingTimes);
    quad.getValues().set(samplePath.im());
    DoubleDataSet envPos = new DoubleDataSet("Envelope (+)").set(samplingTimes.doubleValues(), envelope.doubleValues());
    double[]      negEnv = new double[N];
    for (int i = 0; i < N; i++)
    {
      negEnv[i] = -envelope.get(i).doubleValue();
    }
    DoubleDataSet envNeg = new DoubleDataSet("Envelope (–)").set(samplingTimes.doubleValues(), negEnv);
    chart.getDatasets().setAll(inPhase, quad, envPos, envNeg);
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