package arb.stochastic.processes.correlationfunctions;

import static arb.functions.real.RealFunction.express;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * The set of functions which can be represented by this function is the
 * 'modified Cauchy class'
 * 
 * see <a href="https://arxiv.org/abs/physics/0109031">Stochastic models which
 * separate fractal dimension and Hurst effect</a>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ModifiedCauchyCorrelationFunction extends
                                               CauchyCorrelationFunction
{

  @Override
  public void close()
  {
    α.close();
    β.close();
  }

  public RealFunction c       = express("((1+|h|)ᵅ)^(-(β/α)-1)*(1+(1-β)*|h|ᵅ)", context);

  @Override
  public Real evaluate(Real point, int order, int bits, Real res)
  {
    assert order <= 1 : "todo: make forthcomining automatic differentiation go from automaticly differentiating to already automatically differentiated";
    return c.evaluate(point, order, bits, res);
  }

}
