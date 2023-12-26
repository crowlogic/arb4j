package arb.functions;

import static arb.expressions.Expression.instantiate;

import arb.Tuple;
import arb.expressions.Context;
import arb.expressions.Expression;

/**
 * See {@link Tuple}
 * 
 * integers can be handled by considering it a univariate {@link Tuple} and then
 * using the generified
 * {@link MultivariateFunction}{@link #express(Class, String)}x
 * 
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs format of the same document respectively.
 * 
 * @param <R>
 */
public interface MultivariateFunction<R> extends
                                     Function<Tuple, R>
{

  @SuppressWarnings("unchecked")
  public static <R>
         MultivariateFunction<R>
         express(Class<? extends R> rangeClass, String expression, Context context, boolean verbose)
  {
    return instantiate(expression, context, Tuple.class, rangeClass, MultivariateFunction.class, verbose);
  }

  public static <R> MultivariateFunction<R> express(Class<? extends R> rangeClass,
                                                    String expression,
                                                    boolean verbose)
  {
    return express(rangeClass, expression, null, verbose);
  }

  public static <R> MultivariateFunction<R> express(Class<? extends R> rangeClass, String expression)
  {
    return express(rangeClass, expression, null);
  }

  public static <R> MultivariateFunction<R> express(Class<? extends R> rangeClass,
                                                    String expression,
                                                    Context context)
  {
    return express(rangeClass, null, expression, context, false);
  }

  /**
   * Returns the result of
   * {@link Expression#instantiate(String, Context, Class, Class, Class, boolean)}
   * afteRealFunction calling {@link Context#registerFunction(String, Function)}
   * to register the function by name in the specified {@link Context} '
   * 
   * @param rangeClass   the type of ther range of this functionj
   * @param functionName
   * @param expression
   * @param context
   * @return
   */
  public static <R>
         MultivariateFunction<R>
         express(Class<? extends R> rangeClass, String functionName, String expression, Context context)
  {
    return express(rangeClass, functionName, expression, context, false);
  }

  @SuppressWarnings("unchecked")
  public static <R> MultivariateFunction<R> express(Class<? extends R> rangeClass,
                                                    String functionName,
                                                    String expression,
                                                    Context context,
                                                    boolean verbose)
  {
    MultivariateFunction<R> func = instantiate(expression,
                                               context,
                                               Tuple.class,
                                               rangeClass,
                                               MultivariateFunction.class,
                                               verbose);
    if (functionName != null)
    {
      context.registerFunction(functionName, func);
    }

    return func;
  }

}
