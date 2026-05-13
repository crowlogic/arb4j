package arb.expressions.nodes.unary;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.polynomials.RealPolynomialNullaryFunction;
import junit.framework.TestCase;

/**
 * Tests for expression-compiler polynomial composition (#1023).
 *
 * <p>
 * When the parser sees {@code p(q)} with both {@code p} and {@code q}
 * polynomials of the same kind, the compiler emits a typed
 * {@code INVOKEVIRTUAL} against
 * {@code <PolyType>.evaluate(<PolyType>, int, int, <PolyType>)} which is
 * backed by {@code acb_poly_compose} / {@code arb_poly_compose}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne \u00a9 terms of the
 *      {@link TheArb4jLibrary}
 */
public class PolynomialCompositionTest extends
                                       TestCase
{

  public static final int bits = 128;

  private static ComplexPolynomial cp(String expr)
  {
    return ComplexPolynomialNullaryFunction.express(expr).evaluate(bits, new ComplexPolynomial());
  }

  private static RealPolynomial rp(String expr)
  {
    return RealPolynomialNullaryFunction.express(expr).evaluate(bits, new RealPolynomial());
  }

  /**
   * Direct Java-side smoke: composition of two ComplexPolynomial values
   * computes correctly and is aliasing-safe when the result buffer is
   * one of the inputs.
   */
  public void testComplexPolynomialDirectComposition()
  {
    // p(z) = z^2 + 1, q(z) = z + 1  ->  p(q(z)) = (z+1)^2 + 1 = z^2 + 2z + 2
    try (ComplexPolynomial p = cp("1+x^2");
         ComplexPolynomial q = cp("1+x");
         ComplexPolynomial r = new ComplexPolynomial())
    {
      ComplexPolynomial composed = p.evaluate(q, 1, bits, r);
      assertSame("result buffer must be returned", r, composed);
      // Evaluate the composed polynomial at x=0: should be 2.
      try (Complex zero = new Complex(); Complex out = new Complex())
      {
        zero.set(0);
        composed.evaluate(zero, 1, bits, out);
        assertEquals(2.0, out.re().doubleValue(), 1e-30);
      }
      // Evaluate at x=1: (1+1)^2 + 1 = 5.
      try (Complex one = new Complex(); Complex out = new Complex())
      {
        one.set(1);
        composed.evaluate(one, 1, bits, out);
        assertEquals(5.0, out.re().doubleValue(), 1e-30);
      }
    }
  }

  /**
   * The aliasing guard must produce identical results whether or not
   * result aliases an input.
   */
  public void testComplexPolynomialCompositionAliasing()
  {
    try (ComplexPolynomial p1 = cp("1+x^2");
         ComplexPolynomial q1 = cp("1+x");
         ComplexPolynomial p2 = cp("1+x^2");
         ComplexPolynomial q2 = cp("1+x");
         ComplexPolynomial fresh = new ComplexPolynomial())
    {
      p1.evaluate(q1, 1, bits, fresh);
      p2.evaluate(q2, 1, bits, p2);
      assertEquals("alias-receiver result matches unaliased", fresh.toString(), p2.toString());
    }
    try (ComplexPolynomial p1 = cp("1+x^2");
         ComplexPolynomial q1 = cp("1+x");
         ComplexPolynomial p2 = cp("1+x^2");
         ComplexPolynomial q2 = cp("1+x");
         ComplexPolynomial fresh = new ComplexPolynomial())
    {
      p1.evaluate(q1, 1, bits, fresh);
      p2.evaluate(q2, 1, bits, q2);
      assertEquals("alias-inner result matches unaliased", fresh.toString(), q2.toString());
    }
  }

  /**
   * Same smoke for RealPolynomial: composition via arb_poly_compose.
   */
  public void testRealPolynomialDirectComposition()
  {
    try (RealPolynomial p = rp("1+x^2");
         RealPolynomial q = rp("1+x");
         RealPolynomial r = new RealPolynomial())
    {
      RealPolynomial composed = p.evaluate(q, 1, bits, r);
      assertSame("result buffer must be returned", r, composed);
      try (Real zero = new Real(); Real out = new Real())
      {
        zero.set(0);
        composed.evaluate(zero, 1, bits, out);
        assertEquals(2.0, out.doubleValue(), 1e-30);
      }
      try (Real one = new Real(); Real out = new Real())
      {
        one.set(1);
        composed.evaluate(one, 1, bits, out);
        assertEquals(5.0, out.doubleValue(), 1e-30);
      }
    }
  }

  /**
   * The expression compiler must emit the polynomial composition path
   * when both operands are ComplexPolynomial. Without #1023's fix, this
   * faulted with ClassCastException.
   */
  public void testComplexPolynomialCompositionViaExpressionCompiler()
  {
    Context context = new Context();
    // q(x) = 1+x, expressed and registered in the context.
    ComplexPolynomialNullaryFunction.express("q", "1+x", context);
    // p(x) = 1 + x^2, with the body referring to q so the compiler emits
    // a polynomial-on-polynomial call site.
    ComplexPolynomialNullaryFunction p = ComplexPolynomialNullaryFunction.express("p", "1+q()^2", context);
    try (ComplexPolynomial result = new ComplexPolynomial())
    {
      p.evaluate(0, bits, result);
      // Evaluate the composed polynomial at x = 1: 1 + (1+1)^2 = 5.
      try (Complex at = new Complex(); Complex out = new Complex())
      {
        at.set(1);
        result.evaluate(at, 1, bits, out);
        assertEquals(5.0, out.re().doubleValue(), 1e-30);
      }
    }
  }

  /**
   * RealPolynomial version of the expression-compiler composition path.
   */
  public void testRealPolynomialCompositionViaExpressionCompiler()
  {
    Context context = new Context();
    RealPolynomialNullaryFunction.express("q", "1+x", context);
    RealPolynomialNullaryFunction p = RealPolynomialNullaryFunction.express("p", "1+q()^2", context);
    try (RealPolynomial result = new RealPolynomial())
    {
      p.evaluate(0, bits, result);
      try (Real at = new Real(); Real out = new Real())
      {
        at.set(1);
        result.evaluate(at, 1, bits, out);
        assertEquals(5.0, out.doubleValue(), 1e-30);
      }
    }
  }
}
