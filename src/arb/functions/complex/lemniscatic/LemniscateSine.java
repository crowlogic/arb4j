package arb.functions.complex.lemniscatic;

import arb.Complex;
import arb.functions.complex.HolomorphicFunction;

/**
 * Lemniscate Sine: sl(z)=∫(1/(1-t^4),t=0..z) <br>
 * 
 * sl(x) = q(1,x)/q(3,x) <br>
 * where <br>
 * q(k,x) = theta[k](G*x;exp(-x))<br>
 * and <br>
 * G = M(1,√2) = Gauss's constant <br>
 * where M(a,b) is the arithmetic-geometric-mean of 1 and the √2
 * 
 * @param t
 * @param prec
 * @param res
 */
public class LemniscateSine implements
                            HolomorphicFunction
{

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    throw new UnsupportedOperationException("TODO: implement ");
//    // TODO: move theta1 and theta3 to ThreadLocal variables
//    ComplexPolynomial theta1 = new ComplexPolynomial(), theta3 = new ComplexPolynomial();
//    acb_poly_init(theta1);
//    acb_poly_init(theta3);
//
//    Complex tau = null;
//   // Jacobiθ(theta1, null, theta3, null, z, tau, order, prec);
//
//    // lemniscate
//    // M(1,sqrt(2))
//    // return theta(1, *x;exp(-Pi)_
//    return null;
  }

}
