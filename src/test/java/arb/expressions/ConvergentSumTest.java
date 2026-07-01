package arb.expressions;

import arb.Complex;
import arb.Real;
import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class ConvergentSumTest extends
                               TestCase
{
  /**
   * The infinite series Σ xᵏ/k!{k=0…∞} evaluated at x=1 is the true infinite
   * sum; the compiler supplies the least order whose tail is within the certified
   * ball radius, silently, with no order in the syntax. It must equal e.
   */
  public void testConvergentSumEqualsExponential()
  {
    try ( Real x = new Real(); Real result = new Real(); Real e = new Real(); Real diff = new Real())
    {
      RealFunction f = RealFunction.express("f:x➔Σk➔(x^k/k!){k=0…∞}");
      x.one();
      f.evaluate(x, 1, 128, result);
      e.one().exp(128, e);
      result.sub(e, 128, diff).abs();
      assertTrue(String.format("Σ x^k/k!{k=0…∞} at x=1 = %s, e = %s, |Δ| = %s", result, e, diff),
                 diff.compareTo(Real.valueOf("1e-18", 128)) < 0);
    }
  }

  public void testFixedBoundSumUnchanged()
  {
    try ( Real x = new Real(); Real result = new Real())
    {
      RealFunction f = RealFunction.express("g:x➔Σk➔(x^k/k!){k=0…10}");
      x.zero();
      f.evaluate(x, 1, 128, result);
      assertEquals(1.0, result.doubleValue(), 1e-15);
    }
  }

  /**
   * The inline convergence exit is type-directed: a complex summand converges to
   * a certified enclosure exactly as the real one does. Σ (iz)ᵏ/k!{k=0…∞} at z=1
   * is e^{i} = cos(1) + i·sin(1).
   */
  public void testComplexConvergentSum()
  {
    try ( Complex z = new Complex(); Complex result = new Complex(); Complex expected = new Complex();
          Complex diff = new Complex(); Real diffMag = new Real())
    {
      ComplexFunction f = ComplexFunction.express("f:z➔Σk➔((I*z)^k/k!){k=0…∞}");
      z.set(1);
      f.evaluate(z, 1, 128, result);
      expected.re().set("1", 128).cos(128, expected.re());
      expected.im().set("1", 128).sin(128, expected.im());
      result.sub(expected, 128, diff).abs(128, diffMag);
      assertTrue("Σ (iz)^k/k!{k=0…∞} at z=1 = " + result + ", e^i = " + expected,
                 diffMag.compareTo(Real.valueOf("1e-18", 128)) < 0);
    }
  }

  /**
   * A genuinely divergent series must fail loud — never spin forever, never stop
   * at an arbitrary ceiling. Σ k!·xᵏ{k=0…∞} at x=1 has terms that grow without
   * bound, so the convergence exit can never be met and the divergence witness
   * throws.
   */
  public void testDivergentSumThrows()
  {
    try ( Real x = new Real(); Real result = new Real())
    {
      RealFunction f = RealFunction.express("h:x➔Σk➔(k!*x^k){k=0…∞}");
      x.one();
      try
      {
        f.evaluate(x, 1, 128, result);
        fail("a divergent Σ{k=0…∞} must throw, not return");
      }
      catch (ArithmeticException expected)
      {
        // fail loud, as required
      }
    }
  }
}
