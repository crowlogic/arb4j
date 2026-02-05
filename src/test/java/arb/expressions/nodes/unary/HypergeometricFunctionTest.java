package arb.expressions.nodes.unary;

import arb.Complex;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.RealConstants;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.polynomials.RealHypergeometricPolynomialFunction;
import arb.functions.polynomials.RealPolynomialNullaryFunction;
import arb.functions.rational.ComplexRationalNullaryFunction;
import arb.functions.rational.RationalNullaryFunction;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class HypergeometricFunctionTest extends
                                        TestCase
{
  public int bits = 128;

  public void testHypergeometricPolynomialReal()
  {
    try ( RealHypergeometricPolynomialFunction poly = new RealHypergeometricPolynomialFunction())
    {

      poly.init(Real.class,
                RealPolynomial.class,
                RealPolynomialNullaryFunction.class,
                Real.newVector(-2, 3.5, 1),
                Real.newVector(2, 4),
                RealPolynomialNullaryFunction.express("1/2-x/2"));

      RealPolynomial expressed = poly.evaluate(bits, new RealPolynomial());
      assertEquals("0.065625*x² + 0.30625*x + 0.628125", expressed.toString());
    }

  }

  public void testHypergeometricFunctionExpressionReal()
  {
    var    f = RealFunction.express("pFq([-5,3.75,1.2],[1.4,2.7,3.4],-x^2)");
    double x = f.eval(2.3);
    assertEquals(82.03626613894305, x);
  }

  public void testHypergeometricFuntionExpressionComplexRealArg()
  {
    var poly = ComplexRationalNullaryFunction.express("pFq([-2,3.5,1],[2,4],1/2-x/2)");
    var f    = poly.evaluate(128);
    var g    = ComplexRationalNullaryFunction.express("201/320+49/160*x+21/320*x^2").evaluate(128);
    assertEquals(g, f);

    Complex y = f.evaluate(new Real("2.3",
                                    128),
                           1,
                           128,
                           new Complex());
    y.printPrecision = false;
    assertEquals("1.67965625", y.toString());
  }

  public void testHypergeometricFuntionExpressionComplexComplexArg()
  {
    var poly = ComplexRationalNullaryFunction.express("pFq([-2,3.5,1],[2,4],1/2-x/2)");
    var f    = poly.evaluate(128);
    var g    = ComplexRationalNullaryFunction.express("201/320+49/160*x+21/320*x^2").evaluate(128);
    assertEquals(g, f);

    Complex y = f.evaluate(new Complex("2.3",
                                       128),
                           1,
                           128,
                           new Complex());
    y.printPrecision = false;
    assertEquals("1.67965625", y.toString());
  }

  public void testHypergeometricFunctionExpressionRationalFunction()
  {
    var              poly = RationalNullaryFunction.express("pFq([-2,3.5,1],[2,4],1/2-x/2)");
    RationalFunction f    = poly.evaluate(bits, new RationalFunction());
    var              g    = RationalNullaryFunction.express("201/320+49/160*x+21/320*x^2").evaluate(128);
    assertEquals(g, f);
  }

  public void testHypergeometricFunctionExpressionRealPolynomial()
  {
    boolean caughtException = false;
    try
    {
      var poly = RealPolynomialNullaryFunction.express("pFq([-2,3.5,1],[2,4],1/2-x/2)");
      RealPolynomial expressed = poly.evaluate(bits, new RealPolynomial());
      assertEquals( "0.065625*x² + 0.30625*x + 0.628125", expressed.toString() );
    }
    catch (UnsupportedOperationException e)
    {
      caughtException = true;
    }
    assertFalse(caughtException);
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
    RealPolynomialNullaryFunction arg = RealPolynomialNullaryFunction.express("x");

    try ( RealHypergeometricPolynomialFunction F = new RealHypergeometricPolynomialFunction();
          RealPolynomial y = new RealPolynomial();)
    {
      F.init(Real.newVector(-6, 2.5), Real.newVector(1.0), arg);
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

      Expression<Integer, Real, Function<Integer, Real>> prototype =
                                                                   Function.compile(Integer.class,
                                                                                    Real.class,
                                                                                    Function.class,
                                                                                    "n➔zⁿ*∏k➔α[k]₍ₙ₎{k=1…p}/(n!*∏k➔β[k]₍ₙ₎{k=1…q})",
                                                                                    context);
      var                                                summand   = prototype.instantiate();

      Real                                               res       =
                                                             summand.evaluate(new Integer(3), 1, 128, new Real());
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

      Expression<Integer, Complex, Function<Integer, Complex>> prototype =
                                                                         Function.compile(Integer.class,
                                                                                          Complex.class,
                                                                                          Function.class,
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
