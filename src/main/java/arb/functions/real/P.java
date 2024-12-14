package arb.functions.real;

import arb.*;
import arb.Integer;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.integer.Sequence;
import arb.functions.rational.RationalFunctionSequence;
import arb.utensils.ShellFunctions;
import arb.utensils.Utensils;

public class P implements
               RationalFunctionSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public Expression<Integer, RationalFunction, RationalFunctionSequence> expression()
  {
    return Sequence.parse("P", RationalFunctionSequence.class, RationalFunction.class, toString());
  }

  public static void main(String args[])
  {
    P   P    = new P();
    var expr = P.expression();
    var f = expr.instantiate();
    
//    P.α = RealConstants.negHalf;
//    P.β = RealConstants.negHalf;
//
//    var P3 = P.evaluate(3, 128);
//    ShellFunctions.inspect(P);
//
//    System.out.println(P + "(3)=" + P3);
  }

  public A                A;

  public B                B;
  public C                C;
  public final Integer    cℤ0001 = new Integer("0");
  public final Integer    cℤ0002 = new Integer("1");
  public final Integer    cℤ0003 = new Integer("2");
  public E                E;
  public boolean          isInitialized;
  public P                P;
  public Fraction         vf0010 = new Fraction();
  public Fraction         vf0011 = new Fraction();
  public Fraction         vf0012 = new Fraction();
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
  public RationalFunction vℚ0016 = new RationalFunction();
  public Integer          vℤ0005 = new Integer();
  public Integer          vℤ0006 = new Integer();
  public Real             α;
  public Real             β;

  public P()
  {
    super();
    System.err.println("newP " + Utensils.stackTraceToString(new Throwable()));
    System.err.flush();
  }

  @Override
  public void close()
  {
    cℤ0002.close();
    cℤ0001.close();
    cℤ0003.close();
    vf0010.close();
    vℚ0015.close();
    vℤ0006.close();
    vℚ0016.close();
    vℚ0006.close();
    vℚ0007.close();
    vℚ0008.close();
    vℚ0009.close();
    vℤ0005.close();
    vℚ0010.close();
    vℚ0011.close();
    vℚ0012.close();
    vℚ0013.close();
    vℚ0014.close();
    vf0012.close();
    vf0011.close();
    P.close();
    A.close();
    B.close();
    C.close();
    E.close();
  }

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  protected void constructReferencedFunctions()
  {
    if (A == null)
    {
      A = new A();
    }

    if (B == null)
    {
      B = new B();
    }

    if (C == null)
    {
      C = new C();
    }

    if (E == null)
    {
      E = new E();
    }
    P     = new P();
    P.A   = A;
    P.A.F = A.F = new F();
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
    case 0 -> result.set(vℚ0006.set(cℤ0002));
    case 1 -> C.evaluate(cℤ0002, order, bits, vf0010)
               .mul(vℚ0007.identity(), bits, vℚ0008)
               .sub(β, bits, vℚ0009)
               .add(α, bits, vℚ0010)
               .div(cℤ0003, bits, result);
    default -> A.evaluate(n, order, bits, vℚ0011)
                .mul(P.evaluate(n.sub(cℤ0002, bits, vℤ0005), order, bits, vℚ0012), bits, vℚ0013)
                .sub(B.evaluate(n, order, bits, vf0011)
                      .mul(P.evaluate(n.sub(cℤ0003, bits, vℤ0006), order, bits, vℚ0014), bits, vℚ0015),
                     bits,
                     vℚ0016)
                .div(E.evaluate(n, order, bits, vf0012), bits, result);
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
      constructReferencedFunctions();

      injectVariableReferences();

      P.C           = B.C = E.C = A.C = A.F.C = C;
      P.A           = A;
      P.B           = B;
      P.E           = E;
      isInitialized = true;
    }
  }

  protected void injectVariableReferences()
  {
    A.α = B.α = C.α = E.α = P.α = A.F.α = α;
    A.β = B.β = C.β = E.β = P.β = A.F.β = β;
  }

  @Override
  public String toString()
  {
    return "n➔When[cases=[0=1, 1=((C(1)*x)-β+α)/2],default=((A(n)*P(n-1))-(B(n)*P(n-2)))/E(n)]";
  }

  public String intermediateStates()
  {
    return String.format("P[cℤ0001=%s, cℤ0002=%s, cℤ0003=%s, vf0010=%s, vf0011=%s, vf0012=%s, vℚ0006=%s, vℚ0007=%s, vℚ0008=%s, vℚ0009=%s, vℚ0010=%s, vℚ0011=%s, vℚ0012=%s, vℚ0013=%s, vℚ0014=%s, vℚ0015=%s, vℚ0016=%s, vℤ0005=%s, vℤ0006=%s]",
                         cℤ0001,
                         cℤ0002,
                         cℤ0003,
                         vf0010,
                         vf0011,
                         vf0012,
                         vℚ0006,
                         vℚ0007,
                         vℚ0008,
                         vℚ0009,
                         vℚ0010,
                         vℚ0011,
                         vℚ0012,
                         vℚ0013,
                         vℚ0014,
                         vℚ0015,
                         vℚ0016,
                         vℤ0005,
                         vℤ0006);
  }

  @Override
  public String typeset()
  {
    return "1, \\frac{\\left(\\C(1) \\cdot x-β\\right) + α}{2} \text{otherwise} \\frac{\\left(\\A(n) \\cdot \\P(\\left(n-1\\right))-\\B(n) \\cdot \\P(\\left(n-2\\right))\\right)}{\\E(n)}";
  }
}
