/**
 * Copyright ©2022 Stephen Crowley
 * 
 * This file is part of Arb4j which is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License
 * (LGPL) as published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version. See
 * <http://www.gnu.org/licenses/>.
 */
package arb.functions.complex.dynamics;

import arb.Complex;
import arb.exceptions.NotDifferentiableException;
import arb.functions.complex.ComplexFunction;

/**
 * <code>t-f(t)/f'(t)</code>
 *
 * @author Isaac Newton
 * @author Stephen Crowley
 */
public class NewtonMap<F extends ComplexFunction> implements
                      ComplexFunction
{
  @Override
  public ComplexFunction differential() throws NotDifferentiableException
  {
    throw new UnsupportedOperationException("TODO: return (f(t)*f''(t))/(f'(t)^2)");
  }

  public NewtonMap(F f)
  {
    this.f = f;
  }

  F f;

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    try ( Complex y = Complex.newVector(2))
    {
      if (order >= 1)
      {
        z.sub(f.evaluate(z, 2, prec, y).div(y.get(1), prec, w), prec, w);
      }
      if (order >= 2)
      {
        throw new UnsupportedOperationException("TODO: return t-f(t)/f'(t) (also implement first derivative)");
      }
    }
    return w;
  }

}
