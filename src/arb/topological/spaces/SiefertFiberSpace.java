package arb.topological.spaces;

import arb.geometry.Manifold;
import arb.topological.Space;

/**
 * A Seifert manifold is a closed 3-manifold together with a decomposition into
 * a disjoint union of circles (called fibers) such that each fiber has a
 * tubular neighborhood that forms a standard fibered torus.
 * 
 * A standard fibered torus corresponding to a pair of coprime integers (a,b)
 * with a > 0 is the surface bundle of the automorphism of a disk given by
 * rotation by an angle of 2 π b / a (with the natural fibering by circles). If
 * a = 1 the middle fiber is called ordinary, while if a > 1 the middle fiber is
 * called exceptional. A compact Seifert fiber space has only a finite number of
 * exceptional fibers.
 * 
 * The set of fibers forms a 2-dimensional orbifold, denoted by B and called the
 * base —also called the orbit surface— of the fibration. It has an underlying
 * 2-dimensional surface B_0 but may have some special orbifold points
 * corresponding to the exceptional fibers.
 * 
 * The definition of Seifert fibration can be generalized in several ways. The
 * Seifert manifold is often allowed to have a boundary (also fibered by
 * circles, so it is a union of tori). When studying non-orientable manifolds,
 * it is sometimes useful to allow fibers to have neighborhoods that look like
 * the surface bundle of a reflection (rather than a rotation) of a disk, so
 * that some fibers have neighborhoods looking like fibered Klein bottles, in
 * which case there may be one-parameter families of exceptional curves. In both
 * of these cases, the base B of the fibration usually has a non-empty boundary.
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Seifert_fiber_space">SiefertFiberSpace@Wikipedia</a>
 */
public interface SiefertFiberSpace extends
                                   FiberSpace
{

}
