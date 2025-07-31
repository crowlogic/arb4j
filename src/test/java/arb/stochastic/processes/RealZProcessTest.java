package arb.stochastic.processes;

import junit.framework.TestCase;

public class RealZProcessTest extends
                              TestCase
{
  public static void testZProcess()
  {
    RealZProcess Zprocess = new RealZProcess();
    assertEquals("λ➔exp((ⅈ*λ)*((θ(t))-t))", Zprocess.gainFuction().toString());
    assertEquals("λ➔exp((ⅈ*λ)*(θ(t)))", Zprocess.oscillatoryFunction().toString());
  }
}
