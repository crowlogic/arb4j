package arb.functions.complex;

import static arb.Constants.*;

import arb.Complex;
import arb.Real;

/**
 * The conjugate of this function is {@link YFunction}
 * 
 * @author crow
 */
public class XFunction extends
                       ComplexComposition<SFunction, ZFunction>
{

  public XFunction()
  {
    super(new SFunction(),
          new ZFunction());
  }

  public XFunction(Real scale)
  {
    super(new SFunction(scale),
          new ZFunction());
  }

  /**
   * Radial hyperbolic tangent of the Real part of X
   * 
   * @param t     a point on the curve where Re(X(t))=0
   * @param s     OUTPUT s=t+h*e^(i*π*a)
   * @param scale
   * @param h     magnitude
   * @param a     angle ranging from [-1,1] indicating direction
   * @param res   OUTPUT angle ranging from [-1,1] indicating a direction which
   *              should be pointing in a direction of less than or equal real
   *              part as the compared to the value at the input angle a
   * @param prec
   * @return res=frac(a+tanh(Re(Y(t+h*e^(i*Pi*a)))/Im(Y'(t+h*e^(i*Pi*a))*h*Pi*e^(i*Pi*a))))
   */
  public Real realXang(Complex t, Complex s, Real scale, Real h, Real res, int prec)
  {
    assert t.isFinite();
    try ( Complex dt = new Complex(); Complex y = Complex.newVector(2); Complex p = new Complex();
          Complex Z = Complex.newVector(2))
    {
      s = t.add(h.mul(iπ.mul(scale, prec, dt).exp(prec, dt), dt), prec, s);
      assert s.isFinite() : String.format("s=%s t=%s h=%s a=%s dt=%s\n", s, t, h, scale, dt);
//      .dt.(s, Z, scale, 2, y);
      y.get(1).mul(dt, prec, p).getImag().mul(π, p.getImag());
      y.getReal().div(p.getImag(), prec, res).tanh(res, prec).add(scale, prec, res).frac(prec, res);
      assert res.isFinite() : "result is not finite";
      return res;
    }
  }

}
