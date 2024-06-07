package arb.documentation.concepts;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.language.RegularTerm;
import arb.space.topological.HilbertSpace;

/**
 * Defines a system of imprimitivity based on a LocallyCompactTopologicalGroup G.
 * <ul>
 * <li><b>Unitary Representation:</b> ρ: G → U(H) on a {@link HilbertSpace}
 * H</li>
 * <li><b>Locally Compact Space:</b> X, a Hausdorff space with a continuous left
 * G-action</li>
 * <li><b>Projection-Valued Measure:</b> P: B(X) → End(H), where B(X) is the
 * Borel σ-algebra of X</li>
 * <li><b>Covariance:</b> The relationship is defined such that ρ(g)P(E)ρ(g)⁻¹ =
 * P(g⋅E) for all g ∈ G and E ∈ B(X), ensuring the covariance of the measure
 * under the group action.</li>
 * </ul>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne for terms of the
 *      {@link TheArb4jLibrary}.
 */
public interface SystemOfImprimitivity extends
                                       Concept,
                                       RegularTerm
{

  @Override
  default String getDefinition()
  {
    return "A system of imprimitivity for a group G consists of a unitary representation ρ: G → U(H) on a Hilbert Space H, "
                  + "a locally compact Hausdorff space X with a continuous left G-action, and a projection-valued measure P: B(X) → End(H) "
                  + "where B(X) is the Borel σ-algebra of X such that ρ(g)P(E)ρ(g)⁻¹ = P(g⋅E) for all g ∈ G and E ∈ B(X).";
  }

}
