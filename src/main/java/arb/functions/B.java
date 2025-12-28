package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.integer.RealSequence;

public class B implements
               RealSequence,
               Typesettable,
               AutoCloseable,
               Initializable,
               Named
{
  public boolean       isInitialized;
  public Context       context = new Context();
  public final Integer cℤ0000  = new Integer("1");
  public Real          vℝ0019  = new Real();
  public Real          vℝ0020  = new Real();
  public Real          vℝ0021  = new Real();
  public Real          vℝ0022  = new Real();
  public Real          vℝ0023  = new Real();
  public Real          vℝ0024  = new Real();
  public Real          vℝ0025  = new Real();
  public C             C;
  public Real          α;
  public Real          β;

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
  public Real evaluate(Integer n, int order, int bits, Real result)
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

      return n.add(α, bits, vℝ0019)
              .sub(cℤ0000, bits, vℝ0020)
              .mul(n.add(β, bits, vℝ0021).sub(cℤ0000, bits, vℝ0022), bits, vℝ0023)
              .mul((Real) C.evaluate(vℝ0024.set(n), order, bits, vℝ0025), bits, result);
    }
  }

  @Override
  public RealSequence derivative()
  {
    return Function.express(Integer.class,
                            Real.class,
                            RealSequence.class,
                            "_diffB",
                            "diff((((n+α)-1)*((n+β)-1))*C(n),n)",
                            context);
  }

  @Override
  public RealSequence integral()
  {
    return Function.express(Integer.class,
                            Real.class,
                            RealSequence.class,
                            "_intB",
                            "int((((n+α)-1)*((n+β)-1))*C(n),n)",
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
      if (C == null)
      {
        C = new C();
      }

      if (C.α == null)
      {
        C.α = new Real();
        C.α.set(α);
      }
      else
      {
        C.α = α;
      }

      if (C.β == null)
      {
        C.β = new Real();
        C.β.set(β);
      }
      else
      {
        C.β = β;
      }

      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    vℝ0019.close();
    vℝ0020.close();
    vℝ0021.close();
    vℝ0022.close();
    vℝ0023.close();
    vℝ0024.close();
    vℝ0025.close();
    C.close();
  }

  @Override
  public String getName()
  {
    return "B";
  }

  @Override
  public Context getContext()
  {
    return context;
  }

  @Override
  public String toString()
  {
    return "B:n➔(((n+α)-1)*((n+β)-1))*C(n)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\left(\\left(\\left(n + α\\right)-1\\right) \\cdot \\left(\\left(n + β\\right)-1\\right)\\right) \\cdot \\C(n)\\right)";
  }
}
