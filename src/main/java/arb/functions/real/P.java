package arb.functions.real;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;
import arb.functions.rational.RationalFunctionSequence;

public class P implements
               RationalFunctionSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean          isInitialized;
  public final Integer    cℤ0002;
  public final Integer    cℤ0001;
  public final Integer    cℤ0003;
  public RationalFunction ℚ0006;
  public RationalFunction ℚ0007;
  public RationalFunction ℚ0008;
  public RationalFunction ℚ0009;
  public Integer          ℤ0005;
  public RationalFunction ℚ0013;
  public RationalFunction ℚ0014;
  public RationalFunction ℚ0015;
  public Integer          ℤ0006;
  public RationalFunction ℚ0016;
  public Fraction         f0012;
  public RationalFunction ℚ0010;
  public Fraction         f0011;
  public Fraction         f0010;
  public RationalFunction ℚ0011;
  public RationalFunction ℚ0012;
  public P                P;
  public A                A = new A();
  public B                B = new B();
  public C                C = new C();
  public E                E = new E();
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
    if (!isInitialized)
    {
      initialize();
    }
    return switch (n.getSignedValue())
    {
    case 0 -> result.set(ℚ0006.set(cℤ0002));
    case 1 -> C.evaluate(cℤ0002, order, bits, f0010)
               .mul(ℚ0007.identity(), bits, ℚ0008)
               .sub(β, bits, ℚ0009)
               .add(α, bits, ℚ0010)
               .div(cℤ0003, bits, result);
    default -> A.evaluate(n, order, bits, ℚ0011)
                .mul(P.evaluate(n.sub(cℤ0002, bits, ℤ0005), order, bits, ℚ0012), bits, ℚ0013)
                .sub(B.evaluate(n, order, bits, f0011)
                      .mul(P.evaluate(n.sub(cℤ0003, bits, ℤ0006), order, bits, ℚ0014), bits, ℚ0015),
                     bits,
                     ℚ0016)
                .div(E.evaluate(n, order, bits, f0012), bits, result);
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
      C             = new C();
      A.C           = C;
      A.α           = α;
      A.β           = β;
      B.C           = C;
      B.α           = α;
      B.β           = β;
      C.α           = α;
      A.F.C         = C;
      C.β           = β;
      E.C           = C;
      E.α           = α;
      E.β           = β;
      
      P             = new P();
      P.α           = α;
      P.β           = β;
      isInitialized = true;
    }
  }

  public P()
  {
    cℤ0002 = new Integer("1");
    cℤ0001 = new Integer("0");
    cℤ0003 = new Integer("2");
    ℚ0006  = new RationalFunction();
    ℚ0007  = new RationalFunction();
    ℚ0008  = new RationalFunction();
    ℚ0009  = new RationalFunction();
    ℤ0005  = new Integer();
    ℚ0013  = new RationalFunction();
    ℚ0014  = new RationalFunction();
    ℚ0015  = new RationalFunction();
    ℤ0006  = new Integer();
    ℚ0016  = new RationalFunction();
    f0012  = new Fraction();
    ℚ0010  = new RationalFunction();
    f0011  = new Fraction();
    f0010  = new Fraction();
    ℚ0011  = new RationalFunction();
    ℚ0012  = new RationalFunction();
  }

  @Override
  public void close()
  {
    cℤ0002.close();
    cℤ0001.close();
    cℤ0003.close();
    ℚ0006.close();
    ℚ0007.close();
    ℚ0008.close();
    ℚ0009.close();
    ℤ0005.close();
    ℚ0013.close();
    ℚ0014.close();
    ℚ0015.close();
    ℤ0006.close();
    ℚ0016.close();
    f0012.close();
    ℚ0010.close();
    f0011.close();
    f0010.close();
    ℚ0011.close();
    ℚ0012.close();
    P.close();
    A.close();
    B.close();
    C.close();
    E.close();
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
