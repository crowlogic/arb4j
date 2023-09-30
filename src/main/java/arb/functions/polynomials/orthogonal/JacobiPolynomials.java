package arb.functions.polynomials.orthogonal;

import java.util.Iterator;
import java.util.NoSuchElementException;

import arb.*;
import arb.domains.Domain;
import arb.functions.real.RealFunction;

public class JacobiPolynomials<P extends JacobiPolynomial> implements
                              OrthogonalBasis<Real, P>,
                              Iterable<P>
{

  private final int    n;
  private final double α;
  private final double β;

  public JacobiPolynomials(int n, double alpha, double beta)
  {
    this.n = n;
    this.α = alpha;
    this.β = beta;
  }

  private double compute(int n, double x)
  {
    if (n == 0)
      return 1.0;
    if (n == 1)
      return 0.5 * ((α + β + 2) * x + (α - β));

    double a  = 2 * (n) * (n + α + β) * (2 * n - 2 + α + β);
    double b  = (2 * n - 1 + α + β) * (α * α - β * β);
    double c  = (2 * n - 2 + α + β) * (2 * n - 1 + α + β) * (2 * n + α + β);
    double d  = 2 * (n - 1 + α) * (n - 1 + β) * (2 * n + α + β);

    double p0 = compute(n - 2, x);
    double p1 = compute(n - 1, x);

    return (1 / a) * ((b + c * x) * p1 - d * p0);
  }

  public double evaluateAt(double x)
  {
    return compute(n, x);
  }

  @Override
  public Iterator<P> iterator()
  {
    return new Iterator<P>()
    {
      private int currentIndex = 0;

      @Override
      public boolean hasNext()
      {
        return currentIndex <= n;
      }

      @SuppressWarnings(
      { "unchecked" })
      @Override
      public P next()
      {
        if (!hasNext())
          throw new NoSuchElementException();
        // Assuming RealPolynomial has a method or constructor to create a Jacobi
        // Polynomial
        return (P) new JacobiPolynomial(currentIndex++,
                                        α,
                                        β); // Replace with actual implementation
      }
    };
  }

  @Override
  public RealFunction getOrthogonalMeasure()
  {
    // TODO: Implement this method
    return null;
  }

  @Override
  public Domain<Real> getDomain()
  {
    // TODO: Implement this method
    return null;
  }

  public static void main(String[] args)
  {
    JacobiPolynomials<JacobiPolynomial> jacobiPolynomials = new JacobiPolynomials<>(5,
                                                                                    1.0,
                                                                                    2.0);
    double                              result            = jacobiPolynomials.evaluateAt(0.5);
    System.out.println("The value of Jacobi Polynomial is: " + result);
  }
}
