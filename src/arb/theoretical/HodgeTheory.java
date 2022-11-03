package arb.theoretical;

import arb.geometry.DifferentiableManifold;
import arb.geometry.differential.RiemannianManifold;
import arb.geometry.differential.RiemannianMetric;

/**
 * Hodge theory, named after W. V. D. Hodge, is a method for studying the
 * cohomology groups of a smooth manifold (aka a {@link DifferentiableManifold}
 * M using partial differential equations.
 * 
 * The key observation is that, given a {@link RiemannianMetric} on M, every
 * cohomology class has a canonical representative, a differential form that
 * vanishes under the Laplacian operator of the metric. Such forms are called
 * harmonic.
 * 
 * The theory was developed by Hodge in the 1930s to study algebraic geometry,
 * and it built on the work of Georges de Rham on de Rham cohomology. It has
 * major applications in two settings: {@link RiemannianManifold} and Kähler
 * manifolds. Hodge's primary motivation, the study of complex projective
 * varieties, is encompassed by the latter case.
 * 
 * Hodge theory has become an important tool in algebraic geometry, particularly
 * through its connection to the study of algebraic cycles.
 * 
 * While Hodge theory is intrinsically dependent upon the real and complex
 * numbers, it can be applied to questions in number theory. In arithmetic
 * situations, the tools of p-adic Hodge theory have given alternative proofs
 * of, or analogous results to, classical Hodge theory.
 * 
 * @author crow
 *
 */
public interface HodgeTheory extends
                             Theory
{

}
