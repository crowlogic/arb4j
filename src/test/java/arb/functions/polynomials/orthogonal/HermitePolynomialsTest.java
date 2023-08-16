package arb.functions.polynomials.orthogonal;

import static java.lang.System.out;

import java.util.Iterator;

import arb.ComplexPolynomial;
import arb.domains.ExtendedRealLine;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

public class HermitePolynomialsTest extends
                                    TestCase
{
  HermitePolynomials H = new HermitePolynomials();

  protected void setUp() throws Exception
  {
    super.setUp();
  }

  protected void tearDown() throws Exception
  {

    super.tearDown();
  }

  public void testOrthogonality()
  {
    assert false : "todo: numerically integrate and verify orthogonality";
  }

  public void testGetDomain()
  {
    assertTrue(H.getDomain().getClass().equals(ExtendedRealLine.class));
  }

}
