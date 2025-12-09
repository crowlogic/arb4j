package arb.functions;

import arb.Fraction;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;

/*
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link
 * TheArb4jLibrary}
 * 
 * @author ©2024 Stephen Crowley
 */
public interface FractionFunction extends
                                  Function<Fraction, Fraction>
{

  public boolean verbose = false;

  public static Expression<Fraction, Fraction, FractionFunction> compile(String expression)
  {
    return compile(expression, null);
  }

  public static Expression<Fraction, Fraction, FractionFunction> compile(String expression, Context context)
  {
    return Compiler.compile(expression, context, Fraction.class, Fraction.class, FractionFunction.class, null);
  }

  public static FractionFunction express(String expression)
  {
    return express(null, expression, null);
  }

  public static FractionFunction express(String expression, Context context)
  {
    return Function.instantiate(expression, context, Fraction.class, Fraction.class, FractionFunction.class, null);
  }

  public static FractionFunction express(String expression, Context context, boolean verbose)
  {
    return Function.instantiate(expression, context, Fraction.class, Fraction.class, FractionFunction.class, null);
  }

  public static FractionFunction express(String expression, String string)
  {
    return express(expression, string, null);
  }

  public static FractionFunction express(String functionName, String expression, Context context)
  {
    return express(functionName, expression, context, false);
  }

  public static FractionFunction express(String functionName, String expression, Context context, boolean verbose)
  {
    return Function.instantiate(expression,
                                context,
                                Fraction.class,
                                Fraction.class,
                                FractionFunction.class,
                                functionName);
  }

  public static Expression<Fraction, Fraction, FractionFunction> parse(String expression)
  {
    return Function.parse(Parser.hashString(expression),
                          expression,
                          null,
                          Fraction.class,
                          Fraction.class,
                          FractionFunction.class,
                          null,
                          null);
  }

  public static Expression<Fraction, Fraction, FractionFunction> parse(String expression, Context context)
  {
    return Function.parse(Parser.hashString(expression),
                          expression,
                          context,
                          Fraction.class,
                          Fraction.class,
                          FractionFunction.class,
                          null,
                          null);
  }
}
