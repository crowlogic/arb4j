package arb.stochastic.processes;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.functions.RealBivariateToComplexFunction;
import arb.functions.SquareInterableFunctions;

/**
 * @author Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
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
