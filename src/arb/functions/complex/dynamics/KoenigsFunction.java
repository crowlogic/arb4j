package arb.functions.complex.dynamics;

import arb.Complex;
import arb.functions.complex.ComplexFunction;

/**
 * Let D be the unit disk in the complex numbers. Let f be a holomorphic
 * function mapping D into itself, fixing the point 0, with f not identically 0
 * or an automorphism of D, i.e. a Möbius transformation defined by a matrix in
 * SU(1,1). <br>
 * 
 * In the year 1884 Gabriel Koenigs proved that the limit of the normalized
 * iterates of f converges uniformly on compacta via the Denjoy-Wolf theorem
 * which states f leaves invariant each disk smaller than some radius |z | < r
 * and the iterates of f converge uniformly on compacta to 0. This infinitely
 * renormalized limit is the unique holomorphic function h defined on D, now
 * called the Koenigs function, such that h(0) = 0, h'(0) = 1 and Schröder's
 * equation is satisfied. <br>
 * 
 * When f is univalent then its Koenigs function h is also univalent. Therefore,
 * when f (and hence h) are univalent, D can be identified with the open domain
 * U = h(D). Under this conformal identification, the mapping f becomes
 * multiplication by λ, a dilation on U. <br>
 * 
 * TODO: show how this is related quark confinement, iterated velocity, the beta
 * function, the renormalization group flow, quantum field theories and
 * something to do with the coupling constant
 */
public class KoenigsFunction implements
                             ComplexFunction
{
  private ComplexFunction f;

  public KoenigsFunction(ComplexFunction f)
  {
    this.f = f;
  }

  /**
   * This function should evaluate the {@link IteratedFunction#} then set the
   * error ball to the error made by truncating the approximation at some finite
   * order
   * 
   */
  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    throw new UnsupportedOperationException("TODO: calculate limit of iterated and normalized function here");

  }

}
