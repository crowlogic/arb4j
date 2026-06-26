package arb.applications;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.RiccatiMuntzPadeFunctional;

/**
 * Command-line demonstration of the fractional Riccati evaluator.
 *
 * <h2>Mathematical background</h2>
 *
 * Given μ ∈ (0,1], the fractional Riccati equation
 *
 * <pre>
 *   D^μ y(t) = P + Q·y(t) + R·y(t)²,   y(0) = 0
 * </pre>
 *
 * has no closed form in general for μ ≠ 1.  The Müntz–Padé method expands the
 * solution in the Müntz series
 *
 * <pre>
 *   y(t) = Σ_{k≥1} a_k · t^{kμ}
 * </pre>
 *
 * whose coefficients a_k satisfy a computable algebraic recurrence (see
 * {@link RiccatiMuntzPadeFunctional}).  The adaptive evaluator selects the
 * truncation order M automatically at the requested precision.
 *
 * <h2>Default run</h2>
 *
 * Without command-line arguments the program evaluates three representative
 * equations:
 *
 * <ol>
 *   <li>μ=1, P=1, Q=0, R=−1 → tanh (classical oracle).</li>
 *   <li>μ=0.5, P=1, Q=0, R=−1 → fractional tanh analogue.</li>
 *   <li>μ=0.7, P=1, Q=−1, R=0 → linear fractional ODE with power-law
 *       solution.</li>
 * </ol>
 *
 * For each equation a table of y(t) at t ∈ {0.1, 0.25, 0.5, 0.75, 1.0} is
 * printed at 128-bit working precision.
 *
 * @author Stephen Crowley ©2024-2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FractionalRiccatiEvaluator
{
  static final int    BITS   = 128;
  static final double[] T_VALS = { 0.1, 0.25, 0.5, 0.75, 1.0 };

  public static void main(String[] args)
  {
    System.out.println("Fractional Riccati evaluator — Müntz-Padé adaptive solver");
    System.out.println("Equation: D^μ y(t) = P + Q·y(t) + R·y(t)²,   y(0) = 0");
    System.out.println("Precision: " + BITS + " bits");
    System.out.println();

    printTable("μ=1, P=1, Q=0, R=-1  (oracle: tanh)", "1", "1", "0", "-1");
    printTable("μ=1/2, P=1, Q=0, R=-1  (fractional tanh analogue)", "1/2", "1", "0", "-1");
    printTable("μ=7/10, P=1, Q=-1, R=0  (linear fractional ODE)", "7/10", "1", "-1", "0");
  }

  private static void printTable(String label, String mu, String p, String q, String r)
  {
    System.out.println("─".repeat(70));
    System.out.println(label);
    System.out.println("─".repeat(70));
    System.out.printf("%-10s  %s%n", "t", "y(t)");
    System.out.println("-".repeat(60));

    try ( Real μ = new Real().set(mu, BITS);
          RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(μ, p, q, r);
          Complex zeroV = new Complex();
          Complex t     = new Complex();
          Complex res   = new Complex())
    {
      zeroV.zero();
      ComplexFunction approx = eq.evaluate(zeroV, 1, BITS, null);

      for (double tv : T_VALS)
      {
        t.set(Double.toString(tv), BITS);
        approx.evaluate(t, 1, BITS, res);

        String imStr = "";
        double im    = res.im().doubleValue();
        if (Math.abs(im) > 1e-20)
        {
          imStr = String.format(" + %.10fi", im);
        }
        System.out.printf("%-10.4f  %s%s%n", tv, res.re().toString(15), imStr);
      }
    }
    System.out.println();
  }
}
