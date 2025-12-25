package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.real.RealFunction;

public class _intw implements
                   RealFunction,
                   Typesettable,
                   AutoCloseable,
                   Initializable,
                   Named
{
  public boolean       isInitialized;
  public Context       context = new Context();
  public final Integer cℤ0000  = new Integer("1");
  public Real          vℝ0076  = new Real();
  public Real          vℝ0077  = new Real();
  public Real          vℝ0078  = new Real();
  public Real          vℝ0079  = new Real();  
  public Real          vℝ0080  = new Real();
  public Real          vℝ0081  = new Real();
  public Real          vℝ0082  = new Real();
  public Real          vℝ0083  = new Real();
  public Real          t;
  public Real          α;
  public Real          β;
  public Real          γ;

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
  public Real evaluate(Real x, int order, int bits, Real result)
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

      return this.cℤ0000.sub(x, bits, this.vℝ0076)
                        .pow(this.α.add(this.cℤ0000, bits, this.vℝ0077), bits, this.vℝ0078)
                        .div(this.vℝ0077, bits, this.vℝ0079)
                        .mul(this.cℤ0000.add(x, bits, this.vℝ0080)
                                        .pow(this.β.add(this.cℤ0000, bits, this.vℝ0081),
                                             bits,
                                             this.vℝ0082)
                                        .div(this.vℝ0081, bits, this.vℝ0083),
                             bits,
                             result);
    }
  }

  @Override
  public RealFunction derivative()
  {
    return Function.express(Real.class,
                            Real.class,
                            RealFunction.class,
                            "_diff_intw",
                            "diff((((1-x)^(α+1))/(α+1))*(((1+x)^(β+1))/(β+1)),x)",
                            this.context);
  }

  @Override
  public RealFunction integral()
  {
    return Function.express(Real.class,
                            Real.class,
                            RealFunction.class,
                            "_int_intw",
                            "int((((1-x)^(α+1))/(α+1))*(((1+x)^(β+1))/(β+1)),x)",
                            this.context);
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (this.α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("β is null");
    }
    else
    {
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ0000.close();
    this.vℝ0076.close();
    this.vℝ0077.close();
    this.vℝ0078.close();
    this.vℝ0079.close();
    this.vℝ0080.close();
    this.vℝ0081.close();
    this.vℝ0082.close();
    this.vℝ0083.close();
  }

  @Override
  public String getName()
  {
    return "_intw";
  }

  @Override
  public Context getContext()
  {
    return this.context;
  }

  @Override
  public String toString()
  {
    return "_intw:x➔(((1-x)^(α+1))/(α+1))*(((1+x)^(β+1))/(β+1))";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\frac{{(\\left(1-x\\right))}^{(\\left(α + 1\\right))}}{\\left(α + 1\\right)} \\cdot \\frac{{(\\left(1 + x\\right))}^{(\\left(β + 1\\right))}}{\\left(β + 1\\right)}\\right)";
  }
}
