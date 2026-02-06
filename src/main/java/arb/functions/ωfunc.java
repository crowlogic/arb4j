package arb.functions;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.integer.RealSequence;

public class ωfunc implements
                   RealSequence,
                   Typesettable,
                   AutoCloseable,
                   Initializable,
                   Named
{
  public boolean         isInitialized;
  public Context         context = new Context();
  public final Integer   cℤ0000  = new Integer("1");
  public Real            vℝ0055  = new Real();
  public Real            vℝ0056  = new Real();
  public Real            vℝ0057  = new Real();
  public Real            vℝ0058  = new Real();
  public Real            vℝ0059  = new Real();
  public Real            vℝ0060  = new Real();
  public Real            vℝ0061  = new Real();
  public Real            vℝ0062  = new Real();
  public Real            vℝ0063  = new Real();
  public Real            vℝ0064  = new Real();
  public Real            vℝ0065  = new Real();
  public Real            vℝ0066  = new Real();
  public Real            vℝ0067  = new Real();
  public Real            vℝ0068  = new Real();
  public Real            vℝ0069  = new Real();
  public Real            vℝ0070  = new Real();
  public Real            vℝ0071  = new Real();
  public Real            vℝ0072  = new Real();
  public Real            vℝ0073  = new Real();
  public Real            vℝ0074  = new Real();
  public Real            vℝ0075  = new Real();
  public Integer         vℤ0004  = new Integer();
  public Integer         vℤ0005  = new Integer();
  public Integer         vℤ0006  = new Integer();
  public AlgebraicNumber v𝔸0001 = new AlgebraicNumber();
  public Integer         j;
  public Real            α;
  public Real            β;
  public Real            γ;

  @Override
  public Class<Integer> domainType()
  {
    return Integer.class;
  }

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Integer k, int order, int bits, Real result)
  {
    if (order > 1)
    {
      throw new AssertionError("TODO: implement order=" + order + ">1");
    }
    else
    {
      if (!this.isInitialized)
      {
        this.initialize();
      }

      return this.cℤ0000.neg(this.vℤ0004)
                        .pow(this.j.sub(k, bits, this.vℤ0005), bits, this.v𝔸0001)
                        .mul(this.j.add(this.β, bits, this.vℝ0055)
                                   .add(this.cℤ0000, bits, this.vℝ0056)
                                   .Γ(bits, this.vℝ0057),
                             bits,
                             this.vℝ0058)
                        .mul(this.j.add(k, bits, this.vℤ0006)
                                   .add(this.α, bits, this.vℝ0059)
                                   .add(this.β, bits, this.vℝ0060)
                                   .add(this.cℤ0000, bits, this.vℝ0061)
                                   .Γ(bits, this.vℝ0062),
                             bits,
                             this.vℝ0063)
                        .div(k.add(this.β, bits, this.vℝ0064)
                              .add(this.cℤ0000, bits, this.vℝ0065)
                              .Γ(bits, this.vℝ0066)
                              .mul(this.j.add(this.α, bits, this.vℝ0067)
                                         .add(this.β, bits, this.vℝ0068)
                                         .add(this.cℤ0000, bits, this.vℝ0069)
                                         .Γ(bits, this.vℝ0070),
                                   bits,
                                   this.vℝ0071)
                              .mul(this.vℤ0005.factorial(bits, this.vℝ0072), bits, this.vℝ0073)
                              .mul(k.factorial(bits, this.vℝ0074), bits, this.vℝ0075),
                             bits,
                             result);
    }
  }

  @Override
  public RealSequence derivative()
  {
    return Function.express(Integer.class,
                            Real.class,
                            RealSequence.class,
                            "_diffωfunc",
                            "diff((((-1^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*(j-k)!)*(k)!),k)",
                            this.context);
  }

  @Override
  public RealSequence integral()
  {
    return Function.express(Integer.class,
                            Real.class,
                            RealSequence.class,
                            "_intωfunc",
                            "int((((-1^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*(j-k)!)*(k)!),k)",
                            this.context);
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
      throw new AssertionError("α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ0000.close();
    this.vℝ0055.close();
    this.vℝ0056.close();
    this.vℝ0057.close();
    this.vℝ0058.close();
    this.vℝ0059.close();
    this.vℝ0060.close();
    this.vℝ0061.close();
    this.vℝ0062.close();
    this.vℝ0063.close();
    this.vℝ0064.close();
    this.vℝ0065.close();
    this.vℝ0066.close();
    this.vℝ0067.close();
    this.vℝ0068.close();
    this.vℝ0069.close();
    this.vℝ0070.close();
    this.vℝ0071.close();
    this.vℝ0072.close();
    this.vℝ0073.close();
    this.vℝ0074.close();
    this.vℝ0075.close();
    this.vℤ0004.close();
    this.vℤ0005.close();
    this.vℤ0006.close();
    this.v𝔸0001.close();
  }

  @Override
  public String getName()
  {
    return "ωfunc";
  }

  @Override
  public Context getContext()
  {
    return this.context;
  }

  @Override
  public String toString()
  {
    return "k➔(((-1^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*(j-k)!)*(k)!)";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(\\left({-1}^{(\\left(j-k\\right))} \\cdot \\Γ(\\left(\\left(j + β\\right) + 1\\right))\\right) \\cdot \\Γ(\\left(\\left(\\left(\\left(j + k\\right) + α\\right) + β\\right) + 1\\right))\\right)}{\\left(\\left(\\left(\\Γ(\\left(\\left(k + β\\right) + 1\\right)) \\cdot \\Γ(\\left(\\left(\\left(j + α\\right) + β\\right) + 1\\right))\\right) \\cdot \\factorial(\\left(j-k\\right))\\right) \\cdot \\factorial(k)\\right)}";
  }
}
