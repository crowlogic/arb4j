package arb.functions.sequences;

import arb.Integer;
import arb.Polynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.polynomials.quasi.QuasiPolynomial;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface QuasiPolynomialSequence<S, P extends Polynomial<S, ? extends P>, V extends Function<S, S>, C extends QuasiPolynomial<S, P, V, C>>
                                        extends
                                        Sequence<C>
{

  public static <S, P extends Polynomial<S, ? extends P>, V extends Function<S, S>, C extends QuasiPolynomial<S, P, V, C>, Q extends QuasiPolynomialSequence<S, P, V, C>>
         Q
         express(String name,
                 Class<? extends C> coDomainType,
                 String expression,
                 Class<? extends Q> functionClass,
                 Context context)
  {
    return Function.express(name, Integer.class, coDomainType, expression, functionClass, context);
  }

}
