package arb.stochastic.processes;

import junit.framework.TestCase;

public class RealZProcessTest extends
                              TestCase
{
  public static void testZProcess()
  {
    RealZProcess Z = new RealZProcess();
    assertEquals("t➔exp((ⅈ*λ)*((θ(t))-t))", Z.gainFuction().toString() );
    assertEquals("t➔exp((ⅈ*λ)*(θ(t)))", Z.oscillatoryFunction().toString() );
  }
}
