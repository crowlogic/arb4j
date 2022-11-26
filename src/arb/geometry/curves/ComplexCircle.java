package arb.geometry.curves;

import static java.lang.Math.max;

import arb.Complex;
import arb.MagnitudeConstants;
import arb.Real;
import arb.ThreadLocalComplex;
import arb.arb;
import arb.functions.complex.HolomorphicFunction;
import arb.functions.complex.SFunction;
import arb.functions.complex.dynamics.NewtonMap;
import arb.operators.CompositionOperator;

/**
 * A circle coordinate function representing a circle having a basepoint and
 * radius that goes well with the {@link NewtonMap} of the
 * {@link ComplexRealPart} of the {@link CompositionOperator} applied as the
 * composition of the {@link SFunction} with the {@link ComplexCircle} for
 * instance
 * 
 * <pre>
 *       /   Re(S(circle(0,0.01,θ)))    \
 *  θ -  | ---------------------------- |
 *       \ d/dθ(Re(S(circle(0,0.01,θ))) /
 * </pre>
 *
 *
 */
public class ComplexCircle implements
                           HolomorphicFunction,
                           AutoCloseable
{
  @Override
  public String toString()
  {
    return String.format("ComplexCircle[t=%s, h=%s]", t, h.toString(6));
  }

  /**
   * Construct a rotation of a circle as a complex-valued function of a real
   * argument representing the angle
   * 
   * @param t basepoint
   * @param h radius
   */
  public ComplexCircle(Complex t, Real h)
  {
    assert t != null;
    assert h != null;
    this.t = t;
    this.h = h;
  }

  public Complex     t;

  public Real        h;

  ThreadLocalComplex s = new ThreadLocalComplex(1);

  @Override
  public Complex evaluate(Complex a, int order, int prec, Complex res)
  {
    assert prec > 0;
    order = max(1, order);
    assert res.size() >= order;
    Complex s = this.s.get();
    a.muli(s);
    s.exp(prec, s);
    s.mul(h, prec, s);
    s.add(t, prec, res);
    for (int i = 1; i < order; i++)
    {
      arb.acb_mul_onei(res.get(i), res.get(i - 1));
    }
    return res;
  }

  @Override
  public void close() throws Exception
  {
    s.remove();
    t.clear();
    h.clear();
  }

  /**
   * {@link Double}-wrapper for this{@link #evaluate(Complex, int, int, Complex)}
   * 
   * @param angle
   * @param dist
   * @param result
   * @return
   */
  public Complex evaluate(Real angle, int order, int prec, Complex result)
  {
    try ( Complex Θ = new Complex())
    {
      Θ.getReal().set(angle);
      return evaluate(Θ, 1, prec, result);
    }
  }

  /**
   * {@link Double}-wrapper for this{@link #evaluate(Complex, int, int, Complex)}
   * 
   * @param angle   in radians
   * @param result
   * @return
   */
  public Complex evaluate(double angle, Complex result)
  {
    try ( Complex Θ = new Complex())
    {
      Θ.getReal().set(angle);
      evaluate(Θ, 1, 64, result);
      return result;
    }
  }

  /**
   * Perform an (infinitesimal) shift of length this{@link #h} in the specified
   * direction
   * 
   * @param direction specified in radians which is an arc of a circle which is
   *                  equal to the radius, or the angle measured by such an arc.
   * @param distance  how far in the specified direction to move
   * 
   * @return
   */
  public ComplexCircle shift(Real direction, int prec, Real distance)
  {
    direction.get(0).printPrecision = true;
    try ( Real degrees = new Real())
    {
      System.out.print(this + " in the direction " + Math.toDegrees(direction.get(0).doubleValue()) + "° having value ");
    }
    evaluate(direction, 1, prec, t);
    t.printPrecision = true;
    t.getReal().setRad(MagnitudeConstants.zeroMag);
    return this;
  }

}
