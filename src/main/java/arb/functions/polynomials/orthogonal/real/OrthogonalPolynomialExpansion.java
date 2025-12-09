package arb.functions.polynomials.orthogonal.real;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
import java.util.ArrayList;

import arb.Real;
import arb.RealPolynomial;
import arb.functions.polynomials.orthogonal.OrthogonalPolynomialSequence;

public class OrthogonalPolynomialExpansion<O extends OrthogonalPolynomialSequence<Real, Real, RealPolynomial>>
{

  public O                               basis;
  public final Real                      projections;
  public final ArrayList<RealPolynomial> basisElements;

  public OrthogonalPolynomialExpansion(Real projections, ArrayList<RealPolynomial> basisElements)
  {
    super();
    this.projections   = projections;
    this.basisElements = basisElements;
  }

}