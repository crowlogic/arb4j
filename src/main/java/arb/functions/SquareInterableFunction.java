package arb.functions;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.VectorSpace;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface SquareInterableFunction<R extends Field<? extends R>> extends
                                        VectorSpace<R>,
                                        Function<R, R>
{

}
