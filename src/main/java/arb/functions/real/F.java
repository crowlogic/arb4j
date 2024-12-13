package arb.functions.real;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.Typesettable;
import arb.functions.integer.FractionSequence;
import arb.utensils.ShellFunctions;

public class F implements
               FractionSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ0001 = new Integer("1");
  public Integer       vℤ0002 = new Integer();
  public Fraction      vf0002 = new Fraction();
  public Fraction      vf0001 = new Fraction();
  public C             C;
  public Real          α;
  public Real          β;

  public static void main( String args[] )
  {
    F F = new F();
    F.α = RealConstants.negHalf;
    F.β = RealConstants.negHalf;
    ShellFunctions.inspect(F);
    var F3 = F.evaluate(3, 128);
    ShellFunctions.inspect(F);

    System.out.println(F + "(3)=" + F3);
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

    return ((Fraction) this.C.evaluate(n.sub(this.cℤ0001, bits, this.vℤ0002),
                                       order,
                                       bits,
                                       this.vf0001)).mul((Fraction) this.C.evaluate(n, order, bits, this.vf0002),
                                                         bits,
                                                         result);
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
      throw new AssertionError("F.α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("F.β is null");
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
    this.vℤ0002.close();
    this.vf0002.close();
    this.vf0001.close();
    this.C.close();
  }

  @Override
  public String toString()
  {
    return "F:n➔C(n-1)*C(n)";
  }

  @Override
  public String typeset()
  {
    return "\\C(\\left(n-1\\right)) \\cdot \\C(n)";
  }
}
