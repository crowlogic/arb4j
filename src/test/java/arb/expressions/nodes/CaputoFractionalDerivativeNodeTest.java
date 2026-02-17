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
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class CaputoFractionalDerivativeNodeTest extends
                                                TestCase
{
  private static final double TOL = 1e-10;

  /**
   * Đ^(½)(5) = 0
   * 
   * The Caputo derivative of any constant is zero.
   */
  public void testCaputoDerivativeOfConstantIsZero()
  {
    var context = new Context(Real.named("α").set("0.5", 128));
    var f       = RealFunction.express("Đ^(α)(5)", context);
    var result  = f.evaluate(new Real("1.0",
                                      128),
                             1,
                             128,
                             new Real());
    assertEquals("Đ^(α)(constant) must be 0", 0.0, result.doubleValue(), TOL);
  }

  /**
   * Đ^(½)(t) = Γ(2)/Γ(3/2) * t^(1/2) = 1 / (√π/2) * √t = 2/√π * √t
   * 
   * At t=1: 2/√π ≈ 1.1283791670955126
   */
  public void testCaputoDerivativeOfVariable()
  {
    var    context  = new Context(Real.named("α").set("0.5", 128));
    var    f        = RealFunction.express("Đ^(α)(t)", context);
    var    result   = f.evaluate(new Real("1.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    double expected = 2.0 / Math.sqrt(Math.PI);
    assertEquals("Đ^(½)(t) at t=1", expected, result.doubleValue(), TOL);
  }

  /**
   * Đ^(½)(t²) = Γ(3)/Γ(5/2) * t^(3/2) = 2 / (3√π/4) * t^(3/2) = 8/(3√π) * t^(3/2)
   * 
   * At t=2: 8/(3√π) * 2^(3/2) ≈ 4.2567583341940506
   */
  public void testCaputoDerivativeOfTSquared()
  {
    var    context  = new Context(Real.named("α").set("0.5", 128));
    var    f        = RealFunction.express("Đ^(α)(t²)", context);
    var    result   = f.evaluate(new Real("2.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    double expected = (8.0 / (3.0 * Math.sqrt(Math.PI))) * Math.pow(2.0, 1.5);
    assertEquals("Đ^(½)(t²) at t=2", expected, result.doubleValue(), TOL);
  }

  /**
   * Đ^(½)(t³) = Γ(4)/Γ(7/2) * t^(5/2) = 6 / (15√π/8) * t^(5/2) = 16/(5√π) *
   * t^(5/2)
   * 
   * At t=1: 16/(5√π) ≈ 1.8053266673528203
   */
  public void testCaputoDerivativeOfTCubed()
  {
    var    context  = new Context(Real.named("α").set("0.5", 128));
    var    f        = RealFunction.express("Đ^(α)(t³)", context);
    var    result   = f.evaluate(new Real("1.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    double expected = 16.0 / (5.0 * Math.sqrt(Math.PI));
    assertEquals("Đ^(½)(t³) at t=1", expected, result.doubleValue(), TOL);
  }

  /**
   * Đ^(α)(3*t²) = 3 * Đ^(α)(t²)
   * 
   * Constant factor pulls out. At t=2, α=0.5: 3 * 8/(3√π) * 2^(3/2) ≈
   * 12.770275002582152
   */
  public void testCaputoDerivativeOfConstantTimesMonomial()
  {
    var    context  = new Context(Real.named("α").set("0.5", 128));
    var    f        = RealFunction.express("Đ^(α)(3*t²)", context);
    var    result   = f.evaluate(new Real("2.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    double expected = 3.0 * (8.0 / (3.0 * Math.sqrt(Math.PI))) * Math.pow(2.0, 1.5);
    assertEquals("Đ^(½)(3*t²) at t=2", expected, result.doubleValue(), TOL);
  }

  /**
   * Đ^(α)(t + t²) = Đ^(α)(t) + Đ^(α)(t²)
   * 
   * Linearity over addition. At t=1, α=0.5: 2/√π + 8/(3√π) = 2/√π * (1 + 4/3) =
   * 14/(3√π)
   */
  public void testCaputoDerivativeOfSum()
  {
    var    context  = new Context(Real.named("α").set("0.5", 128));
    var    f        = RealFunction.express("Đ^(α)(t+t²)", context);
    var    result   = f.evaluate(new Real("1.0",
                                          128),
                                 1,
                                 128,
                                 new Real());
    double dHalfT   = 2.0 / Math.sqrt(Math.PI);
    double dHalfT2  = 8.0 / (3.0 * Math.sqrt(Math.PI));
    double expected = dHalfT + dHalfT2;
    assertEquals("Đ^(½)(t+t²) at t=1", expected, result.doubleValue(), TOL);
  }

  /**
   * When α=1, the Caputo derivative must agree with the ordinary derivative.
   * 
   * Đ^(1)(t³) = Γ(4)/Γ(3) * t² = 6/2 * t² = 3t² At t=2: 12.0
   */
  public void testCaputoDerivativeOrderOneMatchesOrdinaryDerivative()
  {
    var context = new Context(Real.named("α").set("1.0", 128));
    var f       = RealFunction.express("Đ^(α)(t³)", context);
    var result  = f.evaluate(new Real("2.0",
                                      128),
                             1,
                             128,
                             new Real());
    assertEquals("Đ^(1)(t³) = 3t² at t=2", 12.0, result.doubleValue(), TOL);
  }

  /**
   * Đ^(¼)(t) = Γ(2)/Γ(7/4) * t^(3/4)
   * 
   * At t=1: 1/Γ(7/4) ≈ 1/0.9190625268... ≈ 1.08808...
   */
  public void testCaputoDerivativeOrderOneQuarter()
  {
    var    context     = new Context(Real.named("α").set("0.25", 128));
    var    f           = RealFunction.express("Đ^(α)(t)", context);
    var    result      = f.evaluate(new Real("1.0",
                                             128),
                                    1,
                                    128,
                                    new Real());
    double gamma7Over4 = 0.9190625268488832;
    double expected    = 1.0 / gamma7Over4;
    assertEquals("Đ^(¼)(t) at t=1", expected, result.doubleValue(), 1e-8);
  }

  /**
   * Đ^(¾)(t²) = Γ(3)/Γ(9/4) * t^(5/4)
   * 
   * At t=1: 2/Γ(9/4) ≈ 2/1.13300... ≈ 1.76533...
   */
  public void testCaputoDerivativeOrderThreeQuarters()
  {
    var    context     = new Context(Real.named("α").set("0.75", 128));
    var    f           = RealFunction.express("Đ^(α)(t²)", context);
    var    result      = f.evaluate(new Real("1.0",
                                             128),
                                    1,
                                    128,
                                    new Real());
    double gamma9Over4 = 1.1330027984644842;
    double expected    = 2.0 / gamma9Over4;
    assertEquals("Đ^(¾)(t²) at t=1", expected, result.doubleValue(), 1e-8);
  }
}
