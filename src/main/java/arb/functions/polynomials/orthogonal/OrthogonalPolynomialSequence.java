package arb.functions.polynomials.orthogonal;

import java.util.ArrayList;

import arb.Basis;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.OrthogonalSequence;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class OrthogonalPolynomialSequence<D, V, C> implements
                                                  OrthogonalPolynomialBasis<D, C>,
                                                  OrthogonalSequence<D, C>,
                                                  Basis<D, C>

{
  public C            basis;
  public D            projections;
  public ArrayList<V> basisElements;

}