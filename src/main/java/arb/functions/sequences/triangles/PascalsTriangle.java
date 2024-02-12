package arb.functions.sequences.triangles;

import arb.Integer;
import arb.functions.sequences.IntegerSequence;

/**
 * Pascal's Triangle can be generated using binomial coefficients, where the
 * element in the nth row and kth column is given by <br>
 * <br>
 * binom(n,k)=n!/(k!*((n−k)!))<br>
 * <br>
 * 
 */
public class PascalsTriangle implements
                             TriangularIntegerSequence
{

  @Override
  public IntegerSequence evaluate(Integer n, int order, int bits, IntegerSequence res)
  {
    assert false : "TODO: return the n-th sequence of binomial coeffecients";
    return null;
  }

}
