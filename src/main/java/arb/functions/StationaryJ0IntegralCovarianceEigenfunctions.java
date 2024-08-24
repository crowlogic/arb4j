package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.RealConstants;
import arb.Typesettable;
import arb.functions.real.RealNullaryFunction;

public class StationaryJ0IntegralCovarianceEigenfunctions implements
                                                          RealNullaryFunction,
                                                          Typesettable,
                                                          AutoCloseable,
                                                          Initializable
{
  public boolean                 isInitialized;
  public final Integer           cℤ2 = new Integer("1");
  public final Integer           cℤ1 = new Integer("4");
  public final Integer           cℤ3 = new Integer("2");
  public Integer                 n;
  public Real                    x;
  public Real                    ℝ1  = new Real();
  public Real                    ℝ2  = new Real();
  public Real                    ℝ3  = new Real();
  public Real                    ℝ4  = new Real();
  public Integer                 ℤ4  = new Integer();
  public Integer                 ℤ1;
  public Integer                 ℤ2;
  public SphericalBesselFunction sphsph1;
  public RationalFunction        elementq1;
  public Integer                 ℤ3;
  public Integer                 ℤ5  = new Integer();
  public Integer                 ℤ6  = new Integer();

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Object in, int order, int bits, Real result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return cℤ1.mul(n, bits, ℤ1)
              .add(cℤ2, bits, ℤ2)
              .div(RealConstants.π, bits, ℝ1)
              .sqrt(bits, ℝ2)
              .mul(cℤ2.neg(ℤ3).pow(n, bits, ℤ4), bits, ℝ3)
              .mul(ℝ4.set(elementq1), bits, result);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (x == null)
    {
      throw new AssertionError("x shan't be null");
    }
    else if (n == null)
    {
      throw new AssertionError("n shan't be null");
    }
    else
    {
      sphsph1.set(cℤ3.mul(n, 128, ℤ5));
      cℤ3.mul(n, 128, ℤ6);
      isInitialized = true;
    }
  }

  public StationaryJ0IntegralCovarianceEigenfunctions()
  {
    ℤ1        = new Integer();
    ℤ2        = new Integer();
    sphsph1   = new SphericalBesselFunction();
    elementq1 = new RationalFunction();
    ℤ3        = new Integer();
  }

  @Override
  public void close()
  {
    cℤ2.close();
    cℤ1.close();
    cℤ3.close();
    ℝ1.close();
    ℝ2.close();
    ℝ3.close();
    ℝ4.close();
    ℤ4.close();
    ℤ5.close();
    ℤ6.close();
    ℤ1.close();
    ℤ2.close();
    sphsph1.close();
    elementq1.close();
    ℤ3.close();
  }

  @Override
  public String toString()
  {
    return "√((4*n+1)/(2*π))*(-1)^n*j(2*n,x)";
  }

  @Override
  public String typeset()
  {
    return "\\sqrt{\\frac{4 \\cdot n + 1}{2\\pi}} \\cdot {(-1)}^{n} \\cdot j_{2 \\cdot n}(x)";
  }
}
