package arb.stochastic.processes.correlationfunctions;

import static arb.expressions.Expression.express;

import arb.Real;
import arb.expressions.Variables;
import arb.functions.real.RealFunction;
import arb.stochastic.processes.RealSymmetricCovarianceKernel;

/**
 * The set of functions which can be represented by this function is the 'Cauchy
 * class'
 * 
 * see <a href="https://arxiv.org/abs/physics/0109031">Stochastic models which
 * separate fractal dimension and Hurst effect</a>
 */
public class CauchyCorrelationFunction implements
                                       RealSymmetricCovarianceKernel,
                                       AutoCloseable
{
  @Override
  public void close()
  {
    α.close();
    β.close();
  }

  public Variables<Real> vars = new Variables<Real>();

  public RealFunction    c    = express("((1+|h|)^a)^(-(β/α))", vars);

  /**
   * α∈(0,2)
   */
  public final Real             α    = new Real();

  /**
   * β≥0
   */
  public final Real             β    = new Real();


  {
    vars.put("α",α);
    vars.put("β",β);

  }
  
  
  
  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    assert order <= 1 : "todo: make forthcomining automatic differentiation go from automaticly differentiating to already automatically differentiated";
    return c.evaluate(t, order, bits, res);
  }

}
