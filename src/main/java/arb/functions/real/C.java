package arb.functions.real;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.Typesettable;
import arb.functions.integer.FractionSequence;
import arb.utensils.ShellFunctions;

public class C implements
               FractionSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public static void main( String args[] )
  {
    C C = new C();
    C.α = RealConstants.negHalf;
    C.β = RealConstants.negHalf;
    ShellFunctions.inspect(C);
    var C3 = C.evaluate(3, 128);
    ShellFunctions.inspect(C);

    System.out.println(C);
  }
  //@Override
  public String toString()
  {
    return String.format("C[vℤ0001=%s, vℝ0001=%s]", vℤ0001, vℝ0001);
  }

  public boolean       isInitialized;
  public final Integer cℤ0001 = new Integer("2");
  public Integer       vℤ0001 = new Integer();
  public Real          vℝ0001 = new Real();
  public Real          α;
  public Real          β;

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

    return this.cℤ0001.mul(n, bits, this.vℤ0001).add(this.α, bits, this.vℝ0001).add(this.β, bits, result);
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
      throw new AssertionError("C.α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("C.β is null");
    }
    else
    {
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ0001.close();
    this.vℤ0001.close();
    this.vℝ0001.close();
  }

 // @Override
  public String toFormulaString()
  {
    return "C:n➔2*n+α+β";
  }

  @Override
  public String typeset()
  {
    return "2 \\cdot n + α + β";
  }
}
