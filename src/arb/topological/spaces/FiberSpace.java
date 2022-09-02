package arb.topological.spaces;

import arb.geometry.Manifold;

/**
 * Fibre space
 * 
 * An object (X,π,B) , where π:X→B is a continuous surjective mapping of a
 * topological space X onto a topological space B (i.e., a fibration). Note that
 * X, B and π are also called the total space, the base space and the projection
 * of the fibre space, respectively, and π←[{b}] is called the fibre above b. A
 * fibre space can be regarded as the union of the fibres π←[{b}], parametrized
 * by the base space B and glued by the topology of X. For example, there is the
 * product π:B×F→B, where π is the projection onto the first factor; the
 * fibration-base π:B→B, where π=id and X is identified with B; and the fibre
 * space over a point, where X is identified with a (unique) space F
 * 
 * .
 * 
 * A section of a fibration (fibre space) is a continuous mapping s:B→X such
 * that π∘s=idB
 * 
 * .
 * 
 * The restriction of a fibration (fibre space) π:X→B to a subset A⊆B is the
 * fibration π′:X′→A, where X′=dfπ←[A] and π′=dfπ|X′
 * 
 * . A generalization of the operation of restriction is the construction of an
 * induced fibre bundle.
 * 
 * A mapping F:X→X1 is called a morphism of a fibre space π:X→B into a fibre
 * space π1:X1→B1 if and only if it maps fibres into fibres, i.e., if for each
 * point b∈B, there exists a point b1∈B1 such that F[π←[{b}]]⊆π←[{b1}]. Such an
 * F determines a mapping f:B→B1, given by f(b)=df(π∘F)[π←[{b}]]. Note that F is
 * a covering of f and that π1∘F=f∘π; the restrictions Fb:π←[{b}]→π←1[{b1}] are
 * mappings of fibres. If B=B1 and f=id, then F is called a B-morphism. Fibre
 * spaces with their morphisms form a category — one that contains fibre spaces
 * over B with their B
 * 
 * -morphisms as a subcategory.
 * 
 * Any section of a fibration π:X→B is a fibre-space B-morphism s:B→X from
 * (B,id,B) into (X,π,B). If A⊆B, then the canonical imbedding i:π←[A]→B is a
 * fibre-space morphism from π|A to π
 * 
 * .
 * 
 * When F is a homeomorphism, it is called a fibre-space isomorphism. A fibre
 * space isomorphic to a product is called a trivial fibre space. An isomorphism
 * θ:X→B×F is called a trivialization of π
 * 
 * .
 * 
 * If each fibre π←[{b}] is homeomorphic to a space F, then π is called a
 * fibration with fibre F. For example, in any locally trivial fibre space over
 * a connected base space B, all the fibres π←[{b}] are homeomorphic to one
 * another, and one can take F to be any π←[{b0}]; this determines
 * homeomorphisms ϕb:F→π←[{b}].
 * 
 * @see <a href=
 *      "https://encyclopediaofmath.org/wiki/Fibre_space">FibreSpace@Wikipedia</a>
 *
 */
public interface FiberSpace extends
                            Manifold
{

}