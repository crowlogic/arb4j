package arb.geometry.algebraic;

import arb.geometry.surfaces.RiemannSurface;
import arb.groups.ModularGroup;

/**
 * modular curves are {@link ModuliSpace}s for {@link EllipticCurve}s with
 * {@link LevelStructure}
 * 
 * TODO: relate to the {@link ModularGroup}
 */
public interface ModularCurve<E extends EllipticCurve, L extends LevelStructure<E>> extends
                             ModuliSpace<L>,
                             RiemannSurface<L>
{

}
