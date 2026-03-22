package arb.functions.integer;

import java.util.List;
import java.util.function.IntFunction;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.RealFunctional;
import arb.utensils.ShellFunctions;

/**
 * 
 * @param <C> the codomain of the {@link Function}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */

public interface Sequence<C> extends
                         Function<Integer, C>,
                         IntFunction<C>
{
  public default int bits()
  {
    return 128;
  }

  public default List<C> enumerate(int i, int j)
  {
    return ShellFunctions.seq(i, j, m -> evaluate(m, bits()));
  }

  @Override
  default C apply(int value)
  {
    return evaluate(value, bits());
  }

  @Override
  default Class<Integer> domainType()
  {
    return Integer.class;
  }

  public default C evaluate(int t, int bits)
  {
    try ( Integer integer = new Integer(t))
    {
      return evaluate(integer, bits);
    }
  }

  public default C evaluate(int t, int bits, C res)
  {
    try ( Integer integer = new Integer(t))
    {
      return evaluate(integer, bits, res);
    }
  }



  public static <Q,
                S extends Sequence<? extends Q>>
         S
         express(String name, Class<? extends Q> coDomainType, String expression, Class<? extends S> functionClass)
  {
    return Function.express(name, Integer.class, coDomainType, functionClass, expression);
  }

  public static <Q, S extends Sequence<? extends Q>>
         S
         express(String name, Class<? extends Q> coDomainType, String expression, Class<? extends S> functionClass, Context context)
  {
    return Function.express(name, Integer.class, coDomainType, functionClass, expression, context);
  }

  public static <Q, S extends Sequence<? extends Q>> S express(Class<? extends Q> coDomainType, String expression, Class<? extends S> functionClass)
  {
    return Function.express(Integer.class, coDomainType, functionClass, expression);
  }

  public static <Q, S extends Sequence<? extends Q>>
         S
         express(Class<? extends Q> coDomainType, String expression, Class<? extends S> functionClass, Context context)
  {
    return express(null, coDomainType, expression, functionClass, context);
  }

  public static <C, S extends Sequence<? extends C>>
         Expression<Integer, C, S>
         parse(String className, Class<? extends S> seq, Class<? extends C> coDomainType, String expr)
  {
    return Function.parse(className, expr, null, Integer.class, coDomainType, seq, null, null, true);
  }

  public static <C, S extends Sequence<? extends C>>
         Expression<Integer, C, S>
         parse(String className, Class<? extends S> seq, Class<? extends C> coDomainType, String expr, Context context)
  {
    return Function.parse(className, expr, context, Integer.class, coDomainType, seq, null, null, true);
  }

  public static <C, S extends Sequence<? extends C>> Expression<Integer, C, S> parse(Class<? extends S> seq, Class<? extends C> coDomainType, String expr)
  {
    return Function.parse(null, expr, null, Integer.class, coDomainType, seq, null, null, true);
  }

}
