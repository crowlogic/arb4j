package arb.functions.complex;

import static java.lang.Math.max;
import static java.lang.String.format;

import arb.Complex;
import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.exceptions.NotDifferentiableException;
import arb.functions.Function;

/**
 * The rational meromorphic quartic
 * <code>S(t)=tanh(ln(1-t^2)))=((1 - t^2)^2 - 1)/((1 - t^2)^2 + 1)</code>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SFunction implements
                       ComplexFunction,
                       AutoCloseable
{

  public Real scale;

  public SFunction()
  {
    this(RealConstants.one);
  }

  public SFunction(Real a)
  {
    this.scale = new Real(a);
  }

  @Override
  public void close()
  {
    scale.clear();
  }

  @Override
  public ComplexFunction differential() throws NotDifferentiableException
  {
    return (z, order, prec, w) ->
    {
      assert order <= 1;
      evaluate(z, 1, prec, w);
      return evaluateDerivative(z, w, prec, w);
    };
  }

  @Override
  public Complex evaluate(Complex t, int order, int bits, Complex res)
  {

    assert res.dim >= order && order >= 0 : format("res.dim = %d must be >= order = %d > 0", res.dim, order);
    assert order <= 3;
    order = max(1, order);

    if (order >= 1)
    {
      evaluateFunction(t, bits, res);
    }
    if (order >= 2)
    {
      evaluateDerivative(t, res.get(0), bits, res.get(1));
    }
    if (order >= 3)
    {
      evaluate2ndDerivative(t, bits, res.get(2));
    }
    return res;

  }

  public Complex evaluateFunction(Complex t, int prec, Complex res)
  {
    return t.div(scale, prec, res).pow(2, prec).neg().add(1, prec).log(prec).tanh(prec);
  }

  /**
   * Compute S''(t), the 2nd derivative of S
   * 
   * @param t
   * @param prec
   * @param res
   * @return -8*(2 - 9t⁴ + 5t⁶ ) / (2 - 2t² +t⁴)³
   */
  protected Complex evaluate2ndDerivative(Complex t, int prec, Complex res)
  {
    try ( Complex tmp = Complex.newVector(3))
    {
      Complex a = tmp.get(0);
      Complex b = tmp.get(1);
      Complex c = tmp.get(2);

      c.getReal().set(2);
      c.sub(t.pow(2, prec, a).mul(2, prec), prec);
      c.add(t.pow(4, prec, a), prec).pow(3, prec);

      b.getReal().set(2);
      b.sub(a.mul(9, prec), prec);
      b.add(t.pow(6, prec, a).mul(5, prec), prec).mul(-8, prec);

      return b.div(c, prec, res);
    }
  }

  /**
   * Evaluate S'(t)
   * 
   * @param t
   * @param St   S(t)
   * @param bits
   * @param res
   * @return res=(1-S(t)^2)*(2t/(1+t^2))
   */
  protected Complex evaluateDerivative(Complex t, Complex St, int bits, Complex res)
  {
    try ( Complex tmp = Complex.newVector(2))
    {
      Complex oneMinusTSquared = t.pow(2, bits, tmp.get(0)).neg().add(1, bits);
      Complex derivativeInner  = t.mul(-2, bits, tmp.get(1)).div(oneMinusTSquared, bits);
      return St.pow(2, bits, res).neg().add(1, bits).mul(derivativeInner, bits);
    }
  }

  @Override
  public int getInverseBranchCount()
  {
    return 4;
  }

  @Override
  public synchronized Function<Complex, Complex> inverse(int branch)
  {
    assert false : "TODO: redo with expression compiler";
    return null;
//    assert 0 <= branch && branch <= 4 : branch + " must be in {0,1,2,3}";
//    SFunctionInverse inverse = inverses[branch];
//    if (inverse == null)
//    {
//      inverse = inverses[branch] = new SFunctionInverse(scale,
//                                                        branch);
//    }
//    return inverse;
  }

  @Override
  public int multiplicityOfRoot(Complex z)
  {
    if (z.isZero())
    {
      return 2;
    }
    // TODO: account for the the other roots
    return 1;
  }

  @Override
  public String toString()
  {
    scale.printPrecision = false;
    return String.format("S(scale=%s)", scale.toString(5));
  }

}