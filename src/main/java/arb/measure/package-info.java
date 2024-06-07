/**
 * <pre>
 * The 'arb.measure' package in the arb4j library forms the foundational framework for measure theory in Java.
 * This package primarily consists of interfaces that define key concepts and structures in measure theory.
 * It is designed to provide the core definitions and fundamental abstractions necessary for implementing
 * measure-theoretic concepts.
 *
 * Key interfaces and their primary definitions include:
 * - {@link arb.measure.σField}: Represents a σ-field (or σ-algebra), a collection of subsets of a set X that is
 *   closed under complement, countable union, and countable intersection. The pair (X, Σ) forms a measurable space.
 * - {@link arb.measure.Measure}: An interface that conceptualizes a measure, a function from a σ-algebra Σ over X
 *   to the real numbers, satisfying the properties of non-negativity, null empty set, and σ-additivity.
 * - {@link arb.measure.MeasureSpace}: Defines the concept of a measure space, a triple (X, Σ, μ) where X is a set,
 *   Σ is a σ-algebra on X, and μ is a measure on (X, Σ). It extends {@link arb.measure.MeasurableSpace} and provides
 *   a method {@link arb.measure.MeasureSpace#μ()} to specify the measure.
 * - {@link arb.measure.ProbabilityMeasure}: Specifies the interface for Probability Measures, a measure P on a
 *   measurable space (Ω, Σ) with P(Ω) = 1, fundamental in probability theory and statistics.
 * - {@link arb.measure.MeasurableSpace}: Represents a measurable space, a pair (X, Σ) where X is a set and Σ is a
 *   σ-algebra on X. It extends the {@link arb.space.topological.TopologicalSpace} interface.
 * - {@link arb.measure.HaarMeasure}: Defines the interface for Haar Measure, a specific type of measure used in
 *   certain contexts, central to the study of topological groups and harmonic analysis.
 * - {@link arb.measure.RadonMeasure}: Establishes the framework for Radon Measures, another specific type of measure
 *   important in the theory of distributions and potential theory.
 * - {@link arb.measure.LebesgueMeasure}: Outlines the interface for Lebesgue Measure, a standard way of assigning a
 *   measure to subsets of n-dimensional Euclidean space, coinciding with the standard measure of length, area, or
 *   volume in dimensions 1, 2, or 3. It is foundational in modern integration theory and real analysis.
 *
 * This package is intended as a theoretical backbone for the application of measure theory in various domains.
 * It allows for the extension and customization in practical implementations, serving as a versatile toolkit
 * for research, and application development.
 * </pre>
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
package arb.measure;
