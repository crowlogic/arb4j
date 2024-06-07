package arb.space.topological;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 * Represents a section of a fiber bundle. A section of a fiber bundle is a
 * continuous map that sends each point in the base space B to a point in the
 * fiber over B. The term "section" comes from the idea of a "cut" or "slice"
 * through the bundle.
 *
 * A section of a fibration (fibre space) is a continuous mapping s:B→X such
 * that π∘s=idB
 * 
 * @param <E> the total space
 * @param <B> the base space
 * @param <F> the fiber space
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Section_(fiber_bundle)">Section@Wikipedia</a>
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Section<X extends Field<? extends X>, E extends TopologicalSpace<? extends X>, B extends TopologicalSpace<? extends X>, F extends TopologicalSpace<? extends X>>
                        extends
                        Function<B, E>
{

  /**
   * Determines whether this Section is a zero-section. The zero-section is the
   * section s such that for each point b in the base space B, s(b) is the zero
   * element of the fiber F_b.
   * 
   * @return true if this is a zero-section, false otherwise
   */
  boolean isZeroSection();

  /**
   * Retrieves the image in the total space E of a point in the base space B under
   * this Section. The result should always lie in the fiber over the point in the
   * base space.
   *
   * @param pointInBaseSpace The point in the base space B.
   * @return The point in the total space E that is in the fiber over the
   *         specified point in the base space.
   */
  E imageInFiber(B pointInBaseSpace);
}
