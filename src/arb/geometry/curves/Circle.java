package arb.geometry.curves;

import static java.lang.Math.max;

import arb.Complex;
import arb.ComplexConstants;
import arb.Real;
import arb.RealConstants;
import arb.arb;
import arb.functions.complex.SFunction;
import arb.functions.complex.dynamics.NewtonMap;
import arb.geometry.Manifold;
import arb.operators.CompositionOperator;

/**
 * A circle coordinate function representing a circle having a basepoint and
 * radius that goes well with the {@link NewtonMap} of the
 * {@link ComplexRealPart} of the {@link CompositionOperator} applied as the
 * composition of the {@link SFunction} with the {@link ComplexCircle} for
 * instance
 * 
 * <code>
 *       /   Re(S(circle(t,h,θ)))    \
 *  θ -  | --------------------------|
 *       \ d/dθ(Re(S(circle(t,h,θ))) /
 * </code>
 *
 *
 */
public class Circle implements
                    PlaneCurve,
                    AutoCloseable,
                    Manifold
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
  public Circle(Complex t, Real h)
  {
    assert t != null;
    assert h != null;
    this.t.set(t);
    this.h.set(h);
  }

  public Circle()
  {
    this(ComplexConstants.ZERO,
         RealConstants.one);
  }

  Complex s = new Complex();
  Complex t = new Complex();
  Real    h = new Real();

  @Override
  public Complex evaluate(Real a, int order, int prec, Complex res)
  {
    assert prec > 0;
    order = max(1, order);
    assert res.size() >= order;

    try ( Complex ca = new Complex())
    {
      ca.getReal().set(a);
      arb.acb_mul_onei(s, ca);
      s.exp(prec, s);
      s.mul(h, prec, s);
      s.add(t, prec, res);
      for (int i = 1; i < order; i++)
      {
        arb.acb_mul_onei(res.get(i), res.get(i - 1));
      }
      return res;
    }
  }

  @Override
  public void close() throws Exception
  {
    s.close();
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
    return 1;
  }

}
