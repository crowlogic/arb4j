package arb.differential.geometry;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.VectorSpace;

/**
 * The orientation of a real vector space or simply orientation of a vector
 * space is the arbitrary choice of which ordered bases are "positively"
 * oriented and which are "negatively" oriented. In the three-dimensional
 * Euclidean space, right-handed bases are typically declared to be positively
 * oriented, but the choice is arbitrary, as they may also be assigned a
 * negative orientation. A vector space with an orientation selected is called
 * an oriented vector space, while one not having an orientation selected, is
 * called unoriented.
 *
 * @param <F> The type of the field over which the vector space is defined. This
 *            should extend the {@link Field} interface.
 * @param <X> The type of the elements in the vector space.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface OrientedVectorSpace<F extends Field<? extends F>, X> extends
                                    VectorSpace<F>
{

}
