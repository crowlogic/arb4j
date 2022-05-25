/**
 * Copyright ©2022 Stephen Crowley
 * 
 * This file is part of Arb4j which is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License
 * (LGPL) as published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version. See
 * <http://www.gnu.org/licenses/>.
 */
package arb.functions.complex;

import arb.Complex;
import arb.ComplexFunction;

/**
 * <code>t-f(t)/f'(t)</code>
 *
 * @author Isaac Newton
 * @author Stephen Crowley
 */
public class NewtonMap implements
                       ComplexFunction
{
  public NewtonMap(ComplexFunction f)
  {
    this.f = f;
  }

  ComplexFunction f;

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
