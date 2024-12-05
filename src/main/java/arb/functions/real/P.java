package arb.functions.real;

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
  public final Integer    cℤ2;
  public final Integer    cℤ1;
  public final Integer    cℤ4;
  public final Real       cℝ3;
  public RationalFunction iℚ6;
  public RationalFunction iℚ8;
  public RationalFunction iℚ7;
  public RationalFunction iℚ9;
  public Real             iℝ19;
  public Real             iℝ18;
  public RationalFunction iℚ14;
  public RationalFunction iℚ15;
  public RationalFunction iℚ16;
  public RationalFunction iℚ10;
  public RationalFunction iℚ11;
  public RationalFunction iℚ12;
  public Integer          iℤ6;
  public Real             iℝ20;
  public Integer          iℤ5;
  public RationalFunction iℚ13;
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
    case 0 -> result.set(iℚ6.set(cℤ2));
    case 1 -> C.evaluate(cℤ2, order, bits, iℝ18)
               .mul(iℚ7.identity(), bits, iℚ8)
               .sub(β, bits, iℚ9)
               .add(α, bits, iℚ10)
               .div(cℝ3, bits, result);
    default -> A.evaluate(n, order, bits, iℚ11)
                .mul(P.evaluate(n.sub(cℤ2, bits, iℤ5), order, bits, iℚ12), bits, iℚ13)
                .sub(B.evaluate(n, order, bits, iℝ19)
                      .mul(P.evaluate(n.sub(cℤ4, bits, iℤ6), order, bits, iℚ14), bits, iℚ15),
                     bits,
                     iℚ16)
                .div(E.evaluate(n, order, bits, iℝ20), bits, result);
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

  public P()
  {
    cℤ2  = new Integer("1");
    cℤ1  = new Integer("0");
    cℤ4  = new Integer("2");
    cℝ3  = new Real("2.0",
                    128);
    iℚ6  = new RationalFunction();
    iℚ8  = new RationalFunction();
    iℚ7  = new RationalFunction();
    iℚ9  = new RationalFunction();
    iℝ19 = new Real();
    iℝ18 = new Real();
    iℚ14 = new RationalFunction();
    iℚ15 = new RationalFunction();
    iℚ16 = new RationalFunction();
    iℚ10 = new RationalFunction();
    iℚ11 = new RationalFunction();
    iℚ12 = new RationalFunction();
    iℤ6  = new Integer();
    iℝ20 = new Real();
    iℤ5  = new Integer();
    iℚ13 = new RationalFunction();
  }

  @Override
  public void close()
  {
    cℤ2.close();
    cℤ1.close();
    cℤ4.close();
    cℝ3.close();
    iℚ6.close();
    iℚ8.close();
    iℚ7.close();
    iℚ9.close();
    iℝ19.close();
    iℝ18.close();
    iℚ14.close();
    iℚ15.close();
    iℚ16.close();
    iℚ10.close();
    iℚ11.close();
    iℚ12.close();
    iℤ6.close();
    iℝ20.close();
    iℤ5.close();
    iℚ13.close();
    P.close();
    A.close();
    B.close();
    C.close();
    E.close();
  }

  @Override
  public String toString()
  {
    return "P:n➔when(n=0,1,n=1,(C(1)*x-β+α)/2.0,else,(A(n)*P(n-1)-B(n)*P(n-2))/E(n))";
  }

  @Override
  public String typeset()
  {
    return "1, \\frac{\\left(\\C(1) \\cdot x-β\\right) + α}{2.0} \text{otherwise} \\frac{\\left(\\A(n) \\cdot \\P(\\left(n-1\\right))-\\B(n) \\cdot \\P(\\left(n-2\\right))\\right)}{\\E(n)}";
  }
}
