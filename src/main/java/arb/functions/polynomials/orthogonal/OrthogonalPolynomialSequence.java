package arb.functions.polynomials.orthogonal;

import arb.Field;
import arb.OrthogonalBasis;
import arb.Real;
import arb.domains.Domain;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealFunction;

/**
 * 
 * <pre>
 * arb4j is made available under the terms of the Business Source License™ v1.1
 * ©2023 which can be found in the root directory of this project in a file
 * named License.pdf, License.txt, or License.tm which are the pdf, text, and
 * TeXmacs formatted versions of the same document respectively.
 * </pre>
 * 
 * @author ©2023 Stephen Crowley
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
   * @return a {@link Real} whose midpoint and radius cover the domain over which these
   *         polynomials are orthogonal over with respect to the measure given by
   *         this{@link #getOrthogonalMeasure()}
   */
  public Domain<X> getDomain();
}
