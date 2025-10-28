package arb.functions.real;

import java.util.stream.IntStream;

import arb.*;
import arb.Float;
import arb.expressions.*;
import arb.functions.Function;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public interface RealFunction extends
                              Function<Real, Real>
{

 
  @Override
  default Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  default Class<Real> domainType()
  {
    return Real.class;
  }

  public default RealFunction mul(RealFunction that)
  {
    return new RealMultiplicationFunction(this,
                                          that);
  }

  public default RealFunction div(RealFunction that)
  {
    return new RealDivisionFunction(this,
                                    that);
  }

  public default RealFunction add(RealFunction that)
  {
    return new RealAdditionFunction(this,
                                    that);
  }

  public default RealFunction sub(RealFunction that)
  {
    return new RealSubtractionFunction(this,
                                       that);
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
    return Function.express(Real.class, Real.class, RealFunction.class, expression, context);
  }

  public static RealFunction express(String expression, String string)
  {
    return express(expression, string, null);
  }

  public static RealFunction express(String functionName, String expression, Context context)
  {
    return express(functionName, expression, context, false);
  }

  public static RealFunction
         express(String functionName, String expression, Context context, boolean verbose)
  {
    return Function.instantiate(expression,
                                context,
                                Real.class,
                                Real.class,
                                RealFunction.class,
                                functionName);
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
    String className = Parser.expressionToUniqueClassname(expression);
    return Function.parse(className,
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
    try ( var x = Real.newVector(2))
    {
      return evaluate(x.get(0).set(t), 1, Double.PRECISION + 5, x.get(1)).doubleValue(roundingMode);
    }
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
  public default RealDataSet quantize(double left, double right, int n)
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
  public default RealDataSet quantize(double left, double right, int n, boolean parallel)
  {
    try ( var I = new FloatInterval(left,
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
  public default RealDataSet quantize(double left, double right, int n, boolean parallel, int bits)
  {
    try ( var I = new FloatInterval(left,
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
  public default RealDataSet quantize(double left, double right, int n, int bits)
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
  public default RealDataSet quantize(FloatInterval interval, int bits, int n, boolean parallel)
  {
    try ( var Δ = interval.length(bits, new Float()))
    {
      Δ.div(n, bits);
      RealDataSet sample = new RealDataSet(
                                           String.format("%s over %s..%s (#=%d Δ=%s)",
                                                         toString(),
                                                         interval.left().toString(5),
                                                         interval.right().toString(5),
                                                         n,
                                                         Δ),
                                           n,
                                           interval);
      Real        values = sample.getRealYValues();

      try ( RealPartition mesh =
                               interval.generateRealPartition(bits, false, sample.getRealXValues()))
      {
        IntStream domain = IntStream.range(0, n);
        if (parallel)
        {
          domain = domain.parallel();
        }
        domain.forEach(i ->
        {
          Real ithVal   = values.get(i);
          Real ithPoint = mesh.get(i);
          evaluate(ithPoint, 1, bits, ithVal);
        });
        return sample;
      }
    }
  }

  public default String toStringWithoutIndependentVariableSpecified()
  {
    String str        = toString();
    int    arrowIndex = str.indexOf('➔');
    return arrowIndex == -1 ? str : str.substring(arrowIndex + 1);
  }

  @Override
  public default RealFunction derivative()
  {
    assert false : "TODO: " + getClass() + " should implement this";
    return Function.super.derivative();
  }

  public default RealFunction integral()
  {
    assert false : "TODO: " + getClass() + " should implement this";
    return Function.super.integral();
  }

}