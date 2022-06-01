package arb.functions.complex;

import static arb.Constants.COMPLEX_ONE;
import static java.lang.String.format;

import arb.Complex;
import arb.Constants;
import arb.Real;
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
  public Complex evaluateDerivative(Complex t, int prec, Complex res1)
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
  public Complex evaluate2ndDerivative(Complex t, int prec, Complex res)
  {

    try ( Complex numer = new Complex(); Complex denom = new Complex(); Complex a = new Complex();)
    {
      denom.getReal().set(2);
      t.pow(2, prec, a);
      a.mul(2, prec, a);
      denom.sub(a, prec, denom);
      t.pow(4, prec, a);
      denom.add(a, prec, denom);
      denom.pow(3, denom);

      numer.getReal().set(2);
      a.mul(9, prec, a);
      numer.sub(a, numer);
      t.pow(6, a);
      a.mul(5, prec, a);
      numer.add(a, prec, numer);
      numer.neg(numer);
      numer.mul(8, prec, numer);

//      System.out.println("S''[t] numer is " + numer);
//      System.out.println("S''[t] denom is " + denom);
      return numer.div(denom, prec, res);
    }
  }

}