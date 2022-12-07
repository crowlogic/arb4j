package arb.topology.transformations;

/**
 * A morphism f: X → Y is called an isomorphism if there exists a morphism g: Y
 * → X such that f ∘ g = idY and g ∘ f = idX. If a morphism has both
 * left-inverse and right-inverse, then the two inverses are equal, so f is an
 * isomorphism, and g is called simply the inverse of f. Inverse morphisms, if
 * they exist, are unique. The inverse g is also an isomorphism, with inverse f.
 * Two objects with an isomorphism between them are said to be isomorphic or
 * equivalent.
 *
 * @param <A>
 */
public interface Automorphism<A> extends
                             Isomorphism<A, A>
{

}
