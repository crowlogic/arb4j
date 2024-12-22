package arb.functions;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.rational.RationalFunctionSequence;

public class P implements
               RationalFunctionSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public static void main(String args[])
  {
    Context context = new Context(Real.named("α").set(RealConstants.negHalf),
                                  Real.named("β").set(RealConstants.negHalf));
    P       P       = new P();
    context.injectReferences(P);
    var P3 = P.evaluate(3, 128);
    System.out.println("P3=" + P3);
  }

  public boolean          isInitialized;
  public final Integer    cℤ0000 = new Integer("0");
  public final Integer    cℤ0001 = new Integer("1");
  public final Integer    cℤ0002 = new Integer("2");
  public Fraction         vf0018 = new Fraction();
  public Fraction         vf0019 = new Fraction();
  public Fraction         vf0020 = new Fraction();
  public Fraction         vf0021 = new Fraction();
  public RationalFunction vℚ0005 = new RationalFunction();
  public RationalFunction vℚ0006 = new RationalFunction();
  public RationalFunction vℚ0007 = new RationalFunction();
  public RationalFunction vℚ0008 = new RationalFunction();
  public RationalFunction vℚ0009 = new RationalFunction();
  public RationalFunction vℚ0010 = new RationalFunction();
  public RationalFunction vℚ0011 = new RationalFunction();
  public RationalFunction vℚ0012 = new RationalFunction();
  public RationalFunction vℚ0013 = new RationalFunction();
  public RationalFunction vℚ0014 = new RationalFunction();
  public RationalFunction vℚ0015 = new RationalFunction();
  public Integer          vℤ0001 = new Integer();
  public Integer          vℤ0002 = new Integer();
  public P                P;
  public E                E;
  public B                B;
  public A                A;
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
    return switch (n.getSignedValue())
    {
    case 0 -> result.set(this.vℚ0005.set(this.cℤ0001));
    case 1 -> ((Fraction) this.C.evaluate(this.vf0018.set(this.cℤ0001),
                                          order,
                                          bits,
                                          this.vf0019)).mul(this.vℚ0006.identity(), bits, this.vℚ0007)
                                                       .sub(this.β, bits, this.vℚ0008)
                                                       .add(this.α, bits, this.vℚ0009)
                                                       .div(this.cℤ0002, bits, result);
    default ->
            ((RationalFunction) this.A.evaluate(n,
                                                order,
                                                bits,
                                                this.vℚ0010)).mul((RationalFunction) this.P.evaluate(n.sub(this.cℤ0001, bits, this.vℤ0001), order, bits, this.vℚ0011), bits, this.vℚ0012).sub(((Fraction) this.B.evaluate(n, order, bits, this.vf0020)).mul((RationalFunction) this.P.evaluate(n.sub(this.cℤ0002, bits, this.vℤ0002), order, bits, this.vℚ0013), bits, this.vℚ0014), bits, this.vℚ0015).div((Fraction) this.E.evaluate(n, order, bits, this.vf0021), bits, result);
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
      if (this.E == null)
      {
        this.E = new E();
      }

      this.E.α = this.α;
      this.E.β = this.β;
      if (this.B == null)
      {
        this.B = new B();
      }

      this.B.α = this.α;
      this.B.β = this.β;
      if (this.A == null)
      {
        this.A = new A();
      }

      this.A.α = this.α;
      this.A.β = this.β;
      if (this.C == null)
      {
        this.C = A.C = B.C = E.C = new C();
      } 

      this.C.α           = this.α;
      this.C.β           = this.β;
      this.P           = new P();
      this.P.α           = this.α;
      this.P.β           = this.β;
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ0000.close();
    this.cℤ0001.close();
    this.cℤ0002.close();
    this.vf0018.close();
    this.vf0019.close();
    this.vf0020.close();
    this.vf0021.close();
    this.vℚ0005.close();
    this.vℚ0006.close();
    this.vℚ0007.close();
    this.vℚ0008.close();
    this.vℚ0009.close();
    this.vℚ0010.close();
    this.vℚ0011.close();
    this.vℚ0012.close();
    this.vℚ0013.close();
    this.vℚ0014.close();
    this.vℚ0015.close();
    this.vℤ0001.close();
    this.vℤ0002.close();
    this.P.close();
    this.A.close();
    this.B.close();
    this.C.close();
    this.E.close();
  }

  @Override
  public String toString()
  {
    return "P:n➔when(n=0,1,n=1,((C(1)*x)-β+α)/2,else,((A(n)*P(n-1))-(B(n)*P(n-2)))/E(n))";
  }

  @Override
  public String typeset()
  {
    return "1, \\frac{\\left(\\C(1) \\cdot x-β\\right) + α}{2} \text{otherwise} \\frac{\\left(\\A(n) \\cdot \\P(\\left(n-1\\right))-\\B(n) \\cdot \\P(\\left(n-2\\right))\\right)}{\\E(n)}";
  }
}
