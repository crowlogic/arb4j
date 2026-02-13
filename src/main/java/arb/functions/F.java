package arb.functions;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.integer.RealSequence;

public class F implements
               RealSequence,
               Typesettable,
               AutoCloseable,
               Initializable,
               Named
{
  public boolean       isInitialized;
  public Context       context = new Context();
  public final Integer cℤ0000  = new Integer("1");
  public Real          vℝ0003  = new Real();
  public Real          vℝ0004  = new Real();
  public Real          vℝ0005  = new Real();
  public Real          vℝ0006  = new Real();
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

      return C.evaluate(n.sub(cℤ0000, bits, vℝ0003), order, bits, vℝ0004)
              .mul(C.evaluate(vℝ0005.set(n), order, bits, vℝ0006), bits, result);
    }
  }

  @Override
  public RealSequence derivative()
  {
    return Function.express(Integer.class,
                            Real.class,
                            RealSequence.class,
                            "_diffF",
                            "diff(C(n-1)*C(n),n)",
                            context);
  }

  @Override
  public RealSequence integral()
  {
    return Function.express(Integer.class,
                            Real.class,
                            RealSequence.class,
                            "_intF",
                            "int(C(n-1)*C(n),n)",
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
    vℝ0003.close();
    vℝ0004.close();
    vℝ0005.close();
    vℝ0006.close();
    C.close();
  }

  @Override
  public String getName()
  {
    return "F";
  }

  @Override
  public Context getContext()
  {
    return context;
  }

  @Override
  public String toString()
  {
    return "F:n➔C(n-1)*C(n)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\C(\\left(n-1\\right)) \\cdot \\C(n)\\right)";
  }
}
