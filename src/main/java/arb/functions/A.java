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
  public Real                c0 = new Real("1",
                                           128);
  public Real                l0 = new Real();
  public Real                l1 = new Real();
  public Real                l2 = new Real();
  public RealFunction C  = null;

  public Real evaluate(Integer in, int order, int bits, Real result)
  {
    return ((Real) this.C.evaluate(in.sub(this.c0, bits, result),
                                   order,
                                   bits,
                                   this.l0)).mul((Real) this.l1.set(in).evaluate(in, order, bits, this.l2),
                                                 bits,
                                                 result);
  }

  public void close()
  {
    this.c0.close();
    this.l0.close();
    this.l1.close();
    this.l2.close();
  }
}