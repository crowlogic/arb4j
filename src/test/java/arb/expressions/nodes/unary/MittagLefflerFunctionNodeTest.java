package arb.expressions.nodes.unary;

import arb.Real;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class MittagLefflerFunctionNodeTest extends
                                           TestCase
{

  public void testE_1_1_equalsExp()
  {
    RealFunction f = RealFunction.express("z->E(1,1,z)");
    assertEquals(Math.exp(2.0), f.eval(2.0), 1e-12);
  }

  public void testE_half_1()
  {
    RealFunction f   = RealFunction.express("z->E(0.5,1,z)");
    Real         val = f.evaluate(new Real("0.5",
                                           128),
                                  1,
                                  128,
                                  new Real());
    assertTrue("E_{0.5,1}(0.5) mismatch: " + val, val.toString().startsWith("1.952360489182557"));
  }

  public void testE_09_1_negative()
  {
    RealFunction f   = RealFunction.express("z->E(0.9,1,z)");
    Real         val = f.evaluate(new Real("-5",
                                           128),
                                  1,
                                  128,
                                  new Real());
    assertEquals(0.0344313248040984, val.doubleValue(), 1e-10);
  }

  public void testE_08_2()
  {
    RealFunction f   = RealFunction.express("z->E(0.8,2,z)");
    Real         val = f.evaluate(new Real("0.2",
                                           128),
                                  1,
                                  128,
                                  new Real());
    assertEquals(1.13089927806696, val.doubleValue(), 1e-10);
  }

  public void testE_twoArgForm_betaDefaultsToOne()
  {
    RealFunction f = RealFunction.express("z->E(1,z)");
    assertEquals(Math.exp(2.0), f.eval(2.0), 1e-12);
  }
}
