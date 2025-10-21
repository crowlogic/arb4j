package arb.functions;

import static arb.utensils.Utensils.throwOrWrap;

import java.io.Closeable;

import arb.Typesettable;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.*;
import arb.functions.complex.ComplexFunction;

/**
 * 
 * @param <D> the domain
 * @param <C> the co-domain
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Function<D, C> extends
                         Closeable,
                         AutoCloseable,
                         Typesettable
{

  public default <F extends Function<? extends D, ? extends C>> F derivative()
  {
    assert false : "TODO: " + getClass() + " should implement this";
    return null;
  }

  public default Function<D, C> integral()
  {
    assert false : "TODO: " + getClass() + " should implement this";
    return null;
  }

  public static <D, C, F extends Function<? extends D, ? extends C>>
         Expression<D, C, F>
         compile(Class<? extends D> domainClass,
                 Class<? extends C> coDomainClass,
                 Class<? extends F> functionClass,
                 String expression,
                 Context context)
  {
    Expression<D,
                  C,
                  F> parsedExpression =
                                      Function.parse(Parser.expressionToUniqueClassname(expression),
                                                     expression,
                                                     context,
                                                     domainClass,
                                                     coDomainClass,
                                                     functionClass,
                                                     null,
                                                     null);
    parsedExpression.compile();

    return parsedExpression;
  }

  public static <D, C, F extends Function<? extends D, ? extends C>>
         F
         express(Class<? extends D> class1,
                 Class<? extends C> class2,
                 Class<? extends F> class3,
                 String expression,
                 Context context)
  {
    return express(class1, class2, class3, null, expression, context);

  }

  public static <D, C, F extends Function<? extends D, ? extends C>>
         F
         express(Class<? extends D> domainClass,
                 Class<? extends C> coDomainClass,
                 String expression)
  {
    return (F) Function.instantiate(expression,
                                    new Context(),
                                    domainClass,
                                    coDomainClass,
                                    Function.class,
                                    null);
  }

  public static <D, C, F extends Function<? extends D, ? extends C>>
         F
         express(Class<? extends D> domainClass,
                 Class<? extends C> coDomainClass,
                 Class<? extends F> functionClass,
                 String expression)
  {
    return (F) Function.instantiate(expression,
                                    new Context(),
                                    domainClass,
                                    coDomainClass,
                                    functionClass,
                                    null);
  }

  @SuppressWarnings("unchecked")
  public static <D, C, F extends Function<? extends D, ? extends C>>
         F
         express(Class<? extends D> domainClass,
                 Class<? extends C> coDomainClass,
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

  @SuppressWarnings("unchecked")
  public static <D, C, F extends Function<? extends D, ? extends C>>
         F
         express(Class<? extends D> domainClass,
                 Class<? extends C> coDomainClass,
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

  public static <D, C, F extends Function<? extends D, ? extends C>>
         F
         express(Class<? extends D> domainClass,
                 Class<? extends C> coDomainClass,
                 Class<? extends F> functionClass,
                 String expressionName,
                 String expression)
  {
    return express(domainClass, coDomainClass, functionClass, expressionName, expression, null);
  }

  public static <D, C, F extends Function<? extends D, ? extends C>>
         F
         express(Class<? extends D> domainClass,
                 Class<? extends C> coDomainClass,
                 Class<? extends F> functionClass,
                 String expressionName,
                 String expression,
                 Context context)
  {
    return (F) Function.instantiate(expression,
                                    context,
                                    domainClass,
                                    coDomainClass,
                                    functionClass,
                                    expressionName);
  }

  public static <D, C, F extends Function<D, C>> F express(String functionName,
                                                           Class<? extends D> domainClass,
                                                           Class<? extends C> coDomainClass,
                                                           Class<? extends F> functionClass,
                                                           String expression)
  {
    return Function.instantiate(expression,
                                new Context(),
                                domainClass,
                                coDomainClass,
                                functionClass,
                                functionName);
  }

  public static <D, C, F extends Function<? extends D, ? extends C>>
         F
         express(String functionName,
                 Class<? extends D> domainClass,
                 Class<? extends C> coDomainClass,
                 Class<? extends F> functionClass,
                 String expression,
                 Context context)
  {
    return Function.instantiate(expression,
                                context,
                                domainClass,
                                coDomainClass,
                                functionClass,
                                functionName);
  }

  static <D, C, F extends Function<? extends D, ? extends C>>
         F
         instantiate(String expression,
                     Context context,
                     Class<? extends D> domainClass,
                     Class<? extends C> coDomainClass,
                     Class<? extends F> functionClass,
                     String functionName)
  {
    Expression<D,
                  C,
                  F>    compiledExpression = Compiler.compile(expression,
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

  static <D, C, F extends Function<? extends D, ? extends C>> F instantiate(String className,
                                                                            String expression,
                                                                            Context context,
                                                                            Class<D> domainClass,
                                                                            Class<C> coDomainClass,
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

  public static <D, C, F extends Function<? extends D, ? extends C>>
         Expression<D, C, F>
         parse(Class<? extends D> domainClass,
               Class<? extends C> coDomainClass,
               Class<? extends F> functionClass,
               String expression)
  {
    return parse(null, expression, null, domainClass, coDomainClass, functionClass, null, null);
  }

  public static <D, C, F extends Function<? extends D, ? extends C>>
         Expression<D, C, F>
         parse(Class<? extends D> domainClass,
               Class<? extends C> coDomainClass,
               Class<? extends F> functionClass,
               String expression,
               Context context)
  {
    return parse(Parser.expressionToUniqueClassname(expression),
                 expression,
                 context,
                 domainClass,
                 coDomainClass,
                 functionClass,
                 null,
                 null);
  }

  public static <D,
                C,
                F extends Function<? extends D, ? extends C>,
                PD,
                PC,
                PF extends Function<? extends PD, ? extends PC>>
         Expression<D, C, F>
         parse(String className,
               String expression,
               Context context,
               Class<? extends D> domainClass,
               Class<? extends C> coDomainClass,
               Class<? extends F> functionClass,
               String functionName,
               Expression<PD, PC, PF> containingExpression)
  {
    int     punctuationMarkIndex = expression.indexOf(":");
    boolean autonamed            = true;
    if (punctuationMarkIndex != -1)
    {
      String inlineFunctionName = expression.substring(0, punctuationMarkIndex);
      if (functionName != null && !functionName.equals(inlineFunctionName))
      {
        throw new CompilerException(String.format("functionName='%s' specified via function argument != inlineFunctionName='%s'",
                                                  functionName,
                                                  inlineFunctionName));
      }
      functionName = inlineFunctionName;
      expression   = expression.substring(punctuationMarkIndex + 1, expression.length());
      autonamed    = false;
    }
    expression = expression.replaceAll(" ", "");

    var expr = new Expression<D, C, F>(className,
                                       domainClass,
                                       coDomainClass,
                                       functionClass,
                                       expression,
                                       context,
                                       functionName,
                                       containingExpression);
    expr.functionNameSpecified = !autonamed;

    return expr.parseRoot();
  }

  public default void close()
  {

  }

  public default Class<C> coDomainType()
  {
    assert false : "this should be implemented by " + getClass();
    return null;
  }

  public default Class<D> domainType()
  {
    assert false : "this should be implemented by " + getClass();
    return null; // for instance, the RealFunction would return Real.class for both the domain
                 // and coDomain
  }

  public default C evaluate(D t, int bits)
  {
    return evaluate(t, 1, bits);
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
  public default C evaluate(D t, int bits, C res)
  {
    return evaluate(t, 1, bits, res);
  }

  public default C evaluate(D t, int order, int bits)
  {
    C result = coDomainType().isInterface() ? null : newCoDomainInstance();
    return evaluate(t, order, bits, result);
  }

  /**
   * <pre>
   * Evaluates this function f(t). When called with order = 0, func should write
   * to out the value of f at the point t, evaluated at a precision of prec bits.
   * 
   * In this case, f can be an arbitrary complex function, which may have branch
   * cuts or even be non-holomorphic.
   * 
   * When called with order = n >= 1, the
   * this{@link #evaluate(Object, int, int, Object)} method should write to res
   * the first n coefficients in the Taylor series expansion of f at the point t,
   * evaluated at a precision of prec bits.
   * 
   * NOTE: In this case, the implementation should verify that f is a
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
  public C evaluate(D t, int order, int bits, C res);

  public default D newDomainInstance()
  {
    try
    {
      return domainType().getConstructor().newInstance();
    }
    catch (Throwable e)
    {
      throwOrWrap(e);
      return null;
    }
  }

  public default C newCoDomainInstance()
  {
    assert !coDomainType().isInterface() : "cannot instantiate the interface class "
                                           + coDomainType();
    try
    {
      return coDomainType().getConstructor().newInstance();
    }
    catch (Throwable e)
    {
      throwOrWrap(e);
      return null;
    }
  }

  @Override
  default String typeset()
  {
    assert false : getClass() + " needs to implement this";
    return null;
  }

}
