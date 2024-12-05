package arb.functions.real;

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
  public final Integer    cℤ2;
  public final Integer    cℤ1;
  public Real             iℝ8;
  public RationalFunction iℚ5;
  public RationalFunction iℚ2;
  public RationalFunction iℚ1;
  public RationalFunction iℚ4;
  public Real             iℝ7;
  public Real             iℝ6;
  public RationalFunction iℚ3;
  public C                C = new C();
  public F                F = new F();
  public G                G = new G();
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

    return ((Real) this.F.evaluate(n, order, bits, this.iℝ6)).mul(this.iℚ1.identity(), bits, this.iℚ2)
                                                             .add((RationalFunction) this.G.evaluate(null,
                                                                                                     order,
                                                                                                     bits,
                                                                                                     this.iℚ3),
                                                                  bits,
                                                                  this.iℚ4)
                                                             .mul(((Real) this.C.evaluate(n,
                                                                                          order,
                                                                                          bits,
                                                                                          this.iℝ7)).sub(this.cℤ1,
                                                                                                         bits,
                                                                                                         this.iℝ8),
                                                                  bits,
                                                                  this.iℚ5)
                                                             .div(this.cℤ2, bits, result);
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
      this.C.α           = this.α;
      this.C.β           = this.β;
      this.F.α           = this.α;
      this.F.β           = this.β;
      this.G.α           = this.α;
      this.G.β           = this.β;
      this.isInitialized = true;
    }
  }

  public A()
  {
    this.cℤ2 = new Integer("2");
    this.cℤ1 = new Integer("1");
    this.iℝ8 = new Real();
    this.iℚ5 = new RationalFunction();
    this.iℚ2 = new RationalFunction();
    this.iℚ1 = new RationalFunction();
    this.iℚ4 = new RationalFunction();
    this.iℝ7 = new Real();
    this.iℝ6 = new Real();
    this.iℚ3 = new RationalFunction();
  }

  @Override
  public void close()
  {
    this.cℤ2.close();
    this.cℤ1.close();
    this.iℝ8.close();
    this.iℚ5.close();
    this.iℚ2.close();
    this.iℚ1.close();
    this.iℚ4.close();
    this.iℝ7.close();
    this.iℝ6.close();
    this.iℚ3.close();
    this.C.close();
    this.F.close();
    this.G.close();
  }

  @Override
  public String toString()
  {
    return "A:n➔(F(n)*x+G())*(C(n)-1)/2";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\F(n) \\cdot x + \\G() \\cdot \\left(\\C(n)-1\\right)}{2}";
  }
}
