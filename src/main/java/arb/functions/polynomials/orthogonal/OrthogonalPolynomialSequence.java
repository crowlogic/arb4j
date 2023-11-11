package arb.functions.polynomials.orthogonal;

import arb.Field;
import arb.OrthogonalBasis;
import arb.domains.Domain;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealFunction;

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
