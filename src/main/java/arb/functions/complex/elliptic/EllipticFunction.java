package arb.functions.complex.elliptic;

import arb.functions.complex.MeromorphicFunction;

/**
 * 
 * @author crow
 *
 */
public interface EllipticFunction extends
                                  MeromorphicFunction
{
  public FundamentalPeriodPair periodPair();
}
