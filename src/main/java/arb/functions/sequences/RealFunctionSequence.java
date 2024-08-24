package arb.functions.sequences;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.functions.Function;
import arb.functions.real.RealFunction;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealFunctionSequence<R extends RealFunction> implements
                                 Sequence<R>
{

  public static <R extends RealFunctionSequence<? extends R>>
         Expression<Integer, RealFunction, R>
         compile(String expression)
  {
    return compile(expression, null);
  }

  public static <R extends RealFunctionSequence<? extends R>>
         Expression<Integer, RealFunction, R>
         compile(String expression, Context context)
  {
    return Compiler.compile(expression,
                            context,
                            Integer.class,
                            RealFunction.class,
                            RealFunctionSequence.class,
                            null);
  }

  public static <R extends RealFunctionSequence<? extends R>>
         RealFunctionSequence<? extends R>
         express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static <R extends RealFunctionSequence<? extends R>>
         RealFunctionSequence<? extends R>
         express(String expression)
  {
    return express(null, expression, null);
  }

  public static RealFunctionSequence express(String name, String expression, Context context)
  {
    return Function.express(Integer.class,
                            RealFunction.class,
                            RealFunctionSequence.class,
                            name,
                            expression,
                            context);
  }

  public static <R extends RealFunctionSequence<? extends R>>
         Expression<Integer, RealFunction, R>
         parse(String className, String string)
  {
    return Sequence.parse(className, RealFunctionSequence.class, RealFunction.class, string);
  }

  public static <R extends RealFunctionSequence<? extends R>>
         Expression<Integer, RealFunction, R>
         parse(String expression, Context context)
  {
    return parse(Parser.expressionToUniqueClassname(expression), expression, context);
  }

  public static <R extends RealFunctionSequence<? extends R>>
         Expression<Integer, RealFunction, R>
         parse(String name, String expression, Context context)
  {
    return Function.parse(name,
                          expression,
                          context,
                          Integer.class,
                          RealFunction.class,
                          RealFunctionSequence.class,
                          null,
                          null);
  }

  @Override
  public RealFunction evaluate(Integer t, int order, int bits, RealFunction res)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

}
