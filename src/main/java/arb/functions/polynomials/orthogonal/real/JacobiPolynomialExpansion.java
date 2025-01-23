package arb.functions.polynomials.orthogonal.real;

import arb.Real;
import arb.RealConstants;
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
    var basisIterator = basis().iterator();

    try ( Real blip = new Real())
    {
      for (Real projection : projections)
      {
        res.add(basisIterator.next().evaluate(t, bits, blip).mul(projection, bits), bits);
      }
      return res;
    }

  }
}
