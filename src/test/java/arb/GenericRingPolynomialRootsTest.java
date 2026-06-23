package arb;

import junit.framework.TestCase;

/**
 * Locate the roots of a generic-ring polynomial via FLINT's
 * {@code gr_poly_roots} \u2014 the ring-level root locator that works
 * uniformly across every ring FLINT supports. No polynomial-type
 * knowledge needed at the Java side.
 *
 * <p>The polynomial here is {@code z\u00b2 \u2212 1} over the complex acb ring;
 * its two roots are {@code +1} and {@code \u22121}. Multiplicities live in
 * the integer ring (FLINT's design \u2014 multiplicities are integers
 * regardless of where roots live), so the {@code mult} vector is
 * initialised and cleared with the integer ring, not the complex one.</p>
 */
public class GenericRingPolynomialRootsTest extends TestCase
{
  public void testRootsOfZSquaredMinusOneOverComplexAcb()
  {
    int prec = 128;
    GenericRing C  = GenericRing.complexBalls(prec);
    GenericRing ZZ = new GenericRing();
    arblib.gr_ctx_init_fmpz(ZZ);

    GenericRingPolynomial p = GenericRingPolynomial.in(C);
    p.setCoeff(0, -1, C);
    p.setCoeff(2,  1, C);

    GenericRingVector roots = new GenericRingVector();
    GenericRingVector mult  = new GenericRingVector();
    arblib.gr_vec_init(roots, 0, C);
    arblib.gr_vec_init(mult,  0, ZZ);
    try
    {
      int status = arblib.gr_poly_roots(roots, mult, p, 0, C);
      assertEquals("gr_poly_roots success", 0, status);
      assertEquals("two roots of z\u00b2 \u2212 1", 2, arblib.arblib_gr_vec_length(roots));
    }
    finally
    {
      arblib.gr_vec_clear(roots, C);
      arblib.gr_vec_clear(mult,  ZZ);
    }
  }
}
