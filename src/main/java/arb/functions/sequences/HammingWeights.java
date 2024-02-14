package arb.functions.sequences;

import arb.Integer;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Returns the number of ‘1’ bits in the given Z (aka Hamming weight or
 * population count). The return value is undefined if the input is negative.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class HammingWeights implements
                            IntegerSequence
{

  @Override
  public Integer evaluate(Integer t, int order, int bits, Integer res)
  {
    return res.set(arblib.fmpz_popcnt(t.swigCPtr));
  }

}
