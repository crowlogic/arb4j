package arb.topological.spaces;

import arb.Field;
import arb.functions.Function;
import arb.topological.Space;

/**
 * Hilbert spaces (named after David Hilbert) allow generalizing the methods of
 * linear algebra and calculus from (finite-dimensional) Euclidean vector spaces
 * to spaces that may be infinite-dimensional. A Hilbert space is a vector space
 * equipped with an inner product which defines a distance function for which it
 * is a complete metric space. Hilbert spaces arise naturally and frequently in
 * mathematics and physics, typically as function spaces.<br>
 * 
 * A Hilbert space H is a real or complex inner product space that is also a
 * complete metric space with respect to the distance function induced by the
 * inner product.<br>
 * 
 * An element of a Hilbert space can be uniquely specified by its coordinates
 * with respect to an orthonormal basis, in analogy with Cartesian coordinates
 * in classical geometry.<br>
 * 
 * When this basis is countably infinite, it allows identifying the Hilbert
 * space with the space of the infinite sequences that are square-summable. The
 * latter space is often in the older literature referred to as the Hilbert
 * space.
 */
public interface HilbertSpace<D extends Field> extends
                             Space
{
  public <P extends Field> P innerProduct(D left, D right);
}
