package arb.expressions.nodes.binary;

import arb.*;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.RealBivariateToComplexFunction;
import arb.functions.RealToComplexFunction;
import arb.functions.real.RealFunction;
import arb.functions.real.RealRiemannSiegelThetaFunction;
import junit.framework.TestCase;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class ExponentiationNodeTest extends
                                    TestCase
{
  public static void testDerivativesAndExponentialsInvolvingRealToComplexFunction()
  {
    try ( Real x = Real.named("x").set("24.75", 128))
    {
      Expression.saveClasses = Expression.trace = true;
      var  context = new Context();
      Real λ       = Real.named("λ").set(RealConstants.half);
      context.registerVariable(λ);

      final RealFunction θ = RealFunction.express("θ:im(lnΓ(¼+ⅈ*t/2))-(log(π)/2)*t", context);
      var                A = RealToComplexFunction.express("A:exp(ⅈ*λ*(θ(t)-t))*√(θ̇(t))", context);
      Complex            a = A.evaluate(x, 128);
      System.out.format("A(%s)=%s\n", x, a);
    }
    finally
    {
      Expression.saveClasses = Expression.trace = false;
    }
  }

  public static void testDerivativesAndExponentialsInvolvingRealBivariateToComplexFunction()
  {
    try ( var tmp = new Complex())
    {
      Expression.saveClasses = Expression.trace = true;
      var                   context = new Context();

      final RealFunction    θ       =
                              RealFunction.express("θ:im(lnΓ(¼+ⅈ*t/2))-(log(π)/2)*t", context);
      var                   gain    =
                                 RealBivariateToComplexFunction.express("A:exp(ⅈ*λ*(θ(t)-t))*√(θ̇(t))",
                                                                        context);
      RealToComplexFunction func    = gain.evaluate(RealConstants.half, 128);
      Complex               y       = func.eval(2.3, tmp);
      assertEquals(0.4296015350333563, y.re().doubleValue());
      assertEquals(-0.5684675488546744, y.im().doubleValue());
    }
    finally
    {
      Expression.saveClasses = Expression.trace = false;
    }
  }

  public static void testDerivativesAndExponentialsWithExpressionlessFunction()
  {
    try
    {
      Expression.saveClasses = Expression.trace = true;
      var context = new Context();
      var θ       = new RealRiemannSiegelThetaFunction();
      context.registerFunction("θ", θ);

      var gain = RealBivariateToComplexFunction.express("A:exp(ⅈ*λ*(θ(t)-t))*√(θ̇(t))", context);
      gain.evaluate(RealConstants.zero, 128);
    }
    finally
    {
      Expression.saveClasses = Expression.trace = false;
    }
  }

  public static void testSimplifySquaredSquareRoots()
  {
    var f = RealFunction.parse("x^(1/2)*x^(1/2)");
    f.simplify();
    assertEquals("x➔x", f.toString());
  }
}
