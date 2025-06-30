package arb.expressions.nodes;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class DerivativeNodeTest extends
                                TestCase
{

  public static void testDerivativeOfComplexExponential()
  {
    boolean caught = false;
    try
    {
      var context = new Context();
      var a       = context.registerVariable(Real.named("a").one());
      var f       = RealFunction.express("diff(exp(I*a*t),t)", context);
      var x       = f.eval(2.3);
      assertEquals(26, x);
    }
    catch (CompilerException ce)
    {
      caught = ce.toString().contains("cannot be represented as");
    }
    assertTrue(caught);
  }

  public void testIntegralOfSquareRoot()
  {
    var f = RealFunction.express("∫y➔1/sqrt(1-y^2)dy");
    var y = f.eval(0.75);

    var g = RealFunction.express("arcsin(y)");
    var z = g.eval(0.75);
    assertEquals(f.toString(), g.toString());

    assertEquals(y, z);

  }

  public void testDefiniteIntegralOfSquareRoot()
  {

    // Expression.trace = Expression.saveClasses = true;
    // Expression.useNewIntegralNode = true;
    var f = RealFunction.express("x➔∫y➔1/sqrt(1-y^2)dy∈(-1,x)");
    var y = f.eval(0.75);

    var g = RealFunction.express("arcsin(x)+π⁄2");
    var z = g.eval(0.75);
    // assertEquals(f.toString(), g.toString());

    assertEquals(y, z);
    Expression.trace = Expression.saveClasses = true;

  }

  public void testSquareRootDerivative()
  {
    var f  = RealFunction.parse("diff(sqrt(x),x)");
    var df = RealFunction.parse("1/(sqrt(x)*2)");
    assertEquals(df.rootNode.toString(), f.rootNode.toString());
  }

  public void testCosineDerivativeSimplerSyntax()
  {
    var f  = RealFunction.parse("diff(cos(x),x)");
    var df = RealFunction.parse("-sin(x)");
    assertEquals(df.rootNode.toString(), f.rootNode.toString());
  }

  public void testGammaDerivative()
  {
    var f  = RealFunction.parse("∂Γ(x)/∂x");
    var df = RealFunction.parse("Γ(x)*digamma(x)");
    assertEquals(df.rootNode.toString(), f.rootNode.toString());
  }

  public void testHyperbolicSineDerivative()
  {
    var f  = RealFunction.parse("∂sinh(x)/∂x");
    var df = RealFunction.parse("cosh(x)");
    assertEquals(df.rootNode.toString(), f.rootNode.toString());
  }

  public void testHyperbolicCosineDerivative()
  {
    var f  = RealFunction.parse("∂cosh(x)/∂x");
    var df = RealFunction.parse("sinh(x)");
    assertEquals(df.rootNode.toString(), f.rootNode.toString());
  }

  public void testCotangentDerivative()
  {
    var f  = RealFunction.parse("∂cot(x)/∂x");
    var df = RealFunction.parse("(-1)-cot(x)^2");
    assertEquals(df.toString(), f.toString());
  }

  public void testCosecantDerivative()
  {
    var f  = RealFunction.parse("∂csc(x)/∂x");
    var df = RealFunction.parse("(-csc(x))*cot(x)");
    assertEquals(df.rootNode.toString(), f.rootNode.toString());
  }

  public void testSecantDerivative()
  {
    var f  = RealFunction.parse("∂sec(x)/∂x");
    var df = RealFunction.parse("sec(x)*tan(x)");
    assertEquals(df.rootNode.toString(), f.rootNode.toString());
  }

  public void testTanhDerivative()
  {
    var f  = RealFunction.parse("∂tanh(x)/∂x");
    var df = RealFunction.parse("1-tanh(x)²");
    assertEquals(df.rootNode.toString(), f.rootNode.toString());
  }

  public void testArcSinDerivative()
  {
    var f  = RealFunction.parse("∂arcsin(x)/∂x").simplify();
    var df = RealFunction.parse("1/√(1-x^2)").simplify();
    assertEquals(df.rootNode.toString(), f.rootNode.toString());
  }

  public void testRealFunctionDerivative()
  {
    var context    = new Context(Real.named("a").set(2),
                                 Real.named("b").set(4),
                                 Real.named("c").set(6));
    var f          = RealFunction.parse("x->a*x+b*x²+c*x³", context);
    var derivative = f.rootNode.differentiate().simplify();
    f.rootNode   = derivative;
    f.expression = derivative.toString();
    var    func = f.instantiate();
    double val  = func.eval(2.3);
    assertEquals(115.61999999999998, val);
  }
}
