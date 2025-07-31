package arb.stochastic.processes;

import junit.framework.TestCase;

public class RealZProcessTest extends
                              TestCase
{
  public static void testZProcess()
  {
    RealZProcess Z = new RealZProcess();
    assertEquals("A:t➔exp((ⅈ*λ)*((θ(t))-t))", Z.toString());
  }
}
