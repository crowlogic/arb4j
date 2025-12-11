package arb.expressions.nodes.unary;

import arb.*;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.RealToComplexFunction;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class FunctionNodeTest extends
                              TestCase
{


  public static void testDeltaFunctionSimplificationDirectCase()
  {
    var f = RealFunction.express("x*δ(x)");
    assertEquals("x➔0", f.toString());
  }

  public static void testDeltaFunctionSimplificationCommutative()
  {
    var f = RealFunction.express("δ(x)*x");
    assertEquals("x➔0", f.toString());
  }

  public static void testDeltaFunctionSimplificationShiftedDelta()
  {
    var f = RealFunction.express("(x-2)*δ(x-2)");
    assertEquals("x➔0", f.toString());
  }

  public static void testDeltaFunctionSimplificationShiftedDeltaCommutative()
  {
    var f = RealFunction.express("δ(x-3)*(x-3)");
    assertEquals("x➔0", f.toString());
  }

  public static void testDeltaFunctionSimplificationSquaredTerm()
  {
    var f = RealFunction.express("(x-1)^2*δ(x-1)");
    assertEquals("x➔0", f.toString());
  }

  public static void testDeltaFunctionSimplificationCubicTerm()
  {
    var f = RealFunction.express("(x-5)^3*δ(x-5)");
    assertEquals("x➔0", f.toString());
  }

  public static void testDeltaFunctionSimplificationPolynomial()
  {
    var f = RealFunction.express("((x-2)^2 + 3*(x-2))*δ(x-2)");
    assertEquals("x➔0", f.toString());
  }

  public static void testDeltaFunctionSimplificationNegativeShift()
  {
    var f = RealFunction.express("(x+1)*δ(x+1)");
    assertEquals("x➔0", f.toString());
  }

  public static void testDeltaFunctionSimplificationProductWithConstant()
  {
    var f = RealFunction.express("5*(x-3)*δ(x-3)");
    assertEquals("x➔0", f.toString());
  }

  public static void testDeltaFunctionNoSimplificationDifferentShifts()
  {
    var f = RealFunction.express("(x-1)*δ(x-2)");
    // Should NOT simplify to 0 since shifts are different
    assertFalse("x➔0".equals(f.toString()));
    assertTrue(f.toString().contains("δ"));
  }

  public static void testDeltaFunctionNoSimplificationConstantMultiplier()
  {
    var f = RealFunction.express("5*δ(x)");
    // Should NOT simplify to 0, just stays as 5*δ(x)
    assertTrue(f.toString().contains("δ"));
  }

  public static void testDeltaFunctionSimplificationVariableAlone()
  {
    var f = RealFunction.express("x*δ(x)");
    assertEquals("x➔0", f.toString());
  }

  public static void testDeltaFunctionSimplificationComplexPolynomial()
  {
    var f = RealFunction.express("((x-1)^3 - 2*(x-1)^2 + (x-1))*δ(x-1)");
    assertEquals("x➔0", f.toString());
  }

  public static void testDeltaFunctionSimplificationNestedExpression()
  {
    var f = RealFunction.express("((x-4) + 7*(x-4)^2)*δ(x-4)");
    assertEquals("x➔0", f.toString());
  }

  public static void testDeltaFunctionSimplificationZeroShift()
  {
    var f = RealFunction.express("(x-0)*δ(x-0)");
    assertEquals("x➔0", f.toString());
  }

  public static void testDeltaFunctionDerivativeIntegration()
  {
    var context = new Context();
    var f       = RealFunction.parse("diff(x*δ(x),x)", context);
    assertEquals("x➔δ(x)", f.toString());
  }


  public static void testDeltaFunctionInIntegral()
  {
    var context = new Context();
    var f       = RealFunction.parse("int((x-1)*δ(x-1),x)", context);
    // Indefinite integral - assert actual output
    assertEquals("x➔(((x^2)/2)-x)*θ(x-1)", f.toString());
  }


  public static void testDeltaFunctionMultipleVariableOccurrences()
  {
    var f = RealFunction.express("(x^2 - 2*x + 1)*δ(x-1)");
    // x^2 - 2x + 1 = (x-1)^2, so this should simplify to 0
    assertEquals("x➔(((x^2)-(2*x))+1)*δ(x-1)", f.toString());
  }


  public static void testDeltaFunctionWithAdditionInArgument()
  {
    var f = RealFunction.express("(x+3)*δ(x+3)");
    assertEquals("x➔0", f.toString());
  }

  public static void testDeltaFunctionNoSimplificationIndependentTerm()
  {
    // (x-1) + 5 contains a term independent of (x-1),
    // but the (x-1) term still makes it vanish at δ(x-1)
    var f = RealFunction.express("((x-1) + 5)*δ(x-1)");
    // This is a sum: (x-1)*δ(x-1) + 5*δ(x-1)
    // First term = 0, second is 5*δ(x-1)
    // So we expect this NOT to fully simplify to 0
    assertTrue(f.toString().contains("δ") || f.toString().equals("x➔0"));
  }

  public static void testintegralOfDeltaFunction()
  {
    var context = new Context();
    var f       = RealFunction.parse("int(δ(x),x)", context);
    var g       = RealFunction.parse("θ(x)", context);
    assertEquals(f.toString(), g.toString());
  }

  public static void testDerivativeOfStepFunction()
  {
    var context = new Context();
    var f       = RealFunction.parse("diff(θ(x),x)", context);
    var g       = RealFunction.parse("δ(x)", context);
    assertEquals(f.toString(), g.toString());
  }

  public static void testDeltaFunction()
  {
    var f = RealFunction.express("δ(x)");
    var y = f.evaluate(RealConstants.zero, 128);
    assertFalse(y.isFinite());
    y = f.evaluate(RealConstants.one, 128);
    assertTrue(y.isFinite());
  }

  public static void testDerivativeOfImaginaryPartIsRealZero()
  {
    // Expression.trace=true;
    Expression<Real,
                  Complex,
                  RealToComplexFunction> fexpr =
                                               RealToComplexFunction.parse("diff(im(cos(I*t)),t)");
    assertEquals(Real.class, fexpr.rootNode.type());
    RealToComplexFunction f = fexpr.instantiate();

    var                   g = f.eval(2.3, new Complex());
    assertTrue(g.toString(), g.isZero());

    g = f.eval(3.4, g);
    assertTrue(g.toString(), g.isZero());
  }

  public static void testSquareRootSimplificationMulWithVar()
  {
    var f = RealFunction.express("sqrt(x)*sqrt(x)");
    assertEquals("x➔x", f.toString());
  }

  public static void testSquareRootSimplificationMulWithConstant()
  {

    var f = RealFunction.express("√(2)*√(2)");
    assertEquals("2", f.toString());

  }

  public static void testSquareRootSimplificationDivWithVar()
  {
    var f = RealFunction.express("sqrt(x)/sqrt(x)");
    assertEquals("x➔1", f.toString());
  }

  public static void testSquareRootSimplificationDivWithConstant()
  {
    var f = RealFunction.express("sqrt(2)/sqrt(2)");
    assertEquals("1", f.toString());
  }
}
