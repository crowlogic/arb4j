package arb.differential.geometry;

import arb.topological.spaces.VectorSpace;

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
 * @param <X>
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Orientation_(vector_space)">Orientation
 *      of vector spaces@Wikipedia</a>
 */
public interface OrientedVectorSpace<X> extends
                                    VectorSpace<X>
{

}
