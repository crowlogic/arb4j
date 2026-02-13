package arb.functions;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.integer.ComplexSequence;

public class ωfunc implements
                   ComplexSequence,
                   Typesettable,
                   AutoCloseable,
                   Initializable,
                   Named
{
  public boolean       isInitialized;
  public Context       context;
  public final Integer cℤ0000 = new Integer("1");
  public Complex       vℂ0004 = new Complex();
  public Complex       vℂ0005 = new Complex();
  public Complex       vℂ0006 = new Complex();
  public Complex       vℂ0007 = new Complex();
  public Complex       vℂ0008 = new Complex();
  public Complex       vℂ0009 = new Complex();
  public Complex       vℂ0010 = new Complex();
  public Real          vℝ0052 = new Real();
  public Real          vℝ0053 = new Real();
  public Real          vℝ0054 = new Real();
  public Real          vℝ0055 = new Real();
  public Real          vℝ0056 = new Real();
  public Real          vℝ0057 = new Real();
  public Real          vℝ0058 = new Real();
  public Real          vℝ0059 = new Real();
  public Real          vℝ0060 = new Real();
  public Real          vℝ0061 = new Real();
  public Real          vℝ0062 = new Real();
  public Real          vℝ0063 = new Real();
  public Real          vℝ0064 = new Real();
  public Real          vℝ0065 = new Real();
  public Real          vℝ0066 = new Real();
  public Integer       vℤ0005 = new Integer();
  public Integer       vℤ0006 = new Integer();
  public Integer       vℤ0007 = new Integer();
  public Integer       vℤ0008 = new Integer();
  public Integer       j;
  public Real          α;
  public Real          β;
  public Real          γ;

  @Override
  public Class<Integer> domainType()
  {
    return Integer.class;
  }

  @Override
  public Class<Complex> coDomainType()
  {
    return Complex.class;
  }

  @Override
  public Complex evaluate(Integer k, int order, int bits, Complex result)
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

      return cℤ0000.neg(vℤ0005)
                   .pow(j.sub(k, bits, vℤ0006), bits, vℂ0004)
                   .mul(j.add(β, bits, vℝ0052).add(cℤ0000, bits, vℝ0053).Γ(bits, vℝ0054),
                        bits,
                        vℂ0005)
                   .mul(j.add(k, bits, vℤ0007)
                         .add(α, bits, vℝ0055)
                         .add(β, bits, vℝ0056)
                         .add(cℤ0000, bits, vℝ0057)
                         .Γ(bits, vℝ0058),
                        bits,
                        vℂ0006)
                   .div(k.add(β, bits, vℝ0059)
                         .add(cℤ0000, bits, vℝ0060)
                         .Γ(bits, vℝ0061)
                         .mul(j.add(α, bits, vℝ0062)
                               .add(β, bits, vℝ0063)
                               .add(cℤ0000, bits, vℝ0064)
                               .Γ(bits, vℝ0065),
                              bits,
                              vℝ0066)
                         .mul(j.sub(k, bits, vℤ0008).factorial(bits, vℂ0007), bits, vℂ0008)
                         .mul(k.factorial(bits, vℂ0009), bits, vℂ0010),
                        bits,
                        result);
    }
  }

  @Override
  public ComplexSequence derivative()
  {
    return Function.express(Integer.class,
                            Complex.class,
                            ComplexSequence.class,
                            "_diffωfunc",
                            "diff((((-1^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*(j-k)!)*(k)!),k)",
                            context);
  }

  @Override
  public ComplexSequence integral()
  {
    return Function.express(Integer.class,
                            Complex.class,
                            ComplexSequence.class,
                            "_intωfunc",
                            "int((((-1^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*(j-k)!)*(k)!),k)",
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
    vℂ0004.close();
    vℂ0005.close();
    vℂ0006.close();
    vℂ0007.close();
    vℂ0008.close();
    vℂ0009.close();
    vℂ0010.close();
    vℝ0052.close();
    vℝ0053.close();
    vℝ0054.close();
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
    vℤ0005.close();
    vℤ0006.close();
    vℤ0007.close();
    vℤ0008.close();
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
  public String toString()  {
    return "k➔(((-1^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*(j-k)!)*(k)!)";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(\\left({-1}^{(\\left(j-k\\right))} \\cdot \\Γ(\\left(\\left(j + β\\right) + 1\\right))\\right) \\cdot \\Γ(\\left(\\left(\\left(\\left(j + k\\right) + α\\right) + β\\right) + 1\\right))\\right)}{\\left(\\left(\\left(\\Γ(\\left(\\left(k + β\\right) + 1\\right)) \\cdot \\Γ(\\left(\\left(\\left(j + α\\right) + β\\right) + 1\\right))\\right) \\cdot \\factorial(\\left(j-k\\right))\\right) \\cdot \\factorial(k)\\right)}";
  }
}
