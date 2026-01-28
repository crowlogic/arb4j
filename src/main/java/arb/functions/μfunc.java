package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.integer.RealSequence;

public class μfunc implements
                   RealSequence,
                   Typesettable,
                   AutoCloseable,
                   Initializable,
                   Named
{
  public boolean      isInitialized;
  public Context      context         = new Context();
  public Integer      k               = new Integer();
  public Real         sumℝ0001        = new Real();
  public Integer      upperLimitℤ0001 = new Integer();
  public Real         valueℝ0001      = new Real();
  public Integer      vℤ0010          = new Integer();
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
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Integer j, int order, int bits, Real result)
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

      operandF0001.j = j;
      sumℝ0001.additiveIdentity();
      k.set(γ.ceil(bits, vℤ0010));
      Integer var10000 = k;
      upperLimitℤ0001.set(j);

      while (var10000.compareTo(upperLimitℤ0001) <= 0)
      {
        sumℝ0001.add((Real) operandF0001.evaluate(k, bits, valueℝ0001), bits);
        var10000 = k.increment();
      }

      return result.set(sumℝ0001);
    }
  }

  @Override
  public RealSequence derivative()
  {
    return Function.express(Integer.class,
                            Real.class,
                            RealSequence.class,
                            "_diffμfunc",
                            "diff(Σk➔(((ω(j)(k))*Γ(k+1))/Γ((k+1)-γ))*(χ(i)(k-γ)){k=ceil(γ)…j},j)",
                            context);
  }

  @Override
  public RealSequence integral()
  {
    return Function.express(Integer.class,
                            Real.class,
                            RealSequence.class,
                            "_intμfunc",
                            "int(Σk➔(((ω(j)(k))*Γ(k+1))/Γ((k+1)-γ))*(χ(i)(k-γ)){k=ceil(γ)…j},j)",
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

      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    k.close();
    sumℝ0001.close();
    upperLimitℤ0001.close();
    valueℝ0001.close();
    vℤ0010.close();
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
    return "j➔Σk➔(((ω(j)(k))*Γ(k+1))/Γ((k+1)-γ))*(χ(i)(k-γ)){k=ceil(γ)…j}";
  }

  @Override
  public String typeset()
  {
    return "\\sum_{k = \\ceil(γ)}^{j}{\\left(\\frac{\\left(\\ω(j)\\left(k\\right) \\cdot \\Gamma(\\left(k + 1\\right))\\right)}{\\Gamma(\\left(\\left(k + 1\\right)-γ\\right))} \\cdot \\χ(i)\\left(\\left(k-γ\\right)\\right)\\right)}";
  }
}
