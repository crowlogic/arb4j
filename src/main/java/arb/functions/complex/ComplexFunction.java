package arb.functions.complex;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.NotIntegrableException;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.functions.Function;
import arb.functions.RealToComplexFunction;
import arb.space.topological.VectorSpace;

/**
 * <pre>
 * A {@link ComplexFunction} is a {@link Complex}-valued {@link Function}.
 * 
 * The Cauchy-Riemann equations are a set of necessary conditions for a function
 * to be analytic in a region of the complex plane and thus be a {@link HolomorphicFunction}. 
 * 
 * Specifically, if a function f(z) = u(x, y) + iv(x, y) is analytic in a region
 * of the complex plane, then it satisfies the Cauchy-Riemann equations:
 * 
 * ∂u/∂x = +∂v/∂y 
 * ∂u/∂y = -∂v/∂x
 * 
 * where z = x + iy and ∂/∂x and ∂/∂y denote the partial derivatives with
 * respect to x and y, respectively.
 * 
 * These equations are important because they provide a way to check if a given
 * function is analytic in a region of the complex plane. In particular, if the
 * partial derivatives of a function satisfy the Cauchy-Riemann equations, then
 * the function is analytic in that region.
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface ComplexFunction extends
                                 Function<Complex, Complex>,
                                 VectorSpace<Complex>

{

  @Override
  default Class<Complex> coDomainType()
  {
    return Complex.class;
  }

  public static Expression<Complex, Complex, ComplexFunction> compile(String expression)
  {
    return compile(expression, null);
  }

  public static Expression<Complex, Complex, ComplexFunction> compile(String expression, Context context)
  {
    return Compiler.compile(expression, context, Complex.class, Complex.class, ComplexFunction.class, null);

  }

  public static ComplexFunction express(String expression)
  {
    return express(null, expression, null);
  }

  public static ComplexFunction express(String expression, Context context)
  {
    return Function.instantiate(expression, context, Complex.class, Complex.class, ComplexFunction.class, null);
  }

  public static ComplexFunction express(String expression, Context context, boolean verbose)
  {
    return Function.instantiate(expression, context, Complex.class, Complex.class, ComplexFunction.class, null);
  }

  public static ComplexFunction express(String expression, String string)
  {
    return express(expression, string, null);
  }

  public static ComplexFunction express(String functionName, String expression, Context context)
  {
    return express(functionName, expression, context, false);
  }

  public static ComplexFunction express(String functionName, String expression, Context context, boolean verbose)
  {
    return Function.instantiate(expression, context, Complex.class, Complex.class, ComplexFunction.class, functionName);
  }

  public static Expression<Complex, Complex, ComplexFunction> parse(String expression)
  {
    return Function.parse(Parser.expressionToUniqueClassname(expression),
                          expression,
                          null,
                          Complex.class,
                          Complex.class,
                          ComplexFunction.class,
                          null,
                          null);
  }

  /**
   * The proper term to describe a function that maps from the set of real numbers
   * (R) to the set of complex numbers (C) is a "real-valued function" or a
   * "real-to-complex function." This indicates that the function takes a real
   * number as input and produces a complex number as output.
   * 
   * If you're referring to a specific type of function that maps from the real
   * part of a complex number to another complex number, you could describe it as
   * a "real part mapping function" or a "real part to complex mapping function."
   * This would emphasize that the input is the real component of a complex number
   * and the output is a complex number.
   * 
   * However, it's important to note that the terminology used can vary depending
   * on the context and the specific field of study. Different disciplines may
   * have their own conventions and terminology for describing functions with
   * specific input and output types.
   * 
   * @return new instance of {@link RealPartOfHolomorphicMapping} which converts
   *         the function from C->C to a function from R->C where R is the real
   *         part of this functionF
   */
  public default RealToComplexFunction asRealToComplexFunction()
  {
    return new RealPartOfHolomorphicMapping(this);
  }

  /**
   * 
   * @return 1 if this function is invertible with a unique inverse
   */
  public default int getInverseBranchCount()
  {
    return 1;
  }

  /**
   * An <b>antiderivative<b>, <b>inverse derivative</b>, <b>primitive
   * function</b>, <b>primitive integral</b> or <b>indefinite integral</b> of a
   * function f is a differentiable function F whose derivative is equal to the
   * original function f. This can be stated symbolically as F' = f.
   * 
   * @return ∫this which should satisfy
   *         this{@link #integral()}{@link #differential()} == this ==
   *         this{@link #differential()}{@link #integral()}
   */
  public default ComplexFunction integral() throws NotIntegrableException
  {
    throw new UnsupportedOperationException(getClass() + " needs to implement this method");
  }

  /**
   * 
   * @param z
   * @return the multiplicity of the root at the point z, or 0 if there is no root
   *         there
   */
  public default int multiplicityOfRoot(Complex z)
  {
    return 1;
    // throw new UnsupportedOperationException(getClass() + "TODO: return the
    // multiplicity of the root at the point " + z + " here, or throw an exception
    // or something if there isn't a root at the requested point within whatever
    // uncertainty radius is there");
  }

  public default Complex eval(double t, Complex result)
  {
    if (result == null)
    {
      result = new Complex();
    }
    try ( Real x = new Real())
    {
      x.get(0).set(t);

      return evaluate(x, 1, Double.PRECISION + 5, result);
    }
  }

  public default Complex evaluate(Real x, int order, int bits, Complex result)
  {
    try ( Complex tmp = new Complex())
    {
      return evaluate(tmp.set(x), order, bits, result);
    }
  }

}