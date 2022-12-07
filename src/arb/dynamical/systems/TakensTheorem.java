package arb.dynamical.systems;

import arb.theoretical.Theorem;

/**
 * Takens' theorem is the 1981 delay embedding theorem of Floris Takens. It
 * provides the conditions under which a smooth attractor can be reconstructed
 * from the observations made with a generic function. Later results replaced
 * the smooth attractor with a set of arbitrary box counting dimension and the
 * class of generic functions with other classes of functions.
 * 
 * Delay embedding theorems are simpler to state for
 * {@link DiscreteTimeDynamicalSystem}
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Takens%27s_theorem">Taken's
 *      theorem</a>
 */
public interface TakensTheorem extends
                               DelayEmbeddingTheorem
{

}
