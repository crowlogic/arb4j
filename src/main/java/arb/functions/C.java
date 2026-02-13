package arb.functions;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.real.RealFunction;

public class C implements
               RealFunction,
               Typesettable,
               AutoCloseable,
               Initializable,
               Named
{
  public boolean       isInitialized;
  public Context       context = new Context();
  public final Integer cℤ0000  = new Integer("2");
  public Real          vℝ0001  = new Real();
  public Real          vℝ0002  = new Real();
  public Real          α;
  public Real          β;

  @Override
  public Class<Real> domainType()
  {
    return Real.class;
  }

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Real n, int order, int bits, Real result)
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

      return cℤ0000.mul(n, bits, vℝ0001).add(α, bits, vℝ0002).add(β, bits, result);
    }
  }

  @Override
  public RealFunction derivative()
  {
    return Function.express(Real.class,
                            Real.class,
                            RealFunction.class,
                            "_diffC",
                            "diff(((2*n)+α)+β,n)",
                            context);
  }

  @Override
  public RealFunction integral()
  {
    return Function.express(Real.class,
                            Real.class,
                            RealFunction.class,
                            "_intC",
                            "int(((2*n)+α)+β,n)",
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
    vℝ0001.close();
    vℝ0002.close();
  }

  @Override
  public String getName()
  {
    return "C";
  }

  @Override
  public Context getContext()
  {
    return context;
  }

  @Override
  public String toString()
  {
    return "C:n➔((2*n)+α)+β";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\left(\\left(2 \\cdot n\\right) + α\\right) + β\\right)";
  }
}
