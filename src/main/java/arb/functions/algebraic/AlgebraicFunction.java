package arb.functions.algebraic;

import arb.AlgebraicNumber;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.functions.Function;

public interface AlgebraicFunction extends
                                   Function<AlgebraicNumber, AlgebraicNumber>
{

  public static Expression<AlgebraicNumber, AlgebraicNumber, AlgebraicFunction>
         compile(String expression)
  {
    return compile(expression, null);
  }

  public static Expression<AlgebraicNumber, AlgebraicNumber, AlgebraicFunction>
         compile(String expression, Context context)
  {
    return Compiler.compile(expression,
                            context,
                            AlgebraicNumber.class,
                            AlgebraicNumber.class,
                            AlgebraicFunction.class,
                            null);
  }

  public static AlgebraicFunction express(String expression)
  {
    return express(null, expression, null);
  }

  public static AlgebraicFunction express(String expression, Context context)
  {
    return Function.instantiate(expression,
                                context,
                                AlgebraicNumber.class,
                                AlgebraicNumber.class,
                                AlgebraicFunction.class,
                                null);
  }

  public static AlgebraicFunction express(String expression, Context context, boolean verbose)
  {
    return Function.instantiate(expression,
                                context,
                                AlgebraicNumber.class,
                                AlgebraicNumber.class,
                                AlgebraicFunction.class,
                                null);
  }

  public static AlgebraicFunction express(String expression, String string)
  {
    return express(expression, string, null);
  }

  public static AlgebraicFunction express(String functionName, String expression, Context context)
  {
    return express(functionName, expression, context, false);
  }

  public static AlgebraicFunction
         express(String functionName, String expression, Context context, boolean verbose)
  {
    return Function.instantiate(expression,
                                context,
                                AlgebraicNumber.class,
                                AlgebraicNumber.class,
                                AlgebraicFunction.class,
                                functionName);
  }

  public static Expression<AlgebraicNumber, AlgebraicNumber, AlgebraicFunction>
         parse(String expression)
  {
    return Function.parse(Parser.expressionToUniqueClassname(expression),
                          expression,
                          null,
                          AlgebraicNumber.class,
                          AlgebraicNumber.class,
                          AlgebraicFunction.class,
                          null,
                          null);
  }

  public static Expression<AlgebraicNumber, AlgebraicNumber, AlgebraicFunction>
         parse(String expression, Context context)
  {
    return Function.parse(Parser.expressionToUniqueClassname(expression),
                          expression,
                          context,
                          AlgebraicNumber.class,
                          AlgebraicNumber.class,
                          AlgebraicFunction.class,
                          null,
                          null);
  }

}
