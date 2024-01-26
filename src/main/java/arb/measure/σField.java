package arb.measure;

import arb.SubSet;

/**
 * A σ-algebra (also called a σ-field (of random events)) on a set X is a
 * nonempty collection Σ of {@link SubSet} of X closed under taking complements,
 * countable unions, and countable intersections. The ordered pair ( X , Σ ) is
 * a {@link MeasurableSpace}. For an intuitive description of what the σ-field
 * of random events is, see the excellent "Stochastic finite elements: a
 * spectral approach" by Ghanem & Spanos, 1991.
 * 
 * @param <X>
 */
public class σField<X> implements
                   SubSet<X>
{

}
