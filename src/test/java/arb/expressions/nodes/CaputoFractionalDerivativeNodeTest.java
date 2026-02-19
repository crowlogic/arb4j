package arb.expressions.nodes;

import arb.Real;
import arb.expressions.Context;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Tests for the Caputo fractional derivative operator Đ^(α) applied via
 * Node.fractionalDerivative().
 *
 * Reference formulas: Đ^(α)(c) = 0 Đ^(α)(t) = Γ(2)/Γ(2-α) * t^(1-α) Đ^(α)(t^k)
 * = Γ(k+1)/Γ(k+1-α) * t^(k-α) Đ^(α)(f+g) = Đ^(α)(f) + Đ^(α)(g) Đ^(α)(c*f) = c *
 * Đ^(α)(f)
 *
 * All expected values computed via mpmath at 50 decimal digits of precision.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class CaputoFractionalDerivativeNodeTest extends
                                                TestCase
{
  private static final double TOL = 1e-10;

  /**
   * substitute() must return this (the same object reference), not a newly
   * allocated node. Every other Node subclass follows this contract. A violation
   * means any parent node holding a reference to this node becomes stale after
   * substitution.
   */

  /**
   * End-to-end: a CaputoFractionalDerivativeNode embedded in a sum should survive
   * substitution with the parent's references remaining valid.
   */
  public void testSubstituteInSumPreservesTreeIntegrity()
  {
    var    context  = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));
    var    f        = RealFunction.express("Đ^(α)(t)+t", context);
    var    result   = f.evaluate(new Real("1.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    // Đ^(½)(t) at t=1 = Γ(2)/Γ(3/2) = 1/Γ(3/2) = 2/√π
    // mpmath: 2/sqrt(pi) = 1.1283791670955125738961589031215451716881...
    double dHalfT   = 2.0 / Math.sqrt(Math.PI);
    double expected = dHalfT + 1.0;
    assertEquals("Đ^(½)(t)+t at t=1 must work after tree construction",
                 expected,
                 result.doubleValue(),
                 1e-10);
  }

  public void testCaputoDerivativeOfConstantIsZero()
  {
    var context = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));
    var f       = RealFunction.express("Đ^(α)(5)", context);
    var result  = f.evaluate(new Real("1.0",
                                      128),
                             1,
                             128,
                             new Real());
    assertEquals("Đ^(α)(constant) must be 0", 0.0, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOfVariable()
  {
    var    context  = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));
    var    f        = RealFunction.express("Đ^(α)(t)", context);
    var    result   = f.evaluate(new Real("1.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    // Đ^(½)(t) at t=1 = Γ(2)/Γ(3/2) = 2/√π
    // mpmath: 1.1283791670955125738961589031215451716881...
    double expected = 2.0 / Math.sqrt(Math.PI);
    assertEquals("Đ^(½)(t) at t=1", expected, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOfTSquared()
  {
    var    context  = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));
    var    f        = RealFunction.express("Đ^(α)(t²)", context);
    var    result   = f.evaluate(new Real("2.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    // Đ^(½)(t²) at t=2 = Γ(3)/Γ(5/2) * 2^(3/2)
    // = 2/Γ(5/2) * 2^(3/2)
    // Γ(5/2) = (3/2)(1/2)√π = (3√π)/4
    // = 2/((3√π)/4) * 2√2 = 8/(3√π) * 2√2
    // mpmath: 4.2553843242819485646927579726334065970758...
    double expected = (8.0 / (3.0 * Math.sqrt(Math.PI))) * Math.pow(2.0, 1.5);
    assertEquals("Đ^(½)(t²) at t=2", expected, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOfTCubed()
  {
    var    context  = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));
    var    f        = RealFunction.express("Đ^(α)(t³)", context);
    var    result   = f.evaluate(new Real("1.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    // Đ^(½)(t³) at t=1 = Γ(4)/Γ(7/2) = 6/Γ(7/2)
    // Γ(7/2) = (5/2)(3/2)(1/2)√π = (15√π)/8
    // = 6/((15√π)/8) = 48/(15√π) = 16/(5√π)
    // mpmath: 1.8047185369720890668...
    double expected = 16.0 / (5.0 * Math.sqrt(Math.PI));
    assertEquals("Đ^(½)(t³) at t=1", expected, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOfConstantTimesMonomial()
  {
    var    context  = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));
    var    f        = RealFunction.express("Đ^(α)(3*t²)", context);
    var    result   = f.evaluate(new Real("2.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    // 3 * Đ^(½)(t²) at t=2 = 3 * (8/(3√π)) * 2^(3/2) = (8/√π) * 2^(3/2)
    // mpmath: 12.766152972845845694077773917890219791...
    double expected = 3.0 * (8.0 / (3.0 * Math.sqrt(Math.PI))) * Math.pow(2.0, 1.5);
    assertEquals("Đ^(½)(3*t²) at t=2", expected, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOfSum()
  {
    var    context  = new Context(Real.named("α").set("0.5", 128).setBounds(0, false, 1, true));
    var    f        = RealFunction.express("Đ^(α)(t+t²)", context);
    var    result   = f.evaluate(new Real("1.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    // Đ^(½)(t) at t=1 = 2/√π
    // Đ^(½)(t²) at t=1 = Γ(3)/Γ(5/2) = 2/Γ(5/2) = 2/((3√π)/4) = 8/(3√π)
    // mpmath: 1.1283791670955125... + 1.5045158670318416... = 2.6328950341273542...
    double dHalfT   = 2.0 / Math.sqrt(Math.PI);
    double dHalfT2  = 8.0 / (3.0 * Math.sqrt(Math.PI));
    double expected = dHalfT + dHalfT2;
    assertEquals("Đ^(½)(t+t²) at t=1", expected, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOrderOneMatchesOrdinaryDerivativeAltSyntax()
  {
    var context = new Context(Real.named("α").set("1.0", 128).setBounds(0, false, 1, true));
    var f       = RealFunction.express("ꟲD^(α)(t³)", context);
    var result  = f.evaluate(new Real("2.0",
                                      128),
                             1,
                             128,
                             new Real());
    // Đ^(1)(t³) = Γ(4)/Γ(3) * t^2 = 6/2 * t^2 = 3t²; at t=2: 12
    assertEquals("Đ^(1)(t³) = 3t² at t=2", 12.0, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOrderOneMatchesOrdinaryDerivative()
  {
    var context = new Context(Real.named("α").set("1.0", 128).setBounds(0, false, 1, true));
    var f       = RealFunction.express("Đ^(α)(t³)", context);
    var result  = f.evaluate(new Real("2.0",
                                      128),
                             1,
                             128,
                             new Real());
    // Đ^(1)(t³) = Γ(4)/Γ(3) * t^2 = 6/2 * t^2 = 3t²; at t=2: 12
    assertEquals("Đ^(1)(t³) = 3t² at t=2", 12.0, result.doubleValue(), TOL);
  }

  public void testCaputoDerivativeOrderOneQuarter()
  {
    var    context  = new Context(Real.named("α").set("0.25", 128).setBounds(0, false, 1, true));
    var    f        = RealFunction.express("Đ^(α)(t)", context);
    var    result   = f.evaluate(new Real("1.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    // Đ^(¼)(t) at t=1 = Γ(2)/Γ(2-¼) = 1/Γ(7/4)
    // mpmath: Γ(7/4) = 0.91906252684888323384682372752216789513842943608105...
    // 1/Γ(7/4) = 1.0880652521310173081027812631344501510346444944124...
    double expected = 1.0 / 0.91906252684888323;
    assertEquals("Đ^(¼)(t) at t=1", expected, result.doubleValue(), 1e-10);
  }

  public void testCaputoDerivativeOrderThreeQuarters()
  {
    var    context  = new Context(Real.named("α").set("0.75", 128).setBounds(0, false, 1, true));
    var    f        = RealFunction.express("Đ^(α)(t²)", context);
    var    result   = f.evaluate(new Real("1.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    // Đ^(¾)(t²) at t=1 = Γ(3)/Γ(3-¾) = 2/Γ(9/4)
    // mpmath: Γ(9/4) = 1.1330030963193463474783391112086475009359899009...
    // 2/Γ(9/4) = 1.7652202421133396119036514559252031984486350001153...
    double expected = 2.0 / 1.1330030963193463;
    assertEquals("Đ^(¾)(t²) at t=1", expected, result.doubleValue(), 1e-10);
  }
}
