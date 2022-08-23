package arb.topological.spaces;

import arb.Complex;
import arb.Field;
import arb.OrthonormalBasis;
import arb.Real;
import arb.functions.Function;
import arb.functions.FunctionSpace;
import arb.topological.Space;

/**
 * Hilbert spaces (named after David Hilbert) allow generalizing the methods of
 * linear algebra and calculus from (finite-dimensional) Euclidean vector spaces
 * to spaces that may be infinite-dimensional. A Hilbert space is a vector space
 * equipped with an inner product which defines a distance function for which it
 * is a complete metric space. Hilbert spaces arise naturally and frequently in
 * mathematics and physics, typically as {@link FunctionSpace}.<br>
 * 
 * A Hilbert space H is a {@link Real} or {@link Complex} inner product space
 * that is also a complete {@link MetricSpace} with respect to the distance
 * function induced by the inner product.<br>
 * 
 * An element of a {@link HilbertSpace} can be uniquely specified by its
 * coordinates with respect to an {@link OrthonormalBasis}, in analogy with
 * Cartesian coordinates in classical geometry.<br>
 * 
 * When this basis is countably infinite, it allows identifying the Hilbert
 * space with the space of the <b>infinite sequences<b> that are
 * <b><i>square-summable</i></b>. The latter space is often in the older
 * literature referred to as *the* {@link HilbertSpace}.
 */
public interface HilbertSpace<D extends Field> extends
                             InnerProductSpace<D>
{
}
