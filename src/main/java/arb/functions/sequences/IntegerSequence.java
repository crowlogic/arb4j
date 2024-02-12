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
  public static IntegerSequence gouldsSequence     = express("a(n) = Σbinomial(n,k) mod 2{k=0..n}");

  /**
   * by the swinging factorial of n we understand the ratio of n! to
   * floor(n/2)*c!^2 and denote it by no = n! bn/2c!2 (n > 0) . (1.1) bxc is the
   * floor-function giving the largest integer not greater than x. The first few
   * values of no are displayed in table 1. We write (n k ) = n!/(k!(n − k)!) for
   * the binomial coefficient. Let μn = ( n bn/2c ) denote the middle binomial
   * coefficient. Then no = μn if n is even, otherwise no = μn((n + 1)/2). Thus no
   * is always an integer
   */
  public static IntegerSequence swingingFactorials = express("2^(n-(n mod 2))*∏(k=1..n)k^((-1)^(k+1))=n!/⌊n/2⌋!²");
}
