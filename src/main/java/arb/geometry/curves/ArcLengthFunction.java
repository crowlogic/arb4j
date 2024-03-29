package arb.geometry.curves;

import arb.Complex;
import arb.ComplexConstants;
import arb.Magnitude;
import arb.Real;
import arb.functions.RealToComplexFunction;
import arb.functions.real.RealFunction;

public final class ArcLengthFunction implements
                                     RealFunction,
                                     AutoCloseable
{
  final PlaneCurve curve;

  public ArcLengthFunction(PlaneCurve curve)
  {
    super();
    this.curve = curve;
    df         = curve.differential();
    absdf      = (t, order, prec, w) ->
               {
                 df.evaluate(t, order, prec, w).abs(prec, w.getReal());
                 w.getImag().zero();
                 return w;
               };
  }

  final RealToComplexFunction df;
  final RealToComplexFunction absdf;
  Magnitude                   absErr = new Magnitude().set(Math.pow(10, -75));

  @SuppressWarnings("resource")
  @Override
  public Real evaluate(Real a, int order, int prec, Real q)
  {
    try ( Complex integral = new Complex();)
    {
      absdf.integrate(ComplexConstants.ZERO.getReal(), a, prec, absErr, null, prec, integral);
      assert integral.getImag().isZero();
      return q.set(integral.getReal());
    }
  }

  @Override
  public void close()
  {
    absErr.close();
  }
}
