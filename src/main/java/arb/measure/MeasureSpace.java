package arb.measure;

/**
 * A {@link MeasureSpace} is a basic space of {@link MeasureTheory} which
 * generalizes the notion of volumes. It contains an underlying set, the subsets
 * of this set that are feasible for measuring (the σ-algebra) and the method
 * that is used for measuring (the measure). One important example of a measure
 * space is a probability space.
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
public interface MeasureSpace<X, Σ extends σField<X>> extends
                             MeasurableSpace<X>
{
  public Measure<X,Σ> μ();
}
