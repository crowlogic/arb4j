package arb.functions.polynomials.orthogonal.real;

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

  public final JacobiPolynomials basis;
  public final Real              projections;

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
    basis            = new JacobiPolynomials(α,
                                             β);
    this.projections = projections;
  }

  @Override
  public JacobiPolynomials basis()
  {
    return basis;
  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    JacobiPolynomials basis         = basis();
    var               basisIterator = basis.iterator();
    var               measure       = basis.orthogonalityMeasure();

    res.zero();
    try ( Real blip = new Real(); Real bloop = new Real())
    {
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
}
