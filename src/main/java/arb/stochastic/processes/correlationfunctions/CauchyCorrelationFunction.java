package arb.stochastic.processes.correlationfunctions;

import arb.Real;
import arb.expressions.*;
import arb.expressions.Compiler;
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
  @Override
  public void close()
  {
    α.close();
    β.close();
  }

  public Variables<Real> vars = new Variables<Real>();

  public RealContext context = new RealContext(vars);
  
  public RealFunction    c    = Compiler.express("((1+|h|)^α)^(-(β/α))", context);

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
