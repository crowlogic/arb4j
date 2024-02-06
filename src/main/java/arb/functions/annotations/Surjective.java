package arb.functions.annotations;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Target;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 * A {@link Surjective} {@link Function} is a {@link Function} whose image is
 * equal to its co-domain. Also, the range, co-domain and the image of a
 * surjective function are all equal.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@Documented
@Target(ElementType.TYPE)
public @interface Surjective
{

}
