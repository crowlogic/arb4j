package arb.applications;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Real;
import arb.expressions.Context;
import arb.functions.complex.MuntzPadeApproximant;
import arb.functions.complex.RiccatiMuntzPadeFunctional;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.ComplexSequence;
import arb.utensils.text.tables.TextTable;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

/**
 * Prints the first N orthogonal polynomials of the numerator and denominator
 * of the Müntz-Padé spectral-tau solution of the constant-coefficient
 * (time-independent) fractional Riccati equation.
 *
 * <pre>
 *   D^μ y(t) = P + Q·y(t) + R·y(t)²,   y(0) = 0
 * </pre>
 *
 * @author Stephen Crowley ©2024–2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
@Command(name = "muntzPadePolynomials",
         description = "Print the orthogonal polynomials of the Müntz-Padé spectral-tau solution",
         mixinStandardHelpOptions = true)
public class MuntzPadePolynomialPrinter implements Runnable
{
  @Option(names = "--mu", description = "fractional order μ (default: 1)", defaultValue = "1")
  String mu;

  @Option(names = "--P", description = "constant coefficient P (default: 1)", defaultValue = "1")
  String pCoeff;

  @Option(names = "--Q", description = "constant coefficient Q (default: 0)", defaultValue = "0")
  String qCoeff;

  @Option(names = "--R", description = "constant coefficient R (default: -1)", defaultValue = "-1")
  String rCoeff;

  @Option(names = "--N", description = "number of orthogonal polynomials (default: 10)", defaultValue = "10")
  int N;

  @Option(names = "--bits", description = "working precision in bits (default: 128)", defaultValue = "128")
  int bits;

  public static void main(String[] args)
  {
    int exitCode = new CommandLine(new MuntzPadePolynomialPrinter()).execute(args);
    System.exit(exitCode);
  }

  @Override
  public void run()
  {
    System.out.println("Müntz–Padé orthogonal polynomials of the spectral-tau solution");
    System.out.println("of the constant-coefficient (time-independent) fractional Riccati equation");
    System.out.printf("  D^%s y(t) = %s + %s·y(t) + %s·y(t)²,  y(0) = 0%n", mu, pCoeff, qCoeff, rCoeff);
    System.out.printf("Working precision: %d bits (~%d decimal digits)%n", bits, (int) (bits * Math.log10(2)));
    System.out.printf("First %d orthogonal polynomials in z = t^μ%n", N);
    System.out.println();

    try ( Real μ = new Real().set(mu, bits);
          RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(μ, pCoeff, qCoeff, rCoeff);
          Complex zeroV = new Complex())
    {
      zeroV.zero();
      MuntzPadeApproximant approx = (MuntzPadeApproximant) eq.evaluate(zeroV, 1, bits, null);
      Context ctx = approx.context;

      ComplexPolynomialSequence PnSeq = (ComplexPolynomialSequence) ctx.getFunctionMapping("Pn").instantiate();
      ComplexSequence αvSeq = (ComplexSequence) ctx.getFunctionMapping("αv").instantiate();
      ComplexSequence βvSeq = (ComplexSequence) ctx.getFunctionMapping("βv").instantiate();
      ComplexSequence hvSeq = (ComplexSequence) ctx.getFunctionMapping("hv").instantiate();

      // ── Denominator polynomials P_n(z) ──────────────────────────────────
      System.out.println("═".repeat(70));
      System.out.println("Denominator polynomials P_n(z)  [monic orthogonal, first kind]");
      System.out.println("═".repeat(70));
      System.out.printf("Recurrence: P_{n+1}(z) = (z − α_n)·P_n(z) − β_n·P_{n-1}(z)%n");
      try ( Complex α0 = new Complex() )
      {
        αvSeq.evaluate(0, bits, α0);
        System.out.printf("  α_0 = %s%n", α0);
      }
      System.out.println();

      String[] polyCols = { "n", "P_n(z)" };
      String[][] polyData = new String[N][2];
      for (int n = 0; n < N; n++)
      {
        try ( ComplexPolynomial Pn = approx.ops.evaluate(n, bits) )
        {
          Pn.setIndependentVariableName("z");
          polyData[n][0] = String.valueOf(n);
          polyData[n][1] = Pn.toString();
        }
      }
      new TextTable(polyCols, polyData).printTable();
      System.out.println();

      // ── Numerator polynomials Pn_n(z) ───────────────────────────────────
      System.out.println("═".repeat(70));
      System.out.println("Numerator polynomials Pn_n(z)  [associated, second kind]");
      System.out.println("═".repeat(70));
      System.out.printf("Recurrence: Pn_{n+1}(z) = (z − α_n)·Pn_n(z) − β_n·Pn_{n-1}(z)%n");
      try ( Complex h0 = new Complex() )
      {
        hvSeq.evaluate(0, bits, h0);
        System.out.printf("  h(0) = %s%n", h0);
      }
      System.out.println();

      String[][] assocData = new String[N][2];
      for (int n = 0; n < N; n++)
      {
        try ( ComplexPolynomial PnAssoc = PnSeq.evaluate(n, bits) )
        {
          PnAssoc.setIndependentVariableName("z");
          assocData[n][0] = String.valueOf(n);
          assocData[n][1] = PnAssoc.toString();
        }
      }
      new TextTable(polyCols, assocData).printTable();
      System.out.println();

      // ── Jacobi coefficients ─────────────────────────────────────────────
      System.out.println("═".repeat(70));
      System.out.println("Jacobi coefficients α_n, β_n, h_n");
      System.out.println("═".repeat(70));

      String[] jacobiCols = { "n", "α_n", "β_n", "h_n" };
      String[][] jacobiData = new String[N][4];
      try ( Complex αn = new Complex(); Complex βn = new Complex(); Complex hn = new Complex() )
      {
        for (int n = 0; n < N; n++)
        {
          αvSeq.evaluate(n, bits, αn);
          βvSeq.evaluate(n, bits, βn);
          hvSeq.evaluate(n, bits, hn);
          jacobiData[n][0] = String.valueOf(n);
          jacobiData[n][1] = αn.toString();
          jacobiData[n][2] = βn.toString();
          jacobiData[n][3] = hn.toString();
        }
      }
      new TextTable(jacobiCols, jacobiData).printTable();
      System.out.println();
    }
  }
}
