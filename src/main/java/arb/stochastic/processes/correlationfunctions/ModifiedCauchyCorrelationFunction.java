package arb.stochastic.processes.correlationfunctions;

import static arb.expressions.Expression.express;

import arb.Real;
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

  public RealFunction c = express("((1+|h|)^a)^(-(β/α)-1)*(1+(1-β)*|h|^α)", vars);

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    assert order <= 1 : "todo: make forthcomining automatic differentiation go from automaticly differentiating to already automatically differentiated";
    return c.evaluate(t, order, bits, res);
  }

}
