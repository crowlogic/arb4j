package arb.functions;

import arb.Complex;
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

    assertEquals(-0.91421356237309504880168872420969807857, result.doubleValue()); // ½-√2
  }

  public void testEvalRealBivariateFunctionWithContextVariable()
  {
    RealZProcess                   Zprocess        = new RealZProcess();
    RealBivariateToComplexFunction gain            = Zprocess.gainFuction();

    RealToComplexFunction          gainAtFrequency = gain.evaluate(Real.named("λ").one(), 128);
    assertEquals(-0.9308570971323369, gainAtFrequency.eval(1.0, new Complex()).re().doubleValue());
  }

}
