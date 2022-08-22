package arb.functions.complex.numbertheoretic;

import arb.*;
import arb.functions.complex.HolomorphicFunction;

/**
 * The Riemann zeta function plays a pivotal role in analytic number theory, and
 * has applications in physics, probability theory, and applied statistics.
 * 
 * Leonhard Euler first introduced and studied the function over the
 * {@link Real}s in the first half of the eighteenth century. Bernhard Riemann's
 * 1859 article "On the Number of Primes Less Than a Given Magnitude" extended
 * the Euler definition to a {@link Complex} variable, proved its meromorphic
 * continuation and functional equation, and established a relation between its
 * zeros and the distribution of prime numbers. This paper also contained the
 * Riemann hypothesis, a conjecture about the distribution of complex zeros of
 * the Riemann zeta function that is considered by many mathematicians to be the
 * most important unsolved problem in pure mathematics.
 * 
 * @author crow
 *
 */
public class RiemannζFunction implements
                              HolomorphicFunction
{

  @Override
  public String toString()
  {
    return "ζ";
  }

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    assert order <= w.size();
    assert prec > 0;
    try ( Complex r = Complex.newVector(order))
    {
      arb.acb_dirichlet_zeta_jet(r, z, 0, order, prec);
      w.set(r);
    }
    return w;
  }

}
