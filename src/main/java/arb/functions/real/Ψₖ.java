package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.Typesettable;
import arb.arblib;

public class Ψₖ implements RealFunction, Typesettable, AutoCloseable, Initializable
{
  Integer        cℤ1 = new Integer("4");
  Integer        cℤ2 = new Integer("1");
  Integer        cℤ3 = new Integer("2");
  public boolean isInitialized;
  public Integer n;
  public Real    ℝ1  = new Real();
  public Real    ℝ2  = new Real();
  public Real    ℝ3  = new Real();
  public Real    ℝ4  = new Real();
  public Real    ℝ5  = new Real();
  public Integer ℤ1  = new Integer();
  public Integer ℤ2  = new Integer();
  public Integer ℤ3  = new Integer();
  public Integer ℤ4  = new Integer();

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
    ℤ1.close();
    ℤ2.close();
    ℤ3.close();
    ℝ5.close();
  }

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Real x, int order, int bits, Real result)  
  {
    if (!isInitialized)
    {
      initialize();
    }

    Real var10000 = cℤ1.mul(n, bits, ℤ1)
                       .add(cℤ2, bits, ℤ2)
                       .div(RealConstants.π, bits, ℝ1)
                       .sqrt(bits, ℝ2)
                       .mul(cℤ2.neg(ℤ3).pow(n, bits, ℤ4), bits, ℝ3);
    Real var10001 = ℝ4;
    arblib.arb_hypgeom_bessel_j(ℝ4, cℤ3.mul(n, bits, ℝ5), x, bits);
    return var10000.mul(var10001, bits, result);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (n == null)
    {
      throw new AssertionError("n shan't be null");
    }
    else
    {
      isInitialized = true;
    }
  }

  @Override
  public String toString()
  {
    return "Ψₖ:x➔√((4*n+1)/π)*(-1)^n*j(2*n,x)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\left(\\sqrt{\\frac{\\left(\\left(4 \\cdot n\\right) + 1\\right)}{\\pi}} \\cdot (-1)^{(n)}\\right) \\cdot j_{\\left(2 \\cdot n\\right)}(x)\\right)";
  }
}
