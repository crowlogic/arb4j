package arb.space.topological;

import arb.Complex;

/**
 * A Hardy space is a HilbertSpace with inner product given by:
 * <code>(f|g)=sup{0&lt;r&lt;1}(∫(f(r*e^(i*𝜃))*conj(g(r*e^(i*𝜃)))d𝜃=0..2π))</code>
 */
public interface HardySpace<VE, V extends HilbertSpace<Complex, VE, V>> extends
                           HilbertSpace<Complex, VE, V>
{

}
