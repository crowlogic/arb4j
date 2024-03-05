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

  public static IntegerSequence V0                                    = express("(exp(π*n*I)-1)/(n+2)");

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
   * n≀ = n!/⌊n/2⌋!² 
   * </pre>
   * 
   * <a href="https://oeis.org/A056040">A056040 Swinging factorial, a(n) = 2^(n-(n
   * mod 2))*Product_{k=1..n} k^((-1)^(k+1))</a>
   */
  public static IntegerSequence swingingFactorials                    = express("n->n!/⌊n/2⌋!²");
}
