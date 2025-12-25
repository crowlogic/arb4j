package arb.functions;

import arb.AlgebraicNumber;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
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
  public Real            t;
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
      if (!isInitialized)
      {
        initialize();
      }

      return cℤ0000.neg(vℤ0004)
                   .pow(j.sub(k, bits, vℤ0005), bits, v𝔸0001)
                   .mul(j.add(β, bits, vℝ0055).add(cℤ0000, bits, vℝ0056).Γ(bits, vℝ0057),
                        bits,
                        vℝ0058)
                   .mul(j.add(k, bits, vℤ0006)
                         .add(α, bits, vℝ0059)
                         .add(β, bits, vℝ0060)
                         .add(cℤ0000, bits, vℝ0061)
                         .Γ(bits, vℝ0062),
                        bits,
                        vℝ0063)
                   .div(k.add(β, bits, vℝ0064)
                         .add(cℤ0000, bits, vℝ0065)
                         .Γ(bits, vℝ0066)
                         .mul(j.add(α, bits, vℝ0067)
                               .add(β, bits, vℝ0068)
                               .add(cℤ0000, bits, vℝ0069)
                               .Γ(bits, vℝ0070),
                              bits,
                              vℝ0071)
                         .mul(vℤ0005.factorial(bits, vℝ0072), bits, vℝ0073)
                         .mul(k.factorial(bits, vℝ0074), bits, vℝ0075),
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
                            "diff((((-1^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*factorial(j-k))*factorial(k)),k)",
                            context);
  }

  @Override
  public RealSequence integral()
  {
    return Function.express(Integer.class,
                            Real.class,
                            RealSequence.class,
                            "_intωfunc",
                            "int((((-1^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*factorial(j-k))*factorial(k)),k)",
                            context);
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
      throw new AssertionError("α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    vℝ0055.close();
    vℝ0056.close();
    vℝ0057.close();
    vℝ0058.close();
    vℝ0059.close();
    vℝ0060.close();
    vℝ0061.close();
    vℝ0062.close();
    vℝ0063.close();
    vℝ0064.close();
    vℝ0065.close();
    vℝ0066.close();
    vℝ0067.close();
    vℝ0068.close();
    vℝ0069.close();
    vℝ0070.close();
    vℝ0071.close();
    vℝ0072.close();
    vℝ0073.close();
    vℝ0074.close();
    vℝ0075.close();
    vℤ0004.close();
    vℤ0005.close();
    vℤ0006.close();
    v𝔸0001.close();
  }

  @Override
  public String getName()
  {
    return "ωfunc";
  }

  @Override
  public Context getContext()
  {
    return context;
  }

  @Override
  public String toString()
  {
    return "k➔(((-1^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*factorial(j-k))*factorial(k))";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(\\left({-1}^{(\\left(j-k\\right))} \\cdot \\Γ(\\left(\\left(j + β\\right) + 1\\right))\\right) \\cdot \\Γ(\\left(\\left(\\left(\\left(j + k\\right) + α\\right) + β\\right) + 1\\right))\\right)}{\\left(\\left(\\left(\\Γ(\\left(\\left(k + β\\right) + 1\\right)) \\cdot \\Γ(\\left(\\left(\\left(j + α\\right) + β\\right) + 1\\right))\\right) \\cdot \\factorial(\\left(j-k\\right))\\right) \\cdot \\factorial(k)\\right)}";
  }
}
