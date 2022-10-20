package arb.geometry.algebraic;

import arb.topological.TopologicalSpace;

/**
 * a moduli space is a geometric space (usually a scheme or an algebraic stack)
 * whose points represent algebro-geometric objects of some fixed kind, or
 * isomorphism classes of such objects. Such spaces frequently arise as
 * solutions to classification problems: If one can show that a collection of
 * interesting objects (e.g., the smooth algebraic curves of a fixed genus) can
 * be given the structure of a geometric space, then one can parametrize such
 * objects by introducing coordinates on the resulting space
 * 
 *
 * @param <X> the type of points of this moduli space
 */
public interface ModuliSpace<X> extends
                            TopologicalSpace<X>
{

}
