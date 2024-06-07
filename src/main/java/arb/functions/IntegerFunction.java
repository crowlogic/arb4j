package arb.functions;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface IntegerFunction extends
                                 Function<Integer, Integer>
{

  public static IntegerFunction express(String string)
  {
    return Function.express(Integer.class, Integer.class, string, IntegerFunction.class);
  }

}
