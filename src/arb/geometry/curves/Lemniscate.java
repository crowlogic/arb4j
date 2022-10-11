package arb.geometry.curves;

import static java.lang.Math.max;

import arb.*;
import arb.functions.complex.HolomorphicFunction;
import arb.functions.real.RealFunction;

/**
 * A parameterization of a scaled Bernoullian lemniscate whose <br>
 * <b>curvature</b> is given by <br>
 * <code> κ(t) = ((3*√2)*cos(t))/(scale*√(3-cos(2t))) <br>
 * and its <b>tangential angle</b> by <br>
 * <code> φ(t) = 3*tan^⁻¹(sin(t)) </code><br>
 * 
 * 
 */
public class Lemniscate implements
                        PlaneCurve,
                        AutoCloseable
{

  /**
   * @return new {@link LemniscateArcLength}
   */
  @Override
  public RealFunction getArcLength()
  {
    return new LemniscateArcLength(this);
  }

  /**
   * The default scale is 2, which is the case where the integral over the
   * absolute value of this{@link #differential()} is equal to the Lemniscate
   * constant, which is the ratio of the perimeter of a lemniscate to its
   * diameter, this means that the lemniscate constant is to the
   * {@link Lemniscate} as π is to the {@link Circle}
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

  private static final Complex imaginaryUnit = ComplexConstants.imaginaryUnit;

  private static final Complex ONE           = ComplexConstants.complexOne;

  Real                         scale;

  /**
   * @param z
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
      scale.mul(z.cos(prec, a), prec, numerator.getReal());
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
  public HolomorphicFunction inverse(int branch)
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
    scale.close();
  }

}
