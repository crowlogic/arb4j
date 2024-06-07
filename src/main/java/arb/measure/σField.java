package arb.measure;

import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * A σ-algebra, or σ-algebra, (also called a σ-field (of "random events")) on a
 * set X is a nonempty collection Σ of subset(subclass in java terms) of X
 * closed under taking complements, countable unions, and countable
 * intersections. The pair ( X , Σ ) is a {@link MeasurableSpace}. For an
 * intuitive description of what the σ-field of random events is, see the
 * excellent {@link Bibliography#stochasticFiniteElements}
 * 
 * @param <X>
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface σField<X> extends
                       MeasurableSpace<X, σField<? extends X>>
{

}
