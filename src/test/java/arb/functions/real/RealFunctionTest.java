package arb.functions.real;

import arb.Fraction;
import arb.Integer;
import arb.Real;
import arb.expressions.Context;
import junit.framework.TestCase;

@SuppressWarnings(
{ "resource" })
/*
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 * 
 * @author ©2024 Stephen Crowley
 */
public class RealFunctionTest
                              extends
                              TestCase
{
  
  public void testDeltaFunctionSifting()
  {
    var context = new Context();
    var H       = RealFunction.parse("H:a->int(sin(x)*δ(x-a),x=-inf..inf)",                                     
                                     context);
    assertEquals("H:a➔sin(a)", H.toString());
    
  }
  
  public void testDeltaFunctionIntegrals()
  {
    var context = new Context();
    var δ       = RealFunction.parse("δ(x)",
                                     context);
    var H       = RealFunction.parse("H:int(δ(x),x)",                                     
                                     context);
    assertEquals("H:x➔θ(x)", H.toString());
    
    var H2      = RealFunction.parse("H2:int(H(x),x)",
                                     context);
    assertEquals("H2:x➔x*θ(x)", H2.toString());

    var H3      = RealFunction.parse("H3:int(H2(x),x)",
                                     context);
    assertEquals("H3:x➔((x^2)/2)*(x*θ(x))", H3.toString());
  }

  public void testEvaluateMixedExpression()
  {
    var context = new Context(Real.named("input")
                                  .set("1.5",
                                       128),
                              Integer.named("k").set(1),
                              Integer.named("j").set(2));
    var seq     = RealFunction.express("x->½*J(k,x)*π^½*(8*j+2)^½*(-1)^j*Γ(½*k+j+½)/Γ(½*k+½-j)/Γ(j+1-½*k)/Γ(½*k+j+1)",
                                       context);
    var f3      = seq.eval(2.3);
    assertEquals(Double.NaN,
                 f3);
  }

  public static void testParse()
  {
    var context   = new Context();
    var f         = RealFunction.express("θ:im(lnΓ(¼+I*t/2))-(log(π)/2)*t",
                                         context);
    var e         = RealFunction.parse("e:θ(t)-t",
                                       context);
    var einstance = e.instantiate();
    assertEquals("e:t➔θ(t)-t",
                 einstance.toString());
    assertEquals("θ:t➔im(lnΓ(¼+((ⅈ*t)/2)))-((log(π)/2)*t)",
                 f.toString());
  }

  public static void testJOneQuarter()
  {
    var    f = RealFunction.express("J(1/4, s)");
    double y = f.eval(2.3);
    assertEquals(0.2443567191733145,
                 y);
  }

  public static void testRandomWavePropagator()
  {
    var    f = RealFunction.express("√(π)*Γ(¾)*J(¼,|s|)*2^¼÷|s|^¼");
    double y = f.eval(2.3);
    assertEquals(0.5125173326531876,
                 y);
  }

  public static void testBetaFunctionReal()
  {
    var oneOverThirty      = new Fraction(1,
                                          30);
    var oneThirtieth       = RealNullaryFunction.express("Beta(5,2)");
    var oneDividedByThirty = oneThirtieth.evaluate(128);
    assertEquals(oneOverThirty.doubleValue(),
                 oneDividedByThirty.doubleValue());
  }

}
