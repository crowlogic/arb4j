package arb.functions.complex;

import static arb.Constants.COMPLEX_ONE;
import static java.lang.String.format;

import arb.*;
import arb.exceptions.NotDifferentiableException;

/**
 * The rational meromorphic quartic
 * <code>S(t)=tanh(ln(1-t^2)))=((1 - t^2)^2 - 1)/((1 - t^2)^2 + 1)</code>
 * 
 * @author Stephen Crowley
 */
public class SFunction implements
                       ComplexFunction
{

  @Override
  public String toString()
  {
    return String.format("S(scale=%s)", scale.toString(5));
  }

  @Override
  public int multiplicityOfRoot(Complex z)
  {
    if ( z.isZero() || ( !z.isFinite() ) )
    {
      return 2;
    }
    // TODO: account for the the other roots
    return 1;
  }

  /**
   * A new {@link TFunction} of the same scale
   */
  @Override
  public ComplexFunction adjoint()
  {
    return new TFunction(scale);
  }

  @Override
  public ComplexFunction differential() throws NotDifferentiableException
  {
    return (z, order, prec, w) ->
    {
      assert order <= 1;
      return evaluateDerivative(z, prec, w);
    };
  }

  private static final Complex ONE = COMPLEX_ONE;

  public Real                  scale;

  public SFunction()
  {
    scale = Constants.ONE;
    scale.printPrecision = false;
  }

  public SFunction(Real scale)
  {
    this.scale = scale;
  }

  @Override
  public Complex evaluate(Complex t, int order, int prec, Complex res)
  {

    assert res.dim >= order && order > 0 : format("res.dim = %d must be >= order = %d > 0", res.dim, order);
    assert order <= 3;
    try ( Complex r = new Complex(); Complex s = new Complex())
    {
      if (order >= 1)
      {
        t.div(scale, prec, r)
         .pow(2, prec, r)
         .neg(r)
         .add(1, prec, r)
         .pow(2, prec, r)
         .sub(1, prec, r)
         .div(r.add(2, prec, s), prec, res);
      }
      if (order >= 2)
      {
        evaluateDerivative(t, prec, res.get(1));
      }
      if (order >= 3)
      {
        evaluate2ndDerivative(t, prec, res.get(2));
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
  protected Complex evaluateDerivative(Complex t, int prec, Complex res1)
  {
    /**
     * TODO: optimize this and compute (t-1)*(t+1) since it appears in both the
     * numerator and the denominator
     */
    try ( Complex b = new Complex(); Complex c = new Complex(); Complex d = new Complex(); Complex e = new Complex();
          Complex g = new Complex(); Complex h = new Complex();)
    {
      t.div(scale, prec, b);
      b.pow(2, prec, c);
      c.neg(d);
      d.add(1, prec, e);
      e.pow(2, prec, g);
      g.add(1, prec, h);
      h.pow(2, prec, g);
      ONE.div(g, prec, h);
      b.mul(8, prec, g);
      g.mul(e, prec, g);
      g.mul(h, prec, g);
      g.neg(res1);
    }
    return res1;
  }

  /**
   * Evaluate the 2nd derivative of S(t)
   * 
   * @param t
   * @param prec
   * @param res
   * @return -8*(2 - 9t^4 + 5t^6 ) / (2 - 2t^2 +t^4)^3
   */
  protected Complex evaluate2ndDerivative(Complex t, int prec, Complex res)
  {
    try ( Complex numer = new Complex(); Complex denom = new Complex(); Complex a = new Complex();)
    {
      denom.getReal().set(2);
      denom.sub(t.pow(2, prec, a).mul(2, prec, a), prec, denom);
      denom.add(t.pow(4, prec, a), prec, denom).pow(3, prec, denom);

      numer.getReal().set(2);
      numer.sub(a.mul(9, prec, a), prec, numer);
      numer.add(t.pow(6, prec, a).mul(5, prec, a), prec, numer).neg(numer).mul(8, prec, numer);

      return numer.div(denom, prec, res);
    }
  }

}