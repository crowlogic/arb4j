package arb.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * There are two possible definitions:
 * 
 * 1. Possessing similarity of form,
 * 
 * 2. Continuous, one-to-one, in surjection, and having a continuous inverse.
 * 
 * The most common meaning is possessing intrinsic topological equivalence. Two
 * objects are homeomorphic if they can be deformed into each other by a
 * continuous, invertible mapping. Such a homeomorphism ignores the space in
 * which surfaces are embedded, so the deformation can be completed in a higher
 * dimensional space than the surface was originally embedded. Mirror images are
 * homeomorphic, as are Möbius strip with an even number of half-twists, and
 * Möbius strip with an odd number of half-twists.
 *
 * 
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
public @interface Homeomorphic
{

}
