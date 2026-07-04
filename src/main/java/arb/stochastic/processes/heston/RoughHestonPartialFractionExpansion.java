package arb.stochastic.processes.heston;

import arb.Complex;
import arb.Real;

/**
 * Partial-fraction-expansion data of the M-th Padé approximant κ_M(T, v) of the
 * rough-Heston cumulant generating function, in the form
 *
 * <pre>
 *   κ_M(T, v) = −σ_T²(M)·v²/2 − i·μ_T(M)·v + Σ_{j=1..2M} A_j / (v − u_j)
 * </pre>
 *
 * (Lemma 6 of {@code docs/SchwingerHermiteFromCitations.tex}).
 *
 * <p>All quantities are arb balls. The PFE poles {@code u} have
 * {@code Im(u_j) < 0} (lower-half-plane), and {@code σT2 > 0}, by Lemma 6.
 *
 * <p>This is a plain value type; no compiled expressions are owned. It is
 * recomputed by {@code RoughHestonCharacteristicFunction.partialFractionExpansion(M, bits)}
 * whenever the model parameters or {@code M} change.
 */
public class RoughHestonPartialFractionExpansion implements
                                                  AutoCloseable
{
  /** Pad\u00e9 order. {@code u.dim == A.dim == 2*M}. */
  public final int     M;

  /** σ_T²(M) — the Lewis-Gaussian variance of κ_M at large |v|. */
  public final Real    σT2;

  /** μ_T(M) — the Lewis-Gaussian drift of κ_M at large |v|. */
  public final Real    μT;

  /** PFE poles: u_j ∈ ℂ, Im(u_j) < 0, for j = 1..2M. */
  public final Complex u;

  /** PFE residues: A_j ∈ ℂ, for j = 1..2M. */
  public final Complex A;

  public RoughHestonPartialFractionExpansion(int M, Real σT2, Real μT, Complex u, Complex A)
  {
    assert u.dim == 2 * M : "u.dim=" + u.dim + " expected 2M=" + (2 * M);
    assert A.dim == 2 * M : "A.dim=" + A.dim + " expected 2M=" + (2 * M);
    this.M   = M;
    this.σT2 = σT2;
    this.μT  = μT;
    this.u   = u;
    this.A   = A;
  }

  /**
   * The hypothesis of the erfc–Hermite series representation at this order:
   * σ_T² &gt; 0 and every pole strictly below the real axis (Im u_j &lt; 0), so
   * ψ = e^ρ is analytic on the closed left w-half-plane of the Lewis line.
   * Guaranteed for all sufficiently large M by the pole-location asymptotics;
   * an order at which it fails is outside this chart and the next order is
   * taken.
   */
  public boolean admissible()
  {
    if (σT2.sign() <= 0)
      return false;
    for (int j = 0; j < u.dim(); j++)
      if (u.get(j).im().sign() >= 0)
        return false;
    return true;
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
