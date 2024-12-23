package arb.functions;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;
import arb.functions.rational.RationalFunctionSequence;

public class A implements
               RationalFunctionSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean          isInitialized;
  public final Integer    cℤ0000 = new Integer("1");
  public final Integer    cℤ0001 = new Integer("2");
  public Fraction         vf0006 = new Fraction();
  public Fraction         vf0007 = new Fraction();
  public Fraction         vf0008 = new Fraction();
  public Fraction         vf0009 = new Fraction();
  public Fraction         vf0010 = new Fraction();
  public RationalFunction vℚ0001 = new RationalFunction();
  public RationalFunction vℚ0002 = new RationalFunction();
  public RationalFunction vℚ0003 = new RationalFunction();
  public RationalFunction vℚ0004 = new RationalFunction();
  public G                G;
  public F                F;
  public C                C;
  public Real             α;
  public Real             β;

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  @Override
  public RationalFunction evaluate(Integer n, int order, int bits, RationalFunction result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    return ((Fraction) this.F.evaluate(n,
                                       order,
                                       bits,
                                       this.vf0006)).mul(this.vℚ0001.identity(), bits, this.vℚ0002)
                                                    .add((Fraction) this.G.evaluate(null, order, bits, this.vf0007),
                                                         bits,
                                                         this.vℚ0003)
                                                    .mul(((Fraction) this.C.evaluate(this.vf0008.set(n),
                                                                                     order,
                                                                                     bits,
                                                                                     this.vf0009)).sub(this.cℤ0000,
                                                                                                       bits,
                                                                                                       this.vf0010),
                                                         bits,
                                                         this.vℚ0004)
                                                    .div(this.cℤ0001, bits, result);
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
      throw new AssertionError("A.α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("A.β is null");
    }
    else
    {
      if (this.G == null)
      {
        this.G = new G();
      }

      this.G.α = this.α;
      this.G.β = this.β;
      if (this.F == null)
      {
        this.F = new F();
      }

      this.F.α = this.α;
      this.F.β = this.β;
      if (this.C == null)
      {
        this.C = new C();
      }
      F.C = C;
      
      this.C.α           = this.α;
      this.C.β           = this.β;
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ0000.close();
    this.cℤ0001.close();
    this.vf0006.close();
    this.vf0007.close();
    this.vf0008.close();
    this.vf0009.close();
    this.vf0010.close();
    this.vℚ0001.close();
    this.vℚ0002.close();
    this.vℚ0003.close();
    this.vℚ0004.close();
    this.C.close();
    this.F.close();
    this.G.close();
  }

  @Override
  public String toString()
  {
    return "A:n➔(F(n)*x+G(null)*C(n)-1)/2";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\F(n) \\cdot x + \\G() \\cdot \\left(\\C(n)-1\\right)}{2}";
  }
}
