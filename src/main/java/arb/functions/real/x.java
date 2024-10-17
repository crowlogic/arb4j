package arb.functions.real;

import arb.*;
import arb.Integer;

public class x implements
               RealFunction,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ2  = new Integer("2");
  public final Integer cℤ1  = new Integer("1");
  public final Integer cℤ3  = new Integer("8");
  public Real          input;
  public Integer       j;
  public Integer       k;
  public Fraction      if11 = new Fraction();
  public Fraction      if10 = new Fraction();
  public Fraction      if13 = new Fraction();
  public Fraction      if12 = new Fraction();
  public Real          iℝ1  = new Real();
  public Real          iℝ11 = new Real();
  public Real          iℝ12 = new Real();
  public Real          iℝ3  = new Real();
  public Real          iℝ13 = new Real();
  public Real          iℝ2  = new Real();
  public Real          iℝ10 = new Real();
  public Real          iℝ9  = new Real();
  public Real          iℝ8  = new Real();
  public Real          iℝ5  = new Real();
  public Real          iℝ4  = new Real();
  public Real          iℝ7  = new Real();
  public Real          iℝ6  = new Real();
  public Fraction      if20 = new Fraction();
  public Fraction      if21 = new Fraction();
  public Fraction      if15 = new Fraction();
  public Fraction      if14 = new Fraction();
  public Integer       iℤ2  = new Integer();
  public Fraction      if17 = new Fraction();
  public Integer       iℤ1  = new Integer();
  public Fraction      if16 = new Fraction();
  public Fraction      if2  = new Fraction();
  public Fraction      if19 = new Fraction();
  public Fraction      if1  = new Fraction();
  public Fraction      if18 = new Fraction();
  public Fraction      if4  = new Fraction();
  public Fraction      if3  = new Fraction();
  public Fraction      if6  = new Fraction();
  public Fraction      if5  = new Fraction();
  public Fraction      if8  = new Fraction();
  public Fraction      if7  = new Fraction();
  public Integer       iℤ4  = new Integer();
  public Integer       iℤ3  = new Integer();
  public Fraction      if9  = new Fraction();
  public Integer       iℤ6  = new Integer();
  public Integer       iℤ5  = new Integer();

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

    Fraction var10000 = cℤ1.div(cℤ2, bits, if1);
    Real     var10001 = iℝ1;
    arblib.arb_hypgeom_bessel_j(iℝ1, k, x, bits);
    return var10000.mul(var10001, bits, iℝ2)
                   .mul(RealConstants.π.pow(cℤ1.div(cℤ2, bits, if2), bits, iℝ3), bits, iℝ4)
                   .mul(cℤ3.mul(j, bits, iℤ1).add(cℤ2, bits, iℤ2).pow(cℤ1.div(cℤ2, bits, if3), bits, if4), bits, iℝ5)
                   .mul(cℤ1.neg(iℤ3).pow(j, bits, iℤ4), bits, iℝ6)
                   .mul(cℤ1.div(cℤ2, bits, if5)
                           .mul(k, bits, if6)
                           .add(j, bits, if7)
                           .add(cℤ1.div(cℤ2, bits, if8), bits, if9)
                           .Γ(bits, iℝ7),
                        bits,
                        iℝ8)
                   .div(j.neg(iℤ5)
                         .add(cℤ1.div(cℤ2, bits, if10).mul(k, bits, if11), bits, if12)
                         .add(cℤ1.div(cℤ2, bits, if13), bits, if14)
                         .Γ(bits, iℝ9),
                        bits,
                        iℝ10)
                   .div(j.add(cℤ1, bits, iℤ6)
                         .sub(cℤ1.div(cℤ2, bits, if15).mul(k, bits, if16), bits, if17)
                         .Γ(bits, iℝ11),
                        bits,
                        iℝ12)
                   .div(cℤ1.div(cℤ2, bits, if18)
                           .mul(k, bits, if19)
                           .add(j, bits, if20)
                           .add(cℤ1, bits, if21)
                           .Γ(bits, iℝ13),
                        bits,
                        result);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (input == null)
    {
      throw new AssertionError("x-1⁄2*J(k,x)*π^(1⁄2)*(8*j+2)^(1⁄2)*(-1)^j*Γ(1⁄2*k+j+1⁄2)⁄Γ(-j+1⁄2*k+1⁄2)⁄Γ(j+1-1⁄2*k)⁄Γ(1⁄2*k+j+1).input is null");
    }
    else if (j == null)
    {
      throw new AssertionError("x-1⁄2*J(k,x)*π^(1⁄2)*(8*j+2)^(1⁄2)*(-1)^j*Γ(1⁄2*k+j+1⁄2)⁄Γ(-j+1⁄2*k+1⁄2)⁄Γ(j+1-1⁄2*k)⁄Γ(1⁄2*k+j+1).j is null");
    }
    else if (k == null)
    {
      throw new AssertionError("x-1⁄2*J(k,x)*π^(1⁄2)*(8*j+2)^(1⁄2)*(-1)^j*Γ(1⁄2*k+j+1⁄2)⁄Γ(-j+1⁄2*k+1⁄2)⁄Γ(j+1-1⁄2*k)⁄Γ(1⁄2*k+j+1).k is null");
    }
    else
    {
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ2.close();
    cℤ1.close();
    cℤ3.close();
    if11.close();
    if10.close();
    if13.close();
    if12.close();
    iℝ1.close();
    iℝ11.close();
    iℝ12.close();
    iℝ3.close();
    iℝ13.close();
    iℝ2.close();
    iℝ10.close();
    iℝ9.close();
    iℝ8.close();
    iℝ5.close();
    iℝ4.close();
    iℝ7.close();
    iℝ6.close();
    if20.close();
    if21.close();
    if15.close();
    if14.close();
    iℤ2.close();
    if17.close();
    iℤ1.close();
    if16.close();
    if2.close();
    if19.close();
    if1.close();
    if18.close();
    if4.close();
    if3.close();
    if6.close();
    if5.close();
    if8.close();
    if7.close();
    iℤ4.close();
    iℤ3.close();
    if9.close();
    iℤ6.close();
    iℤ5.close();
  }

  @Override
  public String toString()
  {
    return "x➔1/2*J(k,x)*π^(1/2)*(8*j+2)^(1/2)*(-1)^j*Γ(1/2*k+j+1/2)/Γ(-j+1/2*k+1/2)/Γ(j+1-1/2*k)/Γ(1/2*k+j+1)";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\frac{\\frac{\\frac{1}{2} \\cdot J_{k}(x) \\cdot {\\pi}^{(\\frac{1}{2})} \\cdot {(8 \\cdot j + 2)}^{(\\frac{1}{2})} \\cdot {(-1)}^{j} \\cdot \\Γ(\\frac{1}{2} \\cdot k + j + \\frac{1}{2})}{\\Γ(-j + \\frac{1}{2} \\cdot k + \\frac{1}{2})}}{\\Γ(\\left(j + 1-\\frac{1}{2} \\cdot k\\right))}}{\\Γ(\\frac{1}{2} \\cdot k + j + 1)}";
  }
}
