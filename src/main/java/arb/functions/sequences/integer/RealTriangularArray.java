package arb.functions.sequences.integer;

import arb.Complex;
import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.sequences.Sequence;

/**
 * a triangular array of {@link Real} or {@link Complex} numbers,
 * {@link RealPolynomial}s, or the like, is a doubly indexed sequence in which
 * each row's degree is equal to the index (or +1)
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealTriangularArray extends
                                     Sequence<RealPolynomial>

{
  @Override
  public default RealPolynomial evaluate(Integer _n, int order, int bits, RealPolynomial res)
  {
    final int n = _n.getSignedValue();
    try ( Real rowIndex = new Real();)
    {
      rowIndex.set(_n);
      var rowValues = Real.newVector(n);
      for (int k = 0; k < n; k++)
      {
        Real result = rowValues.get(k);
        rowIndex.C(k, bits, result);
      }
      res.set(rowValues);
      return res;
    }
  }

}
