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
public interface RealFunctionSequence extends
                                      Sequence<RealFunction>
{

  public static Expression<Integer, RealFunction, RealFunctionSequence> compile(String expression)
  {
    return compile(expression, null);
  }

  public static Expression<Integer, RealFunction, RealFunctionSequence> compile(String expression,
                                                                                        Context context)
  {
    return Compiler.compile(expression,
                            context,
                            Integer.class,
                            RealFunction.class,
                            RealFunctionSequence.class,
                            null);
  }

  @Override
  default Class<RealFunction> coDomainType()
  {
    return RealFunction.class;
  }

  public static RealFunctionSequence express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static RealFunctionSequence express(String expression)
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

  public static Expression<Integer, RealFunction, RealFunctionSequence> parse(String className,
                                                                                      String string)
  {
    return Sequence.parse(className, RealFunctionSequence.class, RealFunction.class, string);
  }

  public static Expression<Integer, RealFunction, RealFunctionSequence> parse(String expression,
                                                                                      Context context)
  {
    return parse(Parser.expressionToUniqueClassname(expression), expression, context);
  }

  public static Expression<Integer, RealFunction, RealFunctionSequence>
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

}
