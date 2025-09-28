package arb.expressions.nodes.binary;

import arb.RealConstants;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.RealBivariateToComplexFunction;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class ExponentiationNodeTest extends
                                    TestCase
{
  public static void testDerivativesAndExponentials()
  {
    try
    {
      Expression.saveClasses = Expression.trace = true;
      var                context = new Context();
//      var θ       = new RealRiemannSiegelThetaFunction();
//      context.registerFunction("θ", θ);
      
      final RealFunction θ       = RealFunction.express("θ:im(lnΓ(¼+ⅈ*t/2))-(log(π)/2)*t", context);
      var gain = RealBivariateToComplexFunction.express("A:exp(ⅈ*λ*(θ(t)-t))*√(θ̇(t))", context);
      gain.evaluate(RealConstants.zero, 128);
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
      var                context = new Context();
//      var θ       = new RealRiemannSiegelThetaFunction();
//      context.registerFunction("θ", θ);
      
      final RealFunction θ       = RealFunction.express("θ:im(lnΓ(¼+ⅈ*t/2))-(log(π)/2)*t", context);
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
