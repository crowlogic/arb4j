package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;

public class operandF0001 implements
                          Function<Integer, Real>,
                          Typesettable,
                          AutoCloseable,
                          Initializable,
                          Named
{
  public boolean isInitialized;
  public Context context = new Context();
  public Integer j;
  public Real    x;

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
      if (!this.isInitialized)
      {
        this.initialize();
      }

      return result.set(k);
    }
  }

  @Override
  public Function derivative()
  {
    return Function.express(Integer.class,
                            Real.class,
                            Function.class,
                            "_diffoperandF0001",
                            "diff(k,k)",
                            this.context);
  }

  @Override
  public Function integral()
  {
    return Function.express(Integer.class,
                            Real.class,
                            Function.class,
                            "_intoperandF0001",
                            "int(k,k)",
                            this.context);
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else
    {
      this.isInitialized = true;
    }
  }

  @Override
  public String getName()
  {
    return "operandF0001";
  }

  @Override
  public Context getContext()
  {
    return this.context;
  }

  @Override
  public String toString()
  {
    return "operandF0001:k➔k";
  }

  @Override
  public String typeset()
  {
    return "k";
  }
}
