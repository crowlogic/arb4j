package arb;

import arb.space.topological.InnerProductSpace;

public interface OrthonormalBasis<F extends Field<F>, VE, S extends InnerProductSpace<F, VE>> extends
                                 OrthogonalBasis<F, VE>
{

}
