package arb.functions.polynomials.orthogonal;

import static java.lang.System.out;

import java.util.Iterator;
import java.util.stream.IntStream;

import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;
import arb.functions.real.RealFunction;

/**
 * The Chebyshev polynomials of the first kind are an instance of the Jacobi
 * Polynomial Pₙ with α=β=−½ such that <br>
 * <br>
 * 
 * Tₙ(x) = Pₙ(−½,−½,x) * π​*Γ(n+1)/Γ(n+½)
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Type1ChebyshevPolynomialSequence extends
                                              JacobiPolynomialSequence
{
  int bits = 128;

  public static void main(String args[])
  {
    Type1ChebyshevPolynomialSequence T = new Type1ChebyshevPolynomialSequence();

    try ( Integer index = new Integer())
    {
      IntStream.range(0, 10)
               .forEach(n -> out.format("T(%d,x)=%s\n", n, T.evaluate(index.set(n), 1, 128, new RealPolynomial())));

      // ShellFunctions.plot(-1, 1, 1000, polys.toArray(new
      // RealPolynomial[polys.size()]));
    }

  }

  public static Real   domain = new Real("0+/-1",
                                         128);

  private RealFunction orthogonalityMeasure;

  public Type1ChebyshevPolynomialSequence()
  {
    super(RealConstants.negHalf,RealConstants.negHalf);
  }

  @Override
  public Domain<Real> getDomain()
  {
    return domain;
  }

  @Override
  public RealFunction getOrthogonalMeasure()
  {
    if (orthogonalityMeasure == null)
    {
      orthogonalityMeasure = RealFunction.express("w", "x➔1/√((1-x)²)", context);
    }
    return orthogonalityMeasure;
  }

  @Override
  public Iterator<RealPolynomial> iterator()
  {
    return new Iterator<RealPolynomial>()
    {
      int n = 0;

      @Override
      public RealPolynomial next()
      {
        try ( Integer index = new Integer(n++))
        {
          return P.evaluate(index, bits, new RealPolynomial());
        }
      }

      @Override
      public boolean hasNext()
      {
        return true;
      }
    };
  }
}
