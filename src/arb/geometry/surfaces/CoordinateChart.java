package arb.geometry.surfaces;

import arb.SubSet;
import arb.topology.transformations.Homeomorphism;

/**
 * By definition, every point of a locally Euclidean space has a neighborhood
 * homeomorphic to an open subset of R^n. Such neighborhoods are called
 * Euclidean neighborhoods. It follows from invariance of domain that Euclidean
 * neighborhoods are always open sets. One can always find Euclidean
 * neighborhoods that are homeomorphic to "nice" open sets in R^n. Indeed, a
 * space M is locally Euclidean if and only if either of the following
 * equivalent conditions holds:
 * 
 * every point of M has a neighborhood homeomorphic to an open ball in R^n.
 * every point of M has a neighborhood homeomorphic to R^n itself.
 * 
 * A Euclidean neighborhood homeomorphic to an open ball in R^n is called a
 * Euclidean ball. Euclidean balls form a basis for the topology of a locally
 * Euclidean space.
 * 
 * For any Euclidean neighborhood U, a homeomorphism ϕ : U → ϕ(U)⊂R^n is called
 * a {@link CoordinateChart} on U (although the word chart is frequently used to
 * refer to the domain or range of such a map). A space M is locally Euclidean
 * if and only if it can be covered by Euclidean neighborhoods. A set of
 * Euclidean neighborhoods that cover M, together with their coordinate charts,
 * is called an atlas on M. (The terminology comes from an analogy with
 * cartography whereby a spherical globe can be described by an atlas of flat
 * maps or charts).
 * 
 * Given two charts ϕ and ψ with overlapping domains U and V, there is a
 * transition function
 * <p>
 * ψ*ϕ^(−1):ϕ(U∩V)→ψ(U∩V)
 * </p>
 * Such a map is a {@link Homeomorphism} between open {@link SubSet} of R^n.
 * That is, coordinate charts agree on overlaps up to homeomorphism. Different
 * types of manifolds can be defined by placing restrictions on types of
 * transition maps allowed. For example, for differentiable manifolds the
 * transition maps are required to be smooth.
 * 
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Topological_manifold#Coordinate_charts">TopologicalManifold@Wikipedia</a>
 * @see <a href=
 *      "https://en.wikipedia.org/wiki/Category:Coordinate_charts_in_general_relativity">CoordinateChartsInGeneralRelativity@Wikipedia</a>
 */
public interface CoordinateChart extends Homeomorphism
{

}
