package arb.functions.complex;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Real;
import junit.framework.TestCase;

/**
 * Operational verification of the theorem <b>Analytic Continuation via
 * Diagonal Padé Sequence in Capacity</b> (Stahl's convergence theorem,
 * Theorem "Stahl's convergence theorem" of
 * {@code docs/TheRiemannHilbertViewOfPadeApproximationAndGlobalAnalyticContinuation.tex}):
 * let g(z) = Σ_k c_k z^k be a formal series analytic in |z| &lt; ρ₀ that
 * continues analytically to D* = ℂ ∖ K*, where K* is the compact of minimal
 * logarithmic capacity carrying the branch cuts. Then the diagonal Padé
 * sequence [N/N]_g = P_N/Q_N converges to g in capacity on every compact
 * subset of D*, with error governed by the Green's function G_{D*}(z, ∞):
 *
 * <pre>
 *   |g(z) − [N/N]_g(z)| ≍ exp(−2N·G_{D*}(z, ∞))
 * </pre>
 *
 * <p>
 * The witness is g(z) = log(1+z) with ρ₀ = 1 and K* = (−∞, −1]. The conformal
 * map w = (√(1+z) − 1)/(√(1+z) + 1) of D* onto the unit disk gives
 * exp(−G_{D*}(z, ∞)) = |w|, so at z = 3 (where √4 = 2, w = 1/3) the theorem
 * predicts the exact per-step error contraction
 *
 * <pre>
 *   |g(3) − [N+1/N+1](3)| / |g(3) − [N/N](3)|  ⟶  1/9,
 * </pre>
 *
 * even though |3| = 3 lies strictly outside the disk of convergence and the
 * degree-2N Taylor partial sums diverge there like 3^{2N}/(2N). The
 * approximants are built purely from the Maclaurin data c_0 … c_{2N} by
 * {@link DiagonalPadePair#fromMaclaurinSeries}, so every digit of agreement
 * beyond |z| = 1 is analytic continuation performed by the Padé sequence.
 *
 * <h2>Covered claims of the theorem</h2>
 * <ol>
 * <li>The defining matching condition: Q_N·g − P_N = O(z^{2N+1}) exactly.</li>
 * <li>Convergence inside the disk of convergence |z| &lt; ρ₀.</li>
 * <li>Analytic continuation strictly past ρ₀: convergence at z = 3 ∈ D*
 * while the Taylor partial sums of identical order diverge.</li>
 * <li>The Green's-function geometric rate exp(−2G_{D*}(3, ∞)) = 1/9.</li>
 * <li>The continuous blow-up along K* is mapped to the discrete, isolated
 * roots of Q_N, all of which lie on the branch cut (−∞, −1] — the support of
 * the equilibrium measure μ_{K*}.</li>
 * <li>The indefinite / singular Hankel case is signalled by the sentinel of
 * {@link DiagonalPadePair#isSingularSentinel} rather than a spurious pair.</li>
 * </ol>
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class PadeAnalyticContinuationInCapacityTest extends
                                                    TestCase
{
  private static final int BITS = 256;

  /**
   * Maclaurin series of g(z) = log(1+z): c_0 = 0, c_k = (−1)^{k+1}/k for
   * k = 1..order.
   */
  private static ComplexPolynomial logSeries(int order)
  {
    ComplexPolynomial g = new ComplexPolynomial();
    g.fitLength(order + 1);
    g.setLength(order + 1);
    g.get(0).zero();
    for (int k = 1; k <= order; k++)
    {
      Real re = g.get(k).re();
      re.one().div(k, BITS, re);
      if (k % 2 == 0)
      {
        re.neg(re);
      }
      g.get(k).im().zero();
    }
    return g;
  }

  /** |[N/N]_g(z) − log(1+z)| as a double, at real z given as a string. */
  private static double errorAt(int N, String zStr)
  {
    try ( ComplexPolynomial g = logSeries(2 * N);
          DiagonalPadePair pade = DiagonalPadePair.fromMaclaurinSeries(g, N, BITS);
          Complex z = new Complex();
          Complex approx = new Complex();
          Real onePlusZ = new Real();
          Real ref = new Real())
    {
      z.set(zStr, BITS);
      pade.evaluate(z, 1, BITS, approx);
      onePlusZ.set(z.re()).add(1, BITS, onePlusZ).log(BITS, ref);
      return Math.abs(approx.re().sub(ref, BITS, new Real()).doubleValue());
    }
  }

  /**
   * Claim 1 — the defining Padé matching condition: the residual
   * Q_N(z)·g(z) − P_N(z) vanishes through order z^{2N} exactly, so the
   * residual at the origin is O(z^{2N+1}).
   */
  public void testMatchingConditionResidualVanishesThroughOrderTwoN()
  {
    final int N = 6;
    try ( ComplexPolynomial g = logSeries(2 * N);
          DiagonalPadePair pade = DiagonalPadePair.fromMaclaurinSeries(g, N, BITS);
          ComplexPolynomial Qg = new ComplexPolynomial();
          ComplexPolynomial residual = new ComplexPolynomial())
    {
      pade.Q.mul(g, BITS, Qg);
      Qg.sub(pade.P, BITS, residual);
      for (int k = 0; k <= 2 * N; k++)
      {
        assertTrue("coefficient " + k + " of Q·g − P must contain 0, got " + residual.get(k),
                   residual.get(k).containsZero());
      }
    }
  }

  /**
   * Claim 2 — inside the disk of convergence (z = 1/2 &lt; ρ₀ = 1) the
   * diagonal sequence converges rapidly: [10/10] matches log(3/2) far beyond
   * double precision.
   */
  public void testConvergenceInsideDiskOfConvergence()
  {
    assertTrue("[10/10] at z=1/2 within the disk of convergence",
               errorAt(10, "1/2") < 1e-15);
  }

  /**
   * Claim 3 — analytic continuation strictly past ρ₀ = 1: at z = 3 ∈ D* the
   * errors decrease strictly monotonically in N and reach ~5.8·10⁻¹⁰ at
   * N = 10, while the degree-2N Taylor partial sum built from the identical
   * Maclaurin data diverges like 3^{2N}/(2N) (≈ 1.29·10⁸ at N = 10).
   */
  public void testAnalyticContinuationBeyondRadiusOfConvergence()
  {
    double prev = Double.MAX_VALUE;
    for (int N = 2; N <= 10; N++)
    {
      double err = errorAt(N, "3");
      assertTrue("Padé error at z=3 must decrease strictly: N=" + N + " gave " + err
                 + " after " + prev,
                 err < prev);
      prev = err;
    }
    assertTrue("[10/10] error at z=3 is below 1e-9, got " + prev, prev < 1e-9);

    // The same Maclaurin data, summed directly, diverges at z = 3.
    try ( ComplexPolynomial g = logSeries(20);
          Complex z = new Complex();
          Complex taylor = new Complex())
    {
      z.set("3", BITS);
      g.evaluate(z, 1, BITS, taylor);
      assertTrue("degree-20 Taylor partial sum diverges at z=3, got " + taylor,
                 Math.abs(taylor.re().doubleValue()) > 1e7);
    }
  }

  /**
   * Claim 4 — the Green's-function rate: exp(−2·G_{D*}(3, ∞)) =
   * ((√4−1)/(√4+1))² = 1/9, so successive error ratios at z = 3 settle onto
   * 1/9 ≈ 0.1111 (measured 0.1115…0.1126 for N = 4…9).
   */
  public void testGreensFunctionGeometricRate()
  {
    double prev = errorAt(4, "3");
    for (int N = 5; N <= 10; N++)
    {
      double curr  = errorAt(N, "3");
      double ratio = curr / prev;
      assertTrue("error contraction at z=3 obeys the Green's-function rate 1/9: N=" + N
                 + " gave ratio " + ratio,
                 ratio > 0.08 && ratio < 0.15);
      prev = curr;
    }
  }

  /**
   * Claim 5 — the roots of Q_N all lie on the branch cut K* = (−∞, −1]: the
   * normalized root-counting measure converges weakly to the equilibrium
   * measure μ_{K*}, so the continuous Volterra-style blow-up along the cut is
   * mapped to a discrete, isolated set of denominator roots. At N = 8 the
   * roots are −50.365, −9.836, −4.215, −2.449, −1.690, −1.311, −1.113,
   * −1.020 — every one real and &lt; −1.
   */
  public void testDenominatorRootsCondenseOnBranchCut()
  {
    final int N = 8;
    try ( ComplexPolynomial g = logSeries(2 * N);
          DiagonalPadePair pade = DiagonalPadePair.fromMaclaurinSeries(g, N, BITS))
    {
      try ( Complex roots = pade.Q.roots(BITS))
      {
        assertEquals("Q_8 has 8 roots", 8, roots.dim());
        for (int j = 0; j < roots.dim(); j++)
        {
          double re = roots.get(j).re().doubleValue();
          double im = roots.get(j).im().doubleValue();
          assertTrue("root " + roots.get(j) + " lies on the branch cut (−∞,−1]: re < −1",
                     re < -1);
          assertTrue("root " + roots.get(j) + " lies on the branch cut (−∞,−1]: im ≈ 0",
                     Math.abs(im) < 1e-30);
        }
      }
    }
  }

  /**
   * Claim 6 — an indefinite moment functional (singular Hankel system) is
   * signalled by the sentinel pair rather than a fabricated approximant: the
   * constant series g ≡ 1 has an identically zero Hankel matrix at every
   * order M ≥ 1.
   */
  public void testSingularHankelSystemYieldsSentinel()
  {
    try ( ComplexPolynomial g = new ComplexPolynomial())
    {
      g.fitLength(1);
      g.setLength(1);
      g.get(0).one();
      try ( DiagonalPadePair pade = DiagonalPadePair.fromMaclaurinSeries(g, 2, BITS))
      {
        assertTrue("zero Hankel matrix at M=2 marks the singular sentinel",
                   pade.isSingularSentinel());
      }
    }
  }
}
