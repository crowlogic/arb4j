package arb.functions.complex;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.PartialFraction;
import arb.arblib;
import junit.framework.TestCase;

/**
 * Unit tests for generic partial-fraction decomposition of complex
 * polynomials ({@link arb.PartialFraction}).
 */
public class PartialFractionTest extends
                                 TestCase
{
  private static double real(Complex c)
  {
    return c.re().doubleValue();
  }

  /**
   * Decompose 1/((v-1)(v-2)) = -1/(v-1) + 1/(v-2).
   * Poles are at 1 and 2 with residues -1 and 1.
   */
  public void testSimplePartialFractions()
  {
    int prec = 256;

    try ( ComplexPolynomial Q = new ComplexPolynomial();
          ComplexPolynomial one = new ComplexPolynomial(); )
    {
      /* Q(v) = (v-1)(v-2) = v^2 - 3v + 2 */
      Q.setLength(3);
      Q.fitLength(3);
      Q.get(0).set(2);
      Q.get(1).set(-3);
      Q.get(2).set(1);

      one.setLength(1);
      one.fitLength(1);
      one.get(0).set(1);

      PartialFraction pf = ComplexPolynomial.partialFractions(one, Q, prec);

      assertEquals("degree of quotient", -1, pf.getQuotient().degree());
      assertEquals("number of poles", 2, pf.getN());

      Complex[] poles = pf.getPolesArray();
      Complex[] residues = pf.getResiduesArray();

      double p0 = real(poles[0]);
      double p1 = real(poles[1]);
      double r0 = real(residues[0]);
      double r1 = real(residues[1]);

      /* Order is unspecified, so match by pole location. */
      if (Math.abs(p0 - 1.0) < 1e-10)
      {
        assertEquals("residue at v=1", -1.0, r0, 1e-10);
        assertEquals("pole 1", 2.0, p1, 1e-10);
        assertEquals("residue at v=2", 1.0, r1, 1e-10);
      }
      else
      {
        assertEquals("pole 0", 2.0, p0, 1e-10);
        assertEquals("residue at v=2", 1.0, r0, 1e-10);
        assertEquals("pole 1", 1.0, p1, 1e-10);
        assertEquals("residue at v=1", -1.0, r1, 1e-10);
      }
    }
  }

  /**
   * Decompose (3v+1)/((v-2)(v+1)) = (7/3)/(v-2) + (2/3)/(v+1).
   */
  public void testLinearNumerator()
  {
    int prec = 256;

    try ( ComplexPolynomial P = new ComplexPolynomial();
          ComplexPolynomial Q = new ComplexPolynomial(); )
    {
      /* P(v) = 3v + 1 */
      P.setLength(2);
      P.fitLength(2);
      P.get(0).set(1);
      P.get(1).set(3);

      /* Q(v) = (v-2)(v+1) = v^2 - v - 2 */
      Q.setLength(3);
      Q.fitLength(3);
      Q.get(0).set(-2);
      Q.get(1).set(-1);
      Q.get(2).set(1);

      PartialFraction pf = ComplexPolynomial.partialFractions(P, Q, prec);

      assertEquals("number of poles", 2, pf.getN());

      Complex[] poles = pf.getPolesArray();
      Complex[] residues = pf.getResiduesArray();

      for (int i = 0; i < 2; i++)
      {
        double p = real(poles[i]);
        double r = real(residues[i]);
        if (Math.abs(p - 2.0) < 1e-10)
          assertEquals("residue at v=2", 7.0 / 3.0, r, 1e-10);
        else if (Math.abs(p + 1.0) < 1e-10)
          assertEquals("residue at v=-1", 2.0 / 3.0, r, 1e-10);
        else
          fail("unexpected pole " + p);
      }
    }
  }

  /**
   * Reconstruct the original rational function from its partial-fraction
   * representation and compare evaluations.
   */
  public void testReconstruction()
  {
    int prec = 256;

    try ( ComplexPolynomial P = new ComplexPolynomial();
          ComplexPolynomial Q = new ComplexPolynomial();
          Complex z = new Complex().set(0.7);
          Complex expected = new Complex();
          Complex actual = new Complex();
          Complex t = new Complex();
          Complex s = new Complex(); )
    {
      /* P(v) = v^2 + 1, Q(v) = v^3 - 6v^2 + 11v - 6 = (v-1)(v-2)(v-3) */
      P.setLength(3);
      P.fitLength(3);
      P.get(0).set(1);
      P.get(1).set(0);
      P.get(2).set(1);

      Q.setLength(4);
      Q.fitLength(4);
      Q.get(0).set(-6);
      Q.get(1).set(11);
      Q.get(2).set(-6);
      Q.get(3).set(1);

      PartialFraction pf = ComplexPolynomial.partialFractions(P, Q, prec);

      /* Expected P(z)/Q(z). */
      arblib.acb_poly_evaluate(expected, P, z, prec);
      arblib.acb_poly_evaluate(actual, Q, z, prec);
      arblib.acb_div(expected, expected, actual, prec);

      /* Reconstruct from partial fractions. */
      arblib.acb_poly_evaluate(actual, pf.getQuotient(), z, prec);
      Complex[] poles = pf.getPolesArray();
      Complex[] residues = pf.getResiduesArray();
      for (int i = 0; i < pf.getN(); i++)
      {
        arblib.acb_sub(t, z, poles[i], prec);
        arblib.acb_div(s, residues[i], t, prec);
        arblib.acb_add(actual, actual, s, prec);
      }

      double err = Math.abs(real(expected) - real(actual));
      assertTrue("reconstruction error too large: " + err, err < 1e-10);
    }
  }
}
