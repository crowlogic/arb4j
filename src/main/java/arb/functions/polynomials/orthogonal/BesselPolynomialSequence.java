package arb.functions.polynomials.orthogonal;

import java.util.Iterator;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.domains.Domain;
import arb.functions.real.RealFunction;
import arb.functions.sequences.RealSequence;

/**
 * <pre>
 * For the Bessel polynomials, as given by their recurrence relation:
 * 
 * (n + 1)yₙ₊₁(x) = (2n + 1)xyₙ(x) - nyₙ₋₁(x)
 * 
 * yₙ₊₁(x) = ((2n + 1)xyₙ(x) - nyₙ₋₁(x)) / (n + 1)
 * 
 * yₙ(x) = (2nxyₙ₋₁(x) - (n-1)yₙ₋₂(x)) / n
 * 
 * the coefficients Aₙ, Bₙ, and Cₙ from the general form of the recurrence
 * relation for orthogonal polynomials,
 * 
 * Pₙ₊₁(x) = (Aₙ x + Bₙ)Pₙ(x) - Cₙ Pₙ₋₁(x)
 * 
 * can be identified as
 * 
 * Aₙ = 2n + 1
 * 
 * Bₙ = 0
 * 
 * Cₙ = n(n + 1)
 * </pre>
 */
public class BesselPolynomialSequence implements
                                      RecurrentlyGeneratedOrthogonalPolynomialSequence
{
  @Override
  public RealSequence A()
  {
    return RealSequence.express("2n+1");
  }
  
  @Override
  public RealSequence B()
  {
    return RealSequence.express("0");
  }
  
  @Override
  public RealSequence C()
  {
    return RealSequence.express("n*(n+1)");
  }

  @Override
  public RealPolynomial evaluate(Integer t, int order, int bits, RealPolynomial res)
  {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public Domain<Real> getDomain()
  {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public RealFunction getOrthogonalMeasure()
  {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public Iterator<RealPolynomial> iterator()
  {
    // TODO Auto-generated method stub
    return null;
  }

}
