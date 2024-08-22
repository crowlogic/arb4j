package arb.functions.sequences;

import static java.util.stream.IntStream.rangeClosed;

import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealSequence extends
                              Sequence<Real>
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
  @SuppressWarnings("resource")
  public default Real enumerate(int i, int j)
  {
    return new Real(rangeClosed(i, j).mapToObj(this)).setName(String.format("%s over %d..%d",
                                                                            toString(),
                                                                            i,
                                                                            j));
  }

  @Override
  default Real newCoDomainInstance()
  {
    return new Real();
  }

  public static RealSequence express(String expression)
  {
    return (RealSequence) Sequence.express(Real.class, expression, RealSequence.class);
  }

  public static RealSequence express(String expression, Context context)
  {
    return (RealSequence) Sequence.express(Real.class, expression, RealSequence.class, context);
  }

  public static RealSequence express(String name, String expression)
  {
    return (RealSequence) Sequence.express(name, Real.class, expression, RealSequence.class);
  }

  public static RealSequence express(String name, String expression, Context context)
  {
    return (RealSequence) Sequence.express(name,
                                           Real.class,
                                           expression,
                                           RealSequence.class,
                                           context);
  }

  public static Expression<?, ?, ?> compile(String string)
  {
    return Function.compile(Integer.class, Real.class, RealSequence.class, string, new Context());
  }

}
