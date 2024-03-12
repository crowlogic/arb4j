package arb.functions.polynomials.orthogonal;

import static java.lang.System.out;

import java.util.Iterator;
import java.util.stream.IntStream;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;
import arb.functions.Function;
import arb.functions.real.RealFunction;

/**
 * 
 * The Chebyshev polynomials of the first kind are defined by 2*x*T(n-1)-T(n-2))
 * with initial conditions T(0)=1, T(1)=x
 * 
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Type1ChebyshevPolynomialSequence implements
                                              OrthogonalPolynomialSequence
{

  Function<Integer, RealPolynomial> T = Function.express(Integer.class,
                                                         RealPolynomial.class,
                                                         "T:n➔when(n=0,1,n=1,x,else,2*x*T(n-1)-T(n-2))");

  @Override
  public RealPolynomial evaluate(Integer n, int order, int bits, RealPolynomial res)
  {
    return T.evaluate(n, order, bits, res);

  }

  int bits = 128;

  public static void main(String args[])
  {

    try ( Type1ChebyshevPolynomialSequence T = new Type1ChebyshevPolynomialSequence(); Integer index = new Integer())
    {
      IntStream.range(0, 10).forEach(n ->
      {
        RealPolynomial poly = T.evaluate(index.set(n), 1, 128, new RealPolynomial());

        out.format("T(%d,x)=%s\n", n, poly);
      });

      // ShellFunctions.plot(-1, 1, 1000, polys.toArray(new
      // RealPolynomial[polys.size()]));
    }

  }

  public static Real   domain = new Real("0+/-1",
                                         128);

  private RealFunction orthogonalityMeasure;

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
      orthogonalityMeasure = RealFunction.express("w", "x➔1/√((1-x)²)");
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
          // FIXME: these will be leaked unless something like the Cleanable interface is
          // implemented if the caller doesnt close them as they are iterated over
          return T.evaluate(index, bits, new RealPolynomial());
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
