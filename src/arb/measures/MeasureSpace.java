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
 * measure.
 */
public interface MeasureSpace<X extends MeasurableSpace> extends
                             Space<X>
{

}
