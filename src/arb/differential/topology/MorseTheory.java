package arb.differential.topology;

import arb.functions.Function;
import arb.geometry.Manifold;
import arb.theoretical.HomologyTheory;
import arb.theoretical.Theory;

/**
 * Morse theory enables one to analyze the topology of a {@link Manifold} by
 * studying differentiable {@link Function}s on that manifold.
 * 
 * According to the basic insights of Marston Morse, a typical differentiable
 * function on a manifold will reflect the topology quite directly.
 * 
 * Morse theory allows one to find CW structures and handle decompositions on
 * manifolds and to obtain substantial information about their homology.
 * 
 * @see HomologyTheory
 *
 */
public interface MorseTheory extends
                             Theory
{

}
