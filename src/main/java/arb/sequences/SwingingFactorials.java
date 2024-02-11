package arb.sequences;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.IntegerSequence;

/**
 * by the swinging factorial of n we understand the ratio of n! to bn/2c!2 and
 * denote it by no = n! bn/2c!2 (n > 0) . (1.1) bxc is the floor-function giving
 * the largest integer not greater than x. The first few values of no are
 * displayed in table 1. We write (n k ) = n!/(k!(n − k)!) for the binomial
 * coefficient. Let μn = ( n bn/2c ) denote the middle binomial coefficient.
 * Then no = μn if n is even, otherwise no = μn((n + 1)/2). Thus no is always an
 * integer
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SwingingFactorials implements
                                IntegerSequence
{

  @Override
  public Integer evaluate(Integer t, int order, int bits, Integer res)
  {
    assert false : "TODO: return expressed n≀=2^(n-(n mod 2))*∏(k=1..n)k^((-1)^(k+1))=n!/⌊n/2⌋!²";
    return res;
  }

}
