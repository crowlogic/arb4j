package arb.functions.real;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.Typesettable;
import arb.functions.integer.FractionSequence;
import arb.utensils.ShellFunctions;

public class B implements
               FractionSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ0001 = new Integer("1");
  public Fraction      vf0009 = new Fraction();
  public Real          vℝ0004 = new Real();
  public Real          vℝ0007 = new Real();
  public Real          vℝ0008 = new Real();
  public Real          vℝ0005 = new Real();
  public Real          vℝ0006 = new Real();
  public C             C;
  public Real          α;
  public Real          β;

  public static void main( String args[] )
  {
    B B = new B();
    B.α = RealConstants.negHalf;
    B.β = RealConstants.negHalf;
    ShellFunctions.inspect(B);
    var B3 = B.evaluate(3, 128);
    ShellFunctions.inspect(B);

    System.out.println(B + "(3)=" + B3);
  }
  @Override
  public Class<Fraction> coDomainType()
  {
    return Fraction.class;
  }

  @Override
  public Fraction evaluate(Integer n, int order, int bits, Fraction result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    return n.add(this.α, bits, this.vℝ0004)
            .sub(this.cℤ0001, bits, this.vℝ0005)
            .mul(n.add(this.β, bits, this.vℝ0006).sub(this.cℤ0001, bits, this.vℝ0007), bits, this.vℝ0008)
            .mul((Fraction) this.C.evaluate(n, order, bits, this.vf0009), bits, result);
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (this.α == null)
    {
      throw new AssertionError("B.α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("B.β is null");
    }
    else
    {
      if (this.C == null)
      {
        this.C = new C();
      }

      this.C.α           = this.α;
      this.C.β           = this.β;
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ0001.close();
    this.vf0009.close();
    this.vℝ0004.close();
    this.vℝ0007.close();
    this.vℝ0008.close();
    this.vℝ0005.close();
    this.vℝ0006.close();
    this.C.close();
  }

  @Override
  public String toString()
  {
    return "B:n➔(n+α)-1*(n+β)-1*C(n)";
  }

  @Override
  public String typeset()
  {
    return "\\left(n + α-1\\right) \\cdot \\left(n + β-1\\right) \\cdot \\C(n)";
  }
}
