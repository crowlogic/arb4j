package arb.applications;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.IntStream;
import java.util.stream.Stream;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.RealToComplexFunction;
import arb.functions.real.RealFunction;
import arb.stochastic.Charts;
import arb.viz.WindowManager;
import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.spi.DefaultNumericAxis;
import io.fair_acc.chartfx.renderer.ErrorStyle;
import io.fair_acc.chartfx.renderer.LineStyle;
import io.fair_acc.chartfx.renderer.spi.ErrorDataSetRenderer;
import io.fair_acc.dataset.spi.DoubleDataSet;
import io.fair_acc.dataset.utils.DataSetStyleBuilder;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Priority;
import javafx.scene.layout.RowConstraints;
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
  public static final double T_MAX         = 1000.0;
  public static final double T_DISPLAY_MAX = 100.0;
  public static final int    N_T           = 80000;
  public static final int    N_OMEGA       = 2560;
  public static final double OMEGA_LO      = -3.0;
  public static final double OMEGA_HI      = +3.0;
  public static final int    BITS          = 128;

  public static final double DT            = (T_MAX - T0) / (N_T - 1);
  public static final double D_OMEGA       = (OMEGA_HI - OMEGA_LO) / N_OMEGA;

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

  private static final String AMP_EXPR   = "ζ(½+ⅈ*t)*√(diff(ϑ(t),t))";
  private static final String ZETA_EXPR  = "ζ(½+ⅈ*t)";
  private static final String THETA_EXPR = "ϑ(t)";

  private double[]  thetaVals;
  private Complex   ampVals;
  private Complex   zetaVals;
  private Complex   density;
  private Complex   zetaStRec;

  private boolean   dark            = true;
  private boolean   light;
  private boolean   separateWindows = false;

  private XYChart   comparisonChart;
  private XYChart   ratioChart;
  private XYChart   phiChart;
  private XYChart   powerChart;

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
   * Phase 3. Direct inverse-Fourier reconstruction of ζ_st(τ_j) for every
   * j in the precomputed τ = θ(t) grid. Parallel over j.
   */
  void reconstructZetaSt()
  {
    System.out.printf("[rec] reconstructing stationary zeta directly on %d points...%n", N_T);
    long          t0    = System.currentTimeMillis();
    ProgressMeter meter = new ProgressMeter("rec", N_T);

    zetaStRec = Complex.newVector(N_T);

    IntStream.range(0, N_T).parallel().forEach(j ->
    {
      double tauJ = thetaVals[j];

      try ( Complex sum     = new Complex();
            Complex phase   = new Complex();
            Complex argPhi  = new Complex();
            Complex term    = new Complex();
            Real    dOmegaR = new Real().set(D_OMEGA))
      {
        sum.set(0, 0);
        for (int k = 0; k < N_OMEGA; k++)
        {
          double omegaK = OMEGA_LO + k * D_OMEGA;

          // argPhi = 0 + i · (+ω_k · τ_j)
          argPhi.set(0.0, omegaK * tauJ);
          argPhi.exp(BITS, phase);

          density.get(k).mul(phase, BITS, term);
          sum.add(term, BITS, sum);
        }

        sum.mul(dOmegaR, BITS, zetaStRec.get(j));
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

    double[] tauPlot   = new double[displayCount];
    double[] zTruePlot = new double[displayCount];
    double[] zStPlot   = new double[displayCount];

    int w = 0;
    for (int j = 0; j < N_T && w < displayCount; j++)
    {
      double tj = T0 + j * DT;
      if (tj >= T0 && tj <= T_DISPLAY_MAX)
      {
        tauPlot[w]   = thetaVals[j];
        zTruePlot[w] = zetaVals.get(j).re().doubleValue();
        zStPlot[w]   = zetaStRec.get(j).re().doubleValue();
        w++;
      }
    }

    double[] rootsTrue = findSignChangeRoots(tauPlot, zTruePlot);
    double[] rootsSt   = findSignChangeRoots(tauPlot, zStPlot);

    XYChart chart = new XYChart(new DefaultNumericAxis("τ",
                                                       ""),
                                new DefaultNumericAxis("Re",
                                                       ""));
    chart.setTitle("High-Resolution Comparison: True Zeta vs Stationary Spectral Process");

    DoubleDataSet trueDs = new DoubleDataSet("Re ζ(1/2 + i θ⁻¹(τ))  [nonstationary ∘ θ⁻¹]").set(tauPlot, zTruePlot);
    DoubleDataSet stDs   = new DoubleDataSet("Re ζ_st(τ)  [stationary spectral reconstruction]").set(tauPlot, zStPlot);
    stDs.setStyle("strokeDashArray=6,6; strokeColor=cornflowerblue;");

    chart.getDatasets().addAll(trueDs, stDs);

    // Vertical root markers — every 10th sign-change root of each series.
    // Encode each as a two-point DoubleDataSet spanning the y range.
    double yLo = -6.0;
    double yHi = 6.0;
    for (int i = 0; i < rootsTrue.length; i += 10)
    {
      double r = rootsTrue[i];
      DoubleDataSet line = new DoubleDataSet(String.format("zTrue root %d", i)).set(new double[]
      { r, r }, new double[]
      { yLo, yHi });
      line.setStyle("strokeColor=red; strokeWidth=0.6; opacity=0.3;");
      chart.getDatasets().add(line);
    }
    for (int i = 0; i < rootsSt.length; i += 10)
    {
      double r = rootsSt[i];
      DoubleDataSet line = new DoubleDataSet(String.format("zSt root %d", i)).set(new double[]
      { r, r }, new double[]
      { yLo, yHi });
      line.setStyle("strokeColor=orange; strokeWidth=0.6; opacity=0.3;");
      chart.getDatasets().add(line);
    }

    return chart;
  }

  /**
   * Build a fine-detail renderer for the Φ(ω) and power traces: thin polyline
   * with no markers and no error surface, so every one of the
   * N_OMEGA = 2560 sample points contributes a line segment. The default
   * chartfx {@code XYChart} renderer produces a visibly coarser line than the
   * matplotlib reference; {@link ErrorDataSetRenderer} with {@code LineStyle
   * .NORMAL} and no marker drawing matches the thin-line look of the Python
   * figure.
   */
  static ErrorDataSetRenderer newFineLineRenderer()
  {
    ErrorDataSetRenderer r = new ErrorDataSetRenderer();
    r.setPolyLineStyle(LineStyle.NORMAL);
    r.setErrorStyle(ErrorStyle.NONE);
    r.setDrawMarker(false);
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
    // visual comparison) constant on [-2, 0]. With c(ω) = 0 off-band, the
    // cumulative |dΦ|² integral is zero for ω < -2, rises linearly from 0
    // to the band's share of total power over [-2, 0], and is flat at that
    // value for ω > 0. The band-share of power is the empirical
    // on-band increment power[K_HI] − power[K_LO] (any gap between this
    // curve and the empirical curve is exactly the off-band noise that
    // the conjecture predicts will vanish as T → ∞).
    double   bandPower   = power[K_HI] - power[K_LO];
    int      bandCount   = K_HI - K_LO + 1;
    double[] theoryPower = new double[N_OMEGA];
    for (int k = 0; k < N_OMEGA; k++)
    {
      if (k < K_LO)
      {
        theoryPower[k] = 0.0;
      }
      else if (k > K_HI)
      {
        theoryPower[k] = bandPower;
      }
      else
      {
        theoryPower[k] = bandPower * (k - K_LO) / (double) (bandCount - 1);
      }
    }

    String thinRed  = DataSetStyleBuilder.instance().setLineColor("black").setMarkerColor("black").setLineWidth(1).build();
    String thinBlue = DataSetStyleBuilder.instance().setLineColor("cornflowerblue").setMarkerColor("cornflowerblue").setLineWidth(1).build();
    String dashRed  = DataSetStyleBuilder.instance().setLineColor("red").setMarkerColor("red").setLineWidth(1).setLineDashes(6.0, 6.0).build();
    String blackEmp = DataSetStyleBuilder.instance().setLineColor("black").setMarkerColor("black").setLineWidth(1).build();

    phiChart = new XYChart(new DefaultNumericAxis("ω",
                                                  ""),
                           new DefaultNumericAxis("Φ(ω)",
                                                  ""));
    phiChart.setTitle("Cumulative Spectral Measure Φ(ω) = ∫ dΦ");
    DoubleDataSet reDs = new DoubleDataSet("Re Φ(ω)").set(omegas, phiRe);
    DoubleDataSet imDs = new DoubleDataSet("Im Φ(ω)").set(omegas, phiIm);
    reDs.setStyle(thinRed);
    imDs.setStyle(thinBlue);
    ErrorDataSetRenderer phiRenderer = newFineLineRenderer();
    phiRenderer.getDatasets().addAll(reDs, imDs);
    phiChart.getRenderers().setAll(phiRenderer);
    phiChart.getXAxis().setAutoRanging(false);
    phiChart.getXAxis().setMin(OMEGA_LO);
    phiChart.getXAxis().setMax(OMEGA_HI);

    powerChart = new XYChart(new DefaultNumericAxis("ω",
                                                    ""),
                             new DefaultNumericAxis("Power",
                                                    ""));
    powerChart.setTitle("Spectral Distribution Function");
    DoubleDataSet empDs    = new DoubleDataSet("Empirical: cumulative sum of |dΦ|²").set(omegas, power);
    DoubleDataSet theoryDs = new DoubleDataSet("Theoretical shape (flat spectral density on [-2, 0])").set(omegas, theoryPower);
    empDs.setStyle(blackEmp);
    theoryDs.setStyle(dashRed);
    ErrorDataSetRenderer powerRenderer = newFineLineRenderer();
    powerRenderer.getDatasets().addAll(empDs, theoryDs);
    powerChart.getRenderers().setAll(powerRenderer);
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
    // Named parameters are currently unused but are read so future overrides
    // (e.g., --N_T=, --T_MAX=) can be wired in without changing call sites.
    if (named != null && !named.isEmpty())
    {
      System.out.printf("[params] named parameters: %s%n", named);
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

    gridPane.add(comparisonChart, 0, 0);
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
    Stage[]   stages = new Stage[]
    { stage, new Stage(), new Stage() };
    XYChart[] charts = new XYChart[]
    { comparisonChart, phiChart, powerChart };

    for (int i = 0; i < charts.length; i++)
    {
      Scene scene = new Scene(charts[i]);
      stages[i].setScene(scene);
      stages[i].setMaximized(true);
      stages[i].setTitle(charts[i].getTitle());
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
    buildSpectralMeasureCharts();
    configureCharts();

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

  public static void main(String[] args)
  {
    launch(args);
  }
}
