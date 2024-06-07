package arb.operators;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.space.topological.Space;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Operator<IN extends Space<?>, OUT extends Space<?>>
{
  OUT apply(IN x, int bits, OUT result);
}
