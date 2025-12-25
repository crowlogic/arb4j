package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.integer.RealSequence;
import arb.functions.integer.RealSequenceSequence;

public class ω implements
               RealSequenceSequence,
               Typesettable,
               AutoCloseable,
               Initializable,
               Named
{
  public boolean isInitialized;
  public Context context = new Context();
  public Real    t;
  public Real    α;
  public Real    β;
  public Real    γ;

  @Override
  public Class<Integer> domainType()
  {
    return Integer.class;
  }

  @Override
  public Class<RealSequence> coDomainType()
  {
    return RealSequence.class;
  }

  @Override
  public RealSequence evaluate(Integer j, int order, int bits, RealSequence result)
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

      ωfunc var10000 = new ωfunc();
      var10000.j = j;
      var10000.α = this.α;
      var10000.β = this.β;
      var10000.γ = this.γ;
      var10000.t = this.t;
      var10000.initialize();
      return var10000;
    }
  }

  @Override
  public RealSequenceSequence derivative()
  {
    return Function.express(Integer.class,
                            RealSequence.class,
                            RealSequenceSequence.class,
                            "_diffω",
                            "diff((((-1^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*(j-k)!)*k!),j)",
                            this.context);
  }

  @Override
  public RealSequenceSequence integral()
  {
    return Function.express(Integer.class,
                            RealSequence.class,
                            RealSequenceSequence.class,
                            "_intω",
                            "int((((-1^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*(j-k)!)*k!),j)",
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
  }

  @Override
  public String getName()
  {
    return "ω";
  }

  @Override
  public Context getContext()
  {
    return this.context;
  }

  @Override
  public String toString()
  {
    return "ω:j➔(((-1^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*(j-k)!)*k!)";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(\\left({-1}^{(\\left(j-k\\right))} \\cdot \\Gamma(\\left(\\left(j + β\\right) + 1\\right))\\right) \\cdot \\Gamma(\\left(\\left(\\left(\\left(j + k\\right) + α\\right) + β\\right) + 1\\right))\\right)}{\\left(\\left(\\left(\\Gamma(\\left(\\left(k + β\\right) + 1\\right)) \\cdot \\Gamma(\\left(\\left(\\left(j + α\\right) + β\\right) + 1\\right))\\right) \\cdot (\\left(j-k\\right))!\\right) \\cdot k!\\right)}";
  }
}
