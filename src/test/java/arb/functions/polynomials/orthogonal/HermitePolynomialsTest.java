package arb.functions.polynomials.orthogonal;

import static java.lang.System.out;

import arb.Real;
import arb.domains.ExtendedRealLine;
import arb.functions.real.RealFunction;
import arb.stochastic.StandardGaussianDensityFunction;
import arb.utensils.ShellFunctions;
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
    try ( var p = new StandardGaussianDensityFunction(); var h1 = new HermitePolynomial(1);
          var h2 = new HermitePolynomial(2); Real r = Real.newVector(4);
          RealFunction integrand = (t, order, bits, res) -> h1.evaluate(t, bits, r)
                                                              .mul(h2.evaluate(t, bits, r.get(1)), bits, r.get(2))
                                                              .mul(p.evaluate(t, bits, r.get(3)), bits, res))
    {
      ShellFunctions.plot(-20, 20, integrand);
      double integral = integrand.integrate(-10, 10);
      out.println("integral=" + integral);
      assertEquals(0.0, integral, 1e-8);
      try
      {
        Thread.sleep(1000 * 60 * 24);
      }
      catch (InterruptedException e)
      {
        throw new RuntimeException(e.getMessage(),
                                   e);
      }
    }
    assert false : "todo: numerically integrate and verify orthogonality";
  }

  public void testGetDomain()
  {
    assertTrue(H.getDomain().getClass().equals(ExtendedRealLine.class));
  }

}
