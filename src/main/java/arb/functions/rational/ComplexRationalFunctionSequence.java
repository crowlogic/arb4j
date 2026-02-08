package arb.functions.rational;

import arb.ComplexRationalFunction;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.*;
import arb.functions.Function;
import arb.functions.integer.Sequence;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface ComplexRationalFunctionSequence extends
                                                 Sequence<ComplexRationalFunction>
{

  public static Expression<Integer, ComplexRationalFunction, ComplexRationalFunctionSequence>
         compile(String expression)
  {
    return compile(expression, null);
  }

  public static Expression<Integer, ComplexRationalFunction, ComplexRationalFunctionSequence>
         compile(String expression, Context context)
  {
    return Parser.parse(expression,
                            context,
                            Integer.class,
                            ComplexRationalFunction.class,
                            ComplexRationalFunctionSequence.class,
                            null);
  }

  @Override
  default Class<ComplexRationalFunction> coDomainType()
  {
    return ComplexRationalFunction.class;
  }

  public static ComplexRationalFunctionSequence express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static ComplexRationalFunctionSequence express(String expression)
  {
    return express(null, expression, null);
  }

  public static ComplexRationalFunctionSequence
         express(String name, String expression, Context context)
  {
    return Function.express(Integer.class,
                            ComplexRationalFunction.class,
                            ComplexRationalFunctionSequence.class,
                            name,
                            expression,
                            context);
  }


  public static Expression<Integer, ComplexRationalFunction, ComplexRationalFunctionSequence>
         parse(String expression, Context context)
  {
    return parse(Parser.hashString(expression), expression, context);
  }

  public static Expression<Integer, ComplexRationalFunction, ComplexRationalFunctionSequence>
         parse(String name, String expression, Context context)
  {
    return Function.parse(name,
                          expression,
                          context,
                          Integer.class,
                          ComplexRationalFunction.class,
                          ComplexRationalFunctionSequence.class,
                          null,
                          null, true);
  }
}
