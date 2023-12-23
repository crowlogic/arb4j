package arb.stochastic.processes.correlationfunctions;

import static arb.functions.real.RealFunction.express;

import arb.Real;
import arb.expressions.RealContext;
import arb.expressions.Variables;
import arb.functions.real.RealFunction;
import arb.stochastic.processes.RealSymmetricCovarianceKernel;

/**
 * The set of functions which can be represented by this function is the 'Cauchy
 * class'
 * 
 * see <a href="https://arxiv.org/abs/physics/0109031">Stochastic models which
 * separate fractal dimension and Hurst effect</a>
 * 
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public class CauchyCorrelationFunction implements
                                       RealSymmetricCovarianceKernel,
                                       AutoCloseable
{
  public CauchyCorrelationFunction()
  {
    vars.register("α", α);
    vars.register("β", β);
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
  public final Real   α       = new Real().setName("α");

  /**
   * β≥0
   */
  public final Real   β       = new Real().setName("β");

  public Variables    vars    = new Variables();

  public RealContext  context = new RealContext(vars);

  public RealFunction c       = express("((1+|h|)^α)^(-(β/α))", context);

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    assert order <= 1 : "todo: make forthcomining automatic differentiation go from automaticly differentiating to already automatically differentiated";
    return c.evaluate(t, order, bits, res);
  }

}
