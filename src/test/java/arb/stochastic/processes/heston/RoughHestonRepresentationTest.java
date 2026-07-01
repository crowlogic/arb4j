package arb.stochastic.processes.heston;

import arb.Complex;
import arb.ComplexConstants;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * Certifies {@link RoughHestonCharacteristicFunction#partialFractionExpansion(int, int)},
 * the model→representation identity of {@code docs/single-series-pricing.md} §3.1: the
 * {@code [2M+2/2M]} Padé-in-{@code v} split
 *
 * <pre>
 *   Φ_M(v) = −½σ_T²·v² − i·μ_T·v + Σ_j A_j/(v − u_j).
 * </pre>
 *
 * The two admissible (exact, quadrature-free) certificates are:
 *
 * <ol>
 * <li>{@code σ_T² > 0} — the Lewis–Gaussian variance is strictly positive, so
 * the pricing contour of §2 exists (the method throws otherwise); and</li>
 * <li>the representation reproduces the model cumulant generating function Φ(v,T) at
 * an interior point to Padé accuracy — an exact self-consistency check against
 * the directly-summed Müntz–lattice Taylor series (no numerical integration).</li>
 * </ol>
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class RoughHestonRepresentationTest extends
                                           TestCase
{
  static final int bits = 400;

  /** (1) σ_T² > 0 emerges from the Euclidean split (the contour exists). */
  public void testPositiveGaussianVariance()
  {
    try ( var cf = new RoughHestonCharacteristicFunction();
          var pfe = cf.partialFractionExpansion(4, bits) )
    {
      assertTrue("σ_T² must be > 0, got " + pfe.σT2, pfe.σT2.sign() > 0);
      assertEquals("proper part has 2M simple poles", 8, pfe.u.dim);
      assertEquals("residue count matches pole count", pfe.u.dim, pfe.A.dim);
    }
  }

  /**
   * (2) The representation Φ_M(v) = −½σ_T²v² − iμ_T v + Σ A_j/(v−u_j) reproduces the
   * model cgf Φ(v,T) = Σ_n c_n vⁿ at an interior point v=0.3, to Padé accuracy.
   */
  public void testRepresentationReproducesModelCumulant()
  {
    int M = 4;
    try ( var cf = new RoughHestonCharacteristicFunction();
          var pfe = cf.partialFractionExpansion(M, bits);
          Complex c = cf.cumulantTaylorCoefficients(4 * M + 2, bits);
          Complex v = new Complex(); Complex direct = new Complex(); Complex repr = new Complex();
          Complex vpow = new Complex(); Complex term = new Complex(); Complex diff = new Complex();
          Complex den = new Complex(); Real diffMag = new Real() )
    {
      v.set("0.3", bits);

      // direct: Σ_n c_n vⁿ (Müntz-lattice Taylor, converges at T=1)
      direct.zero();
      vpow.set(ComplexConstants.one);
      for (int n = 0; n < c.dim; n++)
      {
        c.get(n).mul(vpow, bits, term);
        direct.add(term, bits, direct);
        vpow.mul(v, bits, vpow);
      }

      // representation: −½σ_T² v² − i μ_T v + Σ_j A_j/(v − u_j), centred so
      // Φ_M(0)=0 (the model cgf satisfies Φ(0)=0; the Euclidean quotient's real
      // constant is absorbed into ρ(0) and cancels under this centring).
      repr.zero();
      Complex repr0 = new Complex();
      try ( Complex t = new Complex() )
      {
        v.mul(v, bits, t).mul(pfe.σT2, bits, t);       // σ_T² v²
        t.mul2e(-1, t);                                 // ½
        repr.sub(t, bits, repr);                        // −½σ_T² v²
        v.mul(pfe.μT, bits, t).mul(ComplexConstants.imaginaryUnit, bits, t);
        repr.sub(t, bits, repr);                        // − i μ_T v
        for (int j = 0; j < pfe.u.dim; j++)
        {
          v.sub(pfe.u.get(j), bits, den);
          pfe.A.get(j).div(den, bits, t);
          repr.add(t, bits, repr);
          // ρ(0) contribution = A_j/(0 − u_j)
          pfe.u.get(j).negate(den);
          pfe.A.get(j).div(den, bits, t);
          repr0.add(t, bits, repr0);
        }
      }
      repr.sub(repr0, bits, repr);                       // Φ_M(v) − Φ_M(0)
      repr0.close();

      repr.sub(direct, bits, diff).abs(bits, diffMag);
      assertTrue("representation must match model cgf at v=0.3 (got |Δ|=" + diffMag + ")",
                 diffMag.doubleValue() < 1e-8);
    }
  }
}
