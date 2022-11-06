package arb.functions.complex;

import static arb.ComplexConstants.one;
import static java.lang.String.format;

import arb.Complex;
import arb.ComplexConstants;
import arb.Real;
import arb.RealConstants;
import arb.exceptions.NotDifferentiableException;

/**
 * The rational meromorphic quartic
 * <code>S(t)=tanh(ln(1-t^2)))=((1 - t^2)^2 - 1)/((1 - t^2)^2 + 1)</code>
 * 
 * @author Stephen Androw Crowley <crowlogic@proton.me>
 */
public class SFunction implements
                       HolomorphicFunction,
                       AutoCloseable
{
  SFunctionInverse[] inverses = new SFunctionInverse[SFunctionInverse.BRANCH_COUNT];

  public Real  a;

  private Real aSquared;

  public SFunction()
  {
    this(RealConstants.one);
  }

  public SFunction(Real a)
  {
    this.a        = a;
    this.aSquared = a;
  }

  /**
   * A new {@link TFunction} of the same scale
   */
  @Override
  public HolomorphicFunction adjoint()
  {
    return new TFunction(a);
  }

  @Override
  public void close()
  {
    a.clear();
  }

  @Override
  public HolomorphicFunction differential() throws NotDifferentiableException
  {
    return (z, order, prec, w) ->
    {
      assert order <= 1;
      return evaluateDerivative(z, prec, w);
    };
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
        t.div(aSquared, prec, r).pow(2, prec, r).neg(r).add(1, prec, r).log(prec, r).tanh(prec, res);
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
   * Evaluate the 2nd derivative of S(t)
   * 
   * @param t
   * @param prec
   * @param res
   * @return -8*(2 - 9t^4 + 5t^6 ) / (2 - 2t^2 +t^4)^3
   */
  protected Complex evaluate2ndDerivative(Complex t, int prec, Complex res)
  {
    try ( Complex numer = new Complex(); Complex denom = new Complex(); Complex x = new Complex();)
    {
      denom.getReal().set(2);
      denom.sub(t.pow(2, prec, x).mul(2, prec, x), prec, denom);
      denom.add(t.pow(4, prec, x), prec, denom).pow(3, prec, denom);

      numer.getReal().set(2);
      numer.sub(x.mul(9, prec, x), prec, numer);
      numer.add(t.pow(6, prec, x).mul(5, prec, x), prec, numer).neg(numer).mul(8, prec, numer);

      return numer.div(denom, prec, res);
    }
  }

  /**
   * Evaluate the derivative of S(t)
   * 
   * @param t
   * @param prec
   * @param res
   * @return (8*(t-1)*t*(t+1)) / (t^4 - 2*a*(t-1)*(t+1))^2
   */
  protected Complex evaluateDerivative(Complex t, int prec, Complex res1)
  {

    /**
     * TODO: Let a=quadratic scale parameter and then compute <br>
     * aquad = aQuadrupoled = a^4<br>
     * asqr = aSquared = a^2<br>
     * numer = 8*aquad*(a - t)*t*(a + t) <br>
     * denom = (2*aquad - 2*asqr*(t^2) + t^4)^2 <br>
     * 
     */
    try ( Complex b = new Complex(); Complex c = new Complex(); Complex d = new Complex(); Complex e = new Complex();
          Complex g = new Complex(); Complex h = new Complex();)
    {
      t.div(a, prec, b);
      b.pow(2, prec, c);
      c.neg(d);
      d.add(1, prec, e);
      e.pow(2, prec, g);
      g.add(1, prec, h);
      h.pow(2, prec, g);
      one.div(g, prec, h);
      b.mul(8, prec, g);
      g.mul(e, prec, g);
      g.mul(h, prec, g);
      g.neg(res1);
    }
    return res1;
  }

  @Override
  public int getInverseBranchCount()
  {
    return SFunctionInverse.BRANCH_COUNT;
  }

  @Override
  public synchronized HolomorphicFunction inverse(int branch)
  {
    SFunctionInverse inverse = inverses[branch];
    if (inverse == null)
    {
      inverse = inverses[branch] = new SFunctionInverse(a,
                                                        branch);
    }
    return inverse;
  }

  @Override
  public int multiplicityOfRoot(Complex z)
  {
    if (z.isZero() || (!z.isFinite()))
    {
      return 2;
    }
    // TODO: account for the the other roots
    return 1;
  }

  @Override
  public String toString()
  {
    return String.format("S(a=%s)", a.toString(5));
  }

}