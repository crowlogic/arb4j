package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexMultivariatePolynomialTest extends
                                               TestCase
{

  static int BITS = 128;

  public void testIsZeroOnZeroPolynomial()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS))
    {
      try ( var p = ctx.newPolynomial())
      {
        assertTrue("new polynomial should be zero", p.isZero());
      }
    }
  }

  public void testIsZeroOnNonZeroPolynomial()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS))
    {
      try ( var p = ctx.newPolynomial())
      {
        try ( var coeff = new Complex("1", BITS))
        {
          p.setCoefficient(new long[]{1, 0}, coeff);
        }
        assertFalse("polynomial with a term should not be zero", p.isZero());
      }
    }
  }

  public void testAddComplexMultivariatePolynomials()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var a = ctx.newPolynomial();
          var b = ctx.newPolynomial();
          var result = ctx.newPolynomial())
    {
      try ( var coeff = new Complex("3", BITS))
      {
        a.setCoefficient(new long[]{1, 0}, coeff);
      }
      try ( var coeff = new Complex("2", BITS))
      {
        b.setCoefficient(new long[]{0, 1}, coeff);
      }
      a.add(b, BITS, result);
      assertFalse(result.isZero());
    }
  }

  public void testMulComplexMultivariatePolynomials()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var a = ctx.newPolynomial();
          var b = ctx.newPolynomial();
          var result = ctx.newPolynomial())
    {
      try ( var coeff = new Complex("3", BITS))
      {
        a.setCoefficient(new long[]{1, 0}, coeff);
      }
      try ( var coeff = new Complex("2", BITS))
      {
        b.setCoefficient(new long[]{0, 1}, coeff);
      }
      a.mul(b, BITS, result);
      assertFalse(result.isZero());
      try ( var coeff = new Complex("6", BITS))
      {
        var expected = ctx.newPolynomial();
        expected.setCoefficient(new long[]{1, 1}, coeff);
        assertEquals("3x * 2y = 6xy", expected, result);
        expected.close();
      }
    }
  }

  public void testAddComplexScalar()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var p = ctx.newPolynomial();
          var result = ctx.newPolynomial())
    {
      try ( var coeff = new Complex("3", BITS))
      {
        p.setCoefficient(new long[]{1, 0}, coeff);
      }
      try ( var scalar = new Complex("5", BITS))
      {
        p.add(scalar, BITS, result);
      }
      assertFalse(result.isZero());
    }
  }

  public void testMulComplexScalar()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var p = ctx.newPolynomial();
          var result = ctx.newPolynomial())
    {
      try ( var coeff = new Complex("3", BITS))
      {
        p.setCoefficient(new long[]{1, 0}, coeff);
      }
      try ( var scalar = new Complex("2", BITS))
      {
        p.mul(scalar, BITS, result);
      }
      try ( var expected = ctx.newPolynomial();
            var expectedCoeff = new Complex("6", BITS))
      {
        expected.setCoefficient(new long[]{1, 0}, expectedCoeff);
        assertEquals("3x * 2 = 6x", expected, result);
      }
    }
  }

  public void testFromComplexPolynomial()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var cp = new ComplexPolynomial())
    {
      try ( var c0 = new Complex("1", BITS);
            var c1 = new Complex("2", BITS))
      {
        cp.set(0, c0);
        cp.set(1, c1);
      }
      try ( var mvp = ComplexMultivariatePolynomial.fromComplexPolynomial(cp, ctx, 0))
      {
        assertFalse(mvp.isZero());
      }
    }
  }

  public void testFromComplex()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var c = new Complex("7", BITS))
    {
      try ( var mvp = ComplexMultivariatePolynomial.fromComplex(c, ctx))
      {
        assertFalse(mvp.isZero());
      }
    }
  }

  public void testExpressionCompilerWithTypeResolution()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS))
    {
      var f = ComplexPolynomialNullaryFunction.express("3*x^2+x");
      assertNotNull(f);
    }
  }

  public void testGenerator()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var p = ctx.newPolynomial())
    {
      p.generator(0);
      assertFalse(p.isZero());
      p.generator(1);
      assertFalse(p.isZero());
    }
  }

  public void testZero()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var p = ctx.newPolynomial())
    {
      try ( var coeff = new Complex("3", BITS))
      {
        p.setCoefficient(new long[]{1, 0}, coeff);
      }
      assertFalse(p.isZero());
      p.zero();
      assertTrue(p.isZero());
    }
  }

  // ── negate ─────────────────────────────────────────────────────────────

  public void testNegate()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var a = ctx.newPolynomial();
          var neg = ctx.newPolynomial();
          var sum = ctx.newPolynomial())
    {
      try ( var coeff = new Complex("3", BITS))
      {
        a.setCoefficient(new long[]{1, 0}, coeff);
      }
      a.negate(neg);
      a.add(neg, BITS, sum);
      assertTrue("a + (-a) should be zero", sum.isZero());
    }
  }

  // ── length ─────────────────────────────────────────────────────────────

  public void testLength()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var p = ctx.newPolynomial())
    {
      assertEquals("empty polynomial has length 0", 0, p.length());
      try ( var coeff = new Complex("3", BITS))
      {
        p.setCoefficient(new long[]{1, 0}, coeff);
      }
      assertEquals("polynomial with one term has length 1", 1, p.length());
    }
  }

  // ── pow ────────────────────────────────────────────────────────────────

  public void testPowZero()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var p = ctx.newPolynomial();
          var result = ctx.newPolynomial())
    {
      try ( var coeff = new Complex("3", BITS))
      {
        p.setCoefficient(new long[]{1, 0}, coeff);
      }
      p.pow(0, BITS, result);
      assertTrue("any^0 should be 1", result.isOne());
    }
  }

  public void testPowOne()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var p = ctx.newPolynomial();
          var result = ctx.newPolynomial())
    {
      try ( var coeff = new Complex("3", BITS))
      {
        p.setCoefficient(new long[]{1, 0}, coeff);
      }
      p.pow(1, BITS, result);
      assertEquals("any^1 should be itself", p, result);
    }
  }

  public void testPowTwo()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var x = ctx.newPolynomial();
          var result = ctx.newPolynomial();
          var expected = ctx.newPolynomial();
          var temp = ctx.newPolynomial();
          var prod = ctx.newPolynomial())
    {
      x.generator(0);
      x.pow(2, BITS, result);
      expected.generator(0);
      temp.generator(0);
      expected.mul(temp, BITS, prod);
      assertEquals("x^2 should equal x*x", prod, result);
    }
  }

  // ── sub ────────────────────────────────────────────────────────────────

  public void testSubSelfIsZero()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var a = ctx.newPolynomial();
          var result = ctx.newPolynomial())
    {
      try ( var coeff = new Complex("5", BITS))
      {
        a.setCoefficient(new long[]{1, 1}, coeff);
      }
      a.sub(a, BITS, result);
      assertTrue("a - a should be zero", result.isZero());
    }
  }

  // ── add/sub Complex ────────────────────────────────────────────────────

  public void testSubComplex()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var p = ctx.newPolynomial();
          var result = ctx.newPolynomial())
    {
      try ( var coeff = new Complex("3", BITS))
      {
        p.setCoefficient(new long[]{0, 0}, coeff);
      }
      try ( var scalar = new Complex("3", BITS))
      {
        p.sub(scalar, BITS, result);
      }
      assertTrue("3 - 3 should be zero", result.isZero());
    }
  }

  // ── mul Integer ────────────────────────────────────────────────────────

  public void testMulInteger()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var p = ctx.newPolynomial();
          var result = ctx.newPolynomial())
    {
      try ( var coeff = new Complex("3", BITS))
      {
        p.setCoefficient(new long[]{1, 0}, coeff);
      }
      try ( var n = new Integer(2))
      {
        p.mul(n, BITS, result);
      }
      try ( var expected = ctx.newPolynomial();
            var expectedCoeff = new Complex("6", BITS))
      {
        expected.setCoefficient(new long[]{1, 0}, expectedCoeff);
        assertEquals("3x * 2 = 6x", expected, result);
      }
    }
  }

  // ── mul Real ───────────────────────────────────────────────────────────

  public void testMulReal()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var p = ctx.newPolynomial();
          var result = ctx.newPolynomial())
    {
      try ( var coeff = new Complex("3", BITS))
      {
        p.setCoefficient(new long[]{1, 0}, coeff);
      }
      try ( var r = new Real("2.0", BITS))
      {
        p.mul(r, BITS, result);
      }
      try ( var expected = ctx.newPolynomial();
            var expectedCoeff = new Complex("6", BITS))
      {
        expected.setCoefficient(new long[]{1, 0}, expectedCoeff);
        assertEquals("3x * 2.0 = 6x", expected, result);
      }
    }
  }

  // ── set(String) / toString roundtrip ───────────────────────────────────

  public void testSetString()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var p = ctx.newPolynomial())
    {
      p.setCoefficient(new long[]{1, 0}, 3L);
      p.setCoefficient(new long[]{0, 1}, 2L);
      assertFalse(p.isZero());
      assertFalse(p.isOne());
    }
  }

  public void testIsOne()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var p = ctx.newPolynomial())
    {
      p.one();
      assertTrue(p.isOne());
    }
  }

  // ── setCoefficient long ────────────────────────────────────────────────

  public void testSetCoefficientLong()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var p = ctx.newPolynomial())
    {
      p.setCoefficient(new long[]{1, 0}, 5L);
      assertFalse(p.isZero());
    }
  }

  // ── equals/hashCode ────────────────────────────────────────────────────

  public void testEqualsAndHashCode()
  {
    try ( var ctx = new ComplexMultivariatePolynomialContext(2, BITS);
          var a = ctx.newPolynomial();
          var b = ctx.newPolynomial())
    {
      try ( var coeff = new Complex("3", BITS))
      {
        a.setCoefficient(new long[]{1, 0}, coeff);
        b.setCoefficient(new long[]{1, 0}, coeff);
      }
      assertEquals(a, b);
      assertEquals(a.hashCode(), b.hashCode());
    }
  }

  public void testNotEqualsDifferentContext()
  {
    try ( var ctx1 = new ComplexMultivariatePolynomialContext(2, BITS);
          var ctx2 = new ComplexMultivariatePolynomialContext(2, BITS);
          var a = ctx1.newPolynomial();
          var b = ctx2.newPolynomial())
    {
      try ( var coeff = new Complex("3", BITS))
      {
        a.setCoefficient(new long[]{1, 0}, coeff);
        b.setCoefficient(new long[]{1, 0}, coeff);
      }
      assertFalse("polynomials from different contexts should not be equal", a.equals(b));
    }
  }
}
