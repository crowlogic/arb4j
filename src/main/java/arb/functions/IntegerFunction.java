package arb.functions;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface IntegerFunction extends
                                 Function<Integer, Integer>
{
  public default Integer
         eval(int n)
  {
    try ( Integer val = new Integer(n))
    {
      return evaluate(val,
                      n,
                      new Integer());
    }
  }

  public static IntegerFunction
         express(String string)
  {
    return Function.express(Integer.class,
                            Integer.class,
                            IntegerFunction.class,
                            string);
  }

  public static Expression<Integer, Integer, IntegerFunction>
         parse(String string)
  {
    return Function.parse(Integer.class,
                          Integer.class,
                          IntegerFunction.class,
                          string);
  }

}
