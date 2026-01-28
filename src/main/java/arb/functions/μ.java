package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.functions.integer.RealSequence;
import arb.functions.integer.RealSequenceSequence;

public class μ implements
               RealSequenceSequence,
               Typesettable,
               AutoCloseable,
               Initializable,
               Named
{
  public boolean isInitialized;
  public Context context = new Context();
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
  public RealSequence evaluate(Integer i, int order, int bits, RealSequence result)
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

      μfunc var10000 = new μfunc();
      var10000.α = this.α;
      var10000.β = this.β;
      var10000.γ = this.γ;
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
                            "_diffμ",
                            "diff(Σk➔(ω(j)(k)*Γ(k+1)/Γ(k+1-γ)*χ(i)(k-γ)){k=⌈γ⌉…j},i)",
                            this.context);
  }

  @Override
  public RealSequenceSequence integral()
  {
    return Function.express(Integer.class,
                            RealSequence.class,
                            RealSequenceSequence.class,
                            "_intμ",
                            "int(Σk➔(ω(j)(k)*Γ(k+1)/Γ(k+1-γ)*χ(i)(k-γ)){k=⌈γ⌉…j},i)",
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
      this.isInitialized = true;
    }
  }

  @Override
  public String getName()
  {
    return "μ";
  }

  @Override
  public Context getContext()
  {
    return this.context;
  }

  @Override
  public String toString()
  {
    return "μ:i➔Σk➔(ω(j)(k)*Γ(k+1)/Γ(k+1-γ)*χ(i)(k-γ)){k=⌈γ⌉…j}";
  }

  @Override
  public String typeset()
  {
    return "\\sum_{k = \\lceil{γ}\\rceil}^{j}{null}";
  }
}
