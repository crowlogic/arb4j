package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.Typesettable;
import arb.functions.polynomials.RealPolynomialHypergeometricFunction;

public class pFq implements RealPolynomialNullaryFunction, Typesettable, AutoCloseable, Initializable
{
  public boolean isInitialized;
  Integer        cℤ1 = new Integer("2");
  Integer        cℤ4 = new Integer("4");
  Integer        cℤ3 = new Integer("1");
  Real           cℝ2 = new Real("3.5",
                                128);
  public Real    ℝ1  = new Real();
  public Real    ℝ2  = new Real();
  public Real    ℝ3  = new Real();
  public Real    ℝ4  = new Real();
  public Real    vℝ2 = new Real();
  public Real    vℝ1 = new Real();

  @Override
  public Class<RealPolynomial> coDomainType()
  {
    return RealPolynomial.class;
  }

  public static void main(String args[] )
  {
    pFq pfq = new pFq();
    RealPolynomial evaluate = pfq.evaluate(128);
    System.out.println("f="+evaluate);
    // should be .6281250000+.3062500000*x+.6562500000e-1*x^2 not f=0.065625*x² + 0.4375*x + 1

  }
  @Override
  public RealPolynomial evaluate(Object in, int order, int bits, RealPolynomial result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    Real numer = vℝ1.set(cℤ1.neg(ℝ1), cℝ2, ℝ2.set(cℤ3));
    Real denom = vℝ2.set(ℝ3.set(cℤ1), ℝ4.set(cℤ4));
    F f = new F();
    f.α = numer;
    f.β = denom;
    f.N = new Integer(2);
    f.p = new Integer(numer.size());
    f.q = new Integer(denom.size());
    
    return f.evaluate(null, 1, bits, result);
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
    return "${_3F_2}\\left(\\left[-2,3.5,1\\right], \\left[2,4\\right] ; \\left(\\frac{1}{2}-\\frac{x}{2}\\right)\\right)";
  }
}
