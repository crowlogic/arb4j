package arb.expressions;

import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * @author Stephen A. Crowley ©2024
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ExpressionTest extends
                            TestCase
{

  /**
   * THe problem is that the resultType is not being checked in LiteralConstant,
   * it should check it and cast if necessary.
   * https://github.com/crowlogic/arb4j/issues/343
   */
  public static void testRatioOfRisingFactorials()
  {

    Real                    λ        = new Real();
    Context                 context  = new Context(λ.setName("λ"));
    Function<Integer, Real> f        = Function.express(Integer.class, Real.class, "n➔(λ*2)₍ₙ₎/(λ+½)₍ₙ₎", context);
    Integer                 in       = new Integer(3);
    Real                    evaluate = f.evaluate(in, 128, new Real());
    System.out.println(evaluate);
  }

  public static void testProductViaFactorial()
  {
    Function<Integer, Integer> f        = Function.express(Integer.class, Integer.class, "n➔∏k{k=1…n}");
    Integer                    in       = new Integer(3);
    Integer                    evaluate = f.evaluate(in, 128, new Integer());
    assertEquals(6, evaluate.getUnsignedValue());
  }

  public static void testGammaReal()
  {
    RealFunction func   = RealFunction.express("Γ(4.0)");
    Real         result = func.evaluate(null, 0, 128, new Real());
    assertEquals(6.0, result.doubleValue());
  }

  public static void testGamma()
  {
    RealFunction func   = RealFunction.express("Γ(4)");
    Real         result = func.evaluate(null, 0, 128, new Real());
    assertEquals(6.0, result.doubleValue());
  }

  public static void testFactorial()
  {
    RealFunction func   = RealFunction.express("4!");
    Real         result = func.evaluate(null, 0, 128, new Real());
    assertEquals(24.0, result.doubleValue());
  }

  public static void testFactorialToo()
  {
    RealFunction func   = RealFunction.express("x!");
    Real         result = func.evaluate(new Real("4",
                                                 128),
                                        0,
                                        128,
                                        new Real());
    assertEquals(24.0, result.doubleValue());
  }

  public static void testRisingFactorial()
  {
    RealFunction func   = RealFunction.express("x₍₃₎");
    Real         result = func.evaluate(new Real("5",
                                                 128),
                                        0,
                                        128,
                                        new Real());
    assertEquals(210.0, result.doubleValue());
  }

  public void testVariableIndexedByASquareBracketedConstant()
  {
    Real         α       = Real.newVector(3);
    Context      context = new Context(α.setName("α"));
    RealFunction f       = RealFunction.express("α[1]*t", context);
    α.set(0, RealConstants.π);
    Real twoPi = f.evaluate(RealConstants.two, 128, new Real());
    assertTrue(RealConstants.twoπ.approximatelyEquals(twoPi, 257));
  }

  public void testVariableIndexedByASubscriptAndMultipliedByTheDefactoInput()
  {
    Real         α       = Real.newVector(3);
    Context      context = new Context(α.setName("α"));
    // RealFunction f = RealFunction.express("α[1]*t", context);
    RealFunction f       = RealFunction.express("α₁*t", context);
    α.set(0, RealConstants.π);
    Real twoPi = f.evaluate(RealConstants.two, 128, new Real());
    assertTrue(RealConstants.twoπ.approximatelyEquals(twoPi, 257));
  }
}
