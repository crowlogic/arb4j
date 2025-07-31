package arb.functions;

import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import arb.stochastic.processes.RealZProcess;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealBivariateFunctionTest extends
                                       TestCase
{

  public void testEvaluateRealBivariateFunction()
  {
    RealBivariateFunction func          = RealBivariateFunction.express("x-y");
    RealFunction          innerFunction = func.evaluate(RealConstants.half, 128);
    Real                  result        =
                                 innerFunction.evaluate(RealConstants.sqrt2, 128, new Real());
    result.printPrecision = false;
    assertEquals("-0.91421356237309504880168872420969807857", result.toString()); // ½-√2
  }

  public void testEvalRealBivariateFunctionWithContextVariable()
  {
    RealZProcess Zprocess = new RealZProcess();
    RealFunction gain     = Zprocess.A.evaluate(Real.named("λ").one(), 128);
    assertEquals(2.14, gain.eval(2.3));
  }

}
