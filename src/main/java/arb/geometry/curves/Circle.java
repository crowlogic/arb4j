package arb.geometry.curves;

import static java.lang.Math.max;

import arb.Complex;
import arb.ComplexConstants;
import arb.Real;
import arb.RealConstants;
import arb.arblib;
import arb.geometry.Manifold;

/**
 * A circle coordinate function representing a circle having a center and radius
 *
 */
public class Circle implements
                    PlaneCurve,
                    AutoCloseable,
                    Manifold<Real>
{
  /**
   * Construct a rotation of a circle as a complex-valued function of a real
   * argument representing the angle
   * 
   * The arguments to this function are copied into class-local variables which
   * are freed via the this{@link #close()} method
   * 
   * @param t basepoint
   * @param h radius
   */
  public Circle(Complex t,
                Real h)
  {
    assert t != null;
    assert h != null;
    this.t.set(t);
    this.h.set(h);
  }

  public Circle()
  {
    this(
         ComplexConstants.ZERO,
         RealConstants.one);
  }

  
  Complex t = new Complex();
  Real    h = new Real();

  @Override
  public Complex evaluate(Real a, int order, int prec, Complex res)
  {
    assert prec > 0;
    order = max(1, order);
    assert res.size() >= order;

    try ( Complex s = new Complex(); Complex ca = new Complex())
    {
      ca.getReal().set(a);
      arblib.acb_mul_onei(s, ca);
      s.exp(prec, s);
      s.mul(h, prec, s);
      s.add(t, prec, res);
      for (int i = 1; i < order; i++)
      {
        arblib.acb_mul_onei(res.get(i), res.get(i - 1));
      }
      return res;
    }
  }

  @Override
  public void close() 
  {
    t.close();
    h.close();
  }

  /**
   * double-wrapper for this{@link #evaluate(Real, int, int, Complex)}
   * 
   * @param angle
   * @param complex
   * @return
   */
  public Complex evaluate(double angle, Complex complex)
  {
    try ( Real Θ = new Real())
    {
      Θ.set(angle);
      return evaluate(Θ, 1, Double.SIZE, complex);
    }
  }

  @Override
  public int dim()
  {
    return 2;
  }



}
