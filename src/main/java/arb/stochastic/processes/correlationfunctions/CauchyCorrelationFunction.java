package arb.stochastic.processes.correlationfunctions;

import static arb.functions.real.RealFunction.express;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RealFunction;

/**
 * The set of functions which can be represented by this function is the 'Cauchy
 * class'
 * 
 * see <a href="https://arxiv.org/abs/physics/0109031">Stochastic models which
 * separate fractal dimension and Hurst effect</a>
 *
 * @author Stephen Crowley
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class CauchyCorrelationFunction implements
                                       RealFunction,
                                       AutoCloseable
{
  public CauchyCorrelationFunction()
  {
  }

  @Override
  public void close()
  {
    α.close();
    β.close();
  }

  /**
   * α∈(0,2)
   */
  public final Real   α       = new Real().setName("α").set(1);

  /**
   * β≥0
   */
  public final Real   β       = new Real().setName("β").set(1);
  
  public Context      context = new Context(α,
                                            β);

  public RealFunction c       = express("h➔((1+|h|)ᵅ)^(-(β/α))", context);

  @Override
  public Real evaluate(Real point, int order, int bits, Real res)
  {
    assert order <= 1 : "todo: make forthcomining automatic differentiation go from automaticly differentiating to already automatically differentiated";
    return c.evaluate(point, order, bits, res);
  }

}
