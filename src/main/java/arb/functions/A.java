package arb.functions;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.polynomials.orthogonal.JacobiPolynomialSequence;
import arb.functions.real.RealFunction;

/**
 * This is what the generated expression in {@link JacobiPolynomialSequence#A}
 */
public abstract class A implements
                        Function<Integer, RealPolynomial>
{
  public Integer c0 = new Integer("2");
  public Real y;

  public Real evaluate(Real in, int order, int bits, Real result) {
     return this.y.pow(this.c0, bits, (Real)result);
  }

  public void close() {
     this.c0.close();
  } 
}