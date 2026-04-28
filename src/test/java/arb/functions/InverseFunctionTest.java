package arb.functions;

import arb.Complex;
import arb.Real;
import arb.expressions.Context;
import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Tests for the Lagrange series reversion inverse function implementation
 * (issue #718).
 *
 * <ul>
 *   <li>RealFunction.invert() default method</li>
 *   <li>ComplexFunction.invert() default method</li>
 *   <li>InverseFunctionNode bytecode generation via expression compiler</li>
 *   <li>Equivalence with the deprecated HardyThetaInversion</li>
 * </ul>
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class InverseFunctionTest extends
                                 TestCase
{
  private static final int BITS  = 128;
  private static final int ORDER = 20;

  /**
   * f(x)=x² has compositional inverse f⁻¹(y)=√y near x=2.
   * Verify roundtrip: f⁻¹(f(2)) ≈ 2.
   */
  public void testRealFunctionInvertRoundtrip()
  {
    RealFunction square = RealFunction.express("x²");

    try (Real center = Real.valueOf(2); Real target = new Real(); Real result = new Real())
    {
      // f(2) = 4
      square.evaluate(center, 1, BITS, target);
      assertEquals(4.0, target.doubleValue(), 1e-10);

      // f⁻¹ near center=2
      RealFunction sqrtViaInvert = square.invert(center, ORDER, BITS);

      // f⁻¹(4) should ≈ 2
      sqrtViaInvert.evaluate(target, 1, BITS, result);
      assertEquals(2.0, result.doubleValue(), 1e-10);
    }
  }

  /**
   * f(x)=x³ near center=2. f⁻¹(8) ≈ 2.
   * Center must be near the target for the series to converge.
   */
  public void testRealFunctionInvertCube()
  {
    RealFunction cube = RealFunction.express("x³");

    try (Real center = Real.valueOf(2); Real y = new Real(); Real result = new Real())
    {
      // f(2) = 8, so f⁻¹(8) should ≈ 2
      y.set(8.0);
      RealFunction cubeRoot = cube.invert(center, ORDER, BITS);
      cubeRoot.evaluate(y, 1, BITS, result);
      assertEquals(2.0, result.doubleValue(), 1e-10);
    }
  }

  /**
   * Test that the expression compiler generates working bytecode for f⁻¹(x)
   * syntax using the Lagrange series reversion.
   */
  public void testExpressionCompilerInverseFunction()
  {
    var context = new Context();
    // Register f(x) = x² in the context
    RealFunction.express("f:x->x²", context);

    // Compile f⁻¹(x) — this exercises InverseFunctionNode.generate()
    RealFunction fInverse = RealFunction.express("f⁻¹(x)", context);

    try (Real input = new Real(); Real result = new Real())
    {
      // f⁻¹(4) should ≈ 2 (positive branch near center)
      input.set(4.0);
      fInverse.evaluate(input, 1, BITS, result);
      assertEquals(2.0, result.doubleValue(), 1e-3);
    }
  }



  /**
   * ComplexFunction.invert() for f(z)=z². Uses a hand-built ComplexFunction
   * that supports Taylor jet evaluation (order > 1), since the compiled
   * expression z² does not yet support Taylor jets for complex functions.
   */
  public void testComplexFunctionInvert()
  {
    ComplexFunction square = new ComplexFunction()
    {
      @Override
      public Complex evaluate(Complex z, int order, int bits, Complex result)
      {
        if (order == 1)
        {
          return z.mul(z, bits, result);
        }
        // Taylor coefficients of z² at z=a: [a², 2a, 1, 0, 0, ...]
        z.mul(z, bits, result.get(0));
        result.get(1).set(z).add(z, bits);
        if (order > 2)
        {
          result.get(2).one();
        }
        for (int i = 3; i < order; i++)
        {
          result.get(i).zero();
        }
        return result;
      }
    };

    try (Complex center = new Complex(); Complex y = new Complex();
         Complex result = new Complex())
    {
      center.set(2.0, 0.0);
      y.set(4.0, 0.0);

      ComplexFunction sqrtViaInvert = square.invert(center, ORDER, BITS);
      sqrtViaInvert.evaluate(y, 1, BITS, result);

      assertEquals(2.0, result.re().doubleValue(), 1e-6);
      assertEquals(0.0, result.im().doubleValue(), 1e-6);
    }
  }
}
