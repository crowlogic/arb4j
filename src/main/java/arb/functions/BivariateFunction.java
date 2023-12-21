package arb.functions;

import static arb.expressions.Expression.instantiate;

import arb.Tuple;

public interface BivariateFunction<DA, DB, R> extends
                                  MultivariateFunction<R>
{
  public static <A, B, R> BivariateFunction<A, B, R> express(Class<? extends A> firstDomainClass,
                                                             Class<? extends B> secondDomainClass,
                                                             Class<? extends R> rangeClass,
                                                             String expression,
                                                             boolean verbose)
  {
    Tuple                      tuple    = new Tuple(firstDomainClass,
                                                    secondDomainClass);
    @SuppressWarnings("unchecked")
    BivariateFunction<A, B, R> instance = instantiate(expression,
                                                      null,
                                                      Tuple.class,
                                                      rangeClass,
                                                      BivariateFunction.class,
                                                      verbose);
    return instance;
  }

}
