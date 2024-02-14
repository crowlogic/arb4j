package arb.functions.sequences;

import static arb.expressions.Expression.instantiate;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface IntegerSequence extends
                                 Sequence<Integer>
{
  public static IntegerSequence express(String expression)
  {
    return instantiate(expression, null, Integer.class, Integer.class, IntegerSequence.class, null);
  }

  /**
   * <a href="https://oeis.org/A060632">A060632</a> a(n) = 2^wt(floor(n/2)) (i.e.,
   * 2^A000120(floor(n/2)), or A001316(floor(n/2))).<br>
   * <br>
   * Number of conjugacy classes in the symmetric group S_n that have odd number
   * of elements.<br>
   * <br>
   * 
   */
  public static IntegerSequence symmetricGroupOddConjugacyClassCounts = express("n->Σbinomial(n, 2k) mod 2{k=0..⌊n/2⌋}");

  /**
   * <a href="https://oeis.org/A001316">A001316 Gould's sequence<a>: <br>
   * <br>
   * 
   * a(n) = Σbinomial(n,k) mod 2{k=0..n} = 2^SwingingFactorial(n)<br>
   * <br>
   * 
   * Number of odd entries in row n of Pascal's triangle (A007318)
   * 
   * {@link}
   */
  public static IntegerSequence gouldsSequence                        = express("n->Σbinomial(n,k) mod 2{k=0..n}");

  /**
   * <pre>
   * by the swinging factorial of n we understand the ratio of n! to
   * floor(n/2)*c!^2 and denote it by no = n!/floor(n/2)*c!^2  (n > 0) . 
   * 
   * We write (n k ) = n!/(k!(n − k)!) for the binomial coefficient. 
   * 
   * Let μn = ( n bn/2c ) denote the middle binomial  coefficient. 
   * 
   * Then no = μn if n is even, otherwise no = μn((n + 1)/2). 
   * 
   * Thus no is always an integer
   * </pre>
   */
  public static IntegerSequence swingingFactorials                    = express("n->2^(n-(n mod 2))*∏(k=1..n)k^((-1)^(k+1))=n!/⌊n/2⌋!²");
}
