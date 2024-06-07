package arb.documentation.concepts.stochastic.randomfields.isotropy;

import java.util.stream.Stream;

import arb.documentation.Bibliography;
import arb.documentation.Referral;
import arb.documentation.concepts.Concept;

/**
 * <pre>
 * An isotropic random field is a random field that is invariant 
 * under rotations. It models spatially varying phenomena where the 
 * properties are the same in all directions.
 * 
 * A random field X(r), where r is a position vector in a space (which
 * can be two-dimensional, three-dimensional, etc.), is said to be isotropic if
 * its statistical properties are invariant under rotations. This means that the
 * statistical properties of X(r) do not change when the coordinate system is
 * rotated. For a random field to be considered isotropic, it must satisfy the
 * following condition:
 * 
 * For any two points r₁ and r₂ in the field, and for any rotation R, the
 * statistical properties of the pairs X(r₁) and X(r₂) are the same as those of
 * the pairs X(Rr₁) and X(Rr₂). This implies that quantities such as the mean,
 * variance, and the correlation function of the random field depend only on the
 * distance between points, not on their specific orientation or direction in
 * space.
 * 
 * The concept of isotropy is crucial for simplifying the analysis and
 * simulation of random fields, as it reduces the complexity of the field's
 * statistical characterization. In an isotropic random field, the correlation
 * between any two points depends only on the Euclidean distance between those
 * points, which is a significant simplification compared to anisotropic fields,
 * where the correlation might also depend on the direction between points.
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class IsotropicRandomFields implements
                                   Concept
{

  @Override
  public Stream<Referral> getReferences()
  {
    return Stream.of(Bibliography.correlationTheoryOfStationaryRandomProcesses.referToChapters("22.1",
                                                                                               "22.2",
                                                                                               "22.3",
                                                                                               "22.4"));
  }

}
