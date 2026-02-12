package arb.functions.polynomials.orthogonal.real;

import arb.Integer;
import arb.RealPolynomial;
import arb.functions.integer.RealPolynomialSequence;

public final class IntegralSequence implements
                                    RealPolynomialSequence
{

  /**
   * 
   */
  private final JacobiPolynomialSequence polynomialSequence;

  /**
   * @param jacobiPolynomialSequence
   */
  IntegralSequence(JacobiPolynomialSequence jacobiPolynomialSequence)
  {
    polynomialSequence = jacobiPolynomialSequence;
  }

  @Override
  public Class<RealPolynomial> coDomainType()
  {
    return RealPolynomial.class;

  }

  @Override
  public RealPolynomial evaluate(Integer t, int order, int bits, RealPolynomial res)
  {
    return polynomialSequence.evaluate(t, order, bits, res).integrate(bits, res);
  }
}