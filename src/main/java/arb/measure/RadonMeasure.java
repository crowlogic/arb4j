package arb.measure;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.LocallyCompactHausdorffSpace;

/**
 * Represents a Radon Measure, which is a type of measure defined on a
 * {@link LocallyCompactHausdorffSpace} that can assign a finite measure to all
 * compact subsets. Radon measures are particularly valuable in the field of
 * functional analysis and are widely used in various branches of mathematics
 * including probability theory and potential theory.
 *
 * <p>
 * Radon measures extend the general concept of measures by incorporating
 * topological properties, making them suitable for applications where both
 * measure-theoretic and topological considerations are essential. This
 * interface extends {@link Measure}, thus inheriting the basic properties of
 * measures such as non-negativity, null empty set, and σ-additivity.
 * </p>
 *
 * @param <X> the type of elements in the space where the measure is defined.
 * @param <Σ> the type of σField, representing the measurable subsets of X.
 *
 * @see Measure for the foundational properties of measures.
 * @see BusinessSourceLicenseVersionOnePointOne for terms of the
 *      {@link TheArb4jLibrary}.
 */
public interface RadonMeasure<X extends LocallyCompactHausdorffSpace<?>, Σ extends σField<? extends X>> extends
                             Measure<X, Σ>
{
  // Additional methods specific to the behavior of Radon measures can be defined
  // here,
  // such as methods to assess the compactness of sets, or to integrate functions
  // over the space.
}
