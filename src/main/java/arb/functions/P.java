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
  public Fraction         vf0018 = new Fraction();
  public Fraction         vf0019 = new Fraction();
  public Fraction         vf0020 = new Fraction();
  public Fraction         vf0021 = new Fraction();
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
  public C                C;
  public E                E;
  public B                B;
  public A                A;
  public P                P;
  public Real             α;
  public Real             β;
  public F F;

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  @Override
  public RationalFunction evaluate(Integer n, int order, int bits, RationalFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }
    return switch (n.getSignedValue())
    {
    case 0 -> result.set(1);
    case 1 -> C.evaluate(vf0018.set(1), order, bits, vf0019)
               .mul(vℚ0006.identity(), bits, vℚ0007)
               .sub(β, bits, vℚ0008)
               .add(α, bits, vℚ0009)
               .div(2, bits, result);
    default -> A.evaluate(n, order, bits, vℚ0010)
                .mul(P.evaluate(n.sub(1, bits, vℤ0001), order, bits, vℚ0011), bits, vℚ0012)
                .sub(B.evaluate(n, order, bits, vf0020)
                      .mul(P.evaluate(n.sub(2, bits, vℤ0002), order, bits, vℚ0013), bits, vℚ0014),
                     bits,
                     vℚ0015)
                .div(E.evaluate(n, order, bits, vf0021), bits, result);
    };
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (α == null)
    {
      throw new AssertionError("P.α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("P.β is null");
    }
    else
    {
      if (A == null)
      {
        A = new A();
      }

      if (B == null)
      {
        B = new B();
      }
      if (E == null)
      {
        E = new E();
      }
      if (F == null)
      {
       F = A.F = new F();
      }
      if (C == null)
      {
        C = A.C = B.C = E.C = F.C = new C();
      }


      A.α           = α;
      A.β           = β;
      B.α           = α;
      B.β           = β;
      C.α           = α;
      C.β           = β;
      E.α           = α;
      E.β           = β;
      P             = new P();
      P.α           = α;
      P.β           = β;
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    vf0018.close();
    vf0019.close();
    vf0020.close();
    vf0021.close();
    vℚ0006.close();
    vℚ0007.close();
    vℚ0008.close();
    vℚ0009.close();
    vℚ0010.close();
    vℚ0011.close();
    vℚ0012.close();
    vℚ0013.close();
    vℚ0014.close();
    vℚ0015.close();
    vℤ0001.close();
    vℤ0002.close();
    P.close();
    A.close();
    B.close();
    C.close();
    E.close();
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
