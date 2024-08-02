package arb.expressions.nodes.unary;

import arb.*;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.polynomials.RealPolynomialHypergeometricFunction;
import arb.functions.real.RationalNullaryFunction;
import arb.functions.real.RealFunction;
import arb.functions.real.RealPolynomialNullaryFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class HypergeometricFunctionTest
                                        extends
                                        TestCase
{
  public int bits = 128;

  public void testHypergeometricPolynomial() throws NoSuchFieldException, IllegalAccessException
  {
    try ( RealPolynomialHypergeometricFunction poly = new RealPolynomialHypergeometricFunction(Real.newVector(-2,
                                                                                                              3.5,
                                                                                                              1),
                                                                                               Real.newVector(2, 4),
                                                                                               RealPolynomialNullaryFunction.parse("1/2-x/2")))
    {

      RealPolynomial expressed = poly.evaluate(bits, new RealPolynomial());
      assertEquals("0.065625*x² + 0.30625*x + 0.628125", expressed.toString());
    }

  }

  public void testHypergeometricFuntionExpressionComplex()
  {
    var               poly      = ComplexPolynomialNullaryFunction.express("pFq([-2,3.5,1],[2,4],1/2-x/2)");
    ComplexPolynomial expressed = poly.evaluate(bits, new ComplexPolynomial());
    expressed.getCoeffs().printPrecision = false;
    assertEquals("0.065625*x² + 0.30625*x + 0.628125", expressed.toString());
  }

  public void testHypergeometricFunctionExpressionReal()
  {
    var            poly      = RealPolynomialNullaryFunction.express("pFq([-2,3.5,1],[2,4],1/2-x/2)");
    RealPolynomial expressed = poly.evaluate(bits, new RealPolynomial());

    assertEquals("0.065625*x² + 0.30625*x + 0.628125", expressed.toString());
  }

  /**
   * <pre>
   * 
   * pFq([-2,3+1/2,1],[2,4],1/2-x/2) = 1                 +   ( 1 )
   *                                   - 7/8*(1/2 - x/2) +   ( 7/16-7/16*x ) 
   *                                   21/80*(1/2 - x/2)^2   ( 21/320-21/160*x+21/320*x^2 )
   *                                 = 201/320  +
   *                                   49/160*x + 
   *                                   21/320*x^2
   *                                   
   * </pre>
   */
  public void testHypergeometricFunctionExpressionRational()
  {
    var              function  = RationalNullaryFunction.express("pFq([-2,3+1/2,1],[2,4],1/2-x/2)");
    RationalFunction expressed = function.evaluate(bits, new RationalFunction());
    // Evaluate terms separately
    RationalFunction term0     = RationalNullaryFunction.express("1").evaluate(bits, new RationalFunction());
    RationalFunction term1     = RationalNullaryFunction.express("-7/8*(1/2 - x/2)")
                                                        .evaluate(bits, new RationalFunction());
    RationalFunction term2     = RationalNullaryFunction.express("21/80*(1/2 - x/2)^2")
                                                        .evaluate(bits, new RationalFunction());
    RationalFunction expected  = term0.add(term1, new RationalFunction()).add(term2, new RationalFunction());
    assertEquals("(21*x^2+98*x+201)/320", expressed.toString());
    assertEquals(expected, expressed);
  }

  public static void testSum2()
  {
    //
    try ( var p = new Integer(3,
                              "p");
          var q = new Integer(1,
                              "q");
          var α = Real.newVector(p.getSignedValue(), "α"); var β = Real.newVector(q.getSignedValue(), "β");
          var N = new Integer();)
    {
      var  context    = new Context(p,
                                    q,
                                    α.set(1.5, 0.75, -3),
                                    β.set(1),
                                    N.set(4).setName("N"));

      var  expression = RealFunction.compile("z➔Σn➔zⁿ*∏k➔α[k]₍ₙ₎{k=1…p}/(n!*∏k➔β[k]₍ₙ₎{k=1…q}){n=0…N}", context);

      var  sum        = expression.instantiate();

      Real res        = sum.evaluate(RealConstants.π, 1, 128, new Real());
      assertEquals(-181.54773622929181, res.doubleValue());
    }
  }

  /**
   * Evaluating for the value x=2.3
   * 
   * <pre style="font-family: monospace">
   * /-------------------------------------\
   * | n   | New sumR1      | valueR1      |
   * |-----|----------------|--------------|
   * | 0   | 1.000000       | 1.000000     |
   * | 1   | -33.500000     | -34.500000   |
   * | 2   | 313.656250     | 347.156250   |
   * | 3   | -1283.262500   | -1596.918750 |
   * | 4   | 2504.429161    | 3787.691661  |
   * | 5   | -2025.650065   | -4530.079226 |
   * | 6   | 145.012899     | 2170.662964  |
   * \-------------------------------------/
   * </pre>
   */
  public static void testSum()
  {
    var arg = RealPolynomialNullaryFunction.parse("x");

    try ( RealPolynomialHypergeometricFunction F = new RealPolynomialHypergeometricFunction(2,
                                                                                            1,
                                                                                            arg);
          RealPolynomial y = new RealPolynomial();)
    {
      F.α.set(-6, 2.5);
      F.β.set(1);
      RealPolynomial polynomial = F.evaluate(null, 128, y);
      assert polynomial != null;
      assertEquals("14.6630859375*x⁶ - 70.3828125*x⁵ + 135.3515625*x⁴ - 131.25*x³ + 65.625*x² - 15*x + 1",
                   polynomial.toString());
      double val = polynomial.eval(2.3);
      assertEquals(145.01289685058583, val);
    }
  }

  public static void testSummand()
  {
    try ( var p = new Integer(3,
                              "p");
          var q = new Integer(1,
                              "q");
          var α = Real.newVector(p.getSignedValue(), "α"); var β = Real.newVector(q.getSignedValue(), "β");
          var z = new Real();)
    {
      z.set(RealConstants.π);
      var                                                context   = new Context(p,
                                                                                 q,
                                                                                 α.set(1.5, 0.75, -3),
                                                                                 β.set(1),
                                                                                 z.setName("z"));

      Expression<Integer, Real, Function<Integer, Real>> prototype = Function.compile(Integer.class,
                                                                                      Real.class,
                                                                                      "n➔zⁿ*∏k➔α[k]₍ₙ₎{k=1…p}/(n!*∏k➔β[k]₍ₙ₎{k=1…q})",
                                                                                      context);
      var                                                summand   = prototype.instantiate();

      Real                                               res       = summand.evaluate(new Integer(3),
                                                                                      1,
                                                                                      128,
                                                                                      new Real());
      assertEquals(-244.81029976584379503781836652101052755, res.doubleValue());
    }
  }

  public void testSummandComplex()
  {
    try ( var p = new Integer(3,
                              "p");
          var q = new Integer(1,
                              "q");
          var α = Real.newVector(p.getSignedValue(), "α"); var β = Real.newVector(q.getSignedValue(), "β");
          var z = new Real();)
    {
      z.set(RealConstants.π);
      var                                                      context   = new Context(p,
                                                                                       q,
                                                                                       α.set(1.5, 0.75, -3),
                                                                                       β.set(1),
                                                                                       z.setName("z"));

      Expression<Integer, Complex, Function<Integer, Complex>> prototype = Function.compile(Integer.class,
                                                                                            Complex.class,
                                                                                            "n➔zⁿ*∏k➔α[k]₍ₙ₎{k=1…p}/(n!*∏k➔β[k]₍ₙ₎{k=1…q})",
                                                                                            context);
      var                                                      summand   = prototype.instantiate();

      Complex                                                  res       = summand.evaluate(new Integer(3),
                                                                                            1,
                                                                                            128,
                                                                                            new Complex());
      assertEquals(-244.81029976584379503781836652101052755, res.re().doubleValue());
      assertEquals(0.0, res.im().doubleValue());

    }
  }
}
