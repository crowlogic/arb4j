package arb.functions.polynomials.orthogonal.real;

import java.util.ArrayList;
import java.util.Iterator;

import arb.Real;
import arb.RealConstants;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class JacobiPolynomialExpansion implements
                                       RealOrthogonalPolynomialExpansion<JacobiPolynomials>
{

  public final JacobiPolynomials         basis;
  public final Real                      projections;
  public final ArrayList<RealPolynomial> basisElements;

  /**
   * Default to α=β=-½ which is the {@link Type1ChebyshevPolynomials}
   */

  /**
   * 
   * @param projections an array/vector of projection coeffecients to expand a
   *                    function over [-1,1] w/ respect to the weight functionb
   *                    (1-x)^α*(1-x)^β
   */
  public JacobiPolynomialExpansion(Real projections)
  {
    this(RealConstants.negHalf,
         RealConstants.negHalf,
         projections);
  }

  public JacobiPolynomialExpansion(Real α, Real β, Real projections)
  {
    basis              = new JacobiPolynomials(α,
                                               β);
    this.projections   = projections;
    this.basisElements = new ArrayList<>(projections.size());
    JacobiPolynomials        basis         = basis();
    Iterator<RealPolynomial> basisIterator = basis.iterator();
    for (int i = 0; i < projections.size(); i++)
    {
      basisElements.add(basisIterator.next());
    }
  }

  @Override
  public JacobiPolynomials basis()
  {
    return basis;
  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {

    var measure = basis.orthogonalityMeasure();

    res.zero();
    try ( Real blip = new Real(); Real bloop = new Real())
    {
      Iterator<RealPolynomial> basisIterator = basisElements.iterator();

      for (Real projection : projections)
      {
        RealPolynomial basisElement                  = basisIterator.next();
        Real           basisElementAtEvaluationPoint = basisElement.evaluate(t, bits, blip);
        res.add(basisElementAtEvaluationPoint.mul(projection, bits));
      }
      Real measureAtEvaluationPoint = measure.evaluate(t, order, bits, bloop);

      return res.mul(measureAtEvaluationPoint, bits);
    }

  }

  @Override
  public String toString()
  {
    return String.format("JacobiPolynomialExpansion[%s,%s]", basis.α, basis.β);
  }
}
