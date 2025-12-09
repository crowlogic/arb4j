package arb.stochastic.processes;

import arb.Field;
import arb.functions.Function;
import arb.space.topological.VectorSpace;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public interface GaussianProcess<D extends Field<? extends D>,
              R extends Field<? extends R>,
              K extends Function<? extends D, ? extends R>,
              V extends VectorSpace<? extends D>>
{

}
