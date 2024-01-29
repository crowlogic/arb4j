package arb.expressions;

import static java.lang.System.out;

import arb.Real;
import arb.RealConstants;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class ExpressionTest extends
                            TestCase
{
  public static void testRisingFactorial()
  {
    RealFunction func   = RealFunction.express("x₍₃₎");
    RealFunction twoTen = func;
    Real         result = twoTen.evaluate(new Real("5",
                                                   128),
                                          0,
                                          128,
                                          new Real());
    out.println("twoTen=" + result);

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

  public void testVariableIndexedByASubscript()
  {
    Real         α       = Real.newVector(3);
    Context      context = new Context(α.setName("α"));
    RealFunction f       = RealFunction.express("α₁*t", context);
    α.set(0, RealConstants.π);
    Real twoPi = f.evaluate(RealConstants.two, 128, new Real());
    assertTrue(RealConstants.twoπ.approximatelyEquals(twoPi, 257));
  }
}
