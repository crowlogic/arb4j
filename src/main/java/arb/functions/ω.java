package arb.functions;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.integer.ComplexSequence;
import arb.functions.integer.ComplexSequenceSequence;
import arb.utensils.Utensils;

public class ω implements
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
    ω ω = new ω();
    ω.γ = RealConstants.half;
    ω.α = RealConstants.negHalf;
    ω.β = RealConstants.negHalf;

    ComplexSequence seq3 = ω.evaluate(3, 128);
    Complex         val  = seq3.evaluate(4, 128, new Complex());
    System.out.println("val=" + val);
    System.out.println("μ=" + Utensils.yamlString(ω));

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
  public ComplexSequence evaluate(Integer j, int order, int bits, ComplexSequence result)
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

      ωfunc ωfunc = new ωfunc();
      if (ωfunc.j == null)
      {
        ωfunc.j = new Integer();
      }

      ωfunc.j.set(j);
      ωfunc.α = α;
      ωfunc.β = β;
      ωfunc.γ = γ;
      ωfunc.initialize();
      return ωfunc;
    }
  }

  @Override
  public ComplexSequenceSequence derivative()
  {
    return Function.express(Integer.class,
                            ComplexSequence.class,
                            ComplexSequenceSequence.class,
                            "_diffω",
                            "diff((((-1^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*(j-k)!)*k!),j)",
                            context);
  }

  @Override
  public ComplexSequenceSequence integral()
  {
    return Function.express(Integer.class,
                            ComplexSequence.class,
                            ComplexSequenceSequence.class,
                            "_intω",
                            "int((((-1^(j-k))*Γ((j+β)+1))*Γ((((j+k)+α)+β)+1))/(((Γ((k+β)+1)*Γ(((j+α)+β)+1))*(j-k)!)*k!),j)",
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
  }

  @Override
  public String getName()
  {
    return "ω";
  }

  @Override
  public Context getContext()
  {
    return context;
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
