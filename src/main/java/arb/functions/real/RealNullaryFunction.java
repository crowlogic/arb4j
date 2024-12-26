package arb.functions.real;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.functions.Function;
import arb.functions.NullaryFunction;

/**
 * @author ©2024 Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne for © terms
 */
public interface RealNullaryFunction extends
                                     NullaryFunction<Real>
{
  public static Expression<Object, Real, RealNullaryFunction> parse(String expression)
  {
    return NullaryFunction.parse(Real.class,
                                 RealNullaryFunction.class,
                                 Parser.expressionToUniqueClassname(expression),
                                 expression,
                                 null);
  }

  public static Expression<Object, Real, RealNullaryFunction> compile(String expression, Context context)
  {
    return compile(null, expression, context);
  }

  public static Expression<Object, Real, RealNullaryFunction>
         compile(String functionName, String expression, Context context)
  {
    return Compiler.compile(functionName,
                            expression,
                            context,
                            Object.class,
                            Real.class,
                            RealNullaryFunction.class,
                            false);
  }

  public static RealNullaryFunction express(String functionName, String expression, Context context)
  {
    return Function.instantiate(expression, context, Object.class, Real.class, RealNullaryFunction.class, functionName);
  }

  public static RealNullaryFunction express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static RealNullaryFunction express(String expression)
  {
    return express(null, expression, null);
  }

  public default double eval()
  {
    return evaluate().doubleValue();
  }
}
