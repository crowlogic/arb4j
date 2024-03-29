package arb.functions.sequences;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 * 
 * @param <R> the range of the {@link Function}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */

public interface Sequence<R> extends
                         Function<Integer, R>
{

  public static <Q> Sequence<? extends Q> express(String name,
                                                  Class<? extends Q> rangeType,
                                                  String expression,
                                                  Class<? extends Sequence<Q>> functionClass)
  {
    return Function.express(name, Integer.class, rangeType, expression, functionClass);
  }

  public static <Q> Sequence<? extends Q> express(Class<? extends Q> rangeType,
                                                  String expression,
                                                  Class<? extends Sequence<Q>> functionClass)
  {
    return Function.express(Integer.class, rangeType, expression, functionClass);
  }

}
