package arb.expressions.nodes;

import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.CompilerException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.real.RealFunction;
import arb.functions.real.RealRiemannSiegelThetaFunction;
import arb.functions.real.θ;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class DerivativeNodeTest extends
                                TestCase
{
  public void testFirstDerivativeViaCombiningDotAboveCharacter()
  {
    final Context      context = new Context();
    final RealFunction θ       = RealFunction.express("θ:im(lnΓ(¼+ⅈ*t/2))-(log(π)/2)*t", context);
    final RealFunction Nθ      = RealFunction.express("Nθ:t➔t-θ̇(t)", context);
    var                y       = Nθ.eval(2.3);

  }

  public void testFirstDerivativeWithFunctionFormOfDerivative()
  {
    Expression.saveClasses = true;

    final Context      context = new Context();
    final RealFunction θ       = RealFunction.express("θ:im(lnΓ(¼+ⅈ*t/2))-(log(π)/2)*t", context);
    final RealFunction Nθ      = RealFunction.express("Nθ:t➔t-θ(t)/diff(θ(t),t)", context);
    var                y       = Nθ.eval(2.3);
    assertEquals(-2.9960711222608554, y);

  }

  public void testSecondDerivativeViaCombiningTwoDotsAboveCharacter()
  {
    Expression.saveClasses = true;
    final Context      context = new Context();
    final RealFunction θ       = RealFunction.express("θ:im(lnΓ(¼+ⅈ*t/2))-(log(π)/2)*t", context);
    final RealFunction Nθ̇     = RealFunction.express("Nθ̇:t➔t-θ̇(t)/θ̈(t)", context);
    var                y       = Nθ̇.eval(2.3);
    assertFalse(Double.isNaN(y));
  }

  public void testDecompiledEvaluateRealBivariateFunctionWithContextVariable()
  {
    try ( θ θ = new θ())
    {
      var  θ̇      = θ.derivative();
      Real θ̇AtOne = θ̇.evaluate(RealConstants.one, 128, new Real());
      assertEquals(-1.0125730965517337, θ̇AtOne.doubleValue());
    }
  }

  public void testEvaluateDerivativeOfTheRealRiemannSiegelThetaFunction()
  {
    try ( RealRiemannSiegelThetaFunction θ = new RealRiemannSiegelThetaFunction())
    {
      var  θ̇      = θ.derivative();
      Real θ̇AtOne = θ̇.evaluate(RealConstants.one, 128, new Real());
      assertEquals(-1.0125730965517337, θ̇AtOne.doubleValue());
    }
  }

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

  public void testDerivativeOfTheLogarithmicGammaFunction()
  {
    var ψ = RealFunction.express("diff(lnΓ(x),x)");
    var f = ψ.eval(2.3);
    assertEquals(0.6000398803639695, f);
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
