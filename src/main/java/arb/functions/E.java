package arb.functions;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.integer.RealSequence;

public class E implements
               RealSequence,
               Typesettable,
               AutoCloseable,
               Initializable,
               Named
{
  public boolean       isInitialized;
  public Context       context = new Context();
  public final Integer cℤ0000  = new Integer("2");
  public final Integer cℤ0001  = new Integer("1");
  public Real          vℝ0014  = new Real();
  public Real          vℝ0015  = new Real();
  public Real          vℝ0016  = new Real();
  public Real          vℝ0017  = new Real();
  public Real          vℝ0018  = new Real();
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

      return n.mul(C.evaluate(n.div(cℤ0000, bits, vℝ0014), order, bits, vℝ0015), bits, vℝ0016)
              .mul(C.evaluate(n.sub(cℤ0001, bits, vℝ0017), order, bits, vℝ0018), bits, result);
    }
  }

  @Override
  public RealSequence derivative()
  {
    return Function.express(Integer.class,
                            Real.class,
                            RealSequence.class,
                            "_diffE",
                            "diff((n*C(n/2))*C(n-1),n)",
                            context);
  }

  @Override
  public RealSequence integral()
  {
    return Function.express(Integer.class,
                            Real.class,
                            RealSequence.class,
                            "_intE",
                            "int((n*C(n/2))*C(n-1),n)",
                            context);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else
    {
      if (C == null)
      {
        C = new C();
      }

      if (C.α == null)
      {
        C.α = α;
      }
      else
      {
        C.α.set(α);
      }

      if (C.β == null)
      {
        C.β = β;
      }
      else
      {
        C.β.set(β);
      }

      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    cℤ0001.close();
    vℝ0014.close();
    vℝ0015.close();
    vℝ0016.close();
    vℝ0017.close();
    vℝ0018.close();
    C.close();
  }

  @Override
  public String getName()
  {
    return "E";
  }

  @Override
  public Context getContext()
  {
    return context;
  }

  @Override
  public String toString()
  {
    return "E:n➔(n*C(n/2))*C(n-1)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\left(n \\cdot \\C(\\frac{n}{2})\\right) \\cdot \\C(\\left(n-1\\right))\\right)";
  }
}
