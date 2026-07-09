package arb.applications;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.functions.complex.RiccatiMuntzPadeFunctional;
import arb.functions.integer.ComplexPolynomialSequence;

/**
 * Command-line utility that prints the first N orthogonal polynomials of the
 * numerator and denominator of the spectral-tau Padé solution of the fractional
 * Riccati equation with constant (time-independent) polynomial coefficients.
 *
 * <h2>Mathematical background</h2>
 *
 * Given μ ∈ (0,1] and the fractional Riccati equation
 *
 * <pre>
 *   D^μ y(t) = P + Q·y(t) + R·y(t)²,   y(0) = 0
 * </pre>
 *
 * the Müntz–Padé method expands the solution in the Müntz series
 *
 * <pre>
 *   y(t) = Σ_{k≥1} a_k · t^{kμ}
 * </pre>
 *
 * The coefficients a_k satisfy a computable recurrence. A quasi-definite moment
 * functional is then defined by m(k) = a_{k+1}, and the Chebyshev/Wheeler
 * σ-table produces the monic orthogonal polynomial sequence {P_n(z)} (denominator
 * basis) and associated polynomials of the second kind {Pn_n(z)} (numerator
 * basis), both expressed in the Müntz basis variable z = t^μ.
 *
 * <p>
 * The denominator Padé polynomial of order M is assembled as
 * Q_hat(M, z) = z^M · P(M, 1/z) (reversed coefficients of P_M), and the
 * numerator as Phi_num(M, z) from the associated polynomials Pn_M.
 *
 * <h2>Usage</h2>
 *
 * <pre>
 *   bin/run arb.applications.MuntzPadePolynomialPrinter mu P Q R N [bits]
 * </pre>
 *
 * Example: the tanh oracle (μ=1, P=1, Q=0, R=−1):
 * <pre>
 *   bin/run arb.applications.MuntzPadePolynomialPrinter 1 1 0 -1 5
 * </pre>
 *
 * @author Stephen Crowley ©2024–2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class MuntzPadePolynomialPrinter
{
  static final int DEFAULT_BITS = 128;

  public static void main(String[] args)
  {
    if (args.length < 5)
    {
      System.err.println("Usage: MuntzPadePolynomialPrinter mu P Q R N [bits]");
      System.err.println();
      System.err.println("  mu    — fractional order μ ∈ (0,1], e.g. 1, 1/2, 7/10");
      System.err.println("  P     — constant coefficient P, e.g. 1");
      System.err.println("  Q     — constant coefficient Q, e.g. 0");
      System.err.println("  R     — constant coefficient R, e.g. -1");
      System.err.println("  N     — number of orthogonal polynomials to print");
      System.err.println("  bits  — working precision in bits (default: " + DEFAULT_BITS + ")");
      System.err.println();
      System.err.println("Equation: D^μ y(t) = P + Q·y(t) + R·y(t)²,  y(0) = 0");
      System.exit(1);
    }

    String muStr = args[0];
    String pStr  = args[1];
    String qStr  = args[2];
    String rStr  = args[3];
    int    N     = java.lang.Integer.parseInt(args[4]);
    int    bits  = args.length > 5 ? java.lang.Integer.parseInt(args[5]) : DEFAULT_BITS;

    System.out.println("Müntz–Padé orthogonal polynomials of the spectral-tau solution");
    System.out.println("of the constant-coefficient (time-independent) fractional Riccati equation");
    System.out.printf("  D^%s y(t) = %s + %s·y(t) + %s·y(t)²,  y(0) = 0%n", muStr, pStr, qStr, rStr);
    System.out.printf("Working precision: %d bits (~%d decimal digits)%n", bits, (int) (bits * Math.log10(2)));
    System.out.printf("First %d orthogonal polynomials in z = t^μ%n", N);
    System.out.println();

    try ( Real μ = new Real().set(muStr, bits);
          RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(μ, pStr, qStr, rStr);
          Complex zeroV = new Complex())
    {
      zeroV.zero();
      eq.evaluate(zeroV, 1, bits, null);

      // Retrieve the Müntz coefficient sequence a(k) ∈ ℂ[v] from the functional.
      // For constant P, Q, R the a(k) are scalar ComplexPolynomials (degree 0 in v).
      ComplexPolynomialSequence a = eq.muntzBasis();

      // Evaluate a(k) at v = 0 for k = 1 .. 2N to obtain the scalar moment
      // sequence m(k-1) = a(k) of the quasi-definite moment functional.
      int         moments = 2 * N;
      ComplexPolynomial[] m = new ComplexPolynomial[moments];
      try ( ComplexPolynomial aK = new ComplexPolynomial();
            Integer kInt = new Integer() )
      {
        for (int k = 1; k <= moments; k++)
        {
          kInt.set(k);
          a.evaluate(kInt, 1, bits, aK);
          // For constant P, Q, R each a(k) is a degree-0 polynomial (a scalar);
          // evaluate at v = 0 to extract the constant term as a ComplexPolynomial.
          ComplexPolynomial mk = new ComplexPolynomial();
          try ( Complex vZero = new Complex();
                Complex val   = new Complex() )
          {
            vZero.zero();
            aK.evaluate(vZero, 1, bits, val);
            mk.fitLength(1);
            mk.set(0, val);
          }
          m[k - 1] = mk;
        }
      }

      // ── Chebyshev/Wheeler σ-table ──────────────────────────────────────
      // σ(j, k) = L[x^k · P_j(x)] with L[x^k] = m(k).
      //
      //   σ(0, k)   = m(k)
      //   σ(j, k)   = σ(j-1, k+1) − α(j-1)·σ(j-1, k) − β(j-1)·σ(j-2, k)
      //
      //   h(j)  = σ(j, j)
      //   α(j)  = σ(j, j+1)/h(j) − σ(j-1, j)/h(j-1)
      //   β(j)  = h(j)/h(j−1),   β(0) = 0
      Complex[][] sigma = new Complex[N + 1][moments + 1];
      Complex[]   hArr = new Complex[N];
      Complex[]   alphaArr = new Complex[N];
      Complex[]   betaArr  = new Complex[N];

      // Initialise σ(0, k) = m(k).
      for (int k = 0; k < moments; k++)
      {
        sigma[0][k] = new Complex().set(m[k].get(0));
      }

      try ( Complex tmp1 = new Complex();
            Complex tmp2 = new Complex();
            Complex tmp3 = new Complex() )
      {
        for (int j = 0; j < N; j++)
        {
          // Fill σ(j, k) for this row.
          if (j == 0)
          {
            // Row 0 is already filled.
          }
          else
          {
            for (int k = 0; k < moments - j; k++)
            {
              // σ(j, k) = σ(j-1, k+1) − α(j-1)·σ(j-1, k) − β(j-1)·σ(j-2, k)
              sigma[j][k] = new Complex();
              sigma[j - 1][k + 1].sub(tmp1.set(0), bits, sigma[j][k]);
              // subtract α(j-1)·σ(j-1, k)
              alphaArr[j - 1].mul(sigma[j - 1][k], bits, tmp2);
              sigma[j][k].sub(tmp2, bits, sigma[j][k]);
              // subtract β(j-1)·σ(j-2, k)
              if (j >= 2)
              {
                betaArr[j - 1].mul(sigma[j - 2][k], bits, tmp3);
                sigma[j][k].sub(tmp3, bits, sigma[j][k]);
              }
            }
          }

          // h(j) = σ(j, j)
          hArr[j] = new Complex().set(sigma[j][j]);

          // α(j) = σ(j, j+1)/h(j) − σ(j-1, j)/h(j-1)
          alphaArr[j] = new Complex();
          sigma[j][j + 1].div(hArr[j], bits, alphaArr[j]);
          if (j > 0)
          {
            Complex correction = new Complex();
            sigma[j - 1][j].div(hArr[j - 1], bits, correction);
            alphaArr[j].sub(correction, bits, alphaArr[j]);
            correction.close();
          }

          // β(j) = h(j)/h(j−1)  [β(0) = 0]
          betaArr[j] = new Complex();
          if (j == 0)
          {
            betaArr[j].zero();
          }
          else
          {
            hArr[j].div(hArr[j - 1], bits, betaArr[j]);
          }
        }
      }

      // ── Build orthogonal polynomials P_n(z) via the three-term recurrence ──
      //   P_0(z) = 1
      //   P_1(z) = z − α(0)
      //   P_{n+1}(z) = (z − α(n))·P_n(z) − β(n)·P_{n-1}(z)
      //
      // The denominator Padé polynomial of order M is
      //   Q_hat(M, z) = z^M · P(M, 1/z) = sum_{j=0..M} P(M)[M-j]·z^j

      System.out.println("═".repeat(70));
      System.out.println("Denominator polynomials P_n(z)  [monic orthogonal, first kind]");
      System.out.println("═".repeat(70));
      System.out.println("Recurrence: P_{n+1}(z) = (z − α_n)·P_n(z) − β_n·P_{n-1}(z)");
      System.out.printf("  α_0 = %s%n", alphaArr[0]);
      System.out.println();

      ComplexPolynomial[] Pn = new ComplexPolynomial[N];
      Pn[0] = new ComplexPolynomial();
      Pn[0].fitLength(1);
      Pn[0].set(0, new Complex().one());

      if (N > 1)
      {
        Pn[1] = new ComplexPolynomial();
        Pn[1].fitLength(2);
        Pn[1].set(1, new Complex().one());                    // z coefficient = 1
        Pn[1].set(0, new Complex().neg(alphaArr[0]));          // constant = −α(0)
      }

      for (int n = 2; n < N; n++)
      {
        // (z − α(n-1))·Pn(n-1)
        ComplexPolynomial zMinusAlpha = new ComplexPolynomial();
        zMinusAlpha.fitLength(2);
        zMinusAlpha.set(1, new Complex().one());
        zMinusAlpha.set(0, new Complex().neg(alphaArr[n - 1]));

        ComplexPolynomial term1 = new ComplexPolynomial();
        zMinusAlpha.mul(Pn[n - 1], bits, term1);
        zMinusAlpha.close();

        // β(n-1)·P_{n-2}
        ComplexPolynomial term2 = new ComplexPolynomial();
        Pn[n - 2].mul(betaArr[n - 1], bits, term2);

        // P_n = term1 − term2
        Pn[n] = new ComplexPolynomial();
        term1.sub(term2, bits, Pn[n]);
        term1.close();
        term2.close();
      }

      for (int n = 0; n < N; n++)
      {
        Pn[n].setIndependentVariableName("z");
        System.out.printf("  P_%d(z) = %s%n", n, Pn[n]);
      }
      System.out.println();

      // ── Build associated polynomials Pn_n(z) (second kind) ──────────────
      //   Pn_0(z) = 0
      //   Pn_1(z) = h(0)
      //   Pn_{n+1}(z) = (z − α(n))·Pn_n(z) − β(n)·Pn_{n-1}(z)
      //
      // The numerator Padé polynomial of order M is assembled from Pn_M.

      System.out.println("═".repeat(70));
      System.out.println("Numerator polynomials Pn_n(z)  [associated, second kind]");
      System.out.println("═".repeat(70));
      System.out.println("Recurrence: Pn_{n+1}(z) = (z − α_n)·Pn_n(z) − β_n·Pn_{n-1}(z)");
      System.out.printf("  h(0) = %s%n", hArr[0]);
      System.out.println();

      ComplexPolynomial[] PnAssoc = new ComplexPolynomial[N];
      PnAssoc[0] = new ComplexPolynomial();
      PnAssoc[0].fitLength(1);
      PnAssoc[0].set(0, new Complex().zero());

      if (N > 1)
      {
        PnAssoc[1] = new ComplexPolynomial();
        PnAssoc[1].fitLength(1);
        PnAssoc[1].set(0, new Complex().set(hArr[0]));
      }

      for (int n = 2; n < N; n++)
      {
        // (z − α(n-1))·Pn_{n-1}
        ComplexPolynomial zMinusAlpha = new ComplexPolynomial();
        zMinusAlpha.fitLength(2);
        zMinusAlpha.set(1, new Complex().one());
        zMinusAlpha.set(0, new Complex().neg(alphaArr[n - 1]));

        ComplexPolynomial term1 = new ComplexPolynomial();
        zMinusAlpha.mul(PnAssoc[n - 1], bits, term1);
        zMinusAlpha.close();

        // β(n-1)·Pn_{n-2}
        ComplexPolynomial term2 = new ComplexPolynomial();
        PnAssoc[n - 2].mul(betaArr[n - 1], bits, term2);

        // Pn_n = term1 − term2
        PnAssoc[n] = new ComplexPolynomial();
        term1.sub(term2, bits, PnAssoc[n]);
        term1.close();
        term2.close();
      }

      for (int n = 0; n < N; n++)
      {
        PnAssoc[n].setIndependentVariableName("z");
        System.out.printf("  Pn_%d(z) = %s%n", n, PnAssoc[n]);
      }
      System.out.println();

      // ── Jacobi coefficients summary ────────────────────────────────────
      System.out.println("═".repeat(70));
      System.out.println("Jacobi coefficients α_n, β_n, h_n");
      System.out.println("═".repeat(70));
      System.out.printf("  %-6s  %-42s  %-42s  %-42s%n", "n", "α_n", "β_n", "h_n");
      System.out.println("  " + "-".repeat(132));
      for (int n = 0; n < N; n++)
      {
        System.out.printf("  %-6d  %-42s  %-42s  %-42s%n",
                          n,
                          alphaArr[n],
                          betaArr[n],
                          hArr[n]);
      }
      System.out.println();

      // ── Cleanup ────────────────────────────────────────────────────────
      for (int n = 0; n < N; n++)
      {
        if (Pn[n] != null) Pn[n].close();
        if (PnAssoc[n] != null) PnAssoc[n].close();
        if (hArr[n] != null) hArr[n].close();
        if (alphaArr[n] != null) alphaArr[n].close();
        if (betaArr[n] != null) betaArr[n].close();
      }
      for (int j = 0; j <= N; j++)
      {
        for (int k = 0; k < moments + 1; k++)
        {
          if (sigma[j][k] != null) sigma[j][k].close();
        }
      }
      for (int k = 0; k < moments; k++)
      {
        if (m[k] != null) m[k].close();
      }
    }
  }
}
