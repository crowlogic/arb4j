package arb.functions.algebraic;

import arb.AlgebraicNumber;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.functions.Function;

/**
 * Represents a function whose domain and codomain are algebraic numbers.
 * <p>
 * This interface defines methods for instantiating and compiling functions that
 * take {@link AlgebraicNumber} as input and produce {@link AlgebraicNumber} as
 * output. The functions are constructed from string expressions and may use
 * optional contexts for variable bindings and evaluation.
 * </p>
 *
 * <p>
 * Note: The term "AlgebraicNumberFunction" refers specifically to mappings
 * between algebraic numbers, and does not imply the classic mathematical
 * definition of "algebraic function" (a root of a polynomial equation in one or
 * more variables).
 * </p>
 * 
 * @see AlgebraicNumber
 * @see Expression
 * @see Context
 * @see Function
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public interface AlgebraicNumberFunction extends
                                         Function<AlgebraicNumber, AlgebraicNumber>
{

  public static Expression<AlgebraicNumber, AlgebraicNumber, AlgebraicNumberFunction>
         compile(String expression)
  {
    return compile(expression, null);
  }

  public static Expression<AlgebraicNumber, AlgebraicNumber, AlgebraicNumberFunction>
         compile(String expression, Context context)
  {
    return Compiler.compile(expression,
                            context,
                            AlgebraicNumber.class,
                            AlgebraicNumber.class,
                            AlgebraicNumberFunction.class,
                            null);
  }

  public static AlgebraicNumberFunction express(String expression)
  {
    return express(null, expression, null);
  }

  public static AlgebraicNumberFunction express(String expression, Context context)
  {
    return Function.instantiate(expression,
                                context,
                                AlgebraicNumber.class,
                                AlgebraicNumber.class,
                                AlgebraicNumberFunction.class,
                                null);
  }

  public static AlgebraicNumberFunction express(String expression, Context context, boolean verbose)
  {
    return Function.instantiate(expression,
                                context,
                                AlgebraicNumber.class,
                                AlgebraicNumber.class,
                                AlgebraicNumberFunction.class,
                                null);
  }

  public static AlgebraicNumberFunction express(String expression, String string)
  {
    return express(expression, string, null);
  }

  public static AlgebraicNumberFunction
         express(String functionName, String expression, Context context)
  {
    return express(functionName, expression, context, false);
  }

  public static AlgebraicNumberFunction
         express(String functionName, String expression, Context context, boolean verbose)
  {
    return Function.instantiate(expression,
                                context,
                                AlgebraicNumber.class,
                                AlgebraicNumber.class,
                                AlgebraicNumberFunction.class,
                                functionName);
  }

  public static Expression<AlgebraicNumber, AlgebraicNumber, AlgebraicNumberFunction>
         parse(String expression)
  {
    return Function.parse(Parser.expressionToUniqueClassname(expression),
                          expression,
                          null,
                          AlgebraicNumber.class,
                          AlgebraicNumber.class,
                          AlgebraicNumberFunction.class,
                          null,
                          null);
  }

  public static Expression<AlgebraicNumber, AlgebraicNumber, AlgebraicNumberFunction>
         parse(String expression, Context context)
  {
    return Function.parse(Parser.expressionToUniqueClassname(expression),
                          expression,
                          context,
                          AlgebraicNumber.class,
                          AlgebraicNumber.class,
                          AlgebraicNumberFunction.class,
                          null,
                          null);
  }

}
