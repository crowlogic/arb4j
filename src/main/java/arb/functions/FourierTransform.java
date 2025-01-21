package arb.functions;

import arb.Field;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.operators.IntegralOperator;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface FourierTransform<D extends Field<? extends D>, F extends Function<? extends D, ? extends D>> extends
                                 IntegralOperator<D, F, SquareInterableFunctions<D>, SquareInterableFunctions<D>>
{

}
