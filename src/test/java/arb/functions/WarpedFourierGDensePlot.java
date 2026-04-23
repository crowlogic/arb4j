package arb.functions;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

import arb.Complex;
import arb.Real;
import junit.framework.TestCase;

/**
 * Dense evaluation of G_T(ν) = 2·Re K_T(ν) on a fine ν-grid at a large
 * truncation T, writing the results to a CSV for plotting.
 *
 * The amplitude caches are rebuilt per ν (the phase depends on ν so the
 * trapezoid cache is ν-specific). For T=1000 with dt=0.02 that is 50_000
 * evaluations of the integrand per ν — non-trivial, so the grid is kept small.
 */
public class WarpedFourierGDensePlot extends
                                     TestCase
{
  /**
   * Command-line entry point so this driver can be run outside surefire (which
   * buffers test stdout). Invoke via
   *
   *   mvn test-compile
   *   java --enable-preview --illegal-native-access=allow \
   *        --sun-misc-unsafe-memory-access=allow \
   *        -Djava.library.path=. \
   *        -cp "build/classes:build/test-classes:$(cat cp.txt):$JUNIT" \
   *        arb.functions.WarpedFourierGDensePlot
   *
   * where cp.txt is produced by `mvn dependency:build-classpath -Dmdep.outputFile=cp.txt`.
   * Running this way streams the per-ν progress lines live to the console and
   * flushes each CSV row to disk on write.
   */
  public static void main(String[] args) throws IOException
  {
    new WarpedFourierGDensePlot().testDenseSweep();
  }

  static final int    BITS   = 128;
  static final double C      = 1.0;
  static final double ALPHA  = 1.0 / 12.0 + 0.1 / 2.0;

  static final double T0     = 10.0;
  static final double T      = 500.0;
  static final double DT     = 0.02;

  // Dense nu grid around the divergence point nu=1
  static final double NU_MIN = -2.0;
  static final double NU_MAX = 4.0;
  static final int    N_NU   = 121;   // step 0.05

  public void testDenseSweep() throws IOException
  {
    String csvPath = "build/G_dense_sweep.csv";
    new java.io.File("build").mkdirs();

    try ( Real    T0R = new Real().set(T0);
          Real    dtR = new Real().set(DT);
          Real    xT  = new Real().set(T);
          Complex K   = new Complex();
          BufferedWriter w = new BufferedWriter(new FileWriter(csvPath)))
    {
      WarpedFourierGFunctional Gfun =
          new WarpedFourierGFunctional(C, ALPHA, T0R, dtR, BITS);

      w.write("nu,ReK,ImK,G_T\n");

      long t0 = System.currentTimeMillis();
      System.out.format("Dense G_T(nu) sweep: T_0=%.1f, T=%.1f, dt=%.3f, C=%.2f, alpha=%.4f, N_nu=%d%n",
                        T0, T, DT, C, ALPHA, N_NU);

      for (int i = 0; i < N_NU; i++)
      {
        double nu = NU_MIN + (NU_MAX - NU_MIN) * i / (N_NU - 1);
        try ( Real nuR = new Real().set(nu);
              RealToComplexFunction integrator = Gfun.evaluate(nuR, 1, BITS, null))
        {
          integrator.evaluate(xT, 1, BITS, K);
          double re = K.getReal().doubleValue();
          double im = K.getImag().doubleValue();
          double G  = 2.0 * re;
          w.write(String.format("%.6f,%.10e,%.10e,%.10e%n", nu, re, im, G));
          w.flush();
          long elapsed = (System.currentTimeMillis() - t0) / 1000;
          System.out.format("  [%3d/%3d] nu=%+6.3f  G_T=%+14.6e   (t=%ds)%n",
                            i + 1, N_NU, nu, G, elapsed);
          System.out.flush();
        }
      }
      System.out.format("Wrote %s in %ds%n", csvPath,
                        (System.currentTimeMillis() - t0) / 1000);
    }
  }
}
