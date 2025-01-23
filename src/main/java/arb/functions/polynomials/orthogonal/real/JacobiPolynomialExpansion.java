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
public class JacobiPolynomialExpansion extends
                                       RealOrthogonalPolynomialExpansion<JacobiPolynomials>
{

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
    super(new JacobiPolynomials(α,
                                β),
          projections);

  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real result)
  {

    var measure = basis.orthogonalityMeasure();

    result.zero();
    try ( Real blip = new Real();)
    {
      Iterator<RealPolynomial> basisIterator = basisElements.iterator();

      for (Real projection : projections)
      {
        RealPolynomial basisElement                  = basisIterator.next();
        Real           basisElementAtEvaluationPoint = basisElement.evaluate(t, bits, blip);
        result.add(basisElementAtEvaluationPoint.mul(projection, bits));
      }
      Real measureAtEvaluationPoint = measure.evaluate(t, order, bits, blip);
      return result.mul(measureAtEvaluationPoint, bits);
    }

  }

  @Override
  public String toString()
  {
    return String.format("JacobiPolynomialExpansion[%s,%s]", basis.α, basis.β);
  }
}
