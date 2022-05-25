package arb;

public interface OrthogonalPolynomials extends
                                       Iterable<ComplexPolynomial>,
                                       OrthogonalBasis
{
  /**
   * The weighting function that the orthogonal with respect to
   * 
   * @return
   */
  public ComplexFunction getMassDistribution();

  /**
   * 
   * @return a Real whose midpoint and radius cover the domain over which these
   *         polynomials are orthogonal over with respect to the measure given by
   *         this{@link #getMassDistribution()}
   */
  public Real getDomain();
}
