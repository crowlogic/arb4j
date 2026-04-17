package arb.applications;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.stream.IntStream;
import java.util.stream.Stream;

import javax.imageio.ImageIO;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.RealToComplexFunction;
import arb.functions.real.RealFunction;
import arb.stochastic.Charts;
import arb.utensils.Utensils;
import arb.viz.WindowManager;
import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.spi.DefaultNumericAxis;
import io.fair_acc.chartfx.renderer.ErrorStyle;
import io.fair_acc.chartfx.renderer.LineStyle;
import io.fair_acc.chartfx.renderer.spi.ErrorDataSetRenderer;
import io.fair_acc.dataset.spi.DoubleDataSet;
import io.fair_acc.dataset.utils.DataSetStyleBuilder;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.embed.swing.SwingFXUtils;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.SnapshotParameters;
import javafx.scene.image.ImageView;
import javafx.scene.image.WritableImage;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.scene.layout.RowConstraints;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

/**
 * <h3>Zeta Spectral Reconstruction</h3>
 *
 * <p>
 * JavaFX reproduction of the two figures produced by the reference Python
 * script {@code zeta_spectral_gemini.py}. The class computes in three parallel
 * phases, each dispatched across the common ForkJoinPool by
 * {@link IntStream#parallel()} with per-task ownership of scratch
 * {@link Complex}/{@link Real} instances and compiled expressions, so there is
 * no write contention on the shared output arrays.
 *
 * <ol>
 *   <li><b>Precompute on a dense t-grid.</b> With
 *       t_j = T0 + j · dt, dt = (T_MAX − T0)/(N_T − 1) for j = 0..N_T−1,
 *       store
 *       <ul>
 *         <li>θ(t_j) in {@code thetaVals} (as {@code double}; matches the
 *             Python script, which also casts θ to a float for storage),</li>
 *         <li>ζ(½ + i t_j) in {@code zetaVals},</li>
 *         <li>A(t_j) = ζ(½ + i t_j) · √θ'(t_j) in {@code ampVals}.</li>
 *       </ul>
 *       Each task instantiates its own {@link Context} containing a Real
 *       variable {@code t}, compiles three expressions through the expression
 *       compiler — θ(t), ζ(½+ⅈt), and ζ(½+ⅈt)·√(diff(ϑ(t),t)) — evaluates all
 *       three at t_j at {@link #BITS} bits, and writes into disjoint array
 *       slots.</li>
 *
 *   <li><b>Spectral density c(ω).</b> With OMEGAS[k] = OMEGA_LO + k · D_OMEGA
 *       for k = 0..N_OMEGA−1 (endpoint-exclusive, matching
 *       {@code numpy.linspace(-3, 3, 2560, endpoint=False)}), and
 *       D_OMEGA = (OMEGA_HI − OMEGA_LO)/N_OMEGA, compute
 *       c(ω_k) = ∫_{T0}^{T_MAX} A(t) · exp(−i ω_k θ(t)) dt
 *       discretised by the trapezoidal rule on the same t-grid. The Python
 *       script also divides by 2π; that prefactor is intentionally dropped
 *       here — it is an overall constant, not a shape factor.</li>
 *
 *   <li><b>Reconstruction ζ_st(τ).</b> On the same θ(t_j) grid,
 *       ζ_st(τ_j) = Σ_k c(ω_k) · exp(+i ω_k τ_j) · D_OMEGA.</li>
 * </ol>
 *
 * <p>The three precomputed arrays feed two charts that reproduce the Python
 * figures:
 * <ul>
 *   <li><b>Figure 1</b> — comparison of Re ζ(½+iθ⁻¹(τ)) against Re ζ_st(τ)
 *       over τ corresponding to t ∈ [T0, T_DISPLAY_MAX], with every 10th
 *       sign-change root marked as a vertical guide line.</li>
 *   <li><b>Figure 2</b> — top panel: cumulative spectral measure
 *       Φ(ω) = Σ dΦ, Re and Im traces. Bottom panel: cumulative |dΦ|² versus
 *       a straight-line shape (flat-density reference).</li>
 * </ul>
 *
 * <p><b>Exact-arithmetic rules.</b> All integrand-chain arithmetic goes
 * through arb's {@link Real}/{@link Complex} at {@link #BITS} = 128. θ(t_j)
 * is stored as {@code double} because (a) it is only used as the phase
 * argument inside exp(±i ω θ) and as a chart x-coordinate, and (b) the
 * reference script does the same. The amplitude, true ζ, density, and
 * reconstruction all remain at 128-bit precision end-to-end;
 * {@code doubleValue()} is called only at the final chart-dataset
 * assembly step.
 *
 * <p><b>TODOs.</b>
 * <ul>
 *   <li>The theoretical power curve in the bottom panel of Figure 2 is a
 *       cumulative-sum shape match (straight line from 0 to the final
 *       empirical power) rather than a closed-form analytic expression for
 *       the expected spectral power under a flat density. Derive the analytic
 *       form.</li>
 *   <li>The 1/(2π) prefactor that appears in the Python definition of c(ω)
 *       is omitted here by design.</li>
 * </ul>
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ZetaSpectralReconstruction extends
                                        Application
{
  public static final double T0            = 6.289835988;
  /**
   * Upper limit of the integration window in t. Mutable because the
   * time-sweep animation driver overrides it on a per-frame basis via the
   * {@code --T_MAX=<value>} command line parameter so a single JVM
   * invocation renders one frame at one T_MAX. Default matches the
   * reference Python script.
   */
  public static       double T_MAX         = 1000.0;
  public static final double T_DISPLAY_MAX = 100.0;
  /**
   * Number of samples on the dense t-grid. Mutable for the same reason as
   * {@link #T_MAX}: the animation driver scales N_T proportionally to
   * T_MAX so that the timestep dt stays fixed across frames.
   */
  public static       int    N_T           = 80000;
  public static final int    N_OMEGA       = 20480;
  public static final double OMEGA_LO      = -3.0;
  public static final double OMEGA_HI      = +1.0;
  public static final int    BITS          = 128;

  /**
   * Timestep on the t-grid. Not {@code final}: {@link #recomputeDerived()}
   * rewrites it after any runtime override of {@link #T_MAX} or
   * {@link #N_T}.
   */
  public static       double DT            = (T_MAX - T0) / (N_T - 1);
  public static final double D_OMEGA       = (OMEGA_HI - OMEGA_LO) / N_OMEGA;

  /**
   * Recompute quantities derived from {@link #T_MAX} and {@link #N_T}.
   * Called from {@link #processParameters()} after parsing command-line
   * overrides so that every subsequent reference to {@link #DT} sees the
   * updated timestep.
   */
  static void recomputeDerived()
  {
    DT = (T_MAX - T0) / (N_T - 1);
  }

  /**
   * Band of support for the spectral density c(ω). Outside [OMEGA_BAND_LO,
   * OMEGA_BAND_HI] the density decays to zero as T → ∞; restricting the
   * inverse-Fourier reconstruction integral to this interval removes the
   * residual off-band noise that is still present at finite T.
   */
  public static final double OMEGA_BAND_LO = -2.0;
  public static final double OMEGA_BAND_HI = 0.0;
  public static final int    K_LO          = (int) Math.ceil((OMEGA_BAND_LO - OMEGA_LO) / D_OMEGA);
  public static final int    K_HI          = (int) Math.floor((OMEGA_BAND_HI - OMEGA_LO) / D_OMEGA);

  /**
   * Index of the ω = 0 sample in the OMEGAS grid. Under OMEGA_LO = −3 and
   * N_OMEGA chosen so that (OMEGA_HI − OMEGA_LO)/N_OMEGA divides 3 evenly,
   * this is an integer: K0 = 3 / D_OMEGA = K_HI. Kept as its own named
   * constant because the pedestal term depends on density[K0], not on
   * density[K_HI] conceptually (they happen to coincide here).
   */
  public static final int    K_ZERO        = (int) Math.round((0.0 - OMEGA_LO) / D_OMEGA);

  private static final String AMP_EXPR   = "ζ(½+ⅈ*t)*√(diff(ϑ(t),t))";
  private static final String ZETA_EXPR  = "ζ(½+ⅈ*t)";
  private static final String THETA_EXPR = "ϑ(t)";

  private double[]  thetaVals;
  private Complex   ampVals;
  private Complex   zetaVals;
  private Complex   density;
  private Complex   zetaStRec;
  private Complex   zetaStRecNoPedestal; // ζ_st − (pedestal at ω = 0, evaluated at τ_j)
  private Complex   zetaStRecOpenBand;   // ζ_st summed only over k ∈ [K_LO+1, K_HI-1]

  private boolean   dark            = true;
  private boolean   light;
  private boolean   separateWindows = false;

  /**
   * When non-null, the program runs headless: it renders the three charts
   * into a single off-screen scene, writes a PNG to this path, and exits
   * without opening a window. Set by {@code --render=<path>}.
   */
  private String    renderPath      = null;

  /**
   * When positive, the program runs in sweep-driver mode: it spawns child
   * JVMs to render {@code sweepFrames} frames at geometrically spaced
   * {@link #T_MAX} values from {@link #sweepTMin} to {@link #sweepTMax},
   * writing PNG frames into {@link #sweepDir}. Child JVMs invoke the same
   * class with {@code --render=...} and {@code --T_MAX=...}. After all
   * frames exist on disk, the driver invokes ffmpeg via ProcessBuilder
   * to stitch them into animation.mp4 at {@link #sweepFps} fps.
   */
  private int       sweepFrames     = 0;
  private double    sweepTMin       = 1000.0;
  private double    sweepTMax       = 10000.0;
  private int       sweepFps        = 10;
  private String    sweepDir        = null;
  private int       sweepParallel   = Runtime.getRuntime().availableProcessors();

  private XYChart   comparisonChart;
  private XYChart   ratioChart;
  private XYChart   phiChart;
  private XYChart   powerChart;
  private StackPane comparisonPane;

  /**
   * Thread-safe single-line console progress meter. Every call to
   * {@link #tick()} advances an atomic counter; a refresh is emitted only when
   * at least {@value #REFRESH_MILLIS} ms have elapsed since the previous
   * refresh, guarded by a lock so the stdout line is never interleaved. On
   * {@link #finish()} the final state (100%) is written followed by a newline.
   *
   * Output format:
   *   \r[label] [###########.........] 55.3% 442500/800000 eta 00:03:21
   */
  private static final class ProgressMeter
  {
    private static final int         BAR_WIDTH      = 40;
    private static final long        REFRESH_MILLIS = 100L;

    private final String             label;
    private final int                total;
    private final long               startMillis;
    private final java.util.concurrent.atomic.AtomicInteger done =
                                     new java.util.concurrent.atomic.AtomicInteger();
    private final java.util.concurrent.atomic.AtomicLong    lastRefreshMillis =
                                     new java.util.concurrent.atomic.AtomicLong();
    private final Object             refreshLock    = new Object();

    ProgressMeter(String label, int total)
    {
      this.label       = label;
      this.total       = total;
      this.startMillis = System.currentTimeMillis();
      this.lastRefreshMillis.set(0L);
    }

    void tick()
    {
      int  d   = done.incrementAndGet();
      long now = System.currentTimeMillis();
      long prev = lastRefreshMillis.get();
      if (d < total && now - prev < REFRESH_MILLIS)
      {
        return;
      }
      if (!lastRefreshMillis.compareAndSet(prev, now))
      {
        return;
      }
      render(d, now);
    }

    void finish()
    {
      synchronized (refreshLock)
      {
        render(total, System.currentTimeMillis());
        System.out.println();
        System.out.flush();
      }
    }

    private void render(int d, long now)
    {
      synchronized (refreshLock)
      {
        double frac       = total == 0 ? 1.0 : (double) d / (double) total;
        if (frac > 1.0)       frac = 1.0;
        int    filled     = (int) Math.round(frac * BAR_WIDTH);
        StringBuilder bar = new StringBuilder(BAR_WIDTH + 2);
        bar.append('[');
        for (int i = 0; i < BAR_WIDTH; i++)
        {
          bar.append(i < filled ? '#' : '.');
        }
        bar.append(']');

        long elapsedMillis = now - startMillis;
        long etaMillis     = d > 0 && d < total
                             ? (long) (elapsedMillis * ((double) (total - d) / d))
                             : 0L;
        String etaStr      = formatHms(etaMillis);
        String elapsedStr  = formatHms(elapsedMillis);

        System.out.printf("\r[%s] %s %5.1f%% %d/%d elapsed %s eta %s   ",
                          label,
                          bar.toString(),
                          frac * 100.0,
                          d,
                          total,
                          elapsedStr,
                          etaStr);
        System.out.flush();
      }
    }

    private static String formatHms(long millis)
    {
      long total   = millis / 1000L;
      long hours   = total / 3600L;
      long minutes = (total % 3600L) / 60L;
      long seconds = total % 60L;
      return String.format("%02d:%02d:%02d", hours, minutes, seconds);
    }
  }

  /**
   * Phase 1. Precompute θ(t_j), ζ(½+ⅈt_j), and A(t_j) on the dense t-grid,
   * in parallel across the common ForkJoinPool. Each task owns its own
   * {@link Context} and compiled expressions.
   */
  void precomputeTGrid()
  {
    System.out.printf("[pre] building dense t-grid [%g, %g] with N_T=%d, dt=%.6g%n", T0, T_MAX, N_T, DT);
    long            t0    = System.currentTimeMillis();
    ProgressMeter   meter = new ProgressMeter("pre", N_T);

    thetaVals = new double[N_T];
    ampVals   = Complex.newVector(N_T);
    zetaVals  = Complex.newVector(N_T);

    IntStream.range(0, N_T).parallel().forEach(j ->
    {
      double  tj   = T0 + j * DT;
      Real    tVar = Real.named("t");
      Context ctx  = new Context(tVar);

      RealToComplexFunction ampF   = RealToComplexFunction.express(AMP_EXPR, ctx);
      RealToComplexFunction zetaF  = RealToComplexFunction.express(ZETA_EXPR, ctx);
      RealFunction          thetaF = RealFunction.express(THETA_EXPR, ctx);

      try ( Real    t     = new Real().set(tj);
            Complex amp   = new Complex();
            Complex zeta  = new Complex();
            Real    theta = new Real())
      {
        tVar.set(t);

        ampF.evaluate(tVar, 1, BITS, amp);
        zetaF.evaluate(tVar, 1, BITS, zeta);
        thetaF.evaluate(tVar, 1, BITS, theta);

        ampVals.get(j).set(amp);
        zetaVals.get(j).set(zeta);
        thetaVals[j] = theta.doubleValue();
      }
      meter.tick();
    });

    meter.finish();
    System.out.printf("[pre] done in %.2fs%n", (System.currentTimeMillis() - t0) / 1000.0);
  }

  /**
   * Phase 2. Spectral density c(ω_k) by the trapezoidal rule on the
   * precomputed t-grid. The k-loop is parallel; each task owns its own
   * accumulator and scratch {@link Complex}/{@link Real} instances.
   */
  void computeSpectralDensity()
  {
    System.out.printf("[density] computing for N_OMEGA=%d%n", N_OMEGA);
    long          t0    = System.currentTimeMillis();
    ProgressMeter meter = new ProgressMeter("density", N_OMEGA);

    density = Complex.newVector(N_OMEGA);

    IntStream.range(0, N_OMEGA).parallel().forEach(k ->
    {
      double omegaK = OMEGA_LO + k * D_OMEGA;

      try ( Complex sum    = new Complex();
            Complex phase  = new Complex();
            Complex argPhi = new Complex();
            Complex term   = new Complex();
            Real    dtReal = new Real().set(DT))
      {
        sum.set(0, 0);
        for (int j = 0; j < N_T; j++)
        {
          // argPhi = 0 + i · (−ω_k · θ(t_j))
          argPhi.set(0.0, -omegaK * thetaVals[j]);
          argPhi.exp(BITS, phase);

          // term = A(t_j) · exp(−i ω_k θ(t_j))
          ampVals.get(j).mul(phase, BITS, term);

          // trapezoidal endpoint weights
          if (j == 0 || j == N_T - 1)
          {
            term.mul2e(-1, term); // term /= 2
          }
          sum.add(term, BITS, sum);
        }

        // multiply by dt; drop the 1/(2π) prefactor by design
        sum.mul(dtReal, BITS, density.get(k));
      }
      meter.tick();
    });

    meter.finish();
    System.out.printf("[density] done in %.2fs%n", (System.currentTimeMillis() - t0) / 1000.0);
  }

  /**
   * Phase 3. Inverse-Fourier reconstruction of ζ_st(τ_j) for every j in the
   * precomputed τ = θ(t) grid. Computes three closely related signals in a
   * single pass over k ∈ [K_LO, K_HI], the band of support for the
   * conjectured spectral density:
   *
   * <ul>
   *   <li><b>{@link #zetaStRec}</b> — closed-band reconstruction,
   *       summed over k ∈ [K_LO, K_HI] inclusive (includes both endpoints,
   *       which carry large mass at ω = −2 and ω = 0).</li>
   *   <li><b>{@link #zetaStRecOpenBand}</b> — open-band reconstruction,
   *       summed over k ∈ (K_LO, K_HI), i.e. the same sum with both
   *       endpoint contributions subtracted. Diagnoses whether the
   *       non-negativity of ζ_st on the displayed window is driven by the
   *       endpoint mass.</li>
   *   <li><b>{@link #zetaStRecNoPedestal}</b> — closed-band reconstruction
   *       with the ω = 0 endpoint contribution subtracted. At ω = 0 the
   *       exponential {@code exp(i·0·τ)} is 1, so this endpoint contributes
   *       a constant (the "pedestal") to ζ_st equal to
   *       {@code density[K_ZERO] · D_OMEGA}. Removing it isolates the
   *       oscillatory carrier-and-interior part.</li>
   * </ul>
   *
   * Parallel over j.
   */
  void reconstructZetaSt()
  {
    System.out.printf("[rec] reconstructing stationary zeta (closed / open-band / pedestal-removed) on %d points...%n", N_T);
    long          t0    = System.currentTimeMillis();
    ProgressMeter meter = new ProgressMeter("rec", N_T);

    zetaStRec           = Complex.newVector(N_T);
    zetaStRecOpenBand   = Complex.newVector(N_T);
    zetaStRecNoPedestal = Complex.newVector(N_T);

    IntStream.range(0, N_T).parallel().forEach(j ->
    {
      double tauJ = thetaVals[j];

      try ( Complex sum         = new Complex();
            Complex endpointLo  = new Complex();
            Complex endpointHi  = new Complex();
            Complex pedestal    = new Complex();
            Complex phase       = new Complex();
            Complex argPhi      = new Complex();
            Complex term        = new Complex();
            Complex scratch     = new Complex();
            Real    dOmegaR     = new Real().set(D_OMEGA))
      {
        sum.set(0, 0);

        // Closed-band sum over k ∈ [K_LO, K_HI].
        for (int k = K_LO; k <= K_HI; k++)
        {
          double omegaK = OMEGA_LO + k * D_OMEGA;

          // argPhi = 0 + i · (+ω_k · τ_j)
          argPhi.set(0.0, omegaK * tauJ);
          argPhi.exp(BITS, phase);

          density.get(k).mul(phase, BITS, term);
          sum.add(term, BITS, sum);

          // Snapshot the two band-endpoint contributions.
          if (k == K_LO)
          {
            endpointLo.set(term);
          }
          if (k == K_HI)
          {
            endpointHi.set(term);
          }
          // The pedestal term is the contribution at ω = 0; K_ZERO coincides
          // with K_HI under the current grid, so reuse that evaluation.
          if (k == K_ZERO)
          {
            pedestal.set(term);
          }
        }

        // Closed-band reconstruction: Σ · dω.
        sum.mul(dOmegaR, BITS, zetaStRec.get(j));

        // Open-band reconstruction: subtract both endpoint terms before
        // multiplying by dω.
        sum.sub(endpointLo, BITS, scratch);
        scratch.sub(endpointHi, BITS, scratch);
        scratch.mul(dOmegaR, BITS, zetaStRecOpenBand.get(j));

        // Pedestal-removed reconstruction: subtract just the ω = 0 term.
        sum.sub(pedestal, BITS, scratch);
        scratch.mul(dOmegaR, BITS, zetaStRecNoPedestal.get(j));
      }
      meter.tick();
    });

    meter.finish();
    System.out.printf("[rec] done in %.2fs%n", (System.currentTimeMillis() - t0) / 1000.0);
  }

  /**
   * Linear-interpolation sign-change root finder. For each index i where
   * sign(y[i]) != sign(y[i+1]) and y[i] != y[i+1], returns the abscissa of
   * the interpolated zero. Mirrors the Python reference
   * {@code find_sign_change_roots}.
   */
  /**
   * Build a single {@link DoubleDataSet} encoding all vertical root markers
   * for one series. For each root r, the point pair (r, yLo), (r, yHi) is
   * appended; between successive roots a (NaN, NaN) point is inserted so the
   * polyline renderer breaks the stroke and does not draw a horizontal line
   * joining one vertical marker to the next.
   */
  static DoubleDataSet newRootMarkerDataSet(String label, double[] roots, double yLo, double yHi, String color)
  {
    int n = roots.length;
    double[] xs = new double[n * 3];
    double[] ys = new double[n * 3];
    for (int i = 0; i < n; i++)
    {
      xs[3 * i]     = roots[i];
      ys[3 * i]     = yLo;
      xs[3 * i + 1] = roots[i];
      ys[3 * i + 1] = yHi;
      xs[3 * i + 2] = Double.NaN;
      ys[3 * i + 2] = Double.NaN;
    }
    DoubleDataSet ds = new DoubleDataSet(label).set(xs, ys);
    ds.setStyle(DataSetStyleBuilder.instance()
                                    .setLineColor(color)
                                    .setMarkerColor(color)
                                    .setLineWidth(0.6)
                                    .build());
    return ds;
  }

  static double[] findSignChangeRoots(double[] x, double[] y)
  {
    List<Double> roots = new ArrayList<>();
    for (int i = 0; i < y.length - 1; i++)
    {
      double y0 = y[i];
      double y1 = y[i + 1];
      double s0 = Math.signum(y0);
      double s1 = Math.signum(y1);
      if (s0 != s1 && y0 != y1)
      {
        double x0 = x[i];
        double x1 = x[i + 1];
        roots.add(x0 - y0 * (x1 - x0) / (y1 - y0));
      }
    }
    double[] out = new double[roots.size()];
    for (int i = 0; i < out.length; i++)
    {
      out[i] = roots.get(i);
    }
    return out;
  }

  /**
   * Build the set of LaTeX ImageViews that annotate the comparison chart with
   * the closed-band decomposition
   *
   * ζ_st(τ) = pedestal + carrier_{ω = -2} + interior
   *
   * where each term is the explicit Riemann-sum contribution at that location
   * in the band [-2, 0]. The formulas are written as a single multi-line
   * align block so the three components share a common baseline and the
   * definitions of pedestal, carrier, and interior are grouped next to the
   * equation that uses them.
   */
  static VBox buildLatexAnnotations()
  {
    String[] formulas = {
      "\\zeta_{st}(\\tau) \\;=\\; \\mathrm{pedestal} + \\mathrm{carrier} + \\mathrm{interior}",
      "\\mathrm{pedestal} \\;=\\; \\operatorname{Re}\\bigl[c(0)\\,d\\omega\\bigr] \\quad (\\omega = 0 \\text{ endpoint, DC offset})",
      "\\mathrm{carrier} \\;=\\; \\operatorname{Re}\\bigl[c(-2)\\,e^{-2\\,i\\tau}\\,d\\omega\\bigr] \\quad (\\omega = -2 \\text{ endpoint, oscillatory})",
      "\\mathrm{interior} \\;=\\; \\sum_{k = K_{LO}+1}^{K_{HI}-1} \\operatorname{Re}\\bigl[c(\\omega_k)\\,e^{i\\omega_k\\tau}\\bigr]\\,d\\omega \\quad (\\omega \\in (-2, 0) \\text{ open band})",
      "R(\\tau) \\;=\\; \\zeta\\!\\left(\\tfrac{1}{2}+i\\,\\theta^{-1}(\\tau)\\right) - \\zeta_{st}(\\tau) \\quad (\\text{off-band residual, complement of }[-2,0])"
    };
    VBox box = new VBox(2);
    box.setMouseTransparent(true);
    box.setPickOnBounds(false);
    box.setAlignment(Pos.TOP_LEFT);
    StackPane.setAlignment(box, Pos.TOP_LEFT);
    for (String formula : formulas)
    {
      ImageView iv = new ImageView(SwingFXUtils.toFXImage(Utensils.renderLatexFormulaAsBufferedImage(formula, 18), null));
      iv.setMouseTransparent(true);
      iv.setPickOnBounds(false);
      box.getChildren().add(iv);
    }
    return box;
  }

  XYChart newComparisonChart()
  {
    // Mask: t_j ∈ [T0, T_DISPLAY_MAX]
    int displayCount = 0;
    for (int j = 0; j < N_T; j++)
    {
      double tj = T0 + j * DT;
      if (tj >= T0 && tj <= T_DISPLAY_MAX)
      {
        displayCount++;
      }
      else if (tj > T_DISPLAY_MAX)
      {
        break;
      }
    }

    double[] tauPlot            = new double[displayCount];
    double[] zTruePlot          = new double[displayCount];
    double[] zStPlot            = new double[displayCount];
    double[] zStOpenBandPlot    = new double[displayCount];
    double[] zStNoPedestalPlot  = new double[displayCount];
    double[] pedestalPlot       = new double[displayCount];
    double[] residualPlot       = new double[displayCount];

    // The pedestal is a constant: density[K_ZERO] · D_OMEGA, independent of τ.
    double pedestalRe;
    try ( Complex pedestalC = new Complex();
          Real    dOmegaR   = new Real().set(D_OMEGA))
    {
      density.get(K_ZERO).mul(dOmegaR, BITS, pedestalC);
      pedestalRe = pedestalC.re().doubleValue();
    }

    int w = 0;
    for (int j = 0; j < N_T && w < displayCount; j++)
    {
      double tj = T0 + j * DT;
      if (tj >= T0 && tj <= T_DISPLAY_MAX)
      {
        tauPlot[w]            = thetaVals[j];
        zTruePlot[w]          = zetaVals.get(j).re().doubleValue();
        zStPlot[w]            = zetaStRec.get(j).re().doubleValue();
        zStOpenBandPlot[w]    = zetaStRecOpenBand.get(j).re().doubleValue();
        zStNoPedestalPlot[w]  = zetaStRecNoPedestal.get(j).re().doubleValue();
        pedestalPlot[w]       = pedestalRe;
        // Off-band residual R(τ) = ζ(1/2 + i θ⁻¹(τ)) − ζ_st(τ). This is the
        // signal content that lives in the complement of the reconstruction
        // band [-2, 0]: what the band-limited reconstruction discards.
        residualPlot[w]       = zTruePlot[w] - zStPlot[w];
        w++;
      }
    }

    double[] rootsTrue = findSignChangeRoots(tauPlot, zTruePlot);
    double[] rootsSt   = findSignChangeRoots(tauPlot, zStPlot);

    XYChart chart = new XYChart(new DefaultNumericAxis("τ",
                                                       ""),
                                new DefaultNumericAxis("Re",
                                                       ""));
    chart.setTitle(String.format("High-Resolution Comparison: True Zeta vs Stationary Spectral Process — "
                               + "t ∈ [%.6f, %.1f] displayed, integrated over t ∈ [%.6f, %.1f]",
                                 T0, T_DISPLAY_MAX, T0, T_MAX));

    DoubleDataSet trueDs        = new DoubleDataSet("Re ζ(1/2 + i θ⁻¹(τ))  [nonstationary ∘ θ⁻¹]").set(tauPlot, zTruePlot);
    DoubleDataSet stDs          = new DoubleDataSet("Re ζ_st(τ)  [closed-band reconstruction, ω ∈ [-2, 0]]").set(tauPlot, zStPlot);
    DoubleDataSet stOpenBandDs  = new DoubleDataSet("Re ζ_st(τ)  [open-band reconstruction, ω ∈ (-2, 0)]").set(tauPlot, zStOpenBandPlot);
    DoubleDataSet stNoPedDs     = new DoubleDataSet("Re ζ_st(τ) − pedestal  [carrier + interior]").set(tauPlot, zStNoPedestalPlot);
    DoubleDataSet pedestalDs    = new DoubleDataSet("Pedestal = Re[c(0) · dω]  [ω = 0 endpoint DC]").set(tauPlot, pedestalPlot);
    DoubleDataSet residualDs    = new DoubleDataSet("Re R(τ) = Re ζ − Re ζ_st  [off-band residual, complement of [-2, 0]]").set(tauPlot, residualPlot);

    stDs.setStyle(DataSetStyleBuilder.instance().setLineColor("cornflowerblue").setMarkerColor("cornflowerblue").setLineWidth(1.2).setLineDashes(6.0, 6.0).build());
    stOpenBandDs.setStyle(DataSetStyleBuilder.instance().setLineColor("darkgreen").setMarkerColor("darkgreen").setLineWidth(1.0).build());
    stNoPedDs.setStyle(DataSetStyleBuilder.instance().setLineColor("purple").setMarkerColor("purple").setLineWidth(1.0).build());
    pedestalDs.setStyle(DataSetStyleBuilder.instance().setLineColor("gray").setMarkerColor("gray").setLineWidth(1.0).setLineDashes(2.0, 4.0).build());
    residualDs.setStyle(DataSetStyleBuilder.instance().setLineColor("firebrick").setMarkerColor("firebrick").setLineWidth(0.8).build());

    chart.getDatasets().addAll(trueDs, stDs, stOpenBandDs, stNoPedDs, pedestalDs, residualDs);

    // Vertical root markers — every sign-change root of each series, all of
    // them, collapsed into a single {@link DoubleDataSet} per series so only
    // one legend entry appears. Each root is two consecutive points
    // (r, yLo) and (r, yHi); between successive roots a (NaN, NaN) pair
    // breaks the polyline so the two vertical strokes are not joined by a
    // diagonal line across the chart. These are attached to a dedicated
    // {@link ErrorDataSetRenderer} with {@code setAllowNaNs(true)} so the
    // NaN separator is honored as a stroke break; the default renderer does
    // not respect NaN and draws diagonal lines across the chart.
    double yLo = -6.0;
    double yHi = 6.0;
    DoubleDataSet trueRootsDs = newRootMarkerDataSet("zTrue roots", rootsTrue, yLo, yHi, "red");
    DoubleDataSet stRootsDs   = newRootMarkerDataSet("zSt roots",   rootsSt,   yLo, yHi, "orange");

    ErrorDataSetRenderer mainRenderer = new ErrorDataSetRenderer();
    mainRenderer.setPolyLineStyle(LineStyle.NORMAL);
    mainRenderer.setErrorStyle(ErrorStyle.NONE);
    mainRenderer.setDrawMarker(false);
    mainRenderer.setDrawBubbles(false);
    mainRenderer.getDatasets().addAll(trueDs, stDs, stOpenBandDs, stNoPedDs, pedestalDs, residualDs);

    ErrorDataSetRenderer rootRenderer = new ErrorDataSetRenderer();
    rootRenderer.setPolyLineStyle(LineStyle.NORMAL);
    rootRenderer.setErrorStyle(ErrorStyle.NONE);
    rootRenderer.setDrawMarker(false);
    rootRenderer.setDrawBubbles(false);
    rootRenderer.setAllowNaNs(true);
    rootRenderer.getDatasets().addAll(trueRootsDs, stRootsDs);

    chart.getRenderers().setAll(mainRenderer, rootRenderer);

    return chart;
  }

  /**
   * Build a scatter renderer for the Φ(ω) and power traces: small markers,
   * no connecting polyline. With N_OMEGA = 2560 samples and the Python
   * reference drawn at {@code lw=0, markersize≈1}, this is the rendering
   * that resolves the fine oscillatory detail without the polyline smoothing
   * the rapid sign changes at adjacent ω samples.
   */
  static ErrorDataSetRenderer newScatterRenderer()
  {
    ErrorDataSetRenderer r = new ErrorDataSetRenderer();
    r.setPolyLineStyle(LineStyle.NONE);
    r.setErrorStyle(ErrorStyle.NONE);
    r.setDrawMarker(true);
    r.setDrawBubbles(false);
    return r;
  }

  /**
   * Build the two panels of Figure 2 — cumulative Φ(ω) and cumulative |dΦ|²
   * versus a straight-line theoretical shape. Stored into
   * {@link #phiChart} and {@link #powerChart}.
   */

  void buildSpectralMeasureCharts()
  {
    // dΦ_k = density[k] · D_OMEGA, accumulate Φ in arb precision.
    double[] omegas    = new double[N_OMEGA];
    double[] phiRe     = new double[N_OMEGA];
    double[] phiIm     = new double[N_OMEGA];
    double[] power     = new double[N_OMEGA];

    try ( Complex phi     = new Complex();
          Complex dPhi    = new Complex();
          Real    dOmegaR = new Real().set(D_OMEGA);
          Real    absDPhi = new Real();
          Real    sqr     = new Real();
          Real    acc     = new Real())
    {
      phi.set(0, 0);
      acc.set(0.0);

      for (int k = 0; k < N_OMEGA; k++)
      {
        omegas[k] = OMEGA_LO + k * D_OMEGA;

        density.get(k).mul(dOmegaR, BITS, dPhi);
        phi.add(dPhi, BITS, phi);

        phiRe[k] = phi.re().doubleValue();
        phiIm[k] = phi.im().doubleValue();

        dPhi.abs(BITS, absDPhi);
        absDPhi.mul(absDPhi, BITS, sqr);
        acc.add(sqr, BITS, acc);
        power[k] = acc.doubleValue();
      }
    }

    // Theoretical flat-density power curve under the conjecture that the
    // spectral density c(ω) is identically zero outside [-2, 0] and (for
    // visual comparison) constant on [-2, 0]. The ramp is anchored to the
    // empirical plateau levels: power[0] on the left (where the empirical
    // cumulative curve enters the window from ω = OMEGA_LO) and
    // power[N_OMEGA − 1] on the right (where it has finished accumulating
    // and sits flat). The theoretical curve is flat at power[0] for ω ≤ -2,
    // rises linearly to power[N_OMEGA − 1] across [-2, 0], and is flat at
    // power[N_OMEGA − 1] for ω ≥ 0, so the dashed line connects to the
    // empirical plateau on both sides and the two endpoints agree with
    // what the black trace does past the band edges.
    double   powerLeft   = power[0];
    double   powerRight  = power[N_OMEGA - 1];
    double   bandSpan    = powerRight - powerLeft;
    int      bandCount   = K_HI - K_LO + 1;
    double[] theoryPower = new double[N_OMEGA];
    double[] deltaPower  = new double[N_OMEGA];
    for (int k = 0; k < N_OMEGA; k++)
    {
      if (k < K_LO)
      {
        theoryPower[k] = powerLeft;
      }
      else if (k > K_HI)
      {
        theoryPower[k] = powerRight;
      }
      else
      {
        theoryPower[k] = powerLeft + bandSpan * (k - K_LO) / (double) (bandCount - 1);
      }
      // Complement-of-band cumulative deficit: how much empirical cumulative
      // |dΦ|² mass differs from the flat-density prediction at each ω. On
      // the band edges the two curves are anchored to meet, so delta is zero
      // at ω = -2 and ω = 0 by construction; outside the band it measures
      // the off-band mass the conjecture predicts should vanish as T → ∞.
      deltaPower[k] = power[k] - theoryPower[k];
    }

    // Scatter style for the empirical traces: small filled circles, no line.
    // The theoretical-shape trace stays a dashed line so it is visually
    // distinct from the empirical point cloud.
    String scatterBlack = DataSetStyleBuilder.instance()
                                              .setLineColor("black")
                                              .setMarkerColor("black")
                                              .setMarkerType("circle")
                                              .setMarkerSize(1.5)
                                              .build();
    String scatterBlue  = DataSetStyleBuilder.instance()
                                              .setLineColor("cornflowerblue")
                                              .setMarkerColor("cornflowerblue")
                                              .setMarkerType("circle")
                                              .setMarkerSize(1.5)
                                              .build();
    String dashRed      = DataSetStyleBuilder.instance()
                                              .setLineColor("red")
                                              .setMarkerColor("red")
                                              .setLineWidth(1.5)
                                              .setLineDashes(6.0, 6.0)
                                              .build();

    phiChart = new XYChart(new DefaultNumericAxis("ω",
                                                  ""),
                           new DefaultNumericAxis("Φ(ω)",
                                                  ""));
    phiChart.setTitle(String.format("Cumulative Spectral Measure Φ(ω) = ∫ dΦ — "
                                  + "integrated over t ∈ [%.6f, %.1f]",
                                    T0, T_MAX));
    DoubleDataSet reDs = new DoubleDataSet("Re Φ(ω)").set(omegas, phiRe);
    DoubleDataSet imDs = new DoubleDataSet("Im Φ(ω)").set(omegas, phiIm);
    reDs.setStyle(scatterBlack);
    imDs.setStyle(scatterBlue);
    ErrorDataSetRenderer phiRenderer = newScatterRenderer();
    phiRenderer.getDatasets().addAll(reDs, imDs);
    phiChart.getRenderers().setAll(phiRenderer);
    phiChart.getXAxis().setAutoRanging(false);
    phiChart.getXAxis().setMin(OMEGA_LO);
    phiChart.getXAxis().setMax(OMEGA_HI);

    powerChart = new XYChart(new DefaultNumericAxis("ω",
                                                    ""),
                             new DefaultNumericAxis("Power",
                                                    ""));
    powerChart.setTitle(String.format("Spectral Distribution Function — "
                                    + "integrated over t ∈ [%.6f, %.1f]",
                                      T0, T_MAX));
    String scatterMagenta = DataSetStyleBuilder.instance()
                                                .setLineColor("magenta")
                                                .setMarkerColor("magenta")
                                                .setMarkerType("circle")
                                                .setMarkerSize(1.5)
                                                .build();

    DoubleDataSet empDs    = new DoubleDataSet("Empirical: cumulative sum of |dΦ|²").set(omegas, power);
    DoubleDataSet theoryDs = new DoubleDataSet("Theoretical shape (flat spectral density on [-2, 0], anchored to empirical plateaus)").set(omegas, theoryPower);
    DoubleDataSet deltaDs  = new DoubleDataSet("Off-band cumulative deficit Δ(ω) = empirical − theoretical").set(omegas, deltaPower);
    empDs.setStyle(scatterBlack);
    theoryDs.setStyle(dashRed);
    deltaDs.setStyle(scatterMagenta);
    // Empirical and off-band deficit rendered as scatter, theoretical
    // rendered as a dashed line — two renderers on the same chart because
    // the point-style and line-style datasets need different rendering.
    ErrorDataSetRenderer powerScatter = newScatterRenderer();
    powerScatter.getDatasets().addAll(empDs, deltaDs);
    ErrorDataSetRenderer powerLine    = new ErrorDataSetRenderer();
    powerLine.setPolyLineStyle(LineStyle.NORMAL);
    powerLine.setErrorStyle(ErrorStyle.NONE);
    powerLine.setDrawMarker(false);
    powerLine.setDrawBubbles(false);
    powerLine.getDatasets().add(theoryDs);
    powerChart.getRenderers().setAll(powerScatter, powerLine);
    powerChart.getXAxis().setAutoRanging(false);
    powerChart.getXAxis().setMin(OMEGA_LO);
    powerChart.getXAxis().setMax(OMEGA_HI);
  }

  void configureCharts()
  {
    Stream.of(comparisonChart, phiChart, powerChart).forEach(chart -> Charts.configureChart(chart, light));
  }

  protected void processParameters()
  {
    List<String>        params = getParameters().getUnnamed();
    Map<String, String> named  = getParameters().getNamed();
    separateWindows = params.stream().anyMatch(param -> param.contains("separate") || param.contains("individual") || param.contains("sep"));
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
    if (named != null && !named.isEmpty())
    {
      if (named.containsKey("T_MAX"))
      {
        T_MAX = Double.parseDouble(named.get("T_MAX"));
      }
      if (named.containsKey("N_T"))
      {
        N_T = Integer.parseInt(named.get("N_T"));
      }
      if (named.containsKey("render"))
      {
        renderPath = named.get("render");
      }
      recomputeDerived();
      System.out.printf("[params] T_MAX=%g, N_T=%d, DT=%.6g, render=%s%n", T_MAX, N_T, DT, renderPath);
    }
  }

  protected void initializeWindowContainingAllCharts(Stage stage)
  {
    GridPane gridPane = new GridPane();
    gridPane.setHgap(10);
    gridPane.setVgap(10);

    RowConstraints r1 = new RowConstraints();
    r1.setPercentHeight(40);
    RowConstraints r2 = new RowConstraints();
    r2.setPercentHeight(30);
    RowConstraints r3 = new RowConstraints();
    r3.setPercentHeight(30);
    gridPane.getRowConstraints().addAll(r1, r2, r3);

    for (XYChart chart : new XYChart[]
    { comparisonChart, phiChart, powerChart })
    {
      chart.setPrefSize(10000, 10000);
      GridPane.setHgrow(chart, Priority.ALWAYS);
      GridPane.setVgrow(chart, Priority.ALWAYS);
    }
    comparisonPane.setPrefSize(10000, 10000);
    GridPane.setHgrow(comparisonPane, Priority.ALWAYS);
    GridPane.setVgrow(comparisonPane, Priority.ALWAYS);

    gridPane.add(comparisonPane, 0, 0);
    gridPane.add(phiChart, 0, 1);
    gridPane.add(powerChart, 0, 2);

    Scene scene = new Scene(gridPane);
    stage.setScene(scene);
    stage.setMaximized(true);
    stage.setTitle(getClass().getSimpleName());
    WindowManager.installEscapeKeyCloseHandler(stage);
    if (dark)
    {
      WindowManager.setMoreConduciveStyle(scene);
    }
  }

  protected void initializeChartsInTheirOwnWindows(Stage stage)
  {
    Stage[]    stages = new Stage[]
    { stage, new Stage(), new Stage() };
    javafx.scene.Parent[] roots = new javafx.scene.Parent[]
    { comparisonPane, phiChart, powerChart };
    String[]   titles = new String[]
    { comparisonChart.getTitle(), phiChart.getTitle(), powerChart.getTitle() };

    for (int i = 0; i < roots.length; i++)
    {
      Scene scene = new Scene(roots[i]);
      stages[i].setScene(scene);
      stages[i].setMaximized(true);
      stages[i].setTitle(titles[i]);
      WindowManager.installEscapeKeyCloseHandler(stages[i]);
      if (dark)
      {
        WindowManager.setMoreConduciveStyle(scene);
      }
    }
    Stream.of(stages).forEach(Stage::show);
  }

  @Override
  public void start(Stage stage)
  {
    processParameters();

    precomputeTGrid();
    computeSpectralDensity();
    reconstructZetaSt();

    comparisonChart = newComparisonChart();
    comparisonPane  = new StackPane();
    comparisonPane.getChildren().addAll(comparisonChart, buildLatexAnnotations());
    buildSpectralMeasureCharts();
    configureCharts();

    if (renderPath != null)
    {
      renderToPngAndExit(stage);
      return;
    }

    if (separateWindows)
    {
      initializeChartsInTheirOwnWindows(stage);
    }
    else
    {
      initializeWindowContainingAllCharts(stage);
      stage.show();
    }
  }

  /**
   * Render the three charts (comparison pane stacked above the phi and
   * power panels) into a single offscreen scene, snapshot it to a
   * {@link WritableImage}, convert to a {@link java.awt.image.BufferedImage},
   * and write a PNG at {@link #renderPath}. Exits the JavaFX application
   * when done. The scene is rendered at a fixed 1920 x 1080 size so every
   * frame in a sweep is pixel-compatible for ffmpeg stitching.
   */
  void renderToPngAndExit(Stage stage)
  {
    try
    {
      GridPane gridPane = new GridPane();
      gridPane.setHgap(10);
      gridPane.setVgap(10);
      RowConstraints r1 = new RowConstraints();
      r1.setPercentHeight(40);
      RowConstraints r2 = new RowConstraints();
      r2.setPercentHeight(30);
      RowConstraints r3 = new RowConstraints();
      r3.setPercentHeight(30);
      gridPane.getRowConstraints().addAll(r1, r2, r3);

      final int FRAME_W = 1920;
      final int FRAME_H = 1080;
      comparisonPane.setPrefSize(FRAME_W, FRAME_H * 40 / 100);
      phiChart.setPrefSize(FRAME_W, FRAME_H * 30 / 100);
      powerChart.setPrefSize(FRAME_W, FRAME_H * 30 / 100);
      GridPane.setHgrow(comparisonPane, Priority.ALWAYS);
      GridPane.setVgrow(comparisonPane, Priority.ALWAYS);
      GridPane.setHgrow(phiChart, Priority.ALWAYS);
      GridPane.setVgrow(phiChart, Priority.ALWAYS);
      GridPane.setHgrow(powerChart, Priority.ALWAYS);
      GridPane.setVgrow(powerChart, Priority.ALWAYS);
      gridPane.add(comparisonPane, 0, 0);
      gridPane.add(phiChart, 0, 1);
      gridPane.add(powerChart, 0, 2);
      gridPane.setPrefSize(FRAME_W, FRAME_H);

      Scene scene = new Scene(gridPane, FRAME_W, FRAME_H);
      stage.setScene(scene);
      if (dark)
      {
        WindowManager.setMoreConduciveStyle(scene);
      }

      // Stage must be shown and a layout pulse must run for chart-fx to
      // size axes and draw datasets; without this the snapshot is blank.
      // We set opacity to 0 and position offscreen, show briefly, snapshot,
      // then exit. This is the standard chart-fx offscreen-rendering trick
      // because the Canvas-backed renderers only paint in response to a
      // layout pass on a live scene.
      stage.setOpacity(0.0);
      stage.setX(-10000);
      stage.setY(-10000);
      stage.setWidth(FRAME_W);
      stage.setHeight(FRAME_H);
      stage.show();

      // Two pulses of layout/paint before snapshot so chart-fx has a chance
      // to fully render. A single runLater is not always enough.
      Platform.runLater(() -> Platform.runLater(() ->
      {
        try
        {
          SnapshotParameters sp = new SnapshotParameters();
          WritableImage img = scene.getRoot().snapshot(sp, null);
          java.awt.image.BufferedImage bi = SwingFXUtils.fromFXImage(img, null);
          File outFile = new File(renderPath);
          File parent = outFile.getParentFile();
          if (parent != null)
          {
            parent.mkdirs();
          }
          ImageIO.write(bi, "png", outFile);
          System.out.printf("[render] wrote %s (%d x %d)%n", renderPath, bi.getWidth(), bi.getHeight());
        }
        catch (IOException e)
        {
          System.err.println("[render] write failed: " + e);
          e.printStackTrace();
        }
        finally
        {
          Platform.exit();
        }
      }));
    }
    catch (Exception e)
    {
      System.err.println("[render] setup failed: " + e);
      e.printStackTrace();
      Platform.exit();
    }
  }

  /**
   * Sweep driver (runs in the invoking JVM, not inside start()): spawn
   * child JVMs with {@code --render=... --T_MAX=... --N_T=...} for each
   * of {@code frameCount} frames at geometrically spaced {@link #T_MAX}
   * values from {@code tMin} to {@code tMax}, writing PNG frames into
   * {@code outDir}. The driver keeps {@code maxParallel} child JVMs
   * running at once. Frames whose output PNG already exists on disk are
   * skipped, so a crashed driver can resume by being restarted. After
   * all frames exist, runs ffmpeg via ProcessBuilder to stitch them into
   * animation.mp4 at {@code fps} frames per second.
   *
   * The driver also starts an Xvfb virtual display so child JVMs have a
   * DISPLAY to render into; at end of sweep the Xvfb process is stopped.
   *
   * N_T is scaled proportionally to T_MAX so the timestep dt stays fixed
   * across frames. With T_MAX = 1000, N_T = 80000 gives dt approx 0.0124.
   * For T_MAX = X, N_T = round(80000 * X / 1000).
   */
  static void runSweep(int frameCount, double tMin, double tMax, String outDir, int maxParallel, int fps) throws Exception
  {
    Path dir = Paths.get(outDir);
    Files.createDirectories(dir);

    // Start Xvfb so child JVMs have a DISPLAY.
    int xvfbDisplay = 99;
    ProcessBuilder xvfbPb = new ProcessBuilder("Xvfb",
                                               ":" + xvfbDisplay,
                                               "-screen", "0", "1920x1080x24",
                                               "-nolisten", "tcp");
    xvfbPb.redirectError(new File(dir.toFile(), "xvfb.log"));
    xvfbPb.redirectOutput(new File(dir.toFile(), "xvfb.log"));
    Process xvfb = xvfbPb.start();
    Thread.sleep(500); // give Xvfb a beat to come up
    System.out.printf("[sweep] Xvfb started on :%d pid=%d%n", xvfbDisplay, xvfb.pid());

    try
    {
      String javaHome = System.getProperty("java.home");
      String javaBin  = javaHome + File.separator + "bin" + File.separator + "java";
      String classpath = System.getProperty("java.class.path");
      String mainClass = ZetaSpectralReconstruction.class.getName();

      ExecutorService pool = Executors.newFixedThreadPool(maxParallel);
      List<Future<?>> futures = new ArrayList<>();

      for (int i = 0; i < frameCount; i++)
      {
        final int frameIdx = i;
        final double tMaxI = tMin * Math.pow(tMax / tMin, (double) i / (frameCount - 1));
        final int    nTi   = (int) Math.round(80000.0 * tMaxI / 1000.0);
        final String frameName = String.format("frame_%04d_T_%08.2f.png", frameIdx, tMaxI);
        final Path   framePath = dir.resolve(frameName);

        futures.add(pool.submit(() ->
        {
          if (Files.exists(framePath) && Files.size(framePath) > 0)
          {
            System.out.printf("[sweep] frame %03d T_MAX=%.2f already exists, skipping%n", frameIdx, tMaxI);
            return null;
          }
          System.out.printf("[sweep] frame %03d T_MAX=%.2f N_T=%d starting%n", frameIdx, tMaxI, nTi);
          ProcessBuilder pb = new ProcessBuilder(javaBin,
                                                 "-cp", classpath,
                                                 "--enable-native-access=ALL-UNNAMED",
                                                 mainClass,
                                                 "--T_MAX=" + tMaxI,
                                                 "--N_T=" + nTi,
                                                 "--render=" + framePath.toString(),
                                                 "--light");
          pb.environment().put("DISPLAY", ":" + xvfbDisplay);
          pb.redirectError(new File(dir.toFile(), String.format("frame_%04d.log", frameIdx)));
          pb.redirectOutput(new File(dir.toFile(), String.format("frame_%04d.log", frameIdx)));
          Process p = pb.start();
          int rc = p.waitFor();
          if (rc != 0)
          {
            System.err.printf("[sweep] frame %03d exited rc=%d%n", frameIdx, rc);
          }
          else
          {
            System.out.printf("[sweep] frame %03d done%n", frameIdx);
          }
          return null;
        }));
      }

      pool.shutdown();
      pool.awaitTermination(24, TimeUnit.HOURS);
      for (Future<?> f : futures)
      {
        try { f.get(); } catch (Exception e) { System.err.println("[sweep] worker threw: " + e); }
      }

      // Stitch with ffmpeg.
      String pattern = dir.toString() + "/frame_%04d_T_*.png";
      // ffmpeg glob pattern requires -pattern_type glob:
      ProcessBuilder ff = new ProcessBuilder("ffmpeg",
                                             "-y",
                                             "-framerate", Integer.toString(fps),
                                             "-pattern_type", "glob",
                                             "-i", dir.toString() + "/frame_*.png",
                                             "-c:v", "libx264",
                                             "-pix_fmt", "yuv420p",
                                             "-vf", "scale=trunc(iw/2)*2:trunc(ih/2)*2",
                                             dir.toString() + "/animation.mp4");
      ff.redirectError(new File(dir.toFile(), "ffmpeg.log"));
      ff.redirectOutput(new File(dir.toFile(), "ffmpeg.log"));
      Process ffp = ff.start();
      int rc = ffp.waitFor();
      System.out.printf("[sweep] ffmpeg rc=%d, output=%s/animation.mp4%n", rc, dir);
    }
    finally
    {
      xvfb.destroy();
      xvfb.waitFor(5, TimeUnit.SECONDS);
    }
  }

  public static void main(String[] args) throws Exception
  {
    // Sweep mode is driven from main() directly because it spawns child
    // JVMs and must not call Application.launch. Args: --sweep=N,DIR,FPS
    for (String a : args)
    {
      if (a.startsWith("--sweep="))
      {
        String[] parts = a.substring("--sweep=".length()).split(",");
        int frameCount = Integer.parseInt(parts[0]);
        String outDir  = parts[1];
        int fps        = parts.length > 2 ? Integer.parseInt(parts[2]) : 10;
        double tMin    = parts.length > 3 ? Double.parseDouble(parts[3]) : 1000.0;
        double tMax    = parts.length > 4 ? Double.parseDouble(parts[4]) : 10000.0;
        int maxParallel = Runtime.getRuntime().availableProcessors();
        runSweep(frameCount, tMin, tMax, outDir, maxParallel, fps);
        return;
      }
    }
    launch(args);
  }
}
