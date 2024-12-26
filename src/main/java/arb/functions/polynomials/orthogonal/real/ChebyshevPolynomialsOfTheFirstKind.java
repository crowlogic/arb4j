package arb.functions.polynomials.orthogonal.real;

import java.util.Iterator;
import java.util.List;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;
import arb.functions.integer.RealPolynomialSequence;
import arb.functions.polynomials.RealOrthogonalPolynomialSequenceIterator;
import arb.functions.polynomials.orthogonal.RecurrentlyGeneratedOrthogonalPolynomialSequence;
import arb.functions.real.RealFunction;

/**
 * 
 * The Chebyshev polynomials of the first kind are defined by 2*x*T(n-1)-T(n-2))
 * with initial conditions T(0)=1, T(1)=x. The {@link Type1ChebyshevPolynomials}
 * is an equivalent implementation based on the
 * {@link RecurrentlyGeneratedOrthogonalPolynomialSequence} interface
 * 
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ChebyshevPolynomialsOfTheFirstKind implements
                                                RealOrthogonalPolynomialSequence
{

  @Override
  public Class<RealPolynomial>
         coDomainType()
  {
    return RealPolynomial.class;
  }

  public ChebyshevPolynomialsOfTheFirstKind()
  {

  }

  public ChebyshevPolynomialsOfTheFirstKind(int bits)
  {
    this.bits = bits;
  }

  RealPolynomialSequence T = RealPolynomialSequence.express("T:n➔when(n=0,1,n=1,x,else,2*x*T(n-1)-T(n-2))");

  @Override
  public RealPolynomial
         evaluate(Integer n,
                  int order,
                  int bits,
                  RealPolynomial res)
  {
    return T.evaluate(n, order, bits, res);

  }

  int                  bits   = 128;

  public static Real   domain = new Real("0+/-1",
                                         128);

  private RealFunction orthogonalityMeasure;

  @Override
  public Domain<Real>
         domainOfOrthogonality()
  {
    return domain;
  }

  @Override
  public RealFunction
         orthogonalityMeasure()
  {
    if (orthogonalityMeasure == null)
    {
      orthogonalityMeasure = RealFunction.express("w", "x➔1/√((1-x)²)");
    }
    return orthogonalityMeasure;
  }

  @Override
  public Iterator<RealPolynomial>
         iterator()
  {
    return new RealOrthogonalPolynomialSequenceIterator(this);
  }

  @Override
  public List<RealPolynomial> enumerate(int i, int j)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }
}
