package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
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
      if (!this.isInitialized)
      {
        this.initialize();
      }

      return n.mul((Real) this.C.evaluate(n.div(this.cℤ0000, bits, this.vℝ0014),
                                          order,
                                          bits,
                                          this.vℝ0015),
                   bits,
                   this.vℝ0016)
              .mul((Real) this.C.evaluate(n.sub(this.cℤ0001, bits, this.vℝ0017),
                                          order,
                                          bits,
                                          this.vℝ0018),
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
                            "_diffE",
                            "diff((n*C(n/2))*C(n-1),n)",
                            this.context);
  }

  @Override
  public RealSequence integral()
  {
    return Function.express(Integer.class,
                            Real.class,
                            RealSequence.class,
                            "_intE",
                            "int((n*C(n/2))*C(n-1),n)",
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
    this.cℤ0001.close();
    this.vℝ0014.close();
    this.vℝ0015.close();
    this.vℝ0016.close();
    this.vℝ0017.close();
    this.vℝ0018.close();
    this.C.close();
  }

  @Override
  public String getName()
  {
    return "E";
  }

  @Override
  public Context getContext()
  {
    return this.context;
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
