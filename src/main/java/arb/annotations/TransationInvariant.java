package arb.annotations;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.groups.Group;
import arb.groups.LocallyCompactTopologicalGroup;
import arb.measure.HaarMeasure;
import arb.measure.Measure;
import io.fair_acc.bench.Measurable;

/**
 * Defines an annotation indicating that a method or class possesses the
 * property of translation invariance, crucial in the context of
 * {@link HaarMeasure} and {@link LocallyCompactTopologicalGroup}. Translation invariance
 * ensures that the {@link Measure} or operation remains consistent across
 * different locations within the group, a foundational aspect in harmonic
 * analysis, abstract algebra, and related fields.
 * 
 * This property asserts that for any {@link Measurable} set {@code A} in the
 * {@link Group}, and any element {@code g} of the group, the measure of
 * {@code A} and the measure of its translate {@code gA} (or {@code Ag} for
 * right translation) are the same, adhering to the principle that
 * {@code m(gA) = m(A)} for a left Haar measure, or {@code m(Ag) = m(A)} for a
 * right Haar measure.
 * 
 * The existence and uniqueness of the Haar measure on locally compact groups
 * highlight the interplay between group structure, topology, and measure
 * theory, emphasizing the role of symmetry and structure in the universe.
 *
 * @author Stephen A. Crowley ©2024
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@Retention(RetentionPolicy.RUNTIME)
public @interface TransationInvariant
{

}
