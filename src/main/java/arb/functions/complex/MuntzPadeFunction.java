package arb.functions.complex;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.functions.ComplexFunctional;
import arb.functions.integer.ComplexFunctionSequence;
import arb.functions.integer.Sequence;
import arb.solvers.HankelSolver;

/**
 * Müntz–Padé re-summation of a Puiseux power series in {t^{kμ}}_{k≥1} into a
 * globally convergent diagonal Padé approximant in z = t^μ, currying the
 * external parameter v through the Müntz coefficient sequence.
 *
 * <p>
 * The mathematical object is fully characterized by the pair (μ, k ↦ v ↦
 * a_k(v)): a fractional order μ ∈ (0,1), and {@link Sequence} of v-dependent
 * Müntz coefficients. The formal series at fixed v
 *
 * <pre>
 *   y(t; v) = Σ_{k≥1} a_k(v) · t^{kμ}
 * </pre>
 *
 * has finite z-radius determined by complex singularities of the underlying
 * dynamics at v, but the diagonal (M, M) Padé approximant
 *
 * <pre>
 *   R_M(z; v) = P_M(z; v) / Q_M(z; v),     z = t^μ,
 * </pre>
 *
 * built from the first 2M coefficients via a Hankel system, converges to the
 * meromorphic continuation under the de Montessus de Ballore and
 * Nuttall–Pommerenke theorems. Order M is selected as the smallest integer for
 * which the successive-difference bound
 *
 * <pre>
 *   |y(t; v) − R_M(t^μ; v)| ≤ |Δ_M(z)|² / (|Δ_{M-1}(z)| − |Δ_M(z)|)
 * </pre>
 *
 * falls below 2^(−bits), where Δ_k(z) = R_k(z; v) − R_{k-1}(z; v).
 *
 * <p>
 * As a {@link ComplexFunctional}, this object IS the curry v ↦ (t ↦ R_M(t; v)).
 * Calling {@link #evaluate(Complex, int, int, ComplexFunction)} at a Fourier
 * point v returns a fresh {@link MuntzPadeApproximant} — a callable
 * {@link ComplexFunction} of t bound to the Padé pair (P_M, Q_M) computed at
 * that v. Subclasses (and direct callers) supply the curried coefficient
 * sequence; everything else — the Hankel solve, the order-selection loop, the
 * error bound — belongs to the re-summation itself and lives here.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class MuntzPadeFunction implements
                               ComplexFunctional,
                               AutoCloseable
{

  private static final Logger    log  = LoggerFactory.getLogger(MuntzPadeFunction.class);

  /** Fractional order μ ∈ (0,1). */
  public Real                    α;

  /** Curried Müntz coefficient sequence k ↦ v ↦ a_k(v). */
  public ComplexFunctionSequence a;

  /** Optional name for typeset/print purposes. */
  protected String               name;

  /**
   * Stable matrix backing the Padé denominator coefficients q_1..q_M during a
   * single {@link #solveHankel} call. Resized in place to the current M.
   */
  private final ComplexMatrix    qMat = new ComplexMatrix().setName("q");

  public MuntzPadeFunction()
  {

  }

  public MuntzPadeFunction(Real α, ComplexFunctionSequence a)
  {
    this.α = α;
    this.a = a;
  }

  public MuntzPadeFunction(String name, Real α, ComplexFunctionSequence a)
  {
    this(α,
         a);
    this.name = name;
  }

  /**
   * <p>
   * ────────────────────────────────────────────────────────────────────────
   * ComplexFunctional.evaluate — v ↦ (t ↦ R_M(t; v))
   * ────────────────────────────────────────────────────────────────────────
   * </p>
   * The functional output at v is a callable {@link ComplexFunction}
   * 
   * t ↦ R_M(t;v) = P_M(t^μ; v) / Q_M(t^μ; v)
   * 
   * at the order M selected from bits at a representative point z = (1)^μ. The
   * {@code result} parameter is unused — function references are immutable
   * handles, so a fresh {@link MuntzPadeApproximant} is returned and the caller
   * takes ownership.
   */
  @Override
  public ComplexFunction evaluate(Complex v, int order, int bits, ComplexFunction result)
  {
    int M;
    try ( Complex zRep = new Complex())
    {
      zRep.set(1, 0);
      M = chooseOrderForPrecision(v, zRep, bits);
    }
    MuntzPadeApproximant muntzPadeApproximant = computeMuntzPadeApproximant(v, bits, M);
    return muntzPadeApproximant;
  }

  private MuntzPadeApproximant computeMuntzPadeApproximant(Complex v, int bits, int M)
  {
    DiagonalPadePair pade = new DiagonalPadePair(M);
    computeDiagonalPadeRepresentation(v, M, bits, pade);
    return new MuntzPadeApproximant(α,
                                    pade);
  }

  /**
   * The Müntz coefficient sequence k ↦ v ↦ a_k(v).
   */
  public ComplexFunctionSequence coefficients()
  {
    return a;
  }

  /**
   * Evaluate the first n Müntz coefficients at v into the caller-allocated
   * vector; a_k(v) lands at index k−1.
   */
  public Complex coefficientsAt(Complex v, int n, int bits, Complex result)
  {
    if (result == null || result.dim < n)
    {
      throw new IllegalArgumentException("result vector must have dim ≥ " + n + ", got " + (result == null ? "null" : result.dim));
    }
    for (int k = 1; k <= n; k++)
    {
      ComplexFunction ak = a.apply(k);
      ak.evaluate(v, 1, bits, result.get(k - 1));
    }
    return result;
  }

  /**
   * Smallest integer M for which the successive-difference bound at z falls below
   * 2^(−bits). Stall-guarded: returns M−1 if the bound fails to decrease between
   * successive orders.
   *
   * <p>
   * Note: {@code a} is a {@link ComplexFunctionSequence} whose integer domain is
   * automatically cached, so repeated calls to {@code a.evaluate(k,...)} inside
   * {@link #padePade} are O(1) after the first evaluation — no local coefficient
   * cache is needed here.
   */
  public int chooseOrderForPrecision(Complex v, Complex z, int bits)
  {
    DiagonalPadePair rMm2 = null;
    DiagonalPadePair rMm1 = buildDiagonalPadePair(v, 1, bits);
    DiagonalPadePair rM   = buildDiagonalPadePair(v, 2, bits);
    int              M    = 2;

    try ( Real bound = new Real(); Real prevBound = new Real(); Real threshold = new Real())
    {
      threshold.one().mul2e(-bits, threshold);

      boundSuccessiveDifferences(rMm2, rMm1, rM, z, bits, bound);
      if (Expression.trace)
      {
        log.debug("chooseOrderForPrecision: M={} bound={} threshold=2^(-{})", M, bound, bits);
      }

      while (bound.compareTo(threshold) > 0)
      {
        prevBound.set(bound);
        M++;

        if (rMm2 != null)
        {
          rMm2.close();
        }
        rMm2 = rMm1;
        rMm1 = rM;
        rM   = buildDiagonalPadePair(v, M, bits);

        boundSuccessiveDifferences(rMm2, rMm1, rM, z, bits, bound);
        if (Expression.trace)
        {
          log.debug("chooseOrderForPrecision: M={} bound={} prev={}", M, bound, prevBound);
        }
        if (bound.compareTo(prevBound) >= 0)
        {

          log.warn("chooseOrderForPrecision: stalled at M={}, returning M-1={}", M, M - 1);

        }
        return M - 1;
      }

    }
    finally
    {
      if (rMm2 != null)
      {
        rMm2.close();
      }
      rMm1.close();
      rM.close();
    }

    if (Expression.trace)
    {
      log.debug("chooseOrderForPrecision: chose M={} for bits={}", M, bits);
    }
    return M;

  }

  /**
   * Diagonal (M, M) Padé pair filled into the caller-supplied
   * {@link DiagonalPadePair} at the supplied v. Falls back to lower orders on
   * Hankel singularity.
   *
   * @return the result parameter (fluent)
   */
  public DiagonalPadePair computeDiagonalPadeRepresentation(Complex v, int M, int bits, DiagonalPadePair result)
  {
    if (M < 1)
    {
      throw new IllegalArgumentException("padePade requires M ≥ 1, got " + M);
    }
    if (result == null)
    {
      throw new IllegalArgumentException("result must be a preallocated DiagonalPade");
    }
    try ( Complex coeff = Complex.newVector(2 * M))
    {
      coefficientsAt(v, 2 * M, bits, coeff);
      int currentM = M;
      while (currentM >= 1)
      {
        solveHankelSystem(v, coeff, currentM, bits, result);
        if (!result.isSingularSentinel())
        {
          return result;
        }
        currentM--;
      }
    }
    throw new ArithmeticException("All Padé orders ≤ " + M + " produced singular Hankel matrices at v=" + v);
  }

  /**
   * The a-posteriori successive-difference bound at z for the three consecutive
   * Padé approximants R_{M-2}, R_{M-1}, R_M. Pass {@code rMm2 = null} when M=2 to
   * treat R_0 as identically zero.
   */
  public Real boundSuccessiveDifferences(DiagonalPadePair rMm2, DiagonalPadePair rMm1, DiagonalPadePair rM, Complex z, int bits, Real result)
  {
    try ( Complex valM = new Complex(); Complex valMm1 = new Complex(); Complex valMm2 = new Complex(); Complex deltaM = new Complex();
          Complex deltaMm1 = new Complex(); Real absM = result.borrowVariable(); Real absMm1 = result.borrowVariable(); Real num = result.borrowVariable();
          Real denom = result.borrowVariable())
    {
      rM.evaluate(z, 1, bits, valM);
      rMm1.evaluate(z, 1, bits, valMm1);
      if (rMm2 == null)
      {
        valMm2.zero();
      }
      else
      {
        rMm2.evaluate(z, 1, bits, valMm2);
      }
      return valM.sub(valMm1, bits, deltaM)
                 .abs(bits, absM)
                 .mul(absM, bits, num)
                 .div(valMm1.sub(valMm2, bits, deltaMm1).abs(bits, absMm1).sub(absM, bits, denom), bits, result);
    }
  }

  private DiagonalPadePair buildDiagonalPadePair(Complex v, int M, int bits)
  {
    DiagonalPadePair pade = new DiagonalPadePair(M);
    computeDiagonalPadeRepresentation(v, M, bits, pade);
    return pade;
  }

  private DiagonalPadePair solveHankelSystem(Complex v, Complex coeff, int M, int bits, DiagonalPadePair result)
  {
    if (coeff.dim < 2 * M)
    {
      throw new IllegalStateException("Need 2M=" + (2 * M) + " coefficients, have " + coeff.dim);
    }

    ComplexPolynomial P = result.P;
    ComplexPolynomial Q = result.Q;

    qMat.resize(M, 1);

    try ( HankelSolver hankel = new HankelSolver(coeff,
                                                 M);
          ComplexMatrix negb = ComplexMatrix.newMatrix(M, 1))
    {
      for (int i = 0; i < M; i++)
      {
        coeff.get(M + i).neg(negb.get(i, 0));
      }

      hankel.solve(negb, bits, qMat);
      if (hankel.wasSingular())
      {
        result.markSingular();
        return result;
      }

      Q.fitLength(M + 1);
      Q.setLength(M + 1);
      Q.get(0).one();
      for (int j = 1; j <= M; j++)
      {
        Q.set(j, qMat.get(j - 1, 0));
      }

      // P_M(z) = [A(z)·Q_M(z)]_{<M+1}, where A(z) = Σ_{k=1..2M} a_k(v)·z^{k-1}.
      // Polynomial multiplication folds the convolution
      // p_n = a_n(v) + Σ_{j=1..n-1} q_j·a_{n-j}(v), n = 1..M
      // in one call; the slice keeps only the first M+1 coefficients (with
      // p_0 = 0 since A has no z^{-1} term and the leading term of Q is 1).
      try ( ComplexPolynomial A = new ComplexPolynomial(); ComplexPolynomial AQ = new ComplexPolynomial())
      {
        A.fitLength(2 * M);
        A.setLength(2 * M);
        for (int k = 1; k <= 2 * M; k++)
        {
          A.get(k - 1).set(coeff.get(k - 1));
        }
        A.mul(Q, bits, AQ);
        P.fitLength(M + 1);
        P.setLength(M + 1);
        P.get(0).zero();
        for (int n = 1; n <= M; n++)
        {
          P.get(n).set(AQ.get(n - 1));
        }
      }
      return result;
    }
  }

  @Override
  public String getName()
  {
    return name;
  }

  @Override
  public void close()
  {
    qMat.close();
  }
}
