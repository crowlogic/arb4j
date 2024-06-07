package arb.functions.sequences;

import arb.Integer;
import arb.OrderedPair;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 * The Kronecker delta. If left=right then return 1 else return 0
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class KroneckerDelta implements
                            Function<OrderedPair<Integer, Integer>, Integer>
{

  @Override
  public Integer evaluate(OrderedPair<Integer, Integer> pair, int order, int bits, Integer res)
  {
    return res.set(pair.a.equals(pair.b) ? 1 : 0);
  }

}
