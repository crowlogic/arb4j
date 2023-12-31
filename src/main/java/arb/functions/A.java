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
  public Real                    c0 = new Real("1",
                                               128);
  public Real                    c1 = new Real("2",
                                               128);
  public Real                    G;
  public Integer                 x; // why is x being declared an integer?
  public RealPolynomial          l0 = new RealPolynomial();
  public RealPolynomial          l1 = new RealPolynomial();
  public RealPolynomial          l2 = new RealPolynomial();
  public RealPolynomial          l3 = new RealPolynomial();
  public RealPolynomial          l4 = new RealPolynomial();
  public RealFunction            C  = null;
  public Function<Integer, Real> F  = null;

  public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result)
  {
    
    // C is called with n/2 therefore its expressed as RealFunction, that is, a Function from ℝ to ℝ
    return ((RealPolynomial) this.F.evaluate((Integer) in,
                                             order,
                                             bits,
                                             (RealPolynomial) result)).mul((RealPolynomial) result, bits, this.l0)
                                                                      .add(this.G, bits, this.l1)
                                                                      .mul(((RealPolynomial) this.C.evaluate((Integer) in,
                                                                                                             order,
                                                                                                             bits,
                                                                                                             this.l2)).sub(this.c0,
                                                                                                                           bits,
                                                                                                                           this.l3),
                                                                           bits,
                                                                           this.l4)
                                                                      .div(this.c1, bits, (RealPolynomial) result);
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
  }
}