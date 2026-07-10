package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import junit.framework.TestCase;

/**
 *
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
}
