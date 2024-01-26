package arb.dynamical.systems;

import arb.measure.Measure;
import arb.measure.σField;

public interface MeasurePreservingFlow<X, Σ extends σField<X>> extends
                                      Measure<X, Σ>
{

}
