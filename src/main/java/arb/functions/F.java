package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
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
      if (!this.isInitialized)
      {
        this.initialize();
      }

      return ((Real) this.C.evaluate(n.sub(this.cℤ0000, bits, this.vℝ0003),
                                     order,
                                     bits,
                                     this.vℝ0004)).mul((Real) this.C.evaluate(this.vℝ0005.set(n),
                                                                              order,
                                                                              bits,
                                                                              this.vℝ0006),
                                                       bits,
                                                       result);
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
                            this.context);
  }

  @Override
  public RealSequence integral()
  {
    return Function.express(Integer.class,
                            Real.class,
                            RealSequence.class,
                            "_intF",
                            "int(C(n-1)*C(n),n)",
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
      if (this.C == null)
      {
        this.C = new C();
      }

      if (this.C.α == null)
      {
        this.C.α = new Real();
        this.C.α.set(this.α);
      }
      else
      {
        this.C.α = this.α;
      }

      if (this.C.β == null)
      {
        this.C.β = new Real();
        this.C.β.set(this.β);
      }
      else
      {
        this.C.β = this.β;
      }

      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ0000.close();
    this.vℝ0003.close();
    this.vℝ0004.close();
    this.vℝ0005.close();
    this.vℝ0006.close();
    this.C.close();
  }

  @Override
  public String getName()
  {
    return "F";
  }

  @Override
  public Context getContext()
  {
    return this.context;
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
