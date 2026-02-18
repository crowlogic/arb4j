package arb.functions;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.ComplexFunctionSequence;
import arb.utensils.Utensils;

public class χ implements
               ComplexFunctionSequence,
               Typesettable,
               AutoCloseable,
               Initializable,
               Named
{
  public static void main(String args[])
  {
    χ χ = new χ();
    χ.γ = RealConstants.half;
    χ.α = RealConstants.negHalf;
    χ.β = RealConstants.negHalf;

    ComplexFunction func3 = χ.evaluate(3, 128);
    Complex         val   = func3.evaluate(RealConstants.half, 1, 128, new Complex());
    System.out.println("val=" + val);
    System.out.println("χ=" + Utensils.yamlString(χ));

    System.out.println("func3=" + Utensils.yamlString(func3));
  }

  public boolean isInitialized;
  public Context context = new Context();
  public normSq  normSq;
  public w       w;
  public P       P;
  public Real    α;
  public Real    β;
  public Real    γ;

  @Override
  public Class<Integer> domainType()
  {
    return Integer.class;
  }

  @Override
  public Class<ComplexFunction> coDomainType()
  {
    return ComplexFunction.class;
  }

  @Override
  public ComplexFunction evaluate(Integer i, int order, int bits, ComplexFunction result)
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

      χfunc var10000 = new χfunc();
      if (var10000.i == null)
      {
        var10000.i = new Integer();
      }

      var10000.i.set(i);
      var10000.α      = α;
      var10000.β      = β;
      var10000.γ      = γ;
      var10000.P      = P;
      var10000.w      = w;
      var10000.normSq = normSq;
      var10000.initialize();
      return var10000;
    }
  }

  @Override
  public ComplexFunctionSequence derivative()
  {
    return Function.express(Integer.class,
                            ComplexFunction.class,
                            ComplexFunctionSequence.class,
                            "_diffχ",
                            "diff(((∫((1^p)*w(1))*(P(i))d1)-(∫((-1^p)*w(-1))*(P(i))d-1))/normSq(i),i)",
                            context);
  }

  @Override
  public ComplexFunctionSequence integral()
  {
    return Function.express(Integer.class,
                            ComplexFunction.class,
                            ComplexFunctionSequence.class,
                            "_intχ",
                            "int(((∫((1^p)*w(1))*(P(i))d1)-(∫((-1^p)*w(-1))*(P(i))d-1))/normSq(i),i)",
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
      if (P == null)
      {
        P = new P();
      }

      if (w == null)
      {
        w = new w();
      }

      if (normSq == null)
      {
        normSq = new normSq();
      }

      if (normSq.α == null)
      {
        normSq.α = α;
      }
      else
      {
        normSq.α.set(α);
      }

      if (normSq.β == null)
      {
        normSq.β = β;
      }
      else
      {
        normSq.β.set(β);
      }

      if (normSq.γ == null)
      {
        normSq.γ = γ;
      }
      else
      {
        normSq.γ.set(γ);
      }

      if (w.α == null)
      {
        w.α = α;
      }
      else
      {
        w.α.set(α);
      }

      if (w.β == null)
      {
        w.β = β;
      }
      else
      {
        w.β.set(β);
      }

      if (P.α == null)
      {
        P.α = α;
      }
      else
      {
        P.α.set(α);
      }

      if (P.β == null)
      {
        P.β = β;
      }
      else
      {
        P.β.set(β);
      }

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
    return "χ";
  }

  @Override
  public Context getContext()
  {
    return context;
  }

  @Override
  public String toString()
  {
    return "χ:i➔((∫((1^p)*w(1))*(P(i))d1)-(∫((-1^p)*w(-1))*(P(i))d-1))/normSq(i)";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(\\int \\left({1}^{p} \\cdot \\w(1)\\right) \\cdot \\P(i)(1) d1-\\int \\left({-1}^{p} \\cdot \\w(-1)\\right) \\cdot \\P(i)(-1) d-1\\right)}{\\normSq(i)}";
  }
}
