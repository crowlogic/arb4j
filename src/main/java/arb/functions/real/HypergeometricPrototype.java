package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.Typesettable;
import arb.functions.polynomials.RealHypergeometricPolynomial;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class HypergeometricPrototype implements
                                     RealPolynomialNullaryFunction,
                                     Typesettable,
                                     AutoCloseable,
                                     Initializable
{
  public boolean                       isInitialized;
  Integer                              cℤ5 = new Integer("4");
  Integer                              cℤ2 = new Integer("0");
  Integer                              cℤ1 = new Integer("2");
  Integer                              cℤ4 = new Integer("1");
  Real                                 cℝ3 = new Real("3.5",
                                                      128);
  public Real                          ℝ1  = new Real();
  public Real                          ℝ2  = new Real();
  public Real                          ℝ3  = new Real();
  public Real                          ℝ4  = new Real();
  public Real                          vℝ2 = new Real();
  public Real                          vℝ1 = new Real();
  public Integer                       N   = new Integer();
  private RealHypergeometricPolynomial f;

  @Override
  public Class<RealPolynomial> coDomainType()
  {
    return RealPolynomial.class;
  }

  public static void main(String args[])
  {
    try ( HypergeometricPrototype a = new HypergeometricPrototype())
    {
      RealPolynomial evaluate = a.evaluate(128);
      System.out.println(a + "=" + evaluate);
      TestCase.assertEquals("0.065625*x² + 0.30625*x + 0.628125", evaluate.toString());
    }
  }

  @Override
  public RealPolynomial evaluate(Object in, int order, int bits, RealPolynomial result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return f.evaluate(null, 1, bits, result);
  }

  @Override
  public void initialize()
  {
    Real[] alpha = new Real[]
    { cℤ2.sub(cℤ1, 128, ℝ1), cℝ3, ℝ2.set(cℤ4) };
    Real[] beta  = new Real[]
    { ℝ3.set(cℤ1), ℝ4.set(cℤ5) };
    f = new RealHypergeometricPolynomial(vℝ1.set(alpha),
                                         vℝ2.set(beta),
                                         RealPolynomialNullaryFunction.parse("(1/2)-(x/2)"));

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
    cℤ5.close();
    cℤ2.close();
    cℤ1.close();
    cℤ4.close();
    cℝ3.close();
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
    return "pFq(\\frac{1}{2}-\\frac{x}{2})";
  }
}
