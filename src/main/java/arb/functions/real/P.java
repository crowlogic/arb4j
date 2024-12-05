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
    if (!this.isInitialized)
    {
      this.initialize();
    }
    return switch (n.getSignedValue())
    {
    case 0 -> result.set(this.iℚ6.set(this.cℤ2));
    case 1 -> ((Real) this.C.evaluate(this.cℤ2, order, bits, this.iℝ18)).mul(this.iℚ7.identity(), bits, this.iℚ8)
                                                                        .sub(this.β, bits, this.iℚ9)
                                                                        .add(this.α, bits, this.iℚ10)
                                                                        .div(this.cℝ3, bits, result);
    default -> ((RationalFunction) this.A.evaluate(n,
                                                   order,
                                                   bits,
                                                   this.iℚ11)).mul((RationalFunction) this.P.evaluate(n.sub(this.cℤ2, bits, this.iℤ5), order, bits, this.iℚ12), bits, this.iℚ13).sub(((Real) this.B.evaluate(n, order, bits, this.iℝ19)).mul((RationalFunction) this.P.evaluate(n.sub(this.cℤ4, bits, this.iℤ6), order, bits, this.iℚ14), bits, this.iℚ15), bits, this.iℚ16).div((Real) this.E.evaluate(n, order, bits, this.iℝ20), bits, result);
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
      this.A.α           = this.α;
      this.A.β           = this.β;
      this.B.α           = this.α;
      this.B.β           = this.β;
      this.C.α           = this.α;
      this.C.β           = this.β;
      this.E.α           = this.α;
      this.E.β           = this.β;
      this.P             = new P();
      this.P.α           = this.α;
      this.P.β           = this.β;
      this.isInitialized = true;
    }
  }

  public P()
  {
    this.cℤ2  = new Integer("1");
    this.cℤ1  = new Integer("0");
    this.cℤ4  = new Integer("2");
    this.cℝ3  = new Real("2.0",
                         128);
    this.iℚ6  = new RationalFunction();
    this.iℚ8  = new RationalFunction();
    this.iℚ7  = new RationalFunction();
    this.iℚ9  = new RationalFunction();
    this.iℝ19 = new Real();
    this.iℝ18 = new Real();
    this.iℚ14 = new RationalFunction();
    this.iℚ15 = new RationalFunction();
    this.iℚ16 = new RationalFunction();
    this.iℚ10 = new RationalFunction();
    this.iℚ11 = new RationalFunction();
    this.iℚ12 = new RationalFunction();
    this.iℤ6  = new Integer();
    this.iℝ20 = new Real();
    this.iℤ5  = new Integer();
    this.iℚ13 = new RationalFunction();
  }

  @Override
  public void close()
  {
    this.cℤ2.close();
    this.cℤ1.close();
    this.cℤ4.close();
    this.cℝ3.close();
    this.iℚ6.close();
    this.iℚ8.close();
    this.iℚ7.close();
    this.iℚ9.close();
    this.iℝ19.close();
    this.iℝ18.close();
    this.iℚ14.close();
    this.iℚ15.close();
    this.iℚ16.close();
    this.iℚ10.close();
    this.iℚ11.close();
    this.iℚ12.close();
    this.iℤ6.close();
    this.iℝ20.close();
    this.iℤ5.close();
    this.iℚ13.close();
    this.P.close();
    this.A.close();
    this.B.close();
    this.C.close();
    this.E.close();
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
