package arb.functions;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.functions.polynomials.orthogonal.JacobiPolynomialSequence;
import arb.functions.real.RealFunction;

/**
 * This is what the generated expression in {@link JacobiPolynomialSequence#A}
 */
public class A implements
                        Function<Integer, RealPolynomial>
{
  public Real                    c0 = new Real("1",
                                               128);
  public Real                    c1 = new Real("2",
                                               128);
  public Real                    G;
  public Integer                 x;                        // why is x being declared an integer?
  public Real                    l0 = new Real();
  public RealPolynomial          l1 = new RealPolynomial();
  public RealPolynomial          l2 = new RealPolynomial();
  public RealPolynomial          l3 = new RealPolynomial();
  public RealPolynomial          l4 = new RealPolynomial();
  public Real                    l5 = new Real();
  public Real                    l6 = new Real();

  public RealFunction            C  = null;
  public Function<Integer, Real> F  = null;

  public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result)
  {

    // C is called with n/2 therefore its expressed as RealFunction, that is, a
    // Function from ℝ to ℝ
    return this.F.evaluate(in, order, bits, l0)
                 .mul(l1.identity(), bits, l1)
                 .add(G, bits, l2)
                 .mul(C.evaluate(l5.set(in), order, bits, l6).sub(c0, bits, l3), bits, l4)
                 .div(c1, bits, result);
  }

  public void close()
  {
    this.c0.close();
    this.c1.close();
    this.l0.close();
    this.l1.close();
    this.l2.close();
    this.l3.close();
    this.l4.close();
    this.l5.clone();
    this.l6.close();
  }
}