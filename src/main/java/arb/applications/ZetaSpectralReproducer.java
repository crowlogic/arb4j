package arb.applications;

import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Locale;
import java.util.ArrayList;
import java.util.List;
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
import arb.functions.real.RealFunction;
import arb.functions.complex.ComplexFunction;
import arb.functions.RealToComplexFunction;

/**
 * Java reproducer of {@code zeta_spectral_gemini.py}, computed end-to-end
 * via the {@code nint} expression-compiler operator.
 *
 * <p>The pipeline matches the Python script step-for-step:
 *
 * <ol>
 *   <li><b>Spectral density.</b> For each ω in the spectral grid, evaluate
 *       {@link ZetaSpectralRandomMeasure}, which is the compiled expression
 *       <pre>ν ➔ nint(t ➔ ζ(½+ⅈ*t)·√(diff(ϑ(t),t))·exp(-ⅈ*ν*ϑ(t)),
 *                    t = T0 … Tmax,
 *                    dt = (Tmax-T0)/Nt) / (2π)</pre>
 *       at ω. The {@code nint} operator's trapezoid integrator amortizes
 *       evaluation across an outer parameter sweep, so each ω requires
 *       exactly {@code Nt} ζ evaluations \u2014 identical to the
 *       {@code numpy.trapezoid} cost in the reference script.</li>
 *
 *   <li><b>Precompute (θ(t), ζ(½+ⅈt)) on a τ-grid.</b> Same dense {@code Nt}
 *       grid as step 1; we need θ(t) values to build τ = θ(t) for the
 *       reconstruction step, and ζ(½+ⅈt) for the comparison plot.</li>
 *
 *   <li><b>Direct inverse-Fourier reconstruction.</b> On the τ-grid built
 *       from the precomputed θ(t), evaluate
 *       {@code ζ_st(τ) = Σ_k Φ(ω_k) · exp(ⅈ·τ·ω_k) · Δω}.</li>
 * </ol>
 *
 * Outputs three CSV files in the working directory:
 * <ul>
 *   <li>{@code spectral_density.csv} — columns
 *       {@code omega, Re_Phi, Im_Phi}.</li>
 *   <li>{@code precompute_grid.csv} — columns
 *       {@code t, theta, theta_prime, Re_zeta, Im_zeta}.</li>
 *   <li>{@code zeta_st_reconstruction.csv} — columns
 *       {@code tau, Re_zeta, Re_zeta_st} (real parts on the τ-grid; the
 *       Python plot draws exactly these two traces).</li>
 * </ul>
 *
 * <h2>Parameters</h2>
 * The Python defaults ({@code N_T = 80,000}, {@code N_OMEGA = 2560}) require
 * {@code 2,560 × 80,000 = 2.05 × 10^8} ζ evaluations. That is hours of
 * wall time at any reasonable precision \u2014 manageable on a multi-core
 * box, but not interactive. The defaults below are chosen for a fast
 * smoke-run that completes in minutes; pass command-line overrides for a
 * full Python-parity run.
 *
 * <pre>
 *   java arb.applications.ZetaSpectralReproducer \
 *        [Nt=80000] [Nomega=2560] [Tmax=1000.0] [bits=64]
 * </pre>
 *
 * @see ZetaSpectralRandomMeasure
 * @see arb.expressions.nodes.NumericalIntegralNode
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ZetaSpectralReproducer
{
  /** First Riemann\u2013Siegel-theta zero \u2014 same as the Python script. */
  static final double T0_DEFAULT     = 6.289835988;
  static final double TMAX_DEFAULT   = 1000.0;
  static final double OMEGA_MIN      = -3.0;
  static final double OMEGA_MAX      = 3.0;
  static final int    NT_DEFAULT     = 4000;   // smoke run; use 80000 for parity
  static final int    NOMEGA_DEFAULT = 256;    // smoke run; use 2560 for parity
  static final int    BITS_DEFAULT   = 64;

  public static void main(String[] args) throws Exception
  {
    int    Nt     = args.length > 0 ? Integer.parseInt(args[0]) : NT_DEFAULT;
    int    Nomega = args.length > 1 ? Integer.parseInt(args[1]) : NOMEGA_DEFAULT;
    double Tmax   = args.length > 2 ? Double.parseDouble(args[2]) : TMAX_DEFAULT;
    int    bits   = args.length > 3 ? Integer.parseInt(args[3]) : BITS_DEFAULT;

    int    workers = Runtime.getRuntime().availableProcessors();

    System.out.printf(Locale.ROOT,
                      "[main] T=[%.6f, %.1f] N_t=%d N_omega=%d bits=%d workers=%d%n",
                      T0_DEFAULT, Tmax, Nt, Nomega, bits, workers);

    long t0 = System.currentTimeMillis();

    // ── Step 1: spectral density Φ(ω) on ω = linspace(-3, 3, Nomega, endpoint=False)
    System.out.println("[density] computing Φ(ω) over the ω-grid...");
    double[] omegas    = linspaceEndpointFalse(OMEGA_MIN, OMEGA_MAX, Nomega);
    double   dOmega    = (OMEGA_MAX - OMEGA_MIN) / Nomega;
    double[] phiRe     = new double[Nomega];
    double[] phiIm     = new double[Nomega];
    runSpectralDensity(omegas, phiRe, phiIm, Tmax, Nt, bits, workers);
    writeSpectralDensityCsv(omegas, phiRe, phiIm, Path.of("spectral_density.csv"));
    System.out.printf(Locale.ROOT,
                      "[density] done in %.2fs%n",
                      (System.currentTimeMillis() - t0) / 1000.0);

    // ── Step 2: precompute (θ, θ', ζ) on the dense t-grid
    long t1 = System.currentTimeMillis();
    System.out.println("[pre] precomputing (θ, θ', ζ) on the dense t-grid...");
    double[] tGrid       = linspaceInclusive(T0_DEFAULT, Tmax, Nt);
    double[] thetaVals   = new double[Nt];
    double[] thetaPrime  = new double[Nt];
    double[] zetaRe      = new double[Nt];
    double[] zetaIm      = new double[Nt];
    runPrecompute(tGrid, thetaVals, thetaPrime, zetaRe, zetaIm, bits, workers);
    writePrecomputeCsv(tGrid, thetaVals, thetaPrime, zetaRe, zetaIm,
                       Path.of("precompute_grid.csv"));
    System.out.printf(Locale.ROOT,
                      "[pre] done in %.2fs%n",
                      (System.currentTimeMillis() - t1) / 1000.0);

    // ── Step 3: direct inverse-Fourier reconstruction on τ = θ(t)
    long t2 = System.currentTimeMillis();
    System.out.println("[rec] reconstructing ζ_st on the τ-grid...");
    double[] zetaStRe = reconstructZetaSt(thetaVals, omegas, dOmega, phiRe, phiIm);
    writeReconstructionCsv(thetaVals, zetaRe, zetaStRe,
                           Path.of("zeta_st_reconstruction.csv"));
    System.out.printf(Locale.ROOT,
                      "[rec] done in %.2fs%n",
                      (System.currentTimeMillis() - t2) / 1000.0);

    System.out.printf(Locale.ROOT,
                      "[main] total %.2fs; outputs: spectral_density.csv, precompute_grid.csv, zeta_st_reconstruction.csv%n",
                      (System.currentTimeMillis() - t0) / 1000.0);
  }

  // ─────────────────────────────────────────────────────────────────────
  // Step 1: parallel ω-sweep over Φ(ω) via ZetaSpectralRandomMeasure.
  //
  // Each worker thread holds its OWN ZetaSpectralRandomMeasure instance —
  // the underlying nint integrator is stateful (cumulative trapezoid cache)
  // and the per-evaluate rebind in init() is not thread-safe across a
  // single instance.
  // ─────────────────────────────────────────────────────────────────────
  static void runSpectralDensity(double[] omegas,
                                 double[] phiRe,
                                 double[] phiIm,
                                 double Tmax,
                                 int Nt,
                                 int bits,
                                 int workers)
      throws Exception
  {
    int           N        = omegas.length;
    AtomicInteger progress = new AtomicInteger(0);
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
          try (Real    nu     = new Real(Double.toString(omegas[ki]), bits);
               Complex result = new Complex())
          {
            ZetaSpectralRandomMeasure phi = tlPhi.get();
            phi.evaluate(nu, 1, bits, result);
            phiRe[ki] = result.re().getMid().doubleValue();
            phiIm[ki] = result.im().getMid().doubleValue();
          }
          int p = progress.incrementAndGet();
          if (p == 1 || p == N || p % reportEvery == 0)
          {
            System.out.printf(Locale.ROOT,
                              "[density] %d/%d  ω=%+.4f  Φ=%+.3e %+.3ei%n",
                              p, N, omegas[ki], phiRe[ki], phiIm[ki]);
          }
        }));
      }
      for (Future<?> f : futures)
      {
        f.get(); // surfaces any worker exception
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
  // Step 2: parallel precompute of (θ(t), θ'(t), ζ(½+ⅈt)) on the t-grid,
  // each via expression-compiled functions.
  // ─────────────────────────────────────────────────────────────────────
  static void runPrecompute(double[] tGrid,
                            double[] thetaVals,
                            double[] thetaPrime,
                            double[] zetaRe,
                            double[] zetaIm,
                            int bits,
                            int workers)
      throws Exception
  {
    int           N        = tGrid.length;
    AtomicInteger progress = new AtomicInteger(0);
    int           reportEvery = Math.max(1, N / 16);

    ExecutorService pool = Executors.newFixedThreadPool(workers);
    try
    {
      ThreadLocal<RealFunction>          tlTheta      =
          ThreadLocal.withInitial(() -> RealFunction.express("t➔ϑ(t)"));
      ThreadLocal<RealFunction>          tlThetaPrime =
          ThreadLocal.withInitial(() -> RealFunction.express("t➔diff(ϑ(t),t)"));
      ThreadLocal<RealToComplexFunction> tlZeta       =
          ThreadLocal.withInitial(() -> RealToComplexFunction.express("t➔ζ(½+ⅈ*t)"));

      List<Future<?>> futures = new ArrayList<>();
      for (int j = 0; j < N; j++)
      {
        final int ji = j;
        futures.add(pool.submit(() ->
        {
          try (Real    t   = new Real(Double.toString(tGrid[ji]), bits);
               Real    th  = new Real();
               Real    thp = new Real();
               Complex z   = new Complex())
          {
            tlTheta.get().evaluate(t, 1, bits, th);
            tlThetaPrime.get().evaluate(t, 1, bits, thp);
            tlZeta.get().evaluate(t, 1, bits, z);

            thetaVals[ji]  = th.getMid().doubleValue();
            thetaPrime[ji] = thp.getMid().doubleValue();
            zetaRe[ji]     = z.re().getMid().doubleValue();
            zetaIm[ji]     = z.im().getMid().doubleValue();
          }
          int p = progress.incrementAndGet();
          if (p == 1 || p == N || p % reportEvery == 0)
          {
            System.out.printf(Locale.ROOT,
                              "[pre] %d/%d  t=%9.3f  θ=%+9.3f  θ'=%+9.3f  Re ζ=%+8.3f%n",
                              p, N, tGrid[ji], thetaVals[ji], thetaPrime[ji], zetaRe[ji]);
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
  // Step 3: direct ζ_st(τ) = Σ_k Φ(ω_k) · exp(ⅈ·τ·ω_k) · Δω.
  // Returns Re ζ_st only (matching the Python plot, which displays Re).
  // ─────────────────────────────────────────────────────────────────────
  static double[] reconstructZetaSt(double[] tau,
                                    double[] omegas,
                                    double dOmega,
                                    double[] phiRe,
                                    double[] phiIm)
  {
    int      M    = tau.length;
    int      K    = omegas.length;
    double[] zRe  = new double[M];

    for (int i = 0; i < M; i++)
    {
      double accRe = 0.0;
      double accIm = 0.0;
      double t     = tau[i];
      for (int k = 0; k < K; k++)
      {
        double w  = omegas[k];
        double c  = Math.cos(t * w);
        double s  = Math.sin(t * w);
        // Φ * exp(ⅈ τ ω) = (Re + ⅈ Im) * (c + ⅈ s)
        accRe += phiRe[k] * c - phiIm[k] * s;
        accIm += phiRe[k] * s + phiIm[k] * c;
      }
      zRe[i] = accRe * dOmega;
      // accIm * dOmega is dropped — Python plots Re only and the imaginary
      // residual is discretization noise that vanishes in the limit
      // dOmega→0 because the underlying random measure is conjugate-symmetric.
    }
    return zRe;
  }

  // ─────────────────────────────────────────────────────────────────────
  // Grid helpers, same semantics as numpy.linspace.
  // ─────────────────────────────────────────────────────────────────────
  static double[] linspaceInclusive(double a, double b, int n)
  {
    double[] x = new double[n];
    if (n == 1)
    {
      x[0] = a;
      return x;
    }
    double step = (b - a) / (n - 1);
    for (int i = 0; i < n; i++)
    {
      x[i] = a + i * step;
    }
    return x;
  }

  static double[] linspaceEndpointFalse(double a, double b, int n)
  {
    double[] x    = new double[n];
    double   step = (b - a) / n;
    for (int i = 0; i < n; i++)
    {
      x[i] = a + i * step;
    }
    return x;
  }

  // ─────────────────────────────────────────────────────────────────────
  // CSV writers.
  // ─────────────────────────────────────────────────────────────────────
  static void writeSpectralDensityCsv(double[] omegas,
                                      double[] phiRe,
                                      double[] phiIm,
                                      Path out)
      throws IOException
  {
    try (BufferedWriter w = Files.newBufferedWriter(out))
    {
      w.write("omega,Re_Phi,Im_Phi\n");
      for (int k = 0; k < omegas.length; k++)
      {
        w.write(String.format(Locale.ROOT,
                              "%.10g,%.10g,%.10g%n",
                              omegas[k], phiRe[k], phiIm[k]));
      }
    }
  }

  static void writePrecomputeCsv(double[] t,
                                 double[] theta,
                                 double[] thetaPrime,
                                 double[] zRe,
                                 double[] zIm,
                                 Path out)
      throws IOException
  {
    try (BufferedWriter w = Files.newBufferedWriter(out))
    {
      w.write("t,theta,theta_prime,Re_zeta,Im_zeta\n");
      for (int j = 0; j < t.length; j++)
      {
        w.write(String.format(Locale.ROOT,
                              "%.10g,%.10g,%.10g,%.10g,%.10g%n",
                              t[j], theta[j], thetaPrime[j], zRe[j], zIm[j]));
      }
    }
  }

  static void writeReconstructionCsv(double[] tau,
                                     double[] zRe,
                                     double[] zStRe,
                                     Path out)
      throws IOException
  {
    try (BufferedWriter w = Files.newBufferedWriter(out))
    {
      w.write("tau,Re_zeta,Re_zeta_st\n");
      for (int i = 0; i < tau.length; i++)
      {
        w.write(String.format(Locale.ROOT,
                              "%.10g,%.10g,%.10g%n",
                              tau[i], zRe[i], zStRe[i]));
      }
    }
  }

  // suppress unused-import warning for ComplexFunction; kept as a deliberate
  // signpost to the reader of the file.
  @SuppressWarnings("unused")
  private static final Class<?> KEEP_IMPORT = ComplexFunction.class;
}
