package arb.functions.integer;

import static java.util.stream.IntStream.rangeClosed;

import java.lang.foreign.Arena;

import arb.Fraction;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.functions.Function;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface FractionSequence extends
                                  Sequence<Fraction>
{

  public static Expression<Integer, Real, RealSequence> parse(String expression)
  {
    return Function.parse(Parser.expressionToUniqueClassname(expression),
                          expression,
                          null,
                          Integer.class,
                          Real.class,
                          RealSequence.class,
                          null,
                          null);
  }

  /**
   * Enumerate elements of a {@link RealSequence}
   * 
   * @param i start index (inclusive)
   * @param j end index (inclusive)
   * @param f the {@link RealSequence} to be
   *          {@link RealSequence#evaluate(int, int)}ed
   * @return a {@link Real} whose {@link Real#dim} is equal to the number of
   *         elements of f
   */
  public default Fraction enumerate(int i, int j)
  {
    return Fraction.newVector(Arena.ofAuto(), j - i)
                   .set(rangeClosed(i, j).mapToObj(this).toArray(k -> new Fraction[k]))
                   .setName(String.format("%s over %d..%d", toString(), i, j));
  }

  public static FractionSequence express(String expression)
  {
    return (FractionSequence) Sequence.express(Fraction.class, expression, FractionSequence.class);
  }

  public static FractionSequence express(String expression, Context context)
  {
    return (FractionSequence) Sequence.express(Fraction.class, expression, FractionSequence.class, context);
  }

  public static FractionSequence express(String name, String expression)
  {
    return (FractionSequence) Sequence.express(name, Fraction.class, expression, FractionSequence.class);
  }

  public static FractionSequence express(String name, String expression, Context context)
  {
    return (FractionSequence) Sequence.express(name, Fraction.class, expression, FractionSequence.class, context);
  }

  public static Expression<?, ?, ?> compile(String string)
  {
    return Function.compile(Integer.class, Fraction.class, FractionSequence.class, string, new Context());
  }

}
