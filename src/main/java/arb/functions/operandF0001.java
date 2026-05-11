package arb.functions;

import java.util.*;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.integer.Sequence;

public class operandF0001 implements
                          Sequence<Complex>,
                          Typesettable,
                          AutoCloseable,
                          Initializable,
                          Named
{
  public boolean                               isInitialized;
  protected Context                            context;
  public Expression                            expression;
  public final Integer                         cℤ0000   = new Integer("1");
  public a                                     a;
  public Real                                  v;
  public Integer                               l;
  public Real                                  λ;
  public Real                                  μ;
  public Real                                  ν;
  public Real                                  ρ;
  public ArrayList<Function<Integer, Complex>> derivativeCache;
  public Integer                               cseℤ0004 = new Integer();
  public RealToComplexFunction                 vFℝℂ0002;
  public RealToComplexFunction                 vFℝℂ0003;
  public Complex                               vℂ0011   = new Complex();
  public Complex                               vℂ0012   = new Complex();
  public Integer                               vℤ0004   = new Integer();
  public Integer                               vℤ0005   = new Integer();

  @Override
  public Class<Integer> domainType()
  {
    return Integer.class;
  }

  @Override
  public Class<Complex> coDomainType()
  {
    return Complex.class;
  }

  @Override
  public Complex evaluate(Integer j, int order, int bits, Complex result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    if (order <= 1)
    {
      return a.evaluate(j, order, bits, vFℝℂ0002)
              .evaluate(v, order, bits, vℂ0011)
              .mul(a.evaluate(l.sub(cℤ0000, bits, vℤ0004).sub(j, bits, vℤ0005), order, bits, vFℝℂ0003).evaluate(v, order, bits, vℂ0012), bits, result);
    }
    else
    {
      if (derivativeCache == null)
      {
        derivativeCache = new ArrayList<>();
      }

      if (derivativeCache.size() == 0)
      {
        derivativeCache.add(this);
      }

      long var6 = 1L;

      for (int var5 = 0; var5 < order; var5++)
      {
        if (var5 > 0)
        {
          var6 *= var5;
        }

        while (derivativeCache.size() <= var5)
        {
          derivativeCache.add(derivativeCache.get(derivativeCache.size() - 1).derivative());
        }

        Function var10000 = derivativeCache.get(var5);
        Object   var8     = ((Field) result).get(var5);
        var10000.evaluate(j, 1, bits, var8);
        if (var5 >= 2)
        {
          ((Field) var8).div((int) var6, bits, (Field) var8);
        }
      }

      return result;
    }
  }

  public void invalidateCache(Set<Function<?, ?>> var1)
  {
    if (var1.add(this))
    {
      if (a != null)
      {
        a.invalidateCache(var1);
      }
    }
  }

  public void invalidateCache()
  {
    invalidateCache(Collections.newSetFromMap(new IdentityHashMap<>()));
  }

  @Override
  public Sequence derivative()
  {
    return Function.express(Integer.class, Complex.class, Sequence.class, "diffnull", "diff((a(j)(v))*(a((l-1)-j)(v)),j)", context);
  }

  @Override
  public Sequence integral()
  {
    return Function.express(Integer.class, Complex.class, Sequence.class, "intnull", "int((a(j)(v))*(a((l-1)-j)(v)),j)", context);
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
      derivativeCache = new ArrayList<>();
      if (a == null)
      {
        a         = new a();
        a.context = context;
      }

      a.a = a;
      if (a.ρ == null)
      {
        a.ρ = ρ;
      }
      else
      {
        a.ρ.set(ρ);
      }

      if (a.λ == null)
      {
        a.λ = λ;
      }
      else
      {
        a.λ.set(λ);
      }

      if (a.μ == null)
      {
        a.μ = μ;
      }
      else
      {
        a.μ.set(μ);
      }

      if (a.ν == null)
      {
        a.ν = ν;
      }
      else
      {
        a.ν.set(ν);
      }

      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    cseℤ0004.close();
    vFℝℂ0002.close();
    vFℝℂ0003.close();
    vℂ0011.close();
    vℂ0012.close();
    vℤ0004.close();
    vℤ0005.close();
    a.close();
  }

  @Override
  public String getName()
  {
    return null;
  }

  @Override
  public Context getContext()
  {
    return context;
  }

  @Override
  public Expression getExpression()
  {
    return expression;
  }

  @Override
  public String toString()
  {
    return String.format("j➔(a(j)(%2$s))*(a((%1$s-1)-j)(%2$s))", l.toString(), v.toString());
  }

  @Override
  public String typeset()
  {
    return "\\left(\\a\\left(j\\right)\\left(v\\right) \\cdot \\a\\left(\\left(\\left(l-1\\right)-j\\right)\\right)\\left(v\\right)\\right)";
  }
}
