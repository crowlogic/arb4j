package arb.functions.real;

import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * On-band spectral density evaluator derived from the stationary-phase /
 * frequency-matching formula of Theorem "On-band density" (Block C) of
 * {@code docs/RiemannHypothesisProof.tex}.
 *
 * <p>
 * For every warped frequency ν₀ ∈ (-1,1)\{0} and every saddle time t₀ for which
 * the frequency-matching condition
 *
 * <pre>
 *   ∂_t Φ_{n,σ}(t)/ϑ'(t) = ν₀,   σ = sgn(ν₀)
 * </pre>
 *
 * is solved by the saddle mode
 *
 * <pre>
 *   n₀(t₀, ν₀) = exp((1 - |ν₀|) · ϑ'(t₀))
 * </pre>
 *
 * (equation (eq:n0) of the cited document), the on-band density contribution at
 * (ν₀, t₀) is
 *
 * <pre>
 *   K_∞(ν₀; t₀) = (1/(2π)) · Σ_{σ ∈ {+,-}} (2π/|ϑ''(t₀)|)^{1/2}
 *                              · n₀^{-1/2}
 *                              · cos(Φ_{n₀,σ}(t₀) - ν₀·u₀ ± π/4),
 * </pre>
 *
 * with u₀ := ϑ(t₀) and Φ_{n,σ}(t) := σ·ϑ(t) - σ·t·log n. The ± in the phase
 * carries the sign of σ (the standard stationary-phase factor from the sign of
 * the Gaussian second derivative).
 *
 * <p>
 * This evaluator implements the analytic closed-form value — there is exactly
 * one matching mode per frequency at each saddle time, so the density is
 * obtained from the frequency-matching formula directly rather than from any
 * numerical integral of the windowed warped-Fourier kernel K_T.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ZetaOnBandStationaryPhaseDensity implements
                                             AutoCloseable
{
  private final RiemannSiegelThetaFunction ϑ = new RiemannSiegelThetaFunction();

  /**
   * Evaluate the on-band stationary-phase density at (ν₀, t₀).
   *
   * @param ν0     warped frequency in (-1,1)\{0}
   * @param t0     saddle time (t₀ ≥ T₀ = 200, where ϑ is monotone)
   * @param bits   working precision in bits
   * @param result destination; set to K_∞(ν₀; t₀)
   * @return {@code result}
   */
  public Real evaluate(Real ν0, Real t0, int bits, Real result)
  {
    double νd = ν0.doubleValue();
    if (νd <= -1.0 || νd >= 1.0)
    {
      throw new IllegalArgumentException("ν₀ must lie in the open interval (-1, 1); got " + νd);
    }
    if (νd == 0.0)
    {
      throw new IllegalArgumentException("ν₀ = 0 is the boundary atom case; evaluator is defined on (-1,1)\\{0}");
    }

    try ( Real jet          = Real.newVector(3);
          Real absν         = new Real();
          Real oneMinusAbsν = new Real();
          Real ϑp           = new Real();
          Real ϑpp          = new Real();
          Real u0           = new Real();
          Real logN0        = new Real();
          Real n0           = new Real();
          Real absϑpp       = new Real();
          Real ampSquared   = new Real();
          Real amp          = new Real();
          Real sqrtN0       = new Real();
          Real tLogN0       = new Real();
          Real Ψ            = new Real();
          Real ν0U0         = new Real();
          Real piOver4      = new Real();
          Real phasePlus    = new Real();
          Real phaseMinus   = new Real();
          Real tmp          = new Real();
          Real cosPlus      = new Real();
          Real cosMinus     = new Real();
          Real cosSum       = new Real();
          Real product      = new Real())
    {
      ϑ.evaluate(t0, 3, bits, jet);
      u0.set(jet.get(0));
      ϑp.set(jet.get(1));
      ϑpp.set(jet.get(2)).mul(2, bits);

      ν0.abs(bits, absν);
      RealConstants.one.sub(absν, bits, oneMinusAbsν);

      oneMinusAbsν.mul(ϑp, bits, logN0);
      logN0.exp(bits, n0);

      ϑpp.abs(bits, absϑpp);
      RealConstants.twoπ.div(absϑpp, bits, ampSquared);
      ampSquared.sqrt(bits, amp);

      n0.sqrt(bits, sqrtN0);
      amp.div(sqrtN0, bits, amp);

      t0.mul(logN0, bits, tLogN0);
      u0.sub(tLogN0, bits, Ψ);

      ν0.mul(u0, bits, ν0U0);
      RealConstants.π.div(4, bits, piOver4);

      Ψ.sub(ν0U0, bits, tmp);
      tmp.add(piOver4, bits, phasePlus);

      Ψ.add(ν0U0, bits, tmp);
      tmp.add(piOver4, bits);
      tmp.neg(phaseMinus);

      phasePlus.cos(bits, cosPlus);
      phaseMinus.cos(bits, cosMinus);
      cosPlus.add(cosMinus, bits, cosSum);

      amp.mul(cosSum, bits, product);
      product.div(RealConstants.twoπ, bits, result);

      return result;
    }
  }

  /**
   * Compute the saddle mode n₀(t₀, ν₀) = exp((1-|ν₀|)·ϑ'(t₀)).
   *
   * @return {@code result}
   */
  public Real saddleMode(Real ν0, Real t0, int bits, Real result)
  {
    try ( Real jet          = Real.newVector(2);
          Real absν         = new Real();
          Real oneMinusAbsν = new Real();
          Real logN0        = new Real())
    {
      ϑ.evaluate(t0, 2, bits, jet);
      ν0.abs(bits, absν);
      RealConstants.one.sub(absν, bits, oneMinusAbsν);
      oneMinusAbsν.mul(jet.get(1), bits, logN0);
      return logN0.exp(bits, result);
    }
  }

  /**
   * Instantaneous x-frequency of mode (n, σ) at saddle time t₀:
   * σ·(1 − log(n)/ϑ'(t₀)). By construction with n = n₀(t₀, ν₀) and
   * σ = sgn(ν₀), this equals ν₀ (frequency-matching).
   *
   * @return {@code result}
   */
  public Real instantaneousFrequency(Real n, Real t0, int σ, int bits, Real result)
  {
    try ( Real jet           = Real.newVector(2);
          Real logN          = new Real();
          Real ratio         = new Real();
          Real oneMinusRatio = new Real())
    {
      ϑ.evaluate(t0, 2, bits, jet);
      n.log(bits, logN);
      logN.div(jet.get(1), bits, ratio);
      RealConstants.one.sub(ratio, bits, oneMinusRatio);
      oneMinusRatio.mul(σ, bits, result);
      return result;
    }
  }

  @Override
  public void close()
  {
    ϑ.close();
  }
}
