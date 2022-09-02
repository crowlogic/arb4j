package arb.topological.spaces;

/**
 * a vector bundle is a topological construction that makes precise the idea of
 * a family of vector spaces parameterized by another space X (for example X
 * could be a topological space, a manifold, or an algebraic variety): to every
 * point x of the space X we associate (or "attach") a vector space V(x) in such
 * a way that these vector spaces fit together to form another space of the same
 * kind as X (e.g. a topological space, manifold, or algebraic variety), which
 * is then called a vector bundle over X.
 * 
 * The simplest example is the case that the family of vector spaces is
 * constant, i.e., there is a fixed vector space V such that V(x) = V for all x
 * in X: in this case there is a copy of V for each x in X and these copies fit
 * together to form the vector bundle X × V over X. Such vector bundles are said
 * to be trivial. A more complicated (and prototypical) class of examples are
 * the tangent bundles of smooth (or differentiable) manifolds: to every point
 * of such a manifold we attach the tangent space to the manifold at that point.
 * Tangent bundles are not, in general, trivial bundles. For example, the
 * tangent bundle of the sphere is non-trivial by the hairy ball theorem. In
 * general, a manifold is said to be parallelizable if, and only if, its tangent
 * bundle is trivial.
 * 
 * Vector bundles are almost always required to be locally trivial, however,
 * which means they are examples of fiber bundles. Also, the vector spaces are
 * usually required to be over the real or complex numbers, in which case the
 * vector bundle is said to be a real or complex vector bundle (respectively).
 * Complex vector bundles can be viewed as real vector bundles with additional
 * structure. In the following, we focus on real vector bundles in the category
 * of topological spaces.
 * 
 * @author crow
 *
 */
public interface VectorBundle extends
                              FiberBundle
{

}
