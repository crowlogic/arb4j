package arb.functions.polynomials.orthogonal;

import arb.Field;
import arb.OrthogonalBasis;
import arb.domains.Domain;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealFunction;

/**
 * 
 * <pre>
 * Copyright ©2023 Stephen Crowley
 *  
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at https://mozilla.org/MPL/2.0/.
 * </pre>
 */
public interface OrthogonalPolynomialSequence<X extends Field<X>, R extends Function<X, X>, O extends OrthogonalBasis<X, R>>
                                             extends
                                             Iterable<RealFunction>

{
  /**
   * The weighting function that this set of polynomials is orthogonal to
   * 
   * @return
   */
  public ComplexFunction getOrthogonalMeasure();

  /**
   * 
   * @return a Real whose midpoint and radius cover the domain over which these
   *         polynomials are orthogonal over with respect to the measure given by
   *         this{@link #getOrthogonalMeasure()}
   */
  public Domain<X> getDomain();
}
