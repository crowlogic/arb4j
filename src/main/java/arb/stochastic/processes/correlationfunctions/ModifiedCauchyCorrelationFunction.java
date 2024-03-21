package arb.stochastic.processes.correlationfunctions;

import static arb.functions.real.RealFunction.express;

import arb.Real;
import arb.expressions.Context;
import arb.expressions.Variables;
import arb.functions.real.RealFunction;

/**
 * The set of functions which can be represented by this function is the
 * 'modified Cauchy class'
 * 
 * see <a href="https://arxiv.org/abs/physics/0109031">Stochastic models which
 * separate fractal dimension and Hurst effect</a>
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

  /**
   * α∈(0,2)
   */
  public final Real   α       = new Real().setName("α");

  /**
   * β≥0
   */
  public final Real   β       = new Real().setName("β");

  public Variables    vars    = new Variables(α,
                                              β);

  public Context      context = new Context(vars);

  public RealFunction c       = express("((1+|h|)ᵅ)^(-(β/α)-1)*(1+(1-β)*|h|^α)", context);

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    assert order <= 1 : "todo: make forthcomining automatic differentiation go from automaticly differentiating to already automatically differentiated";
    return c.evaluate(t, order, bits, res);
  }

}
