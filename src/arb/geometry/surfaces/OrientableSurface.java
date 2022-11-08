package arb.geometry.surfaces;

import arb.functions.Function;
import arb.topological.spaces.TangentSpace;

/**
 * A regular surface M subset R^n is called orientable if each
 * {@link TangentSpace} M_p has a complex structure J_p:M_p->M_p such that
 * p->J_p is a continuous {@link Function}.
 * 
 * @param <X>
 */
public interface OrientableSurface<X> extends
                                  Surface<X>
{

}
