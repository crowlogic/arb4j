package arb.functions.integer;

import arb.Integer;
import arb.expressions.*;
import arb.functions.Function;
import arb.functions.RealToComplexFunction;

public interface RealToComplexFunctionSequence extends
                                               Sequence<RealToComplexFunction>
{
  public static RealToComplexFunctionSequence express(String expression, Context context)
  {
    return express(null, expression, context);
  }

  public static RealToComplexFunctionSequence express(String expression)
  {
    return express(null, expression, null);
  }

  public static RealToComplexFunctionSequence express(String name, String expression, Context context)
  {
    return Function.express(Integer.class, RealToComplexFunction.class, RealToComplexFunctionSequence.class, name, expression, context);
  }

  public static Expression<Integer, RealToComplexFunction, RealToComplexFunctionSequence> parse(String className, String expr)
  {
    return Sequence.parse(className, RealToComplexFunctionSequence.class, RealToComplexFunction.class, expr);
  }

  public static Expression<Integer, RealToComplexFunction, RealToComplexFunctionSequence> parse(String expr)
  {
    return Sequence.parse(null, RealToComplexFunctionSequence.class, RealToComplexFunction.class, expr);
  }

  public static RealToComplexFunctionSequence express(String name, String expr)
  {
    return express(name, expr, null);
  }

  public static FunctionMapping<Integer, RealToComplexFunction, RealToComplexFunctionSequence> declare(String string, Context context)
  {
    return context.declare(string, Integer.class, RealToComplexFunction.class, RealToComplexFunctionSequence.class);
  }

  public static Expression<Integer, RealToComplexFunction, RealToComplexFunctionSequence> compile(String string, Context context)
  {
    return Sequence.compile(RealToComplexFunction.class, string, RealToComplexFunctionSequence.class, context);
  }
}
