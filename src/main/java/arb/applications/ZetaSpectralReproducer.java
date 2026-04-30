package arb.applications;

import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.ZetaSpectralRandomMeasure;
import arb.stochastic.Charts;
import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.spi.DefaultNumericAxis;
import io.fair_acc.dataset.spi.DoubleDataSet;
import io.fair_acc.dataset.utils.DataSetStyleBuilder;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

/**
 * Java reproducer of the spectral-measure half of {@code zeta_spectral_gemini.py},
 * computed end-to-end via the {@code nint} expression-compiler operator.
 *
 * <p>The pipeline computes Φ(ω) over the spectral grid:
 * for each ω, evaluate {@link ZetaSpectralRandomMeasure}, which is the
 * compiled expression
 * <pre>ν ➔ nint(t ➔ ζ(½+ⅈ*t)·√(diff(ϑ(t),t))·exp(-ⅈ*ν*ϑ(t)),
 *              t = T0 … Tmax,
 *              dt = (Tmax-T0)/Nt) / (2π)</pre>
 * at ω. The {@code nint} operator's trapezoid integrator amortizes
 * evaluation across an outer parameter sweep, so each ω requires exactly
 * {@code Nt} ζ evaluations \u2014 identical to the {@code numpy.trapezoid}
 * cost in the reference script.
 *
 * <h2>Storage and arithmetic</h2>
 *
 * Every grid (ω and Φ(ω)) is held in arbitrary-precision {@code arb.Real}
 * / {@code arb.Complex} vectors via {@link Real#newVector(int)} and
 * {@link Complex#newVector(int)}. The cumulative-power difference
 * {@code |dΦ_k|² = |Φ_k - Φ_{k-1}|²} is also computed at the working
 * precision via FLINT-backed {@link Complex#sub} and {@link Complex#norm}.
 * IEEE-754 {@code double} appears only at two boundaries: the chartfx
 * {@code DoubleDataSet} feed (rendering edge) and the CSV writer
 * (file-format edge).
 *
 * <h2>Outputs</h2>
 *
 * <ul>
 *   <li>{@code spectral_density.csv} \u2014
 *       columns {@code omega, Re_Phi, Im_Phi, cum_power_empirical, cum_power_theory}.</li>
 *   <li>One on-screen JavaFX/chartfx window with two stacked panels
 *       matching {@code spectral_random_measure.png}: top \u2014 Re Φ(ω)
 *       in black and Im Φ(ω) in blue; bottom \u2014 empirical cumulative
 *       |dΦ|² in black and theoretical flat-density ramp in red dashed.</li>
 * </ul>
 *
 * <h2>Parameters</h2>
 *
 * The Python defaults ({@code N_T = 80,000}, {@code N_OMEGA = 2560})
 * require {@code 2,560 × 80,000 = 2.05 × 10^8} ζ evaluations. The defaults
 * below are chosen for a fast smoke-run that completes in minutes; pass
 * command-line overrides for full Python-parity.
 *
 * <pre>
 *   java arb.applications.ZetaSpectralReproducer \
 *        [Nt=4000] [Nomega=256] [Tmax=1000.0] [bits=64]
 * </pre>
 *
 * @see ZetaSpectralRandomMeasure
 * @see arb.expressions.nodes.NumericalIntegralNode
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ZetaSpectralReproducer extends
                                    Application
{
  /** First Riemann\u2013Siegel-theta zero \u2014 same as the Python script. */
  static final double T0_DEFAULT     = 6.289835988;
  static final double TMAX_DEFAULT   = 1000.0;
  static final double OMEGA_MIN      = -3.0;
  static final double OMEGA_MAX      = 3.0;
  static final int    NT_DEFAULT     = 4000;   // smoke run; use 80000 for parity
  static final int    NOMEGA_DEFAULT = 256;    // smoke run; use 2560 for parity
  static final int    BITS_DEFAULT   = 64;

  static int          NT;
  static int          NOMEGA;
  static double       TMAX;
  static int          BITS;

  // Outputs of the headless computation phase, populated by computeAll()
  // and consumed by start() to build the JavaFX scene graph and the CSV.
  Real                omegas;            // length NOMEGA
  Complex             phi;               // length NOMEGA, Φ(ω_k)
  Real                cumPowerEmpirical; // length NOMEGA, cumulative |dΦ_k|²
  Real                cumPowerTheory;    // length NOMEGA, flat-density ramp
  Real                dOmega;            // (OMEGA_MAX - OMEGA_MIN) / NOMEGA, exact at BITS

  public static void main(String[] args) throws Exception
  {
    NT     = args.length > 0 ? Integer.parseInt(args[0])   : NT_DEFAULT;
    NOMEGA = args.length > 1 ? Integer.parseInt(args[1])   : NOMEGA_DEFAULT;
    TMAX   = args.length > 2 ? Double.parseDouble(args[2]) : TMAX_DEFAULT;
    BITS   = args.length > 3 ? Integer.parseInt(args[3])   : BITS_DEFAULT;

    int workers = Runtime.getRuntime().availableProcessors();

    System.out.printf(Locale.ROOT,
                      "[main] T=[%.6f, %.1f] N_t=%d N_omega=%d bits=%d workers=%d%n",
                      T0_DEFAULT, TMAX, NT, NOMEGA, BITS, workers);

    Application.launch(ZetaSpectralReproducer.class, args);
  }

  @Override
  public void start(Stage primaryStage) throws Exception
  {
    long t0 = System.currentTimeMillis();

    int workers = Runtime.getRuntime().availableProcessors();
    computeAll(NT, NOMEGA, TMAX, BITS, workers);

    System.out.printf(Locale.ROOT,
                      "[main] compute total %.2fs%n",
                      (System.currentTimeMillis() - t0) / 1000.0);

    // CSV output: arbitrary-precision values, cast to double at the file-format edge.
    Path csv = Path.of("spectral_density.csv");
    writeSpectralDensityCsv(csv);
    System.out.printf(Locale.ROOT, "[csv] wrote %s%n", csv.toAbsolutePath());

    // Two stacked panels in one window: Φ(ω) on top, cumulative power on bottom.
    XYChart phiChart   = buildPhiChart();
    XYChart powerChart = buildPowerChart();
    Charts.configureChart(phiChart,   true);
    Charts.configureChart(powerChart, true);

    VBox root = new VBox(phiChart, powerChart);
    VBox.setVgrow(phiChart,   javafx.scene.layout.Priority.ALWAYS);
    VBox.setVgrow(powerChart, javafx.scene.layout.Priority.ALWAYS);

    primaryStage.setTitle("Cumulative Spectral Measure  Φ(ω) = ∫ dΦ");
    Scene scene = new Scene(root, 1400, 900);
    primaryStage.setScene(scene);
    primaryStage.show();
  }

  // ─────────────────────────────────────────────────────────────────────
  // Top-level orchestrator. Allocates every arbitrary-precision vector
  // and runs the pipeline.
  // ─────────────────────────────────────────────────────────────────────
  void computeAll(int Nt, int Nomega, double Tmax, int bits, int workers) throws Exception
  {
    // ── ω-grid (linspace endpoint=False) and dω, in arb.Real
    omegas = Real.newVector(Nomega);
    dOmega = new Real();
    try (Real range = new Real(); Real n = new Real())
    {
      range.set(OMEGA_MAX - OMEGA_MIN);
      n.set(Nomega);
      range.div(n, bits, dOmega);
      for (int k = 0; k < Nomega; k++)
      {
        try (Real kReal = new Real(); Real shift = new Real())
        {
          kReal.set(k);
          kReal.mul(dOmega, bits, shift);
          omegas.get(k).set(OMEGA_MIN).add(shift, bits);
        }
      }
    }

    // ── Spectral density Φ(ω)
    phi = Complex.newVector(Nomega);
    System.out.println("[density] computing Φ(ω) over the ω-grid...");
    long t1 = System.currentTimeMillis();
    runSpectralDensity(omegas, phi, Tmax, Nt, bits, workers);
    System.out.printf(Locale.ROOT,
                      "[density] done in %.2fs%n",
                      (System.currentTimeMillis() - t1) / 1000.0);

    // ── Cumulative power: arbitrary-precision first-difference + cumulative sum
    cumPowerEmpirical = Real.newVector(Nomega);
    cumPowerTheory    = Real.newVector(Nomega);
    try (Complex prev = new Complex();
         Complex diff = new Complex();
         Real    mag  = new Real();
         Real    acc  = new Real())
    {
      prev.set(0);
      acc.set(0);
      for (int k = 0; k < Nomega; k++)
      {
        phi.get(k).sub(prev, bits, diff);
        diff.norm(bits, mag);     // |dΦ_k|
        mag.mul(mag, bits);       // |dΦ_k|²
        acc.add(mag, bits);
        cumPowerEmpirical.get(k).set(acc);
        prev.set(phi.get(k));
      }
      // Theoretical ramp: total · k / (Nomega - 1)
      try (Real total = new Real(); Real Nm1 = new Real(); Real kReal = new Real(); Real scale = new Real())
      {
        total.set(cumPowerEmpirical.get(Nomega - 1));
        Nm1.set(Nomega - 1);
        for (int k = 0; k < Nomega; k++)
        {
          kReal.set(k);
          total.mul(kReal, bits, scale);
          scale.div(Nm1, bits, cumPowerTheory.get(k));
        }
      }
    }
  }

  // ─────────────────────────────────────────────────────────────────────
  // Parallel ω-sweep over Φ(ω) via ZetaSpectralRandomMeasure.
  //
  // Each worker thread holds its own ZetaSpectralRandomMeasure instance —
  // the underlying nint integrator is stateful (cumulative trapezoid cache)
  // and the per-evaluate rebind in init() is not thread-safe across a
  // single instance.
  // ─────────────────────────────────────────────────────────────────────
  static void runSpectralDensity(Real omegas,
                                 Complex phi,
                                 double Tmax,
                                 int Nt,
                                 int bits,
                                 int workers)
      throws Exception
  {
    int           N           = omegas.size();
    AtomicInteger progress    = new AtomicInteger(0);
    int           reportEvery = Math.max(1, N / 16);

    ExecutorService pool = Executors.newFixedThreadPool(workers);
    try
    {
      ThreadLocal<ZetaSpectralRandomMeasure> tlPhi = ThreadLocal.withInitial(() ->
      {
        Real T0   = new Real(Double.toString(T0_DEFAULT), bits);
        Real Tend = new Real(Double.toString(Tmax),       bits);
        return new ZetaSpectralRandomMeasure(T0, Tend, Nt, bits);
      });

      List<Future<?>> futures = new ArrayList<>();
      for (int k = 0; k < N; k++)
      {
        final int ki = k;
        futures.add(pool.submit(() ->
        {
          ZetaSpectralRandomMeasure phiFn = tlPhi.get();
          phiFn.evaluate(omegas.get(ki), 1, bits, phi.get(ki));
          int p = progress.incrementAndGet();
          if (p == 1 || p == N || p % reportEvery == 0)
          {
            System.out.printf(Locale.ROOT,
                              "[density] %d/%d  ω=%+.4f  Φ=%+.3e %+.3ei%n",
                              p, N,
                              omegas.get(ki).doubleValue(),
                              phi.get(ki).re().doubleValue(),
                              phi.get(ki).im().doubleValue());
          }
        }));
      }
      for (Future<?> f : futures)
      {
        f.get();
      }
      pool.shutdown();
      pool.awaitTermination(7, TimeUnit.DAYS);
    }
    finally
    {
      if (!pool.isTerminated())
      {
        pool.shutdownNow();
      }
    }
  }

  // ─────────────────────────────────────────────────────────────────────
  // CSV writer.  Lossy double-cast at the file-format edge only.
  // ─────────────────────────────────────────────────────────────────────
  void writeSpectralDensityCsv(Path out) throws IOException
  {
    int N = omegas.size();
    try (BufferedWriter w = Files.newBufferedWriter(out))
    {
      w.write("omega,Re_Phi,Im_Phi,cum_power_empirical,cum_power_theory\n");
      for (int k = 0; k < N; k++)
      {
        w.write(String.format(Locale.ROOT,
                              "%.10g,%.10g,%.10g,%.10g,%.10g%n",
                              omegas           .get(k).doubleValue(),
                              phi              .get(k).re().doubleValue(),
                              phi              .get(k).im().doubleValue(),
                              cumPowerEmpirical.get(k).doubleValue(),
                              cumPowerTheory   .get(k).doubleValue()));
      }
    }
  }

  // ─────────────────────────────────────────────────────────────────────
  // Top panel: Re Φ(ω) (black) and Im Φ(ω) (blue) versus ω.
  // ─────────────────────────────────────────────────────────────────────
  XYChart buildPhiChart()
  {
    int      N    = omegas.size();
    double[] xs   = new double[N];
    double[] reys = new double[N];
    double[] imys = new double[N];
    for (int k = 0; k < N; k++)
    {
      xs[k]   = omegas.get(k).doubleValue();
      reys[k] = phi.get(k).re().doubleValue();
      imys[k] = phi.get(k).im().doubleValue();
    }

    DefaultNumericAxis xAxis = new DefaultNumericAxis("ω", "");
    DefaultNumericAxis yAxis = new DefaultNumericAxis("Φ(ω)", "");
    XYChart            chart = new XYChart(xAxis, yAxis);
    chart.setTitle("Cumulative Spectral Measure  Φ(ω) = ∫ dΦ");
    xAxis.setAutoRanging(false);
    xAxis.setMin(-3.25);
    xAxis.setMax(3.25);
    xAxis.setAutoRangeRounding(false);
    xAxis.setTickUnit(0.25);
    yAxis.setAutoRanging(true);

    DoubleDataSet rePhi = new DoubleDataSet("Re Φ(ω)").set(xs, reys);
    DoubleDataSet imPhi = new DoubleDataSet("Im Φ(ω)").set(xs, imys);

    rePhi.setStyle(DataSetStyleBuilder.instance()
                                      .setLineColor("black")
                                      .setMarkerColor("black")
                                      .setLineWidth(2)
                                      .build());
    imPhi.setStyle(DataSetStyleBuilder.instance()
                                      .setLineColor("dodgerblue")
                                      .setMarkerColor("dodgerblue")
                                      .setLineWidth(2)
                                      .build());

    chart.getDatasets().setAll(rePhi, imPhi);
    return chart;
  }

  // ─────────────────────────────────────────────────────────────────────
  // Bottom panel: empirical cumulative |dΦ|² (black) vs theoretical
  // flat-density ramp (red dashed).
  // ─────────────────────────────────────────────────────────────────────
  XYChart buildPowerChart()
  {
    int      N      = omegas.size();
    double[] xs     = new double[N];
    double[] emp    = new double[N];
    double[] theory = new double[N];
    for (int k = 0; k < N; k++)
    {
      xs[k]     = omegas           .get(k).doubleValue();
      emp[k]    = cumPowerEmpirical.get(k).doubleValue();
      theory[k] = cumPowerTheory   .get(k).doubleValue();
    }

    DefaultNumericAxis xAxis = new DefaultNumericAxis("ω", "");
    DefaultNumericAxis yAxis = new DefaultNumericAxis("Power", "");
    XYChart            chart = new XYChart(xAxis, yAxis);
    chart.setTitle("Spectral Distribution Function");
    xAxis.setAutoRanging(false);
    xAxis.setMin(-3.25);
    xAxis.setMax(3.25);
    xAxis.setAutoRangeRounding(false);
    xAxis.setTickUnit(0.25);
    yAxis.setAutoRanging(true);

    DoubleDataSet empDs   = new DoubleDataSet("Empirical: cumulative sum of |dΦ|²").set(xs, emp);
    DoubleDataSet theoDs  = new DoubleDataSet("Theoretical shape (flat spectral density)").set(xs, theory);

    empDs.setStyle(DataSetStyleBuilder.instance()
                                      .setLineColor("black")
                                      .setMarkerColor("black")
                                      .setLineWidth(2)
                                      .build());
    theoDs.setStyle(DataSetStyleBuilder.instance()
                                       .setLineColor("red")
                                       .setMarkerColor("red")
                                       .setLineWidth(2)
                                       .setLineDashes(new double[]{8, 4})
                                       .build());

    chart.getDatasets().setAll(empDs, theoDs);
    return chart;
  }
}
