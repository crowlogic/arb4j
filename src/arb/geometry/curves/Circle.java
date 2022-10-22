package arb.geometry.curves;

import static java.lang.Math.max;

import arb.Complex;
import arb.ComplexConstants;
import arb.Real;
import arb.RealConstants;
import arb.ThreadLocalComplex;
import arb.ThreadLocalReal;
import arb.arb;
import arb.functions.complex.SFunction;
import arb.functions.complex.dynamics.NewtonMap;
import arb.geometry.Manifold;
import arb.operators.Composition;

/**
 * A circle coordinate function representing a circle having a basepoint and
 * radius that goes well with the {@link NewtonMap} of the
 * {@link ComplexRealPart} of the {@link Composition} applied as the composition
 * of the {@link SFunction} with the {@link ComplexCircle} for instance
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
                    AutoCloseable,Manifold
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
    this.t.get().set(t);
    this.h.get().set(h);
  }

  public Circle()
  {
    this(ComplexConstants.ZERO,
         RealConstants.one);
  }

  ThreadLocalComplex s = new ThreadLocalComplex(1);
  ThreadLocalComplex t = new ThreadLocalComplex(1);
  ThreadLocalReal    h = new ThreadLocalReal();

  @Override
  public Complex evaluate(Real a, int order, int prec, Complex res)
  {
    assert prec > 0;
    order = max(1, order);
    assert res.size() >= order;
    Complex s = this.s.get();
    Complex t = this.t.get();
    Real    h = this.h.get();
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
    t.remove();
    h.remove();
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

  @Override
  public int dim()
  {
    return 1;
  }

}
