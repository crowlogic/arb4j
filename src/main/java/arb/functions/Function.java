package arb.functions;

import static arb.expressions.Expression.instantiate;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.NotDifferentiableException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.complex.ComplexFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 * 
 * @param <D>
 * @param <R>
 */
@SuppressWarnings("unchecked")
public interface Function<D, R> extends
                         AutoCloseable
{
  public default void close()
  {

  }

  public default Class<D> domainType()
  {
    assert false : "this should be implemented by extending class";
    return null; // for instance, the RealFunction would return Real.class for both the domain
                 // and range
  }

  public default Class<R> rangeType()
  {
    assert false : "this should be implemented by extending class";
    return null;
  }

  /**
   * <pre>
   * Evaluates this function f(t). It can be assumed that the result and input(t)
   * are not aliased. When called with order = 0, func should write to out the
   * value of f at the point t, evaluated at a precision of prec bits.
   * 
   * In this case, f can be an arbitrary complex function, which may have branch
   * cuts or even be non-holomorphic.
   * 
   * When called with order = n >= 1, the
   * this{@link #evaluate(Object, int, int, Object)} method should write to res
   * the first n coefficients in the Taylor series expansion of f at the point t,
   * evaluated at a precision of prec bits. 
   * 
   * NOTE: In this case, the implementation must verify that f is a 
   * {@link ComplexFunction} on the complex interval defined by t, 
   * and set the coefficients in the result(res) to non-finite values 
   * otherwise.
   * 
   * For algorithms that do not rely on derivatives,
   * this{@link #evaluate(Object, int, int, Object)} will always get called with
   * order = 0 or order = 1, in which case the user only needs to implement
   * evaluation of the direct function value (without derivatives).
   * 
   * With order = 1, func must verify holomorphicity (unlike the order = 0 case).
   * 
   * If f is built from field operations and meromorphic functions, then no
   * special action is necessary when order is positive since division by zero or
   * evaluation of builtin functions at poles automatically produces infinite
   * enclosures.
   * 
   * <b>However,special care is needed for bounded functions with branch cuts.
   * </b> For example, when evaluating f , the output must be set to a non-finite
   * value if it overlaps with the branch cut.
   * 
   * The easiest way to accomplish this is to use versions of basic functions
   * (sqrt, log, pow, etc.) that test holomorphicity of their arguments
   * individually.
   * 
   * Some functions with branch cut detection are available as builtins: see
   * acb_sqrt_analytic(), acb_rsqrt_analytic(), acb_log_analytic(),
   * acb_pow_analytic().
   * 
   * It is not difficult to write custom functions of this type; 
   * see <a href=
  "https://arblib.org/acb_calc.html#c.acb_calc_func_t">acb_calc_func</a> for examples
   * </pre>
   * 
   * .
   * 
   * @param t     point
   * @param order
   * @param bits  bits of precision the result should be evaluated with
   * @param res   output result
   * @return res after it has been assigned the values of the function evaluated
   *         at t
   */
  public R evaluate(D t, int order, int bits, R res);

  /**
   * shortcut that maps to this{@link #evaluate(Object, int, int, Object)} with
   * order=1
   * 
   * @param t
   * @param bits
   * @param res
   * @return result
   */
  public default R evaluate(D t, int bits, R res)
  {
    return evaluate(t, 1, bits, res);
  }

  public default Function<D, R> differential() throws NotDifferentiableException
  {
    assert false : "TODO: implement in " + getClass();
    return null;
  }

  public default int getInverseBranchCount()
  {
    assert false : "TODO: implement in " + getClass();
    return 0;
  }

  public default Function<R, D> inverse(int branch)
  {
    assert false : "TODO: implement in " + getClass();
    return null;
  }

  /**
   * Returns the result of
   * {@link Expression#instantiate(String, Context, Class, Class, Class, String)}
   * after calling {@link Context#registerFunction(String, Function)} to register
   * the function by name in the specified {@link Context}
   * 
   * @param <D>
   * @param <R>
   * @param <F>
   * @param domainClass
   * @param rangeClass
   * @param functionName
   * @param expression
   * @param context
   * @return
   */
  public static <D, R, F extends Function<D, R>> F express(Class<? extends D> domainClass,
                                                           Class<? extends R> rangeClass,
                                                           String functionName,
                                                           String expression,
                                                           Context context)
  {
    return (F) instantiate(expression, context, domainClass, rangeClass, Function.class, functionName);
  }

  public static <D, R, F extends Function<D, R>>
         F
         express(Class<? extends D> domainClass, Class<? extends R> rangeClass, String expression, Context context)
  {
    return (F) instantiate(expression, context, domainClass, rangeClass, Function.class, null);
  }

  public static <D, R, F extends Function<D, R>>
         F
         express(Class<? extends D> domainClass, Class<? extends R> rangeClass, String expression, boolean verbose)
  {
    return (F) instantiate(expression, new Context(), domainClass, rangeClass, Function.class, null);
  }

  public static <D, R> Function<D, R> express(Class<? extends D> domainClass,
                                              Class<? extends R> rangeClass,
                                              String expression)
  {
    return express(domainClass, rangeClass, expression, new Context());
  }

  public static <D, R> Function<? extends D, ? extends R> express(Class<? extends D> domainClass,
                                                                  Class<? extends R> rangeClass,
                                                                  String expression,
                                                                  Context context,
                                                                  boolean verbose)
  {
    return instantiate(expression, context, domainClass, rangeClass, Function.class, null);
  }

}
