package arb.functions.real;

import arb.*;
import arb.Integer;
import arb.functions.rational.RationalFunctionSequence;
import arb.utensils.ShellFunctions;

public class P implements
               RationalFunctionSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public static void main(String args[])
  {
    P P = new P();
    P.α = RealConstants.negHalf;
    P.β = RealConstants.negHalf;
    C C = new C();
    A A = new A();
    F F = new F();
    B B = new B();
    E E = new E();

    E.C = C;
    F.C = C;
    A.C = C;
    A.F = F;
    P.A = A;
    P.B = B;
    P.C = C;
    P.E = E;

    B.C = C;
    var P3 = P.evaluate(6, 128);
    ShellFunctions.inspect(P);

    System.out.println(P + "(3)=" + P3);
  }

  public boolean          isInitialized;
  public final Integer    cℤ0002 = new Integer("1");
  public final Integer    cℤ0001 = new Integer("0");
  public final Integer    cℤ0003 = new Integer("2");
  public Fraction         vf0010 = new Fraction();
  public RationalFunction vℚ0015 = new RationalFunction();
  public Integer          vℤ0006 = new Integer();
  public RationalFunction vℚ0016 = new RationalFunction();
  public RationalFunction vℚ0006 = new RationalFunction();
  public RationalFunction vℚ0007 = new RationalFunction();
  public RationalFunction vℚ0008 = new RationalFunction();
  public RationalFunction vℚ0009 = new RationalFunction();
  public Integer          vℤ0005 = new Integer();
  public RationalFunction vℚ0010 = new RationalFunction();
  public RationalFunction vℚ0011 = new RationalFunction();
  public RationalFunction vℚ0012 = new RationalFunction();
  public RationalFunction vℚ0013 = new RationalFunction();
  public RationalFunction vℚ0014 = new RationalFunction();
  public Fraction         vf0012 = new Fraction();
  public Fraction         vf0011 = new Fraction();
  public C                C;
  public E                E;
  public B                B;
  public A                A;
  public P                P;
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
    return switch (n.getSignedValue())
    {
    case 0 -> result.set(this.vℚ0006.set(this.cℤ0002));
    case 1 -> ((Fraction) this.C.evaluate(this.cℤ0002, order, bits, this.vf0010))
                                                                                 .mul(this.vℚ0007.identity(),
                                                                                      bits,
                                                                                      this.vℚ0008)
                                                                                 .sub(this.β, bits, this.vℚ0009)
                                                                                 .add(this.α, bits, this.vℚ0010)
                                                                                 .div(this.cℤ0003, bits, result);
    default ->
            ((RationalFunction) this.A.evaluate(n,
                                                order,
                                                bits,
                                                this.vℚ0011)).mul((RationalFunction) this.P.evaluate(n.sub(this.cℤ0002, bits, this.vℤ0005), order, bits, this.vℚ0012), bits, this.vℚ0013).sub(((Fraction) this.B.evaluate(n, order, bits, this.vf0011)).mul((RationalFunction) this.P.evaluate(n.sub(this.cℤ0003, bits, this.vℤ0006), order, bits, this.vℚ0014), bits, this.vℚ0015), bits, this.vℚ0016).div((Fraction) this.E.evaluate(n, order, bits, this.vf0012), bits, result);
    };
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
      throw new AssertionError("P.α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("P.β is null");
    }
    else
    {
      if (this.A == null)
      {
        this.A = new A();
      }

      if (this.B == null)
      {
        this.B = new B();
      }

      if (this.C == null)
      {
        this.C = new C();
      }

      if (this.E == null)
      {
        this.E = new E();
      }

      this.A.α = this.α;
      this.A.β = this.β;
      this.B.α = this.α;
      this.B.β = this.β;
      this.C.α = this.α;
      this.C.β = this.β;
      this.E.α = this.α;
      this.E.β = this.β;
    
        P = new P();
   
      
      this.P.α           = this.α;
      this.P.β           = this.β;
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ0002.close();
    this.cℤ0001.close();
    this.cℤ0003.close();
    this.vf0010.close();
    this.vℚ0015.close();
    this.vℤ0006.close();
    this.vℚ0016.close();
    this.vℚ0006.close();
    this.vℚ0007.close();
    this.vℚ0008.close();
    this.vℚ0009.close();
    this.vℤ0005.close();
    this.vℚ0010.close();
    this.vℚ0011.close();
    this.vℚ0012.close();
    this.vℚ0013.close();
    this.vℚ0014.close();
    this.vf0012.close();
    this.vf0011.close();
    this.P.close();
    this.A.close();
    this.B.close();
    this.C.close();
    this.E.close();
  }

  @Override
  public String toString()
  {
    return "P:n➔When[cases=[0=1, 1=((C(1)*x)-β+α)/2],default=((A(n)*P(n-1))-(B(n)*P(n-2)))/E(n)]";
  }

  @Override
  public String typeset()
  {
    return "1, \\frac{\\left(\\C(1) \\cdot x-β\\right) + α}{2} \text{otherwise} \\frac{\\left(\\A(n) \\cdot \\P(\\left(n-1\\right))-\\B(n) \\cdot \\P(\\left(n-2\\right))\\right)}{\\E(n)}";
  }
}
