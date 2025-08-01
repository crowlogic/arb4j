package arb.stochastic.processes;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;


/**
 * @author Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */

public class RealZProcessTest extends
                              TestCase
{
  public static void testZProcess()
  {
    RealZProcess Zprocess = new RealZProcess();
    assertEquals("λ➔exp((ⅈ*λ)*((θ(t))-t))", Zprocess.gainFunction().toString());
    assertEquals("λ➔exp((ⅈ*λ)*(θ(t)))", Zprocess.oscillatoryFunction().toString());
  }
}
