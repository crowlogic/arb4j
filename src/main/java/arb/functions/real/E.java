package arb.functions.real;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.Typesettable;
import arb.functions.integer.FractionSequence;
import arb.utensils.ShellFunctions;
import arb.utensils.Utensils;

public class E implements
               FractionSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ0002 = new Integer("1");
  public final Integer cℤ0001 = new Integer("2");
  public Integer       vℤ0003 = new Integer();
  public Integer       vℤ0004 = new Integer();
  public Fraction      vf0008 = new Fraction();
  public Fraction      vf0007 = new Fraction();
  public Fraction      vf0006 = new Fraction();
  public C             C;
  public Real          α;
  public Real          β;

  public E()
  {
    super();
    System.err.println("newE " + Utensils.stackTraceToString(new Throwable( )) );
    System.err.flush();
  }
  
  @Override
  public Class<Fraction> coDomainType()
  {
    return Fraction.class;
  }

  public static void main( String args[] )
  {
    E E = new E();
    E.α = RealConstants.negHalf;
    E.β = RealConstants.negHalf;
    ShellFunctions.inspect(E);
    var E3 = E.evaluate(3, 128);
    ShellFunctions.inspect(E);

    System.out.println(E + "(3)=" + E3);
  }
  @Override
  public Fraction evaluate(Integer n, int order, int bits, Fraction result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    return n.mul((Fraction) this.C.evaluate(n.div(this.cℤ0001, bits, this.vℤ0003), order, bits, this.vf0006),
                 bits,
                 this.vf0007)
            .mul((Fraction) this.C.evaluate(n.sub(this.cℤ0002, bits, this.vℤ0004), order, bits, this.vf0008),
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
      throw new AssertionError("E.α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("E.β is null");
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
    this.cℤ0002.close();
    this.cℤ0001.close();
    this.vℤ0003.close();
    this.vℤ0004.close();
    this.vf0008.close();
    this.vf0007.close();
    this.vf0006.close();
    this.C.close();
  }

  @Override
  public String toString()
  {
    return "E:n➔n*C(n/2)*C(n-1)";
  }

  @Override
  public String typeset()
  {
    return "n \\cdot \\C(\\frac{n}{2}) \\cdot \\C(\\left(n-1\\right))";
  }
}
