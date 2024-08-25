package arb.functions.sequences.integer;

import arb.Integer;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Returns the number of ‘1’ bits in the given Z (aka
 * <a href="https://oeis.org/A000120">Hamming weight or population count</a>).
 * The return value is undefined if the input is negative.
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
