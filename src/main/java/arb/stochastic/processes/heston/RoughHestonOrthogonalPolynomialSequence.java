package arb.stochastic.processes.heston;

import arb.Real;
import arb.expressions.Context;
import arb.functions.complex.RiccatiMuntzPadeFunctional;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.polynomials.orthogonal.complex.FractionalRicattiOrthogonalPolynomialMomentFunctionalSequence;

/**
 * OPS of the Müntz–Padé moment functional for the rough Heston model.
 *
 * <p>
 * The rough Heston characteristic function satisfies
 *
 * <pre>
 *   D^μ h(t,u) = P(u) + Q(u)·h(t,u) + R·h(t,u)²,   h(0,u) = 0,
 * </pre>
 *
 * with coefficient polynomials
 *
 * <pre>
 *   P(u) = −½(u² + iu),
 *   Q(u) = κ − ρ·σ·i·u,
 *   R    = σ²/2.
 * </pre>
 *
 * The parameters κ, ρ, σ, μ are registered as named variables in a shared
 * {@link Context}; expression strings reference them symbolically and the ARB4J
 * compiler handles all arithmetic at full arbitrary precision. Approximation
 * order is determined adaptively at evaluation time from the requested
 * bit-precision — it is never fixed at construction.
 *
 * @author Stephen Crowley ©2026
 */
public class RoughHestonOrthogonalPolynomialSequence extends
                                                     FractionalRicattiOrthogonalPolynomialMomentFunctionalSequence
{
  /**
   * Diagonal inner-product sequence S(j) := σ(j, j) = ⟨P_j, P_j⟩ of the σ-table.
   * Exposed as a named field for test access; by construction S(0) = m(0).
   */
  public final ComplexPolynomialSequence S;

  /**
   * @param μ    fractional order μ ∈ (0, 1]
   * @param κ    mean-reversion speed, κ > 0
   * @param ρ    spot/vol Brownian correlation, ρ ∈ (−1, 1)
   * @param σ    vol-of-vol, σ > 0
   */
  public RoughHestonOrthogonalPolynomialSequence(Real μ, Real κ, Real ρ, Real σ)
  {
    super(buildFunctional(μ, κ, ρ, σ));
    this.S = this.h;
  }

  private static RiccatiMuntzPadeFunctional buildFunctional(Real μ, Real κ, Real ρ, Real σ)
  {
    Context ctx = new Context(μ.setName("μ"),
                              κ.setName("κ"),
                              ρ.setName("ρ"),
                              σ.setName("σ"));

    return new RiccatiMuntzPadeFunctional(ctx,
                                          μ,
                                          "u->-1/2*(u^2+u*I)",
                                          "u->κ-ρ*σ*I*u",
                                          "u->σ^2/2");
  }
}
