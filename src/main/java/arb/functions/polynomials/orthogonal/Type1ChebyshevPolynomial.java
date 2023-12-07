package arb.functions.polynomials.orthogonal;

import static arb.expressions.Expression.express;

import arb.Real;
import arb.functions.real.RealFunction;

/**
 * multiply the n-th Jacobi polynomial with (α,β)=(-1/2,-1/2) by √(π)*Γ(n +
 * 1)/Γ(n + ½) to produce the Type-1 Chebyshev polynomials
 * 
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 * 
 * @param <J>
 * @see Type1ChebyshevPolynomialSequence
 */
public class Type1ChebyshevPolynomial extends
                                      UltrasphericalPolynomial<Type1ChebyshevPolynomial>
{

  @Override
  public void close()
  {
    super.close();
    norm.close();
  }

  public final RealFunction scaling = express("√(π)*Γ(n + 1)/Γ(n + ½)");

  public final Real         norm    = new Real();

  public int                bits    = 256;

  @Override
  public Real evaluate(Real z, int order, int prec, Real w)
  {
    return super.evaluate(z, order, prec, w).mul(norm, prec);
  }

  public Type1ChebyshevPolynomial(JacobiPolynomialSequence<Type1ChebyshevPolynomial> sequence, int n)
  {
    super(sequence,
          n);
    scaling.evaluate(norm, bits, norm);
  }

}
