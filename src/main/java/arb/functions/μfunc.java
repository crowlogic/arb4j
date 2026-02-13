package arb.functions;

import arb.Complex;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.integer.ComplexSequence;

public class μfunc implements
                   ComplexSequence,
                   Typesettable,
                   AutoCloseable,
                   Initializable,
                   Named
{
  public boolean      isInitialized;
  public Context      context;
  public Integer      k               = new Integer();
  public Complex      sumℂ0001        = new Complex();
  public Integer      upperLimitℤ0001 = new Integer();
  public Complex      valueℂ0001      = new Complex();
  public Integer      vℤ0011          = new Integer();
  public operandF0001 operandF0001;
  public Integer      i;
  public Real         α;
  public Real         β;
  public Real         γ;

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
  public Complex evaluate(Integer j, int order, int bits, Complex result)
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

      if (operandF0001.j == null)
      {
        operandF0001.j = new Integer();
      }

      operandF0001.j.set(j);
      if (operandF0001.i == null)
      {
        operandF0001.i = new Integer();
      }

      operandF0001.i.set(i);
      sumℂ0001.additiveIdentity();
      k.set(γ.ceil(bits, vℤ0011));
      Integer var10000 = k;
      upperLimitℤ0001.set(j);

      while (var10000.compareTo(upperLimitℤ0001) <= 0)
      {
        sumℂ0001.add(operandF0001.evaluate(k, bits, valueℂ0001), bits);
        var10000 = k.increment();
      }

      return result.set(sumℂ0001);
    }
  }

  @Override
  public ComplexSequence derivative()
  {
    return Function.express(Integer.class,
                            Complex.class,
                            ComplexSequence.class,
                            "_diffμfunc",
                            "diff(Σk➔(((ω(j)(k))*Γ(k+1))*(χ(i)(k-γ)))/Γ((k+1)-γ){k=ceil(γ)…j},j)",
                            context);
  }

  @Override
  public ComplexSequence integral()
  {
    return Function.express(Integer.class,
                            Complex.class,
                            ComplexSequence.class,
                            "_intμfunc",
                            "int(Σk➔(((ω(j)(k))*Γ(k+1))*(χ(i)(k-γ)))/Γ((k+1)-γ){k=ceil(γ)…j},j)",
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
      if (operandF0001 == null)
      {
        operandF0001 = new operandF0001();
      }

      operandF0001.context = context;
      if (operandF0001.α == null)
      {
        operandF0001.α = new Real();
      }

      operandF0001.α.set(α);
      if (operandF0001.β == null)
      {
        operandF0001.β = new Real();
      }

      operandF0001.β.set(β);
      if (operandF0001.γ == null)
      {
        operandF0001.γ = new Real();
      }

      operandF0001.γ.set(γ);
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    k.close();
    sumℂ0001.close();
    upperLimitℤ0001.close();
    valueℂ0001.close();
    vℤ0011.close();
    operandF0001.close();
  }

  @Override
  public String getName()
  {
    return "μfunc";
  }

  @Override
  public Context getContext()
  {
    return context;
  }

  @Override
  public String toString()
  {
    return "j➔Σk➔(((ω(j)(k))*Γ(k+1))*(χ(i)(k-γ)))/Γ((k+1)-γ){k=ceil(γ)…j}";
  }

  @Override
  public String typeset()
  {
    return "\\sum_{k = \\ceil(γ)}^{j}{\\frac{\\left(\\left(\\ω(j)\\left(k\\right) \\cdot \\Gamma(\\left(k + 1\\right))\\right) \\cdot \\χ(i)\\left(\\left(k-γ\\right)\\right)\\right)}{\\Gamma(\\left(\\left(k + 1\\right)-γ\\right))}}";
  }
}
