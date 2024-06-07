/**
 * A {@link arb.dynamical.systems.DynamicalSystem} may be defined formally as a
 * {@link arb.measure.Measure}-preserving transformation of a
 * {@link arb.measure.MeasureSpace}, the triplet (T, (X, Σ, μ), Φ). Here, T is a
 * monoid (usually the non-negative integers), X is a set, and (X, Σ, μ) is a
 * {@link arb.measure.ProbabilitySpace}, meaning that Σ is a sigma-algebra on X
 * and μ is a finite measure on (X, Σ). A map Φ: X → X is said to be
 * Σ-measurable if and only if, for every σ in Σ, one has Φ^(−1)*σ∈Σ . A map Φ
 * is said to preserve the measure if and only if, for every σ in Σ, one has
 * μ(Φ^(−1))=μ(σ) . Combining the above, a map Φ is said to be a
 * measure-preserving transformation of X , if it is a map from X to itself, it
 * is a Σ-{@link arb.measure.MeasurableSpace} , and is measure-preserving. The
 * triplet (T, (X, Σ, μ), Φ), for such a Φ, is then defined to be a
 * {@link arb.dynamical.systems.DynamicalSystem}.
 * 
 * The map Φ embodies the time evolution of the
 * {@link arb.dynamical.systems.DynamicalSystem}. Thus, for
 * {@link arb.dynamical.systems.DiscreteTimeDynamicalSystem}s the iterates Φ^n =
 * Φ ∘ Φ ∘ … ∘ Φ for every integer n are studied. For
 * {@link arb.dynamical.systems.ContinuousTimeDynamicalSystem}, the map Φ is
 * understood to be a finite time evolution map and the construction is more
 * complicated.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
package arb.dynamical.systems;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
