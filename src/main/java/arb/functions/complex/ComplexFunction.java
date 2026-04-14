package arb.functions.complex;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.NotIntegrableException;
import arb.expressions.*;
import arb.functions.Function;
import arb.functions.RealToComplexFunction;
import arb.space.topological.VectorSpace;

/**
 * <pre>
 * A {@link ComplexFunction} is a {@link Complex}-valued {@link Function} of a {@link Complex} variable
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

  public default ComplexFunction mul(ComplexFunction that)
  {
    return new ComplexFunction()
    {
      @Override
      public String typeset()
      {
        return String.format("%s \\cdot %s", ComplexFunction.this.typeset(), that.typeset());
      }

      @Override
      public String toString()
      {
        return String.format("(%s)*(%s)", ComplexFunction.this.toString(), that.toString());
      }

      @Override
      public Complex evaluate(Complex t, int order, int bits, Complex res)
      {
        try ( var blip = t.borrowVariable())
        {
          ComplexFunction.this.evaluate(t, order, bits, res);
          return res.mul(that.evaluate(t, order, bits, blip), bits, res);
        }

      };
    };
  }

  @Override
  default Class<Complex> domainType()
  {
    return Complex.class;
  }

  public default RealToComplexFunction re()
  {
    return new ComplexPart(this);
  }

  public default RealToComplexFunction im()
  {
    return new ImaginaryComplexPart(this);
  }

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
    return Parser.parse(expression, context, Complex.class, Complex.class, ComplexFunction.class, null);

  }

  public static ComplexFunction express(String expression)
  {
    return express(null, expression, null);
  }

  public static ComplexFunction express(String expression, Context context)
  {
    return Function.express(expression, context, Complex.class, Complex.class, ComplexFunction.class, null);
  }

  public static ComplexFunction express(String expression, Context context, boolean verbose)
  {
    return Function.express(expression, context, Complex.class, Complex.class, ComplexFunction.class, null);
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
    return Function.express(expression, context, Complex.class, Complex.class, ComplexFunction.class, functionName);
  }

  public static Expression<Complex, Complex, ComplexFunction> parse(String expression)
  {
    return Parser.parseExpression(Parser.transformToAcceptableJavaIdentifier(expression),
                                  expression,
                                  null,
                                  Complex.class,
                                  Complex.class,
                                  ComplexFunction.class,
                                  null,
                                  null,
                                  true);
  }

  public static Expression<Complex, Complex, ComplexFunction> parse(String expression, Context context)
  {
    return Function.parseCompileAndRegister(expression, context, Complex.class, Complex.class, ComplexFunction.class, null, false);
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
    throw new UnsupportedOperationException(this + " of class " + getClass() + " needs to implement this method");
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

  public default Complex eval(double d)
  {
    return eval(d, new Complex());
  }

  /**
   * Returns the compositional inverse f⁻¹ expanded as a Lagrange series
   * reversion about {@code centerPoint}, truncated to {@code seriesOrder}
   * terms at the given {@code precision}.
   *
   * The returned {@link ComplexFunction} evaluates f⁻¹(w) by:
   * <ol>
   *   <li>Building the Taylor series of this function at centerPoint</li>
   *   <li>Zeroing the constant term</li>
   *   <li>Reverting the series via {@code acb_poly_revert_series} (Lagrange inversion)</li>
   *   <li>Evaluating the reverted polynomial at (w − f(centerPoint))</li>
   *   <li>Adding back centerPoint</li>
   * </ol>
   *
   * @param centerPoint expansion center for the Taylor/Lagrange series
   * @param seriesOrder number of terms in the series (controls accuracy)
   * @param precision   working precision in bits
   * @return a {@link ComplexFunction} representing f⁻¹
   */
  public default ComplexFunction invert(Complex centerPoint, int seriesOrder, int precision)
  {
    ComplexPolynomial series = new ComplexPolynomial();
    series.setLength(seriesOrder);
    series.fitLength(seriesOrder);
    evaluate(centerPoint, seriesOrder, precision, series.getCoeffs());

    Complex fAtCenter = new Complex();
    fAtCenter.set(series.get(0));
    series.get(0).zero();

    ComplexPolynomial reverted    = series.invert(seriesOrder, precision, new ComplexPolynomial());
    Complex           savedCenter = new Complex();
    savedCenter.set(centerPoint);

    return new ComplexFunction()
    {
      @Override
      public Complex evaluate(Complex w, int order, int bits, Complex result)
      {
        w.sub(fAtCenter, bits, result);
        reverted.evaluate(result, order, bits, result);
        result.add(savedCenter, bits);
        return result;
      }
    };
  }
}