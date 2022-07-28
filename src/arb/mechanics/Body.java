package arb.mechanics;

import arb.Set;

/**
 * The often-used term body needs to stand for a wide assortment of objects,
 * including particles, projectiles, spacecraft, stars, parts of machinery,
 * parts of solids, parts of fluids (gases and liquids), etc.
 * 
 * @see <a href="https://en.wikipedia.org/wiki/Physical_object">Wikipedia</a>
 */
public interface Body<X> extends
                     Set<X>
{

}
