package arb.expressions.nodes.nary;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Verifies symbolic differentiation of a bounded summation
 * {@code Σf(k,v){k=a…b}} with respect to a continuous variable {@code v}.
 *
 * <p>
 * Because the summation limits are independent of {@code v}, differentiation
 * commutes with the finite sum (linearity):
 *
 * <pre>
 *   d/dv Σ_{k=a}^{b} f(k,v) = Σ_{k=a}^{b} ∂f(k,v)/∂v
 * </pre>
 *
 * <p>
 * Correctness of the emitted derivative is established by the fundamental
 * theorem of calculus — NOT by finite differences and NOT by numerical
 * integration. The derivative is integrated <em>symbolically</em> (indefinite
 * integral, an exact antiderivative), and the increment of that antiderivative
 * over an interval must reproduce the increment of the original summation,
 * removing the additive constant of integration:
 *
 * <pre>
 *   let g(v) = d/dv Σf(k,v),  H(v) = ∫ g(v) dv
 *   then  H(b) − H(a) = Σf(k,b) − Σf(k,a) = f(b) − f(a)
 * </pre>
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SumDifferentiationTest extends
                                    TestCase
{

  /**
   * The symbolic derivative of f(v) = Σ_{k=1}^{3} v^k = v + v² + v³ is
   * f'(v) = 1 + 2v + 3v². Evaluated directly, the compiled derivative must be
   * exact at every point.
   */
  public void testSummationDerivativeEvaluatesExactly()
  {
    try ( RealFunction g = RealFunction.express("v➔diff(Σv^k{k=1…3},v)"))
    {
      assertEquals("f'(0) = 1", 1.0, g.eval(0.0), 1e-12);
      assertEquals("f'(1) = 1+2+3", 6.0, g.eval(1.0), 1e-12);
      assertEquals("f'(2) = 1+4+12", 17.0, g.eval(2.0), 1e-12);
    }
  }

  /**
   * Fundamental theorem of calculus for the summation: the indefinite
   * (symbolic, exact) integral H of the symbolic derivative of
   * f(v) = Σ_{k=1}^{3} v^k is an exact antiderivative. Its increment over an
   * interval reproduces the increment of the original summation, which removes
   * the additive constant of integration:
   *
   * <pre>
   *   let g(v) = d/dv Σf(k,v),  H(v) = ∫ g(v) dv
   *   then  H(b) − H(a) = Σf(k,b) − Σf(k,a) = f(b) − f(a).
   * </pre>
   *
   * With a = 0.5, b = 2.0: f(2) − f(0.5) = (2+4+8) − (0.5+0.25+0.125) = 13.125.
   */
  public void testFundamentalTheoremReconstructsOriginalSummation()
  {
    try ( RealFunction f = RealFunction.express("v➔Σv^k{k=1…3}");
          RealFunction H = RealFunction.express("∫v➔diff(Σv^k{k=1…3},v)dv"))
    {
      double a                 = 0.5;
      double hAtA              = H.eval(a);
      double fAtA              = f.eval(a);
      for (double b : new double[]
      { 1.0, 1.5, 2.0, 2.5 })
      {
        double integratedIncrement = H.eval(b) - hAtA;
        double originalIncrement   = f.eval(b) - fAtA;
        assertEquals("∫_a^b f'(v) dv must equal f(b)−f(a) at b=" + b,
                     originalIncrement,
                     integratedIncrement,
                     1e-9);
      }
    }
  }
}
