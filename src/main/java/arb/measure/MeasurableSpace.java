package arb.measure;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.Space;

/**
 * A {@link MeasureableSpace} is a basic space of measure theory defined by the
 * pair <b>(X,Σ)</b> which generalizes the notion of volumes. It contains an
 * underlying set X, the {@link MeasurableSpace} subsets of this set known as
 * the {@link σField} or σ-algebra, and the {@link Measure} defined on the
 * σ-algebra. A {@link MeasureSpace} is a {@link MeasurableSpace} together with
 * a {@link Measure} defined on it. Thus
 * 
 * <pre>
 * X is a set
 * Σ is a {@link σField} (also known as σ-algebra) on the set X
 * </pre>
 * 
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface MeasurableSpace<X, Σ extends σField<? extends X>> extends
                                Space<Σ>
{

}
