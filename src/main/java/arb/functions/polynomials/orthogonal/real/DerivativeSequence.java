package arb.functions.polynomials.orthogonal.real;

import arb.Integer;
import arb.RealPolynomial;
import arb.functions.integer.RealPolynomialSequence;

// Static nested classes
public final class DerivativeSequence implements
                                      RealPolynomialSequence
{
  /**
   * 
   */
  private final RealPolynomialSequence polynomialSequence;

  /**
   * @param polynomialSequence
   */
  DerivativeSequence(RealPolynomialSequence polynomialSequence)
  {
    this.polynomialSequence = polynomialSequence;
  }

  @Override
  public Class<RealPolynomial> coDomainType()
  {
    return RealPolynomial.class;

  }

  @Override
  public RealPolynomial evaluate(Integer t, int order, int bits, RealPolynomial res)
  {
    return polynomialSequence.evaluate(t, order, bits, res).differentiate(bits, res);
  }
}