package arb.stochastic.processes.correlationfunctions;

import static arb.expressions.Expression.express;

import arb.Real;
import arb.expressions.Variables;
import arb.functions.real.RealFunction;
import arb.stochastic.processes.RealSymmetricCovarianceKernel;

/**
 * The set of functions which can be represented by this function is the
 * 'modified Cauchy class'
 * 
 * see <a href="https://arxiv.org/abs/physics/0109031">Stochastic models which
 * separate fractal dimension and Hurst effect</a>
 */
public class ModifiedCauchyCorrelationFunction implements
                                               RealSymmetricCovarianceKernel,
                                               AutoCloseable
{
  @Override
  public void close()
  {
    α.close();
    β.close();
  }

  public static Variables<Real> vars = new Variables<Real>();

  public static RealFunction    c    = express("((1+|h|)^a)^(-(β/α)-1)*(1+(1-β)*|h|^α)", vars);

  /**
   * α∈(0,2)
   */
  public final Real             α    = new Real();

  /**
   * β≥0
   */
  public final Real             β    = new Real();

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    assert order <= 1 : "todo: make forthcomining automatic differentiation go from automaticly differentiating to already automatically differentiated";
    return c.evaluate(t, order, bits, res);
  }

}
