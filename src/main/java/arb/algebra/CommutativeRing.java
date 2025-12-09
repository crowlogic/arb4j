package arb.algebra;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * A commutative ring is a {@link Ring} R that satisfies the additional axiom
 * that
 * 
 * <pre>
 * 
 * ab = ba ∀a,b∈ℝ
 * 
 * </pre>
 * 
 * @param <X>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface CommutativeRing<X> extends
                                Ring<X>
{

}
