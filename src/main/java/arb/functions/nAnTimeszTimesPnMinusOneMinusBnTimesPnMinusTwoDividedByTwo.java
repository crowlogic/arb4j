package arb.functions;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;

/***
 * gr8: [ERROR] JacobiPolynomialTest.testP:150 » NullPointer Cannot invoke
 * "arb.functions.Function.evaluate(Object, int, int, Object)" because "this.P"
 * is null
 * 
 */
public class nAnTimeszTimesPnMinusOneMinusBnTimesPnMinusTwoDividedByTwo implements Function<Integer,RealPolynomial>
{
  public RealPolynomial                    l0  = new RealPolynomial();
  public Integer                           l1  = new Integer();
  public RealPolynomial                    l2  = new RealPolynomial();
  public RealPolynomial                    l3  = new RealPolynomial();
  public Real                              l4  = new Real();
  public Real                              l5  = new Real();
  public Integer                           l6  = new Integer();
  public RealPolynomial                    l7  = new RealPolynomial();
  public RealPolynomial                    l8  = new RealPolynomial();
  public RealPolynomial                    l9  = new RealPolynomial();
  public Real                              l10 = new Real();
  public Real                              l11 = new Real();
  public Function<Integer, RealPolynomial> P   = null;
  public Function<Integer, RealPolynomial> A   = null;
  public Function<Real, Real>              B   = null;
  public Function<Real, Real>              E   = null;

  public static void main( String args[] )
  {
    nAnTimeszTimesPnMinusOneMinusBnTimesPnMinusTwoDividedByTwo a = new nAnTimeszTimesPnMinusOneMinusBnTimesPnMinusTwoDividedByTwo();
    a.P = a;
    RealPolynomial p2 = a.evaluate(new Integer(2),128,new RealPolynomial());
    System.out.println( "p2=" + p2 );
  }
  
  public RealPolynomial evaluate(Integer in, int order, int bits, RealPolynomial result)
  {
    return A.evaluate(in, order, bits, l0)
            .mul(P.evaluate(in.sub(1, bits, l1), order, bits, l2), bits, l3)
            .sub(B.evaluate(l4.set(in), order, bits, l5)
                  .mul(P.evaluate(in.sub(2, bits, l6), order, bits, l7), bits, l8),
                 bits,
                 l9)
            .div(E.evaluate(l10.set(in), order, bits, l11), bits, result);
  }

  public void close()
  {
    l0.close();
    l1.close();
    l2.close();
    l3.close();
    l4.close();
    l5.close();
    l6.close();
    l7.close();
    l8.close();
    l9.close();
    l10.close();
    l11.close();
  }
}
