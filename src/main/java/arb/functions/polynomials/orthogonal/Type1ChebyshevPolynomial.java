package arb.functions.polynomials.orthogonal;

/**
 * @see Type1ChebyshevPolynomialSequence
 */
public class Type1ChebyshevPolynomial extends
                                      JacobiPolynomial<Type1ChebyshevPolynomial>
{

  public Type1ChebyshevPolynomial(JacobiPolynomialSequence<Type1ChebyshevPolynomial> sequence, int n)
  {
    super(sequence,
          n);
  }

}
