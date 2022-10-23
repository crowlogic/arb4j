package arb.geometry.algebraic;

import arb.geometry.surfaces.RiemannSurface;

/**
 * modular curves are {@link ModuliSpace}s for {@link EllipticCurve}s with
 * {@link LevelStructure}
 * 
 */
public interface ModularCurve<E extends EllipticCurve, L extends LevelStructure<E>> extends
                             ModuliSpace<L>,
                             RiemannSurface<L>
{

}
