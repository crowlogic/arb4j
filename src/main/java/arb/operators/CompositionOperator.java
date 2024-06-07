package arb.operators;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface CompositionOperator<D, F extends Function<? extends D, ? extends D>, G extends Function<? extends D, ? extends D>>
                                    extends
                                    ComplexFunction,
                                    LinearOperator<D, F, G>
{

  Complex evaluate(Complex t, int order, int prec, Complex res);

  ComplexFunction apply(ComplexFunction x, int bits, ComplexFunction result);

}