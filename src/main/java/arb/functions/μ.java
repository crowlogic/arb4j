package arb.functions;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.integer.ComplexSequence;
import arb.functions.integer.ComplexSequenceSequence;
import arb.utensils.Utensils;

public class μ implements
               ComplexSequenceSequence,
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

  public static void main(String args[])
  {
    μ μ = new μ();
    μ.γ = RealConstants.half;
    μ.α = RealConstants.negHalf;
    μ.β = RealConstants.negHalf;

    ComplexSequence seq3 = μ.evaluate(3, 128);
    Complex         val  = seq3.evaluate(4, 128, new Complex());
    System.out.println("val=" + val);
    System.out.println("μ=" + Utensils.yamlString(μ));

    System.out.println("seq3=" + Utensils.yamlString(seq3));
  }

  @Override
  public Class<Integer> domainType()
  {
    return Integer.class;
  }

  @Override
  public Class<ComplexSequence> coDomainType()
  {
    return ComplexSequence.class;
  }

  @Override
  public ComplexSequence evaluate(Integer i, int order, int bits, ComplexSequence result)
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

      μfunc var10000 = new μfunc();
      if (var10000.i == null)
      {
        var10000.i = new Integer();
      }

      var10000.i.set(i);
      var10000.α = α;
      var10000.β = β;
      var10000.γ = γ;
      var10000.initialize();
      return var10000;
    }
  }

  @Override
  public ComplexSequenceSequence derivative()
  {
    return Function.express(Integer.class,
                            ComplexSequence.class,
                            ComplexSequenceSequence.class,
                            "_diffμ",
                            "diff(Σk➔(ω(j)(k)*Γ(k+1)/Γ(k+1-γ)*χ(i)(k-γ)){k=⌈γ⌉…j},i)",
                            context);
  }

  @Override
  public ComplexSequenceSequence integral()
  {
    return Function.express(Integer.class,
                            ComplexSequence.class,
                            ComplexSequenceSequence.class,
                            "_intμ",
                            "int(Σk➔(ω(j)(k)*Γ(k+1)/Γ(k+1-γ)*χ(i)(k-γ)){k=⌈γ⌉…j},i)",
                            context);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (γ == null)
    {
      throw new AssertionError("γ is null");
    }
    else
    {
      isInitialized = true;
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
    return context;
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
