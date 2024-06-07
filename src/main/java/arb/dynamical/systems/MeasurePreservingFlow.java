package arb.dynamical.systems;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.measure.Measure;
import arb.measure.σField;

/**
 * 
 * @param <X>
 * @param <Σ>
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface MeasurePreservingFlow<X, Σ extends σField<X>> extends
                                      Measure<X, Σ>
{

}
