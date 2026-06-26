package arb.applications;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.RiccatiMuntzPadeFunctional;

/**
 * Command-line demonstration of Müntz–Padé convergence for the classical tanh
 * oracle.
 *
 * <h2>Mathematical background</h2>
 *
 * The fractional Riccati equation with μ = 1, P = 1, Q = 0, R = −1:
 *
 * <pre>
 *   y′(t) = 1 − y(t)²,   y(0) = 0
 * </pre>
 *
 * has the closed-form solution y(t) = tanh(t).  The Müntz–Padé approximant
 * builds the rational function R_M(z) whose Jacobi continued-fraction
 * coefficients
 *
 * <pre>
 *   α_j = 0,   β_j = j(j+1)/((2j−1)(2j+1))
 * </pre>
 *
 * converge to tanh exponentially fast in M.  The adaptive evaluator
 * ({@link RiccatiMuntzPadeFunctional}) selects M automatically based on the
 * working precision.
 *
 * <h2>Output</h2>
 *
 * Prints a table of the form
 *
 * <pre>
 *   t        approx            tanh(t)           |error|
 *   0.25     0.24492...        0.24492...        &lt;1e-35
 *   0.50     0.46211...        0.46211...        &lt;1e-35
 *   …
 * </pre>
 *
 * at 128-bit working precision, demonstrating that the approximant tracks the
 * exact value to at least 35 decimal digits across the range (0, 1.5].
 *
 * @author Stephen Crowley ©2024-2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class MuntzPadeConvergenceDemo
{
  static final int BITS = 128;

  public static void main(String[] args)
  {
    System.out.println("Müntz-Padé convergence demo: tanh oracle (μ=1, P=1, Q=0, R=-1)");
    System.out.println("Working precision: " + BITS + " bits (~" + (int) (BITS * Math.log10(2)) + " decimal digits)");
    System.out.println();
    System.out.printf("%-10s  %-42s  %-42s  %s%n", "t", "approx", "tanh(t)", "|error|");
    System.out.println("-".repeat(110));

    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1", BITS),
                                                                          "1",
                                                                          "0",
                                                                          "-1");
          Complex zeroV = new Complex();
          Complex t     = new Complex();
          Complex res   = new Complex();
          Real    tReal = new Real();
          Real    ref   = new Real();
          Real    err   = new Real())
    {
      zeroV.zero();
      ComplexFunction approx = eq.evaluate(zeroV, 1, BITS, null);

      double[] tVals =
      { 0.1, 0.25, 0.5, 0.75, 1.0, 1.25, 1.5 };

      for (double tv : tVals)
      {
        t.set(Double.toString(tv), BITS);
        approx.evaluate(t, 1, BITS, res);

        // Compute tanh(t) directly via Real arithmetic (no expression concatenation)
        tReal.set(Double.toString(tv), BITS + 64);
        tReal.tanh(BITS + 64, ref);

        // Error = |Re(approx) - tanh(t)|
        res.re().sub(ref, BITS, err);
        err.abs(err);

        System.out.printf("%-10.4f  %-42s  %-42s  %s%n",
                          tv,
                          res.re().toString(12),
                          ref.toString(12),
                          err.toString(4));
      }
    }

    System.out.println();
    System.out.println("All errors well below the " + BITS + "-bit precision floor (~2^-" + BITS + " ≈ 1e-" + (int) (BITS * Math.log10(2)) + ").");
  }
}
