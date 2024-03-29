package arb.geometry.curves;

import static java.lang.Math.max;

import arb.Complex;
import arb.Real;
import arb.arblib;
import arb.functions.complex.ComplexFunction;
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
                           ComplexFunction,
                           AutoCloseable
{
  @Override
  public String toString()
  {
    return String.format("ComplexCircle[t=%s, h=%s]", center, h.toString(6));
  }

  /**
   * Construct a rotation of a circle as a complex-valued function of a real
   * argument representing the angle
   * 
   * @param t basepoint
   * @param h radius
   */
  public ComplexCircle(Complex t,
                       Real h)
  {
    assert t != null;
    assert h != null;
    this.center = new Complex(t);
    this.h      = h;
  }

  public Complex center;

  public Real    h;

  Complex        s = new Complex();

  @Override
  public Complex evaluate(Complex a, int order, int prec, Complex res)
  {
    assert prec > 0;
    order = max(1, order);
    assert res.size() >= order;
    a.muli(s);
    s.exp(prec, s);
    s.mul(h, prec, s);
    s.add(center, prec, res);
    for (int i = 1; i < order; i++)
    {
      arblib.acb_mul_onei(res.get(i), res.get(i - 1));
    }
    return res;
  }

  @Override
  public void close() 
  {
    s.clear();
    center.clear();
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
   * @param angle  in radians
   * @param result
   * @return
   */
  public Complex evaluate(double angle, Complex result)
  {
    try ( Complex Θ = new Complex())
    {
      Θ.getReal().set(angle);
      evaluate(Θ, 1, Double.SIZE, result);
      return result;
    }
  }

  /**
   * Perform an (infinitesimal) shift of length this{@link #h} in the specified
   * direction by moving the this{@link #center}
   * 
   * @param direction specified in radians which is an arc of a circle which is
   *                  equal to the radius, or the angle measured by such an arc.
   * @param distance  how far in the specified direction to move
   * 
   * @return this
   */
  public ComplexCircle shift(Real direction, int prec, Real distance)
  {
    evaluate(direction, 1, prec, center);
    return this;
  }

}
