package arb.series;

import arb.Real;

/**
 * Borel transform of a divergent asymptotic series.
 *
 * <p>Given an asymptotic expansion {@code S(x) = Σ_{k=0}^{N} a_k / x^{k+1}},
 * the Borel transform produces a polynomial in the Borel variable {@code p}:
 *
 * <pre>
 *   F(p) = Σ_{k=0}^{N} (a_k / k!) · p^k
 * </pre>
 *
 * <p>The factorial division {@code a_k / k!} tames the factorial growth of
 * divergent series coefficients, producing a polynomial that is amenable to
 * Padé approximation in the Borel plane.
 *
 * <p>Usage:
 * <pre>
 *   Real[] borelCoeffs = BorelTransform.transform(asymptoticCoeffs, N, bits);
 * </pre>
 *
 * @see <a href="https://github.com/crowlogic/arb4j/issues/1177">Issue #1177</a>
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BorelTransform implements AutoCloseable
{

  /**
   * Apply the Borel transform to asymptotic series coefficients.
   *
   * <p>Computes {@code b_k = a_k / Γ(k+1) = a_k / k!} for {@code k = 0..N}.
   *
   * @param a    asymptotic coefficients {@code a_0, a_1, ..., a_N}
   * @param N    number of terms (inclusive upper bound)
   * @param bits working precision
   * @return new array {@code b_0, b_1, ..., b_N} where {@code b_k = a_k / k!}
   */
  public static Real[] transform(Real[] a, int N, int bits)
  {
    Real[] b = new Real[N + 1];
    try ( Real kfact = new Real();
          Real k    = new Real() )
    {
      for (int j = 0; j <= N; j++)
      {
        b[j]  = new Real();
        k.set(j);
        k.add(1, bits, k);                // k+1
        k.Γ(bits, kfact);                  // Γ(k+1) = k!
        a[j].div(kfact, bits, b[j]);       // b_k = a_k / k!
      }
    }
    return b;
  }

  /**
   * Inverse Borel transform: given Borel-plane coefficients {@code b_k},
   * recover the asymptotic coefficients {@code a_k = b_k · k!}.
   *
   * @param b    Borel coefficients
   * @param N    number of terms
   * @param bits working precision
   * @return new array {@code a_0, ..., a_N}
   */
  public static Real[] inverse(Real[] b, int N, int bits)
  {
    Real[] a = new Real[N + 1];
    try ( Real kfact = new Real();
          Real k     = new Real() )
    {
      for (int j = 0; j <= N; j++)
      {
        a[j]  = new Real();
        k.set(j);
        k.add(1, bits, k);
        k.Γ(bits, kfact);                  // k!
        b[j].mul(kfact, bits, a[j]);       // a_k = b_k · k!
      }
    }
    return a;
  }

  /**
   * Evaluate the Borel-transformed polynomial at a point {@code p}:
   * {@code F(p) = Σ b_k · p^k}.
   *
   * @param b    Borel coefficients {@code b_0, ..., b_N}
   * @param p    evaluation point
   * @param bits working precision
   * @param result storage for result
   * @return {@code F(p)}
   */
  public static Real eval(Real[] b, Real p, int bits, Real result)
  {
    result.zero();
    try ( Real term = new Real();
          Real pk   = new Real() )
    {
      pk.one();
      for (int k = 0; k < b.length; k++)
      {
        b[k].mul(pk, bits, term);   // b_k · p^k
        result.add(term, bits, result);
        pk.mul(p, bits, pk);        // p^{k+1}
      }
    }
    return result;
  }

  /**
   * Evaluate the Borel-transformed polynomial at a complex point.
   *
   * @param b    Borel coefficients
   * @param p    complex evaluation point
   * @param bits working precision
   * @param result storage for result
   * @return {@code F(p)}
   */
  public static arb.Complex eval(Real[] b, arb.Complex p, int bits, arb.Complex result)
  {
    result.zero();
    try ( arb.Complex term = new arb.Complex();
          arb.Complex pk   = new arb.Complex().one() )
    {
      for (int k = 0; k < b.length; k++)
      {
        term.re().set(b[k]);
        term.mul(pk, bits, term);     // b_k · p^k
        result.add(term, bits, result);
        pk.mul(p, bits, pk);          // p^{k+1}
      }
    }
    return result;
  }

  @Override
  public void close()
  {
    // No resources to release — all methods are static with try-with-resources
  }
}
