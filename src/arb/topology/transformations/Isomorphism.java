package arb.topology.transformations;

/**
 * 
 * 
 * Isomorphism is a very general concept that appears in several areas of
 * mathematics. The word derives from the Greek iso, meaning "equal," and
 * morphosis, meaning "to form" or "to shape."
 * 
 * Formally, an isomorphism is bijective morphism. Informally, an isomorphism is
 * a map that preserves sets and relations among elements. "A is isomorphic to
 * B" is written A=B. Unfortunately, this symbol is also used to denote
 * geometric congruence.
 * 
 * An isomorphism from a set of elements onto itself is called an automorphism.
 *
 */
public interface Isomorphism<A,B> extends
                             Transformation,
                             Morphism<A,B,B>
{

}
