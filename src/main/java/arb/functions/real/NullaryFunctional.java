package arb.functions.real;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.functions.NullaryFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface NullaryFunctional<D, C, F extends Function<? extends D, ? extends C>> extends
                                  Functional<Object, D, C, F>,
                                  NullaryFunction<F>
{

  F evaluate(int bits);

  F evaluate();

}