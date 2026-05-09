package arb.functions.complex;

import java.util.ArrayList;

import arb.*;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.ComplexSequence;

/**
 * Adaptive Müntz–Padé evaluator at fixed external parameter v.
 *
 * <p>
 * This object incrementally constructs and caches the diagonal Padé hierarchy:
 *
 * <pre>
 *     R₁, R₂, R₃, ...
 * </pre>
 *
 * and adaptively selects the smallest order M satisfying the requested bit
 * precision at the actual evaluation point:
 *
 * <pre>
 *     z = t^μ.
 * </pre>
 *
 * <p>
 * The convergence criterion is based on successive Padé differences:
 *
 * <pre>
 *     |Δ_M|² / (|Δ_{M-1}| - |Δ_M|)
 * </pre>
 *
 * where:
 *
 * <pre>
 *     Δ_M = R_M - R_{M-1}.
 * </pre>
 *
 * <p>
 * All constructed approximants are retained and reused.
 * 
 * FIXME: THIS NEEDS TO MOVE THE B(RHS) FROM THE SOLVE TO THE CONSTRUCTR
 */
public final class MuntzPadeApproximant implements
                                        ComplexFunction,
                                        AutoCloseable
{

  /**
   * Fractional exponent μ.
   */
  public final Real                         α;

  /**
   * Fixed external parameter.
   */
  public final Complex                      v;

  /**
   * Frozen coefficient sequence:
   *
   * <pre>
   *     k ↦ a_k(v)
   * </pre>
   */
  private final ComplexSequence             coeffs;

  /**
   * Working precision used for Padé construction.
   */
  private final int                         workingBits;

  /**
   * Cached Padé hierarchy.
   *
   * Index convention:
   *
   * <pre>
   * approximants.get(M - 1) == R_M
   * </pre>
   */
  private final ArrayList<DiagonalPadePair> approximants = new ArrayList<>();

  /**
   * Scratch evaluation point:
   *
   * <pre>
   * z = t ^ μ
   * </pre>
   */
  private final Complex                     z            = new Complex();

  public MuntzPadeApproximant(Real α, ComplexPolynomialSequence a, Complex v, int bits)
  {

    this.α           = α;

    this.v           = new Complex(v);

    this.workingBits = bits;

    /**
     * Freeze coefficients at this v.
     */
    this.coeffs      = (k, order, abits, result) ->
                     {
                       return a.evaluate(k, 0, abits).evaluate(this.v, 1, bits, result);
                     };


  }

  @Override
  public Complex evaluate(Complex t, int order, int bits, Complex result)
  {

    /**
     * z = t^μ
     */
    t.pow(α, bits, z);

    /**
     * Threshold = 2^{-bits}
     */
    try ( Real threshold = new Real(); Real bound = new Real())
    {

      threshold.one().mul2e(-bits, threshold);

      int M = 1;

      while (true)
      {

        ensureApproximantExists(M);

        if (M < 2)
        {
          M++;
          continue;
        }

        DiagonalPadePair rM   = approximants.get(M - 1);

        DiagonalPadePair rMm1 = approximants.get(M - 2);

        DiagonalPadePair rMm2 = (M >= 3) ? approximants.get(M - 3) : null;

        boundSuccessiveDifferences(rMm2, rMm1, rM, z, bits, bound);

        /**
         * Converged.
         */
        if (bound.compareTo(threshold) <= 0)
        {

          return rM.evaluate(z, order, bits, result);
        }

        M++;
      }
    }
  }

  /**
   * Ensure R_M exists in the hierarchy.
   */
  private void ensureApproximantExists(int M)
  {

    while (approximants.size() < M)
    {

      int nextM = approximants.size() + 1;

      approximants.add(buildPadePair(nextM));
    }
  }

  /**
   * Build the diagonal Padé approximant R_M incrementally.
   */
  private DiagonalPadePair buildPadePair(int M)
  {

    DiagonalPadePair  pade = new DiagonalPadePair(M);

    ComplexPolynomial P    = pade.P;
    ComplexPolynomial Q    = pade.Q;

    assert false : "TODO: refactor this so that whatever InverseHankelSolver did is done here";
    //ComplexMatrix     q    = hankel.solve(M);
    ComplexMatrix q = ComplexMatrix.newMatrix(1, 1);
    
    try ( ComplexPolynomial A = new ComplexPolynomial(); ComplexPolynomial AQ = new ComplexPolynomial())
    {

      /**
       * Denominator:
       *
       * <pre>
       *     Q(z)=1+Σ q_j z^j
       * </pre>
       */
      Q.fitLength(M + 1);
      Q.setLength(M + 1);

      Q.get(0).one();

      for (int j = 1; j <= M; j++)
      {

        Q.set(j, q.get(j - 1, 0));
      }

      /**
       * Build truncated coefficient polynomial:
       *
       * <pre>
       *     A(z)=Σ a_k z^{k-1}
       * </pre>
       */

      A.fitLength(2 * M);
      A.setLength(2 * M);

      for (int k = 0; k < 2 * M; k++)
      {

        A.get(k).set(coeffs.apply(k + 1));
      }

      /**
       * AQ = A*Q
       */
      A.mul(Q, workingBits, AQ);

      /**
       * Numerator:
       *
       * <pre>
       *     P=[AQ]_{<M+1}
       * </pre>
       */
      P.fitLength(M + 1);
      P.setLength(M + 1);

      P.get(0).zero();

      for (int n = 1; n <= M; n++)
      {

        P.get(n).set(AQ.get(n - 1));
      }

      return pade;
    }
    finally
    {
      q.close();
    }

  }

  /**
   * Successive-difference convergence bound.
   */
  private Real boundSuccessiveDifferences(DiagonalPadePair rMm2, DiagonalPadePair rMm1, DiagonalPadePair rM, Complex z, int bits, Real result)
  {

    try ( Complex valM = new Complex(); Complex valMm1 = new Complex(); Complex valMm2 = new Complex();

          Complex deltaM = new Complex(); Complex deltaMm1 = new Complex();

          Real absM = result.borrowVariable(); Real absMm1 = result.borrowVariable();

          Real num = result.borrowVariable(); Real denom = result.borrowVariable())
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

  @Override
  public void close()
  {

    z.close();

    v.close();

    //hankel.close();

    for (DiagonalPadePair pade : approximants)
    {
      pade.close();
    }

    approximants.clear();
  }
}