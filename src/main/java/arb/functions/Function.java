package arb.functions;

import static arb.utensils.Utensils.throwOrWrap;

import arb.Typesettable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.functions.complex.ComplexFunction;
import arb.space.topological.VectorSpace;

/**
 * 
 * @param <D> the domain
 * @param <C> the co-domain
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Function<D, C> extends
                         AutoCloseable,
                         Typesettable,
                         VectorSpace<C>
{

  @Override
  default String
          typeset()
  {
    assert false : getClass() + " needs to implement this";
    return null;
  }

  @SuppressWarnings("unchecked")
  public static <D, R, F extends Function<? extends D, ? extends R>>
         F
         express(Class<? extends D> domainClass,
                 Class<? extends R> coDomainClass,
                 String expression)
  {
    return (F) Function.instantiate(expression,
                                    new Context(),
                                    domainClass,
                                    coDomainClass,
                                    Function.class,
                                    null);
  }

  @SuppressWarnings("unchecked")
  public static <D, R, F extends Function<? extends D, ? extends R>>
         F
         express(Class<? extends D> domainClass,
                 Class<? extends R> coDomainClass,
                 String expression,
                 Context context)
  {
    return (F) Function.instantiate(expression,
                                    context,
                                    domainClass,
                                    coDomainClass,
                                    Function.class,
                                    null);
  }

  public static <D, R, F extends Function<? extends D, ? extends R>>
         Expression<D, R, F>
         compile(Class<? extends D> domainClass,
                 Class<? extends R> coDomainClass,
                 String expression,
                 Context context)
  {
    return Function.parse(Parser.expressionToUniqueClassname(expression),
                          expression,
                          context,
                          domainClass,
                          coDomainClass,
                          Function.class,
                          null,
                          null);
  }

  @SuppressWarnings("unchecked")
  public static <D, R, F extends Function<? extends D, ? extends R>>
         F
         express(Class<? extends D> domainClass,
                 Class<? extends R> coDomainClass,
                 String expression,
                 boolean verbose)
  {
    return (F) Function.instantiate(expression,
                                    new Context(),
                                    domainClass,
                                    coDomainClass,
                                    Function.class,
                                    null);
  }

  public static <D, R, F extends Function<D, R>>
         F
         express(String functionName,
                 Class<? extends D> domainClass,
                 Class<? extends R> coDomainClass,
                 String expression,
                 Class<? extends F> functionClass)
  {
    return Function.instantiate(expression,
                                new Context(),
                                domainClass,
                                coDomainClass,
                                functionClass,
                                functionName);
  }

  public static <D, R, F extends Function<D, R>>
         F
         express(String functionName,
                 Class<? extends D> domainClass,
                 Class<? extends R> coDomainClass,
                 String expression,
                 Class<? extends F> functionClass,
                 Context context)
  {
    return Function.instantiate(expression,
                                context,
                                domainClass,
                                coDomainClass,
                                functionClass,
                                functionName);
  }

  @SuppressWarnings("unchecked")
  public static <D, R>
         Function<? extends D, ? extends R>
         express(Class<? extends D> domainClass,
                 Class<? extends R> coDomainClass,
                 String expression,
                 Context context,
                 boolean verbose)
  {
    return Function.instantiate(expression,
                                context,
                                domainClass,
                                coDomainClass,
                                Function.class,
                                null);
  }

  public static <D, R, F extends Function<D, R>>
         F
         express(Class<? extends D> domainClass,
                 Class<? extends R> coDomainClass,
                 String expressionName,
                 String expression,
                 Context context,
                 Class<? extends F> functionClass)
  {
    return (F) Function.instantiate(expression,
                                    context,
                                    domainClass,
                                    coDomainClass,
                                    functionClass,
                                    expressionName);
  }

  public static <D, R, F extends Function<D, R>>
         F
         express(Class<? extends D> domainClass,
                 Class<? extends R> coDomainClass,
                 String expression,
                 Class<? extends F> functionClass)
  {
    return (F) Function.instantiate(expression,
                                    new Context(),
                                    domainClass,
                                    coDomainClass,
                                    functionClass,
                                    null);
  }

  public static <D, R, F extends Function<D, R>>
         F
         express(Class<? extends D> domainClass,
                 Class<? extends R> coDomainClass,
                 String expression,
                 Context context,
                 Class<? extends F> functionClass)
  {
    return (F) Function.instantiate(expression,
                                    context,
                                    domainClass,
                                    coDomainClass,
                                    functionClass,
                                    null);
  }

  @SuppressWarnings("unchecked")
  public static <D, R, F extends Function<D, R>>
         F
         express(Class<? extends D> domainClass,
                 Class<? extends R> coDomainClass,
                 String functionName,
                 String expression,
                 Context context)
  {
    return (F) Function.instantiate(expression,
                                    context,
                                    domainClass,
                                    coDomainClass,
                                    Function.class,
                                    functionName);
  }

  public default void
         close()
  {

  }


  public default Class<D>
         domainType()
  {
    assert false : "this should be implemented by extending class";
    return null; // for instance, the RealFunction would return Real.class for both the domain
                 // and coDomain
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
   * {@link ComplexFunction} on the complex interval defined by t, and set the
   * coefficients in the result(res) to non-finite values otherwise.
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
   * </b> For example, when evaluating f , <b>the output must be set to a
   * non-finite value if it overlaps with the branch cut.</b>
   * 
   * The easiest way to accomplish this is to use versions of basic functions
   * (sqrt, log, pow, etc.) that test holomorphicity of their arguments
   * individually.
   * 
   * Some functions with branch cut detection are available as builtins: see
   * acb_sqrt_analytic(), acb_rsqrt_analytic(), acb_log_analytic(),
   * acb_pow_analytic().
   * 
   * @param t     point
   * @param order
   * @param bits  bits of precision the result should be evaluated with
   * @param res   output result
   * @return res after it has been assigned the values of the function evaluated
   *         at t
   */
  public C
         evaluate(D t,
                  int order,
                  int bits,
                  C res);

  public default C
         evaluate(D t,
                  int bits)
  {
    return evaluate(t,
                    1,
                    bits);
  }

  public default C
         evaluate(D t,
                  int order,
                  int bits)
  {
    return evaluate(t,
                    order,
                    bits,
                    newCoDomainInstance());
  }

  public default C
         newCoDomainInstance()
  {
    try
    {
      return coDomainType().getConstructor()
                           .newInstance();
    }
    catch (Throwable e)
    {
      throwOrWrap(e);
      return null;
    }
  }

  /**
   * shortcut that maps to this{@link #evaluate(Object, int, int, Object)} with
   * order=1
   * 
   * @param t
   * @param bits
   * @param res
   * @return result
   */
  public default C
         evaluate(D t,
                  int bits,
                  C res)
  {
    return evaluate(t,
                    1,
                    bits,
                    res);
  }

  public default int
         getInverseBranchCount()
  {
    assert false : "TODO: implement in " + getClass();
    return 0;
  }

  public default Function<C, D>
         inverse(int branch)
  {
    assert false : "TODO: implement in " + getClass();
    return null;
  }

  public default Class<C>
         coDomainType()
  {
    assert false : "this should be implemented by " + getClass();
    return null;
  }

  static <R, D, F extends Function<? extends D, ? extends R>, PD, PR, PF extends Function<? extends PD, ? extends PR>>
         Expression<D, R, F>
         parse(String className,
               String expressionString,
               Context context,
               Class<? extends D> domainClass,
               Class<? extends R> coDomainClass,
               Class<? extends F> functionClass,
               String functionName,
               Expression<PD, PR, PF> containingExpression)
  {
    var expression = new Expression<D, R, F>(className,
                                             domainClass,
                                             coDomainClass,
                                             functionClass,
                                             expressionString,
                                             context,
                                             functionName,
                                             containingExpression);

    return expression.parseRoot();
  }

  static <D, R, F extends Function<D, R>>
         F
         instantiate(String className,
                     String expression,
                     Context context,
                     Class<D> domainClass,
                     Class<R> coDomainClass,
                     Class<F> functionClass,
                     boolean verbose)
  {
    return Compiler.compile(className,
                            expression,
                            context,
                            domainClass,
                            coDomainClass,
                            functionClass,
                            verbose)
                   .instantiate();
  }

  static <D, R, F extends Function<? extends D, ? extends R>>
         F
         instantiate(String expression,
                     Context context,
                     Class<? extends D> domainClass,
                     Class<? extends R> coDomainClass,
                     Class<? extends F> functionClass,
                     String functionName)
  {
    Expression<D, R, F> compiledExpression = Compiler.compile(expression,
                                                              context,
                                                              domainClass,
                                                              coDomainClass,
                                                              functionClass,
                                                              functionName);

    F                   func               = compiledExpression.instantiate();

    if (compiledExpression.mapping != null)
    {
      compiledExpression.mapping.instance = func;
    }

    return func;
  }

}
