package arb.functions.real;

import java.util.stream.IntStream;

import arb.FloatInterval;
import arb.Real;
import arb.RealPartition;
import arb.RealTwoDimensionalDataSet;
import arb.RoundingMode;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.functions.Function;

/**
 * The {@link RealFunction} interface, a part of the arb.functions.real package,
 * models {@link Real}-valued functions. It offers functionality for performing
 * root-related operations, such as root refinement, evaluating convergence
 * factors, and locating roots within intervals. The interface extends
 * {@link Function}<Real, Real> and includes default implementations of various
 * techniques, including Newton's method.
 *
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealFunction extends
                              Function<Real, Real>
{

  public boolean verbose = false;

  public default RealFunction mul(RealFunction that)
  {
    return new RealFunction()
    {
      @Override
      public String typeset()
      {
        return String.format("%s \\cdot %s", RealFunction.this.typeset(), that.typeset());
      }

      @Override
      public String toString()
      {
        return String.format("(%s)*(%s)", RealFunction.this.toString(), that.toString());
      }

      @Override
      public Real evaluate(Real t, int order, int bits, Real res)
      {
        try ( var blip = new Real())
        {
          return RealFunction.this.evaluate(t, order, bits, res).mul(that.evaluate(t, order, bits, blip), bits, res);
        }

      };
    };
  }

  public default RealFunction div(RealFunction that)
  {
    return new RealFunction()
    {
      @Override
      public String typeset()
      {
        return String.format("\frac{%s}{%s}", RealFunction.this.typeset(), that.typeset());
      }

      @Override
      public String toString()
      {
        return String.format("(%s)/(%s)", RealFunction.this.toString(), that.toString());
      }

      @Override
      public Real evaluate(Real t, int order, int bits, Real res)
      {
        try ( var blip = new Real())
        {
          return RealFunction.this.evaluate(t, order, bits, res).div(that.evaluate(t, order, bits, blip), bits, res);
        }

      };
    };
  }

  public default RealFunction add(RealFunction that)
  {
    return new RealFunction()
    {
      @Override
      public String typeset()
      {
        return String.format("(%s) + (%s)", RealFunction.this.typeset(), that.typeset());
      }

      @Override
      public String toString()
      {
        return String.format("(%s)+(%s)", RealFunction.this.toString(), that.toString());
      }

      @Override
      public Real evaluate(Real t, int order, int bits, Real res)
      {
        try ( var blip = new Real())
        {
          return RealFunction.this.evaluate(t, order, bits, res).add(that.evaluate(t, order, bits, blip), bits, res);
        }

      };
    };
  }

  public default RealFunction sub(RealFunction that)
  {
    return new RealFunction()
    {
      @Override
      public String typeset()
      {
        return String.format("(%s) - (%s)", RealFunction.this.typeset(), that.typeset());
      }

      @Override
      public String toString()
      {
        return String.format("(%s)-(%s)", RealFunction.this.toString(), that.toString());
      }

      @Override
      public Real evaluate(Real t, int order, int bits, Real res)
      {
        try ( var blip = new Real())
        {
          return RealFunction.this.evaluate(t, order, bits, res).sub(that.evaluate(t, order, bits, blip), bits, res);
        }

      };
    };
  }

  public static Expression<Real, Real, RealFunction> compile(String expression)
  {
    return compile(expression, null);
  }

  public static Expression<Real, Real, RealFunction> compile(String expression, Context context)
  {
    return Compiler.compile(expression, context, Real.class, Real.class, RealFunction.class, null);
  }

  public static RealFunction express(String expression)
  {
    return express(null, expression, null);
  }

  public static RealFunction express(String expression, Context context)
  {
    return Function.instantiate(expression, context, Real.class, Real.class, RealFunction.class, null);
  }

  public static RealFunction express(String expression, Context context, boolean verbose)
  {
    return Function.instantiate(expression, context, Real.class, Real.class, RealFunction.class, null);
  }

  public static RealFunction express(String expression, String string)
  {
    return express(expression, string, null);
  }

  public static RealFunction express(String functionName, String expression, Context context)
  {
    return express(functionName, expression, context, false);
  }

  public static RealFunction express(String functionName, String expression, Context context, boolean verbose)
  {
    return Function.instantiate(expression, context, Real.class, Real.class, RealFunction.class, functionName);
  }

  public static Expression<Real, Real, RealFunction> parse(String expression)
  {
    return Function.parse(Parser.expressionToUniqueClassname(expression),
                          expression,
                          null,
                          Real.class,
                          Real.class,
                          RealFunction.class,
                          null,
                          null);
  }

  public static Expression<Real, Real, RealFunction> parse(String expression, Context context)
  {
    return Function.parse(Parser.expressionToUniqueClassname(expression),
                          expression,
                          context,
                          Real.class,
                          Real.class,
                          RealFunction.class,
                          null,
                          null);
  }

  @Override
  public default void close()
  {

  }

  /**
   * double wrappeRealFunction foRealFunction
   * this{@link #evaluate(Real, int, int, Real)} which is called with
   * {@link Double#PRECISION} bits
   * 
   * @param t
   * @return the {@link Real#doubleValue()} applied to the result of the
   *         this{@link #evaluate(Real, int, int, Real)} method call
   */
  public default double eval(double t)
  {
    try ( Real x = Real.newVector(2))
    {
      return evaluate(x.get(0).set(t), 1, Double.PRECISION + 5, x.get(1)).doubleValue();
    }
  }

  public default Real eval(double t, Real res)
  {
    return evaluate(res.set(t), 1, Double.PRECISION + 5, res);
  }

  public default double eval(double t, RoundingMode roundingMode)
  {
    try ( Real x = Real.newVector(2))
    {
      return evaluate(x.get(0).set(t), 1, Double.PRECISION + 5, x.get(1)).doubleValue(roundingMode);
    }
  }

  public default Real evaluate(Real x, int order, int bits)
  {
    return evaluate(x, order, bits, x);

  }

  public default Real evaluate(Real x, int bits, Real result)
  {
    return evaluate(x, 1, bits, result);
  }

  /**
   * Default to 128 bits foRealFunction
   * this{@link #quantize(double, double, int, int)}
   * 
   * @param left
   * @param right
   * @param n
   * @return
   */
  public default RealTwoDimensionalDataSet quantize(double left, double right, int n)
  {
    return quantize(left, right, n, false, Double.SIZE);
  }

  /**
   * Default to 128 bits foRealFunction
   * this{@link #quantize(double, double, int, int)}
   * 
   * @param left
   * @param right
   * @param n
   * @param parallel
   * @return
   */
  public default RealTwoDimensionalDataSet quantize(double left, double right, int n, boolean parallel)
  {
    try ( FloatInterval I = new FloatInterval(left,
                                              right);)
    {
      return quantize(I, 128, n, parallel);
    }
  }

  /**
   * double-convenience method for
   * this{@link #quantize(FloatInterval, int, int, Real, boolean)}
   * 
   * @param left
   * @param right
   * @param n
   * @param parallel if true then multiple threads are used
   * @param bits
   * @return
   */
  public default RealTwoDimensionalDataSet quantize(double left, double right, int n, boolean parallel, int bits)
  {
    try ( FloatInterval I = new FloatInterval(left,
                                              right);)
    {
      return quantize(I, bits, n, parallel);
    }
  }

  /**
   * Default to parallel=false for
   * this{@link #quantize(double, double, int, boolean, int)}
   * 
   * @param left
   * @param right
   * @param n
   * @param bits
   * @return
   */
  public default RealTwoDimensionalDataSet quantize(double left, double right, int n, int bits)
  {
    return quantize(left, right, n, false, bits);
  }

  /**
   * Generate a {@link RealPartition} covering the specified interval and call
   * this{@link #evaluate(Real, int, int, Real)} at each of the n points of the
   * partition.
   * 
   * 
   * @param interval
   * @param bits
   * @param n
   * @param values
   * @param parallel TODO
   * @return values
   */
  public default RealTwoDimensionalDataSet quantize(FloatInterval interval, int bits, int n, boolean parallel)
  {
    RealTwoDimensionalDataSet sample = new RealTwoDimensionalDataSet(toString()
                                                                     + " over "
                                                                     + interval.left().toString(5)
                                                                     + ".."
                                                                     + interval.right().toString(5),
                                                                     n);
    Real                      values = sample.getRealYValues();

    try ( RealPartition mesh = interval.generateRealPartition(bits, false, sample.getRealXValues()))
    {
      IntStream coDomain = IntStream.range(0, n);
      if (parallel)
      {
        coDomain = coDomain.parallel();
      }
      coDomain.forEach(i -> evaluate(mesh.get(i), 1, bits, values.get(i)));
      return sample;
    }
  }

  public default String toStringWithoutIndependentVariableSpecified()
  {
    String str        = toString();
    int    arrowIndex = str.indexOf('➔');
    return arrowIndex == -1 ? str : str.substring(arrowIndex + 1);
  }

}