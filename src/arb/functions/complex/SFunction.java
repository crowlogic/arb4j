package arb.functions.complex;

import static arb.Constants.COMPLEX_ONE;
import static java.lang.String.format;

import arb.Complex;
import arb.Constants;
import arb.Real;

/**
 * The rational meromorphic quartic
 * <code>S(t)=tanh(ln(1-t^2)))=(-1 + (1 - t^2)^2)/(1 + (1 - t^2)^2)</code>
 * 
 * @author Stephen Crowley
 */
public class SFunction implements
                       ComplexFunction
{

  private static final Complex ONE = COMPLEX_ONE;

  Real                         a;

  public SFunction()
  {
    a = Constants.ONE;
  }

  public SFunction(Real scale)
  {
    this.a = scale;
  }

  @Override
  public Complex evaluate(Complex t, int order, int prec, Complex res)
  {

    assert res.dim >= order && order > 0 : format("res.dim = %d must be >= order = %d > 0", res.dim, order);
    try ( Complex r = new Complex(); Complex s = new Complex())
    {
      if (order >= 1)
      {
        t.div(a, prec, r);
        r.pow(2, prec, r);
        r.neg(r);
        r.add(1, prec, r);
        r.pow(2, prec, r);
        r.sub(1, prec, r);
        r.add(2, prec, s);
        r.div(s, prec, res);
      }
      if (order >= 2)
      {
        evaluateDerivative(t, prec, res.get(1));
      }
      return res;
    }
  }

  /**
   * Evaluate the derivative of S(t)
   * 
   * @param t
   * @param prec
   * @param res
   * @return (8*(t-1)*t*(t+1)) / (t^4 - 2*(t-1)*(t+1))^2
   */
  public Complex evaluateDerivative(Complex t, int prec, Complex res1)
  {
    try ( Complex b = t.div(a, prec, new Complex()); Complex c = b.pow(2, prec, new Complex());
          Complex d = c.neg(new Complex()); Complex e = d.add(1, prec, new Complex());
          Complex g = e.pow(2, prec, new Complex()); Complex h = g.add(1, prec, new Complex());)
    {

      ONE.div(h.pow(2, prec, g), prec, h);
      b.mul(8, prec, g).mul(e, prec, g).mul(h, prec, g).neg(res1);
    }
    return res1;
  }

}