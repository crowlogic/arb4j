package arb.functions.polynomials.orthogonal.complex;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Domain;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.polynomials.orthogonal.RecurrentlyGeneratedOrthogonalPolynomialSequence;

/**
 * Recurrently generated orthogonal polynomial sequence whose three-term
 * recurrence coefficients A(n), B(n), C(n) are themselves
 * {@link ComplexPolynomial} sequences (i.e. polynomials in an outer parameter
 * variable), and whose elements P_n are also {@link ComplexPolynomial} (in the
 * OPS variable). This is the tower ℂ[u][x] case: polynomial in x with
 * polynomial-in-u coefficients.
 *
 * <p>
 * Distinct from {@link ComplexRecurrentlyGeneratedOrthogonalPolynomialSequence},
 * which fixes the recurrence-coefficient ring to {@link Complex} scalars; here
 * it is {@link ComplexPolynomial}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class ComplexPolynomialCoefficientRecurrentlyGeneratedOrthogonalPolynomialSequence extends
                                                                                                   RecurrentlyGeneratedOrthogonalPolynomialSequence<ComplexPolynomial, Complex, ComplexPolynomial>
{

  @Override
  public Class<ComplexPolynomial> coDomainType()
  {
    return ComplexPolynomial.class;
  }

  public ComplexPolynomialCoefficientRecurrentlyGeneratedOrthogonalPolynomialSequence()
  {
    super(ComplexPolynomial.class);
  }

  public ComplexPolynomialCoefficientRecurrentlyGeneratedOrthogonalPolynomialSequence(Context sharedContext)
  {
    super(ComplexPolynomial.class,
          sharedContext);
  }

  /**
   * Not meaningful for moment functionals whose OPS zeros need not lie on the
   * real line or any classical curve; subclasses may override if they have a
   * natural orthogonality domain.
   */
  @Override
  public Domain<ComplexPolynomial> domainOfOrthogonality()
  {
    return null;
  }

}
