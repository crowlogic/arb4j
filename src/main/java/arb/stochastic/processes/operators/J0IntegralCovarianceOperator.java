package arb.stochastic.processes.operators;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.orthogonal.Type1ChebyshevPolynomialSequence;
import arb.functions.real.BesselFunctionOfTheFirstKind;
import arb.functions.sequences.RealSequence;
import arb.operators.IntegralCovarianceOperator;
import arb.space.topological.VectorSpace;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class J0IntegralCovarianceOperator implements
                                          IntegralCovarianceOperator<Real,
                                                        BesselFunctionOfTheFirstKind>
{

  @Override
  public VectorSpace<? extends Real>
         apply(VectorSpace<? extends Real> x, int bits, VectorSpace<? extends Real> result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  /**
   * projection of the orthonormalized Fourier transform of the k-th element of the
   * {@link Type1ChebyshevPolynomialSequence} onto the Bessel function of the
   * first kind of order 0. Why? Because the Fourier transform of J0 is 1/√(1-x^2)
   * which is the measure to which the {@link Type1ChebyshevPolynomialSequence} is
   * orthogonal with respect to
   */
  RealSequence ξ = RealSequence.express("ξ","(√(2⋅k+3)⋅Γ(k+½)²)/(2⋅√(π)⋅Γ(k+1)²)");

  @Override
  public BesselFunctionOfTheFirstKind kernel()
  {
    assert false : "TODO";
    return null;
  }

}
