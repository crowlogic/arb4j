package arb.measure;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.EuclideanSpace;

/**
 * the Lebesgue measure, named after French mathematician Henri Lebesgue, is the
 * standard way of assigning a measure to subsets of n-dimensional
 * {@link EuclideanSpace}. For n = 1, 2, or 3, it coincides with the standard
 * {@link Measure} of length, area, or volume. In general, it is also called
 * n-dimensional volume, n-volume, or simply volume.[1] It is used throughout
 * real analysis, in particular to define Lebesgue integration. Sets that can be
 * assigned a Lebesgue measure are called Lebesgue-measurable; the measure of
 * the Lebesgue-measurable set A is here denoted by λ(A).
 * 
 * Henri Lebesgue described this measure in the year 1901, followed the next
 * year by his description of the Lebesgue integral. Both were published as part
 * of his dissertation in 1902.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface LebesgueMeasure<X extends EuclideanSpace<Real>, Σ extends σField<? extends X>> extends
                                HaarMeasure<X, Σ>
{

}
