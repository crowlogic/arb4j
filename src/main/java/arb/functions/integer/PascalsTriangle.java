package arb.functions.integer;

import java.util.List;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Pascal's Triangle can be generated using binomial coefficients, where the
 * element in the nth row and kth column is given by <br>
 * <br>
 * binom(n,k)=n!/(k!*((n−k)!))<br>
 * <br>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class PascalsTriangle implements
                             RealTriangularArray
{
  public static void main(String args[])
  {
    int count = 0;
    try ( PascalsTriangle pascalsTriangle = new PascalsTriangle())
    {
      while (count++ < 10)
      {
        RealPolynomial row = pascalsTriangle.evaluate(count, 128, new RealPolynomial());
        System.out.format("C[%d]=%s\n", count, row);
      }
    }
  }

  @Override
  public RealPolynomial evaluate(Integer row, int order, int bits, RealPolynomial res)
  {
    final int n = row.getSignedValue();
    try ( var rowIndex = new Real(); )
    {
      rowIndex.set(n);
      var rowValues = new RealPolynomial(n);
      for (int k = 0; k < n; k++)
      {
        rowIndex.C(k, bits, rowValues.get(k));
      }
      res.become(rowValues);
      return res;
    }
  }

  @Override
  public List<RealPolynomial> enumerate(int i, int j)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

}
