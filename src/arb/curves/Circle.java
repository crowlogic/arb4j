package arb.curves;

import static java.lang.Math.max;

import arb.*;

public class Circle implements
                    PlaneCurve
{
  public Circle(Real radius)
  {
    this.radius = radius;
  }

  Real radius;

  @Override
  public Complex evaluate(Real θ, int order, int precision, Complex result)
  {
    order = max(order, 1);
    assert order <= 1;
    return radius.mul(θ.mul(Constants.i, precision, result).exp(precision, result), precision, result);
  }
}
