package arb.expressions;

import arb.Real;
import arb.RealConstants;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class ExpressionTest extends
                            TestCase
{

  public static void testFactorial()
  {
    RealFunction func   = RealFunction.express("4!");
    Real         result = func.evaluate(null, 0, 128, new Real());
    assertEquals(24.0, result.doubleValue());
  }

  public static void testFactorialToo()
  {
    RealFunction func   = RealFunction.express("x!");
    Real         result = func.evaluate(new Real("4",128), 0, 128, new Real());
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
