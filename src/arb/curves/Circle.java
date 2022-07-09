package arb.curves;

import static java.lang.Math.max;

import arb.*;
import arb.functions.complex.ComplexRealPart;
import arb.functions.complex.SFunction;
import arb.functions.complex.dynamics.NewtonMap;
import arb.operators.CompositionOperator;

/**
 * A circle coordinate function representing a circle having a basepoint and
 * radius that goes well with the {@link NewtonMap} of the
 * {@link ComplexRealPart} of the {@link CompositionOperator} applied as
 * the composition of the {@link SFunction} with the {@link ComplexCircle} for
 * instance
 * 
 * <code>
 *       /   Re(S(circle(0,0.01,θ)))    \
 *  θ -  | ---------------------------- |
 *       \ d/dθ(Re(S(circle(0,0.01,θ))) /
 * </code>
 *
 *
 */
public class Circle implements
                    PlaneCurve,
                    AutoCloseable
{
  /**
   * Construct a rotation of a circle as a complex-valued function of a real
   * argument representing the angle
   * 
   * @param t basepoint
   * @param h radius
   */
  public Circle(Complex t, Real h)
  {
    assert t != null;
    assert h != null;
    this.t = t;
    this.h = h;
  }

  public Circle()
  {
    this(Constants.ZERO,
         Constants.one);
  }

  Complex            t;

  Real               h;

  ThreadLocalComplex s = new ThreadLocalComplex(1);

  @Override
  public Complex evaluate(Real a, int order, int prec, Complex res)
  {
    assert prec > 0;
    order = max(1, order);
    assert res.size() >= order;
    Complex s = this.s.get();
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
    s.remove();
    t.clear();
    h.clear();
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
      return evaluate(Θ, 1, 64, complex);
    }
  }

}
