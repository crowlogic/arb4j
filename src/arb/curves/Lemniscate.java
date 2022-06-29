package arb.curves;

import static java.lang.Math.max;

import arb.*;
import arb.functions.complex.ComplexFunction;
import arb.functions.real.RealFunction;

/**
 * A parameterization of the Lemniscate of Bernoulli with scale parameter
 * 
 * The curvature and tangential angle of the lemniscate are Κappa(t) =
 * (3*sqrt(2)*cos(t))/(scale*sqrt(3-cos(2t))) and φ(t) = 3*tan^(-1)(sin(t)).
 * 
 * 
 */
public class Lemniscate implements
                        PlaneCurve, AutoCloseable
{

  static final Complex negOne = new Complex().one().neg();

  /**
   * @return 2*EllipticF(a, -1) + ω*IntegerPart(a/π)
   */
  @Override
  public RealFunction getArcLength()
  {
    return (z, order, prec, w) ->
    {
      try ( Complex q = new Complex();)
      {
        q.getReal().set(z);
        arb.acb_elliptic_f(q, q, negOne, 0, prec);
        assert q.getImag().isZero();
        w.set(q.getReal());
        return w.mul(2, prec, w);
      }
    };
  }

  /**
   * The default scale is 2, which is the case where the integral over the
   * absolute value of this{@link #differential()} is equal to the Lemniscate
   * constant, which is the ratio of the perimeter of a lemniscate to its diameter
   */
  @SuppressWarnings("resource")
  public Lemniscate()
  {
    this(new Real().set("2", 256));
  }

  public Lemniscate(Real scale)
  {
    assert scale != null;
    this.scale = scale;
  }

  private static final Complex imaginaryUnit = Constants.IMAGINARY_UNIT;

  private static final Complex ONE           = Constants.COMPLEX_ONE;

  Real                         scale;

  /**
   * @param z
   * @param int
   * @param order
   * @param w
   * @return scale*cos(t))/(1-i*sin(t)
   */
  @Override
  public Complex evaluate(Real z, int order, int prec, Complex w)
  {
    order = max(1, order);
    assert order <= w.size() : String.format("order = %d > res.size = %d", order, w.size());
    assert order <= 2;

    try ( Real a = new Real(); Complex divisor = new Complex(); Complex numerator = new Complex())
    {
      scale.mul( z.cos(prec, a), prec, numerator.getReal());
      z.sin(prec, a).mul(imaginaryUnit, prec, divisor);
      divisor.neg(divisor).add(1, prec, divisor);
      numerator.div(divisor, prec, w);
      if (order >= 2)
      {
        a.sub(imaginaryUnit, prec, numerator).mul(scale, prec, numerator);
        a.add(imaginaryUnit, prec, divisor).pow(2, prec, divisor);
        numerator.div(divisor, prec, w.get(1));
      }

    }
    return w;
  }

  @Override
  public int getInverseBranchCount()
  {
    return 4;
  }

  @Override
  public ComplexFunction inverse(int branch)
  {
    switch (branch)
    {
    case 0:
    case 1:
    case 2:
    case 3:
    }
    throw new UnsupportedOperationException("TODO: implement  inverse branches");

  }

  @Override
  public void close() throws Exception
  {
    scale.clear();
  }

}
