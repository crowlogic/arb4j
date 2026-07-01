package arb.applications;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.RiccatiMuntzPadeFunctional;
import arb.stochastic.Charts;
import arb.viz.WindowManager;
import io.fair_acc.chartfx.XYChart;
import io.fair_acc.chartfx.axes.spi.DefaultNumericAxis;
import io.fair_acc.dataset.spi.DoubleDataSet;
import io.fair_acc.dataset.utils.DataSetStyleBuilder;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

/**
 * JavaFX laboratory for the {@link RiccatiMuntzPadeFunctional} fractional
 * Riccati solver.
 *
 * <h2>What it shows</h2>
 *
 * The Müntz–Padé construction solves the fractional Riccati equation
 *
 * <pre>
 *   Đ^μ y(t) = P + Q·y(t) + R·y(t)²,   y(0) = 0
 * </pre>
 *
 * by expanding y(t) = Σ_{k≥1} a_k · t^{kμ} and resumming the Müntz series with a
 * Padé resolvent that analytically continues the solution well past the radius
 * of convergence of its Maclaurin series. This application plots two headline
 * behaviours side by side, both evaluated at 128-bit precision through arb/FLINT
 * ball arithmetic and cast to {@code double} only at the chart-rendering edge.
 *
 * <h3>Top panel — fractional interpolation of tanh</h3>
 *
 * The pure quadratic equation Đ^μ y = 1 − y² (P=1, Q=0, R=−1) is plotted for a
 * family of fractional orders μ ∈ {0.5, 0.7, 0.9, 1.0}. At μ=1 the solution is
 * exactly tanh(t) (drawn in black over the μ=1 curve as a reference); as μ
 * decreases the solution rises faster from the origin (a t^μ power-law onset)
 * yet still saturates toward the same fixed point y=1, illustrating how the
 * fractional order continuously deforms the classical result.
 *
 * <h3>Bottom panel — analytic continuation past a pole</h3>
 *
 * The tangent equation y′ = 1 + y² (μ=1, P=1, Q=0, R=+1) has y(t) = tan(t),
 * which blows up at t = π/2 ≈ 1.5708. The Maclaurin series of tan diverges for
 * |t| ≥ π/2, yet the Müntz–Padé resolvent continues <em>through</em> the pole
 * onto the next branch, recovering the correct negative values for t &gt; π/2.
 * The exact tan(t) reference (black) is overlaid to show the approximant tracks
 * it on both branches; samples straddling the pole are omitted so the vertical
 * asymptote does not swamp the plot.
 *
 * <h2>Running</h2>
 *
 * <pre>
 *   bin/run arb.applications.FractionalRiccatiLab
 * </pre>
 *
 * @author Stephen Crowley ©2024-2026
 * @see RiccatiMuntzPadeFunctional
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FractionalRiccatiLab extends
                                  Application
{
  static final int      BITS       = 128;

  /** Fractional orders sampled in the tanh-family panel. */
  static final String[] MU_VALUES  = { "1/2", "7/10", "9/10", "1" };

  /** Distinct colours for the μ-family curves, in MU_VALUES order. */
  static final String[] MU_COLORS  = { "crimson", "darkorange", "seagreen", "dodgerblue" };

  static final double   TANH_TMAX  = 3.0;
  static final double   TAN_TMAX   = 3.0;
  static final int      SAMPLES    = 240;

  /** Half-width of the sampling gap around the tan pole at π/2. */
  static final double   POLE_GUARD = 0.06;

  public static void main(String[] args)
  {
    Application.launch(FractionalRiccatiLab.class, args);
  }

  @Override
  public void start(Stage primaryStage)
  {
    XYChart tanhChart = buildTanhFamilyChart();
    XYChart tanChart  = buildTangentContinuationChart();
    Charts.configureChart(tanhChart, true);
    Charts.configureChart(tanChart, true);

    VBox root = new VBox(tanhChart,
                         tanChart);
    VBox.setVgrow(tanhChart, Priority.ALWAYS);
    VBox.setVgrow(tanChart, Priority.ALWAYS);

    primaryStage.setTitle("Fractional Riccati Lab — Müntz-Padé solver for Đ^μ y = P + Q·y + R·y²");
    Scene scene = new Scene(root,
                            1400,
                            900);
    primaryStage.setScene(scene);
    WindowManager.setMoreConduciveStyle(scene);
    primaryStage.show();
  }

  // ─────────────────────────────────────────────────────────────────────
  // Top panel: Đ^μ y = 1 − y² for a family of fractional orders μ.
  // ─────────────────────────────────────────────────────────────────────
  XYChart buildTanhFamilyChart()
  {
    DefaultNumericAxis xAxis = new DefaultNumericAxis("t",
                                                      "");
    DefaultNumericAxis yAxis = new DefaultNumericAxis("y(t)",
                                                      "");
    XYChart            chart = new XYChart(xAxis,
                                           yAxis);
    chart.setTitle("Fractional interpolation of tanh:  Đ^μ y = 1 − y²,  y(0)=0");
    xAxis.setAutoRanging(false);
    xAxis.setMin(0);
    xAxis.setMax(TANH_TMAX);

    for (int i = 0; i < MU_VALUES.length; i++)
    {
      DoubleDataSet ds = sampleFunctional(MU_VALUES[i], "1", "0", "-1", TANH_TMAX, "Đ^μ y=1−y²,  μ=" + MU_VALUES[i]);
      ds.setStyle(DataSetStyleBuilder.instance().setLineColor(MU_COLORS[i]).setMarkerColor(MU_COLORS[i]).setLineWidth(2).build());
      chart.getDatasets().add(ds);
    }

    chart.getDatasets().add(referenceCurve(TANH_TMAX, true, "tanh(t)  (exact, μ=1)"));
    return chart;
  }

  // ─────────────────────────────────────────────────────────────────────
  // Bottom panel: y′ = 1 + y² continued past the pole at π/2.
  // ─────────────────────────────────────────────────────────────────────
  XYChart buildTangentContinuationChart()
  {
    DefaultNumericAxis xAxis = new DefaultNumericAxis("t",
                                                      "");
    DefaultNumericAxis yAxis = new DefaultNumericAxis("y(t)",
                                                      "");
    XYChart            chart = new XYChart(xAxis,
                                           yAxis);
    chart.setTitle("Analytic continuation past the pole:  y′ = 1 + y² → tan(t),  pole at π/2");
    xAxis.setAutoRanging(false);
    xAxis.setMin(0);
    xAxis.setMax(TAN_TMAX);
    yAxis.setAutoRanging(false);
    yAxis.setMin(-10);
    yAxis.setMax(15);

    DoubleDataSet approx = sampleFunctional("1", "1", "0", "1", TAN_TMAX, "Müntz-Padé y(t)");
    approx.setStyle(DataSetStyleBuilder.instance().setLineColor("crimson").setMarkerColor("crimson").setLineWidth(2).build());
    chart.getDatasets().add(approx);
    chart.getDatasets().add(referenceCurve(TAN_TMAX, false, "tan(t)  (exact)"));
    return chart;
  }

  /**
   * Evaluate the Riccati functional for the given (μ, P, Q, R) on a uniform t
   * grid over (0, tMax], returning the real part as a chart dataset. Samples
   * within {@link #POLE_GUARD} of the tan pole at π/2 are skipped so the
   * asymptote does not dominate the plot.
   */
  DoubleDataSet sampleFunctional(String mu, String p, String q, String r, double tMax, String label)
  {
    DoubleDataSet ds = new DoubleDataSet(label);
    try ( Real μ = new Real().set(mu, BITS);
          RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(μ, p, q, r);
          Complex zeroV = new Complex(); Complex t = new Complex(); Complex y = new Complex())
    {
      zeroV.zero();
      ComplexFunction approx = eq.evaluate(zeroV, 1, BITS, null);
      for (int k = 1; k <= SAMPLES; k++)
      {
        double tv = tMax * k / SAMPLES;
        if (Math.abs(tv - Math.PI / 2) < POLE_GUARD)
        {
          continue;
        }
        t.set(Double.toString(tv), BITS);
        approx.evaluate(t, 1, BITS, y);
        ds.add(tv, y.re().doubleValue());
      }
    }
    return ds;
  }

  /**
   * The exact reference curve, either tanh(t) or tan(t), computed directly via
   * arb {@link Real} arithmetic on the same grid, skipping the tan pole guard.
   */
  DoubleDataSet referenceCurve(double tMax, boolean hyperbolic, String label)
  {
    DoubleDataSet ds = new DoubleDataSet(label);
    try ( Real t = new Real(); Real y = new Real())
    {
      for (int k = 1; k <= SAMPLES; k++)
      {
        double tv = tMax * k / SAMPLES;
        if (!hyperbolic && Math.abs(tv - Math.PI / 2) < POLE_GUARD)
        {
          continue;
        }
        t.set(Double.toString(tv), BITS);
        if (hyperbolic)
        {
          t.tanh(BITS, y);
        }
        else
        {
          t.tan(BITS, y);
        }
        ds.add(tv, y.doubleValue());
      }
    }
    ds.setStyle(DataSetStyleBuilder.instance().setLineColor("black").setMarkerColor("black").setLineWidth(1).build());
    return ds;
  }
}
