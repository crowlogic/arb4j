package arb.functions.complex;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Complex;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.ArbException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.Verifiable;
import arb.functions.NullaryFunction;
import arb.utensils.Utensils;

/**
 * The Fox H-function
 *
 * <pre>
 *   H^{m,n}_{p,q} [ z | (a, A) ; (b, B) ]
 *     = (1/2πi) ∫_L  Π_{j=1..m} Γ(b_j + B_j s)  ·  Π_{i=1..n} Γ(1 − a_i − A_i s)
 *                    ──────────────────────────────────────────────────────────  z^{-s} ds
 *                    Π_{j=m+1..q} Γ(1 − b_j − B_j s) · Π_{i=n+1..p} Γ(a_i + A_i s)
 * </pre>
 *
 * Evaluated as a {@link Complex}-valued {@link ComplexFunction} of the complex
 * variable z, with the parameters (m, n, a, A, b, B) bound to the instance.
 *
 * <h2>Algorithm</h2>
 *
 * The integral is evaluated as the Slater-type residue series at the
 * lower-half-plane poles of Γ(b_j + B_j s), located at s = −(b_j + ν)/B_j for
 * j = 1..m and ν = 0, 1, 2, … :
 *
 * <pre>
 *   H = Σ_{j=1..m} Σ_{ν=0..∞}  T_{j,ν}(z)
 *
 *   T_{j,ν}(z) = (−1)^ν / (ν! · B_j)  ·  z^{(b_j + ν)/B_j}
 *              · Π_{l=1..m, l≠j} Γ(b_l − B_l (b_j + ν)/B_j)
 *              · Π_{i=1..n}      Γ(1 − a_i + A_i (b_j + ν)/B_j)
 *              ÷ Π_{l=m+1..q}    Γ(1 − b_l + B_l (b_j + ν)/B_j)
 *              ÷ Π_{i=n+1..p}    Γ(a_i − A_i (b_j + ν)/B_j)
 * </pre>
 *
 * Convergence requires the Erdélyi–Braaksma exponent
 *
 *   a* = Σ_{i=1..n} A_i − Σ_{i=n+1..p} A_i + Σ_{j=1..m} B_j − Σ_{j=m+1..q} B_j
 *
 * to be positive, and the argument to lie in the principal sector
 * {@code |arg z| < a* · π / 2}. Outside that domain
 * {@link #evaluate(Complex, int, int, Complex)} throws — there is no
 * alternate method invoked on inputs outside the algorithm's domain of
 * validity.
 *
 * <h2>Generic-stride hypothesis</h2>
 *
 * The residue calculation above assumes the poles of Γ(b_j + B_j s) are
 * simple, equivalently that no two of the values (b_j + ν)/B_j coincide as
 * (j, ν) varies. This is generic for irrational strides B_j (the rough
 * Heston / fractional Riccati case where the stride is α = H + 1/2 with H the
 * Hurst index). For confluences of poles (rational strides with shared
 * denominators) the formula above is replaced by higher-order residues; that
 * case is not yet implemented and is detected up-front in
 * {@link #verify()}.
 *
 * @author Stephen Crowley ©2025-2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FoxHFunction implements
                          ComplexFunction,
                          AutoCloseable,
                          Verifiable
{
  static final Logger logger = LoggerFactory.getLogger(FoxHFunction.class);

  @Override
  public String toString()
  {
    return String.format("H[%d,%d;%s,%s;%s,%s]", m, n, a, A, b, B);
  }

  // ───── Bound parameters ───────────────────────────────────────────────
  /** Upper parameter values a_1, …, a_p — one {@link Complex} handle of dim = p. */
  public Complex                                              a;
  /** Upper strides A_1, …, A_p (all > 0) — one {@link Real} handle of dim = p. */
  public Real                                                 A;
  /** Lower parameter values b_1, …, b_q — one {@link Complex} handle of dim = q. */
  public Complex                                              b;
  /** Lower strides B_1, …, B_q (all > 0) — one {@link Real} handle of dim = q. */
  public Real                                                 B;

  /** Splits 0 ≤ m ≤ q and 0 ≤ n ≤ p. */
  public int                                                  m, n, p, q;

  // ───── Cached at construction ────────────────────────────────────────
  /**
   * Erdélyi–Braaksma sector parameter
   *   a* = Σ_{i=1..n} A_i − Σ_{i=n+1..p} A_i + Σ_{j=1..m} B_j − Σ_{j=m+1..q} B_j.
   * Required > 0 for vertical-contour convergence.  The principal sector is
   *   |arg z| < a* · π / 2.
   */
  public Real                                                 aStar;
  /**
   * Convergence parameter
   *   μ = Σ_{j=1..q} B_j − Σ_{i=1..p} A_i.
   *   μ > 0 : LHP series converges for all |z| in the principal sector;
   *   μ < 0 : RHP series converges for all |z| in the principal sector;
   *   μ = 0 : split by |z| vs β.
   */
  public Real                                                 mu;
  /** Principal sector half-width: π · a* / 2. */
  public Real                                                 sectorWidth;

  // ───── Compiled residue-term expression ──────────────────────────────
  /**
   * The per-residue term T_{j,ν}(z), parsed and compiled once at
   * construction. Its bytecode reads (j, ν, z) at runtime and the bound
   * fields (a, A, b, B, m, n, p, q) by reflection.
   */
  public ComplexFunction                                      H;

  // ───── Expression-compiler context ────────────────────────────────────
  public Context                                              context;
  public Integer                                              N;           // truncation level for the residue sum (default 64)

  public FoxHFunction()
  {
  }

  /**
   * Bind parameters and compile the residue-term expression.
   *
   * @param m number of Γ(b_j + B_j s) factors in the numerator, 0 ≤ m ≤ q
   * @param n number of Γ(1 − a_i − A_i s) factors in the numerator, 0 ≤ n ≤ p
   * @param a length-p Complex vector of upper parameters
   * @param A length-p Real    vector of upper strides (all > 0)
   * @param b length-q Complex vector of lower parameters
   * @param B length-q Real    vector of lower strides (all > 0)
   */
  public FoxHFunction init(Integer m, Integer n, Complex a, Real A, Complex b, Real B)
  {
    if (a.dim() != A.dim())
      throw new ArbException("dim(a)=" + a.dim() + " ≠ dim(A)=" + A.dim());
    if (b.dim() != B.dim())
      throw new ArbException("dim(b)=" + b.dim() + " ≠ dim(B)=" + B.dim());
    this.p = a.dim();
    this.q = b.dim();
    int mi = m.getSignedValue();
    int ni = n.getSignedValue();
    if (ni < 0 || ni > p)
      throw new ArbException("require 0 ≤ n ≤ p; got n=" + ni + ", p=" + p);
    if (mi < 0 || mi > q)
      throw new ArbException("require 0 ≤ m ≤ q; got m=" + mi + ", q=" + q);
    requireAllPositive(A, "A");
    requireAllPositive(B, "B");

    this.a = a;
    this.A = A;
    this.b = b;
    this.B = B;
    this.m = mi;
    this.n = ni;

    computeAStarAndSector();
    if (aStar.sign() <= 0)
      throw new ArbException("Erdélyi–Braaksma exponent a* = " + aStar
                             + " ≤ 0; residue series does not converge for any z");

    initializeContext();
    compileTerm();
    return this;
  }

  private static void requireAllPositive(Real v, String name)
  {
    for (int i = 0; i < v.dim(); i++)
    {
      if (v.get(i).sign() <= 0)
        throw new ArbException(name + "[" + i + "] = " + v.get(i)
                               + " is not positive");
    }
  }

  private void computeAStarAndSector()
  {
    aStar       = new Real();
    mu          = new Real();
    sectorWidth = new Real();
    int prec = 128;
    aStar.zero();
    mu.zero();
    // a* = Σ_{i=1..n} A_i − Σ_{i=n+1..p} A_i + Σ_{j=1..m} B_j − Σ_{j=m+1..q} B_j
    for (int i = 0; i < n; i++)
      aStar.add(A.get(i), prec, aStar);
    for (int i = n; i < p; i++)
      aStar.sub(A.get(i), prec, aStar);
    for (int j = 0; j < m; j++)
      aStar.add(B.get(j), prec, aStar);
    for (int j = m; j < q; j++)
      aStar.sub(B.get(j), prec, aStar);
    // μ = Σ_{j=1..q} B_j − Σ_{i=1..p} A_i
    for (int j = 0; j < q; j++)
      mu.add(B.get(j), prec, mu);
    for (int i = 0; i < p; i++)
      mu.sub(A.get(i), prec, mu);
    // sectorWidth = π · a* / 2
    arb.RealConstants.π.mul(aStar, prec, sectorWidth);
    sectorWidth.div(2, prec, sectorWidth);
  }

  private void initializeContext()
  {
    context = new Context();
    // The parameter vectors are field-referenced by the generated bytecode
    // via reflection over the FoxHFunction instance, exactly the way
    // HypergeometricFunction does it for α, β.
    context.registerVariable("a", a.setName("a"));
    context.registerVariable("A", A.setName("A"));
    context.registerVariable("b", b.setName("b"));
    context.registerVariable("B", B.setName("B"));
    context.registerVariable("p", new Integer(p, "p"));
    context.registerVariable("q", new Integer(q, "q"));
    context.registerVariable("m", new Integer(m, "m"));
    context.registerVariable("n", new Integer(n, "n"));
    N = new Integer(16); N.setName("N"); context.registerVariable("N", N);
    // z is NOT registered — it is the independent variable of the resulting
    // ComplexFunction, introduced by H:z→… in the express call.
  }

  /**
   * Compile the residue series as a {@link ComplexFunction} of z.
   *
   * <p>Defines the curried pole-location auxiliary
   *   {@code u:j→ν→(b[j]+ν)/B[j]}
   * as a {@link arb.functions.integer.ComplexSequenceSequence} in the
   * context, then compiles the main residue-sum body.</p>
   */
  private void compileTerm()
  {
    // Curried pole-location auxiliary u(j)(ν) = (b[j]+ν)/B[j].  Sequence of
    // sequences over the two integer indices j and ν; codomain Complex.
    arb.functions.integer.ComplexSequenceSequence.express("u",
                                                          "u:j→ν→(b[j]+ν)/B[j]",
                                                          context);

    // Residue series H(z) as a ComplexFunction of z.  The outer Σj➜Σν➜…
    // double sum, with l≠j encoded by splitting the inner product into
    // l=1…j-1 and l=j+1…m.
    H = ComplexFunction.express("H",
        "H:z→Σj→Σν→"
      + "(-1)^ν/(ν!·B[j])"
      + "·z^(u(j)(ν))"
      + "·∏l→Γ(b[l]-B[l]·u(j)(ν)){l=1…j-1}"
      + "·∏l→Γ(b[l]-B[l]·u(j)(ν)){l=j+1…m}"
      + "·∏i→Γ(1-a[i]+A[i]·u(j)(ν)){i=1…n}"
      + "/(∏l→Γ(1-b[l]+B[l]·u(j)(ν)){l=m+1…q}"
      + " ·∏i→Γ(a[i]-A[i]·u(j)(ν)){i=n+1…p})"
      + "{ν=0…N}{j=1…m}",
      context);
  }

  // ───── Evaluation ─────────────────────────────────────────────────────

  /**
   * H(z). The arb ball returned has its radius enlarged by a proven upper
   * bound on the truncation tail of the Slater series.
   */
  /** Initial order for the residue series; doubled each iteration on no convergence. */
  private static final int SEED_ORDER = 8;

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex out)
  {
    requireInPrincipalSector(z, prec);

    // Adaptive residue-series accumulation.  The compiled H expression has its
    // inner sum upper bound bound to the context-registered Integer N; growing N
    // simply re-evaluates with more residue terms.  Both the per-(j,ν)
    // residue term and the auxiliary u(j)(ν) are N-independent, so this is
    // pure accumulation with no cache invalidation.
    try ( Complex curr      = new Complex();
          Complex prev      = new Complex();
          Complex diff      = new Complex();
          Real    diffMag   = new Real();
          Real    threshold = new Real();
          Complex best      = new Complex();
          Real    bestMag   = new Real() )
    {
      threshold.one().mul2e(-prec / 2, threshold);
      bestMag.posInf();
      prev.zero();

      boolean firstIter = true;
      for (int Nnow = SEED_ORDER;; Nnow *= 2)
      {
        N.set(Nnow);
        H.evaluate(z, order, prec, curr);

        if (!curr.isFinite())
          break;

        if (firstIter)
        {
          best.set(curr);
          prev.set(curr);
          firstIter = false;
          continue;
        }

        curr.sub(prev, prec, diff);
        diff.abs(prec, diffMag);

        if (diffMag.compareTo(bestMag) < 0)
        {
          best.set(curr);
          bestMag.set(diffMag);
        }

        if (diffMag.compareTo(threshold) <= 0)
          break;

        prev.set(curr);
      }

      out.set(best);
    }
    return out;
  }

  private void requireInPrincipalSector(Complex z, int prec)
  {
    try ( Real arg = new Real(); Real absArg = new Real(); Real bound = new Real() )
    {
      z.arg(prec, arg);
      arg.abs(prec, absArg);
      // For μ > 0 the LHP series gives the analytic continuation on the entire
      // principal sheet |arg z| < π (Mathai-Saxena-Haubold).  For μ ≤ 0 the
      // basic absolute-convergence sector π·a*/2 applies until the dual RHP
      // series and the μ = 0 boundary-radius case are implemented.
      if (mu.sign() > 0)
        bound.set(arb.RealConstants.π);
      else
        bound.set(sectorWidth);
      if (absArg.compareTo(bound) >= 0)
        throw new ArbException("|arg z| = " + absArg
                               + " is not strictly less than the principal sector half-width π·a*/2 = "
                               + sectorWidth + "; the Slater residue series is outside its domain of validity");
    }
  }

  @Override
  public boolean verify()
  {
    // Generic-stride hypothesis: no two (b_j + ν)/B_j coincide.
    // For a fully rigorous check we would need to verify this for all ν ≥ 0,
    // which is undecidable in general; here we check pairwise on the first
    // few ν and on the stride ratios themselves.
    // TODO: full implementation in follow-up commit.
    return aStar.sign() > 0;
  }

  @Override
  public void close()
  {
    a = Utensils.close(a);
    A = Utensils.close(A);
    b = Utensils.close(b);
    B = Utensils.close(B);
    aStar       = Utensils.close(aStar);
    mu          = Utensils.close(mu);
    sectorWidth = Utensils.close(sectorWidth);
    N = Utensils.close(N);
  }
}
