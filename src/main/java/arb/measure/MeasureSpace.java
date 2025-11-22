package arb.measure;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.Space;

/**
 * A {@link MeasureSpace} is a basic {@link Space} of {@link MeasureTheory}
 * which generalizes the notion of volume. It contains an underlying set X, the
 * measurable subsets constituting the {@link σField} and the method that is
 * used for measuring (the {@link Measure}). One important example of a measure
 * space is a {@link ProbabilitySpace}.
 * 
 * A measurable space consists of the first two components without a specific
 * measure, thus.
 * 
 * A measure space is a triple <b>(Σ,A,μ)</b> where<br>
 * 
 * <pre>
 * X is a set
 * Σ is the {@link σField} of the set X
 * μ is a {@link Measure} on (X,Σ)
 * </pre>
 * 
 * In other words, a measure space consists of a {@link MeasurableSpace} (Σ,A )
 * together with a {@link Measure} on it and thus {@link MeasureSpace} extends
 * {@link MeasurableSpace} and provides the method {@link #μ()} to specify the
 * measure
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 * 
 */
public interface MeasureSpace<X, Σ extends σField<? extends X>, μ extends Measure<X, Σ>> extends
                             MeasurableSpace<X, Σ>
{
  public Measure<X, Σ> μ();
}
