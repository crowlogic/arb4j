/**
 * Copyright ©2022 Stephen Crowley
 * 
 * This file is part of Arb4j which is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License
 * (LGPL) as published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version. See
 * <http://www.gnu.org/licenses/>.
 */
package arb.functions;

import arb.Complex;
import arb.ComplexFunction;
import arb.ThreadLocalComplex;

/**
 * The composition of two complex-valued functions <code>f(g(t))</code> which
 * handles the chain-rule
 *
 */
public class ComplexComposition implements
                                ComplexFunction,
                                AutoCloseable
{

  public ComplexComposition(ComplexFunction f, ComplexFunction g)
  {
    this.f = f;
    this.g = g;

  }

  ComplexFunction    f, g;
  ThreadLocalComplex y = new ThreadLocalComplex(2);

  @Override
  public Complex evaluate(Complex t, int order, int prec, Complex res)
  {
    if (order > 2)
    {
      throw new UnsupportedOperationException("derivatives beyond the first not implemented and in many cases not necessary but if someone thought of a way to implement thia via automatic-differentiation that would be superbly stupendous because it is tedious to implement them all by hand depending upon what ones needs are");
    }
    Complex y = this.y.get();

    // y=g(t) or if order==2 y=[g(t), g'(t)]
    g.evaluate(t, order, prec, y);
    // res=y=f(g(t)) if order==1 or y=[f(g(t)),f'(g(t))] if order==2
    f.evaluate(y, order, prec, res);

    if (order == 2)
    {
      // apply the chain rule res[1]=f'(g(t))*g'(t)=res[1]*y[1]
      Complex df = res.get(1);
      df.mul(y.get(1), df);
    }
    return res;
  }

  @Override
  public void close()
  {
    y.get().delete();
    y.remove();
  }

}
