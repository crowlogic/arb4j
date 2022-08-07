package arb.measures;

import arb.topological.Space;

/**
 * A {@link MeasureSpace} is a basic object of {@link MeasureTheory} generalizes
 * the notion of volumes. It contains an underlying set, the subsets of this set
 * that are feasible for measuring (the σ-algebra) and the method that is used
 * for measuring (the measure). One important example of a measure space is a
 * probability space.
 * 
 * A measurable space consists of the first two components without a specific
 * measure, thus.
 * 
 * A measure space is a triple <b>(Σ,A,μ)</b> where
 * 
 * Σ is a set<br>
 * A is a σ-algebra on the set Σ<br>
 * μ is a measure on (Σ,A)<br>
 * 
 * In other words, a measure space consists of a {@link MeasurableSpace} (Σ,A )
 * together with a measure on it and thus {@link MeasureSpace} extends
 * {@link MeasurableSpace} and provides the method this{@link #μ()} to specify
 * the measure
 */
public interface MeasureSpace<Σ> extends
                             MeasurableSpace<Σ>
{
  public Measure<Σ> μ();
}
