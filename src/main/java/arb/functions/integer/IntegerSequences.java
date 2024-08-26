package arb.functions.integer;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class IntegerSequences
{

  public static final IntegerSequence V0                                    = IntegerSequence.express("(exp(π*n*I)-1)/(n+2)");
  /**
   * <a href="https://oeis.org/A060632">A060632</a> a(n) = 2^wt(floor(n/2)) (i.e.,
   * 2^A000120(floor(n/2)), or A001316(floor(n/2))).<br>
   * <br>
   * Number of conjugacy classes in the symmetric group S_n that have odd number
   * of elements.<br>
   * <br>
   * 
   */
  public static final IntegerSequence symmetricGroupOddConjugacyClassCounts = IntegerSequence.express("n->Σbinomial(n, 2k) mod 2{k=0..⌊n/2⌋}");
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
  public static final IntegerSequence gouldsSequence                        = IntegerSequence.express("n->Σbinomial(n,k) mod 2{k=0..n}");
  /**
   * <pre>
   * n≀ = n!/⌊n/2⌋!²
   * </pre>
   * 
   * <br>
   * 
   * Exactly p consecutive multiples of p follow the least positive multiple of p
   * if p is an odd prime.<br>
   * 
   * <a href="https://oeis.org/A056040">A056040 Swinging factorial, a(n) = 2^(n-(n
   * mod 2))*Product_{k=1..n} k^((-1)^(k+1))</a>
   */
  public static final IntegerSequence swingingFactorials                    = IntegerSequence.express("n->n!/⌊n/2⌋!²");
  /**
   * Dual to the this{@link #swingingFactorials} <br><br>
   * 
   * <a href="https://oeis.org/A100071">A100071     a(n) = n * binomial(n-1, floor((n-1)/2)) = n * max_{i=0..n} binomial(n-1, i)</a>
   */
  public static final IntegerSequence A100071 = IntegerSequence.express("n*binomial(n-1, ⌊(n-1)/2)⌋");

}
