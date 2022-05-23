package arblib.functions;

import static arblib.arblib.*;
import static java.lang.Math.log;

import arblib.Complex;
import arblib.ComplexPolynomial;
import arblib.Constants;
import arblib.arblib;

/**
 * TODO: implement and move to other classes
 * 
 */
public final class Functions
{
  public static final int     MIN_PREC = 60;

  public static final Complex ONE      = Constants.COMPLEX_ONE;

  static
  {
    System.loadLibrary("arblib");
  }
  public static int prec = 256;

  /**
   * lemniscate sine: z=int(1/(1-t^4),t=0..sl(z))
   * 
   * sl(x) = q(1,x)/q(3,x) <br>
   * where <br>
   * q(k,x) = theta[k](G*x;exp(-x))<br>
   * and <br>
   * G = M(1,sqrt(2) = Gauss's constant <br>
   * where M(a,b) is the arithmetic-geometric-mean of 1 and the square root of 2
   * 
   * 
   * @param t
   * @param prec
   * @param res
   */
  public static void sl(Complex t, int prec, int order, ComplexPolynomial z)
  {
    // TODO: move theta1 and theta3 to ThreadLocal variables
    ComplexPolynomial theta1 = new ComplexPolynomial(), theta3 = new ComplexPolynomial();
    acb_poly_init(theta1);
    acb_poly_init(theta3);

    Complex tau = null;
    Jacobiθ(theta1, null, theta3, null, z, tau, order, prec);

    // lemniscate
    // M(1,sqrt(2))
    // return theta(1, *x;exp(-Pi)_
  }

  /**
   * Modular Theta Series
   * 
   * public static void acb_modular_theta_series(ComplexPolynomial theta1,
   * ComplexPolynomial theta2, ComplexPolynomial theta3, ComplexPolynomial theta4,
   * ComplexPolynomial z, Complex tau, int len, int prec) {
   * 
   */
  public static void Jacobiθ(ComplexPolynomial theta1,
                             ComplexPolynomial theta2,
                             ComplexPolynomial theta3,
                             ComplexPolynomial theta4,
                             ComplexPolynomial z,
                             Complex tau,
                             int len,
                             int prec)
  {
    arblib.acb_modular_theta_series(theta1, theta2, theta3, theta4, z, tau, len, prec);
  }

  public static boolean trace = false;

  public static int precisionForDigits(int digits)
  {
    return (int) (digits * (((log(2) + log(5)) / log(2)))) + 10;
  }

  /**
   * A version of {@link Complex#overlaps(Complex)} used by the integration code
   * which is less accurate by design
   * 
   * @param tmp
   * @param a
   * @param b
   * @param prec
   * @return
   */
  public static boolean overlaps(Complex tmp, Complex a, Complex b, int prec)
  {
    acb_sub(tmp, a, b, prec);
    return acb_contains_zero(tmp) != 0;
  }

}
