package arb.functions;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.integer.ComplexSequence;

public class operandF0001 implements
                          Function<Integer, Complex>,
                          Typesettable,
                          AutoCloseable,
                          Initializable,
                          Named
{
  public boolean       isInitialized;
  public Context       context;
  public final Integer cℤ0000 = new Integer("1");
  public Complex       vℂ0019 = new Complex();
  public Complex       vℂ0020 = new Complex();
  public Complex       vℂ0021 = new Complex();
  public Complex       vℂ0022 = new Complex();
  public Complex       vℂ0023 = new Complex();
  public Complex       vℂ0024 = new Complex();
  public Complex       vℂ0025 = new Complex();
  public Real          vℝ0071 = new Real();
  public Real          vℝ0072 = new Real();
  public Real          vℝ0073 = new Real();
  public Integer       vℤ0012 = new Integer();
  public Integer       vℤ0013 = new Integer();
  public ω             ω;
  public χ             χ;
  public Integer       j;
  public Integer       i;
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

      return ω.evaluate(j, order, bits, null)
              .evaluate(k, order, bits, vℂ0020)
              .mul(k.add(cℤ0000, bits, vℤ0012).Γ(bits, vℝ0071), bits, vℂ0021)
              .mul(χ.evaluate(i, order, bits, null)
                    .evaluate(k.sub(γ, bits, vℂ0023), order, bits, vℂ0024),
                   bits,
                   vℂ0025)
              .div(k.add(cℤ0000, bits, vℤ0013).sub(γ, bits, vℝ0072).Γ(bits, vℝ0073), bits, result);
    }
  }

  @Override
  public ComplexSequence derivative()
  {
    return Function.express(Integer.class,
                            Complex.class,
                            ComplexSequence.class,
                            "_diffoperandF0001",
                            "diff((((ω(j)(k))*Γ(k+1))*(χ(i)(k-γ)))/Γ((k+1)-γ),k)",
                            context);
  }

  @Override
  public ComplexSequence integral()
  {
    return Function.express(Integer.class,
                            Complex.class,
                            ComplexSequence.class,
                            "_intoperandF0001",
                            "int((((ω(j)(k))*Γ(k+1))*(χ(i)(k-γ)))/Γ((k+1)-γ),k)",
                            context);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (γ == null)
    {
      throw new AssertionError("γ is null");
    }
    else
    {
      if (χ == null)
      {
        χ = new χ();
      }

      if (ω == null)
      {
        ω = new ω();
      }

      if (ω.α == null)
      {
        ω.α = α;
      }
      else
      {
        ω.α.set(α);
      }

      if (ω.β == null)
      {
        ω.β = β;
      }
      else
      {
        ω.β.set(β);
      }

      if (ω.γ == null)
      {
        ω.γ = γ;
      }
      else
      {
        ω.γ.set(γ);
      }

      if (χ.α == null)
      {
        χ.α = α;
      }
      else
      {
        χ.α.set(α);
      }

      if (χ.β == null)
      {
        χ.β = β;
      }
      else
      {
        χ.β.set(β);
      }

      if (χ.γ == null)
      {
        χ.γ = γ;
      }
      else
      {
        χ.γ.set(γ);
      }

      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    vℂ0019.close();
    vℂ0020.close();
    vℂ0021.close();
    vℂ0022.close();
    vℂ0023.close();
    vℂ0024.close();
    vℂ0025.close();
    vℝ0071.close();
    vℝ0072.close();
    vℝ0073.close();
    vℤ0012.close();
    vℤ0013.close();
    χ.close();
    ω.close();
  }

  @Override
  public String getName()
  {
    return "operandF0001";
  }

  @Override
  public Context getContext()
  {
    return context;
  }

  @Override
  public String toString()
  {
    return "operandF0001:k➔(((ω(j)(k))*Γ(k+1))*(χ(i)(k-γ)))/Γ((k+1)-γ)";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(\\left(\\ω(j)\\left(k\\right) \\cdot \\Gamma(\\left(k + 1\\right))\\right) \\cdot \\χ(i)\\left(\\left(k-γ\\right)\\right)\\right)}{\\Gamma(\\left(\\left(k + 1\\right)-γ\\right))}";
  }
}
