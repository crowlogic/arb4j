package arb.stochastic.processes;

import arb.Field;
import arb.functions.*;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public interface OscillatoryProcess<D extends Field<? extends D>, R extends Field<? extends R>>
                                   extends
                                   GaussianProcess<D,
                                                 R,
                                                 Function<D, R>,
                                                 SquareInterableFunctions<D>>
{
  public RealBivariateToComplexFunction gainFunction();

  public RealBivariateToComplexFunction oscillatoryFunction();
}
