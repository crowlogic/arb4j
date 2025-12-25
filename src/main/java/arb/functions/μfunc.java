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
  public Real         t;
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
      if (!this.isInitialized)
      {
        this.initialize();
      }

      this.operandF0001.j = j;
      this.sumℝ0001.additiveIdentity();
      this.k.set(this.γ.ceil(bits, this.vℤ0010));
      Integer var10000 = this.k;
      this.upperLimitℤ0001.set(j);

      while (var10000.compareTo(this.upperLimitℤ0001) <= 0)
      {
        this.sumℝ0001.add((Real) this.operandF0001.evaluate(this.k, bits, this.valueℝ0001), bits);
        var10000 = this.k.increment();
      }

      return result.set(this.sumℝ0001);
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
                            this.context);
  }

  @Override
  public RealSequence integral()
  {
    return Function.express(Integer.class,
                            Real.class,
                            RealSequence.class,
                            "_intμfunc",
                            "int(Σk➔(((ω(j)(k))*Γ(k+1))/Γ((k+1)-γ))*(χ(i)(k-γ)){k=ceil(γ)…j},j)",
                            this.context);
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (this.γ == null)
    {
      throw new AssertionError("γ is null");
    }
    else
    {
      if (this.operandF0001 == null)
      {
        this.operandF0001 = new operandF0001();
      }

      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.k.close();
    this.sumℝ0001.close();
    this.upperLimitℤ0001.close();
    this.valueℝ0001.close();
    this.vℤ0010.close();
    this.operandF0001.close();
  }

  @Override
  public String getName()
  {
    return "μfunc";
  }

  @Override
  public Context getContext()
  {
    return this.context;
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
