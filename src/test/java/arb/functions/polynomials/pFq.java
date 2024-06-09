package arb.functions.polynomials;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.Typesettable;
import arb.functions.real.RealPolynomialNullaryFunction;

public class pFq implements RealPolynomialNullaryFunction, Typesettable, AutoCloseable, Initializable
{
  public boolean        isInitialized;
  Integer               cℤ1 = new Integer("2");
  Integer               cℤ4 = new Integer("4");
  Integer               cℤ3 = new Integer("1");
  Real                  cℝ2 = new Real("3.5",
                                       128);
  public Real           ℝ1  = new Real();
  public Real           ℝ2  = new Real();
  public Real           ℝ3  = new Real();
  public Real           ℝ4  = new Real();
  public RealPolynomial Xℝ2 = new RealPolynomial();
  public RealPolynomial Xℝ1 = new RealPolynomial();
  public Real           vℝ2 = new Real();
  public Real           vℝ1 = new Real();

  @Override
  public Class<RealPolynomial> coDomainType()
  {
    return RealPolynomial.class;
  }

  @Override
  public RealPolynomial evaluate(Object in, int order, int bits, RealPolynomial result)
  {
    if (!isInitialized)
    {
      initialize();
    }
    Real numer                        = vℝ1.set(ℝ1.set(Xℝ1.set(cℤ1).neg(Xℝ2)), cℝ2, ℝ2.set(cℤ3));
    Real denom                        = vℝ2.set(ℝ3.set(cℤ1), ℝ4.set(cℤ4));
    var  arg                          = RealPolynomialNullaryFunction.parse("(1/2)-(x/2)");
    var  realHypergeometricPolynomial = new RealHypergeometricPolynomial(numer,
                                                                         denom,
                                                                         arg);
    return realHypergeometricPolynomial.evaluate(null, 1, bits, result);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else
    {
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ1.close();
    cℤ4.close();
    cℤ3.close();
    cℝ2.close();
    ℝ1.close();
    ℝ2.close();
    ℝ3.close();
    ℝ4.close();
    Xℝ2.close();
    Xℝ1.close();
    vℝ2.close();
    vℝ1.close();
  }

  @Override
  public String toString()
  {
    return "pFq([-2,3.5,1],[2,4],1/2-x/2)";
  }

  @Override
  public String typeset()
  {
    return "\\pFq{\\frac{1}{2}-\\frac{x}{2}}";
  }
}
