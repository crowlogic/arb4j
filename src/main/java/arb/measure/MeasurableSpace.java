package arb.measure;

import arb.space.topological.TopologicalSpace;

/**
 * A {@link MeasureableSpace} is a basic space of measure theory which
 * generalizes the notion of volumes. It contains an underlying set, the
 * measurable subsets of this set known as the σ-algebra and the measure defined
 * on this space. One important example of a measure space is a
 * {@link ProbabilitySpace}
 * 
 * A measurable space consists of the first two components without a specific
 * measure, thus.
 * 
 * A measure space is a triple <b>(Σ,A,μ)</b> where<br>
 * 
 * <pre>
 * Σ is a set
 * A is a σ-algebra on the set Σ
 * μ is a measure on (Σ,A)
 * </pre>
 * 
 * In other words, a measure space consists of a {@link MeasurableSpace} (Σ,A )
 * together with a measure on it and thus {@link MeasureSpace} extends
 * {@link MeasurableSpace} and provides the method this{@link #μ()} to specify
 * the measure
 */
public interface MeasurableSpace<Σ> extends
                                TopologicalSpace<Σ>
{

}
