package arb.measures;

/**
 * Hausdorff measure is a generalization of the traditional notions of area and
 * volume to non-integer dimensions, specifically fractals and their Hausdorff
 * dimensions. It is a type of outer measure, named for Felix Hausdorff, that
 * assigns a number in [0,∞] to each set in R^n or, more generally, in any
 * metric space.
 * 
 * The zero-dimensional Hausdorff measure is the number of points in the set (if
 * the set is finite) or ∞ if the set is infinite. Likewise, the one-dimensional
 * Hausdorff measure of a simple curve in R^n is equal to the length of the
 * curve, and the two-dimensional Hausdorff measure of a Lebesgue-measurable
 * subset of R^2 is proportional to the area of the set. Thus, the concept of
 * the Hausdorff measure generalizes the Lebesgue measure and its notions of
 * counting, length, and area. It also generalizes volume. In fact, there are
 * d-dimensional Hausdorff measures for any d ≥ 0, which is not necessarily an
 * integer. These measures are fundamental in geometric measure theory. They
 * appear naturally in harmonic analysis or potential theory.
 * 
 *
 */
public interface HausdorffMeasure extends
                                  Measure
{

}
