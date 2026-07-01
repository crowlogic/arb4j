package arb.stochastic.processes.heston;

import arb.Complex;
import arb.Real;

/**
 * Partial-fraction-expansion data of the {@code [2M+2 / 2M]} Padé approximant
 * κ_M(T, v) of the rough-Heston cumulant generating function Φ(v,T), in the
 * form
 *
 * <pre>
 *   κ_M(T, v) = −σ_T²(M)·v²/2 − i·μ_T(M)·v + Σ_j A_j / (v − u_j)
 * </pre>
 *
 * (docs/single-series-pricing.md §3.1). The proper part ρ=P/D has {@code deg D
 * = 2M} simple poles {@code u_j} (the roots of the Padé denominator), and
 * {@code σ_T² > 0} (read off the Euclidean quotient — refuse the input if it
 * fails, never silently patch).
 *
 * <p>All quantities are arb balls. This is a plain value type; no compiled
 * expressions are owned. It is produced by
 * {@link RoughHestonCharacteristicFunction#partialFractionExpansion(int, int)}.
 */
public class RoughHestonPartialFractionExpansion implements
                                                  AutoCloseable
{
  /** Padé order M. The proper part has {@code u.dim == A.dim == 2M} simple poles. */
  public final int     M;

  /** σ_T²(M) — the Lewis-Gaussian variance of κ_M at large |v|. */
  public final Real    σT2;

  /** μ_T(M) — the Lewis-Gaussian drift of κ_M at large |v|. */
  public final Real    μT;

  /** PFE poles: u_j ∈ ℂ (roots of the Padé denominator D), j = 1..2M. */
  public final Complex u;

  /** PFE residues: A_j = P(u_j)/D'(u_j) ∈ ℂ, j = 1..2M. */
  public final Complex A;

  public RoughHestonPartialFractionExpansion(int M, Real σT2, Real μT, Complex u, Complex A)
  {
    assert u.dim == A.dim : "u.dim=" + u.dim + " != A.dim=" + A.dim;
    this.M   = M;
    this.σT2 = σT2;
    this.μT  = μT;
    this.u   = u;
    this.A   = A;
  }

  @Override
  public void close()
  {
    σT2.close();
    μT.close();
    u.close();
    A.close();
  }

  @Override
  public String toString()
  {
    return "PFE[M=" + M + ", σT²=" + σT2 + ", μT=" + μT + ", u={" + u + "}, A={" + A + "}]";
  }
}
