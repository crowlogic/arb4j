package arb.functions;

import java.util.*;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.integer.RealToComplexFunctionSequence;

public class afunc implements
                   RealToComplexFunction,
                   Typesettable,
                   AutoCloseable,
                   Initializable,
                   Named
{
  public boolean                                                                   isInitialized;
  protected Context                                                                context;
  public Expression<Integer, RealToComplexFunction, RealToComplexFunctionSequence> expression;
  private Real                                                                     lastV;
  private Complex                                                                  cachedResult;
  public final Integer                                                             cℤ0000          = new Integer("1");
  public final Integer                                                             cℤ0001          = new Integer("2");
  public operandF0001                                                              operandF0001;
  public a                                                                         a;
  public ComplexPolynomial                                                         r;
  public ComplexPolynomial                                                         q;
  public ComplexPolynomial                                                         p;
  public Integer                                                                   l;
  public Real                                                                      λ;
  public Real                                                                      μ;
  public Real                                                                      ν;
  public Real                                                                      ρ;
  public ArrayList<RealToComplexFunction>                                          derivativeCache;
  public Integer                                                                   jℂ0001ℤ0001     = new Integer();
  public Complex                                                                   sumℂ0001        = new Complex();
  public Integer                                                                   upperLimitℤ0001 = new Integer();
  public RealToComplexFunction                                                     vFℝℂ0001;
  public Complex                                                                   valueℂ0002      = new Complex();
  public Complex                                                                   vℂ0001          = new Complex();
  public Complex                                                                   vℂ0002          = new Complex();
  public Complex                                                                   vℂ0003          = new Complex();
  public Complex                                                                   vℂ0004          = new Complex();
  public Complex                                                                   vℂ0005          = new Complex();
  public Complex                                                                   vℂ0006          = new Complex();
  public Complex                                                                   vℂ0007          = new Complex();
  public Complex                                                                   vℂ0008          = new Complex();
  public Complex                                                                   vℂ0009          = new Complex();
  public Complex                                                                   vℂ0010          = new Complex();
  public Real                                                                      vℝ0004          = new Real();
  public Real                                                                      vℝ0005          = new Real();
  public Real                                                                      vℝ0006          = new Real();
  public Real                                                                      vℝ0007          = new Real();
  public Real                                                                      vℝ0008          = new Real();
  public Real                                                                      vℝ0009          = new Real();
  public Real                                                                      vℝ0010          = new Real();
  public Real                                                                      vℝ0011          = new Real();
  public Real                                                                      vℝ0012          = new Real();
  public Integer                                                                   vℤ0001          = new Integer();
  public Integer                                                                   vℤ0002          = new Integer();
  public Integer                                                                   vℤ0003          = new Integer();

  @Override
  public Class<Real> domainType()
  {
    return Real.class;
  }

  @Override
  public Class<Complex> coDomainType()
  {
    return Complex.class;
  }

  @Override
  public Complex evaluate(Real v, int order, int bits, Complex result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    if (order <= 1)
    {
      if (lastV != null && lastV.equals(v) && cachedResult != null)
      {
        return result.set(cachedResult);
      }
      else
      {
        if (lastV == null)
        {
          lastV = new Real();
        }

        lastV.set(v);
        switch (l.getSignedValue())
        {
        case 1:
          p.evaluate(vℂ0001.set(v), order, bits, vℂ0002).div(μ.add(cℤ0000, bits, vℝ0004).Γ(bits, vℝ0005), bits, result);
          break;
        default:
          Real var9 = l.sub(cℤ0000, bits, vℤ0001)
                       .mul(μ, bits, vℝ0006)
                       .add(cℤ0000, bits, vℝ0007)
                       .Γ(bits, vℝ0008)
                       .div(l.mul(μ, bits, vℝ0009).add(cℤ0000, bits, vℝ0010).Γ(bits, vℝ0011), bits, vℝ0012);
          Complex var10001 = q.evaluate(vℂ0003.set(v), order, bits, vℂ0004)
                              .mul(a.evaluate(l.sub(cℤ0000, bits, vℤ0002), order, bits, vFℝℂ0001).evaluate(v, order, bits, vℂ0005), bits, vℂ0006);
          Complex var10002 = r.evaluate(vℂ0007.set(v), order, bits, vℂ0008);
          if (operandF0001.v == null)
          {
            operandF0001.v = new Real();
          }

          operandF0001.v.set(v);
          if (operandF0001.l == null)
          {
            operandF0001.l = new Integer();
          }

          operandF0001.l.set(l);
          sumℂ0001.additiveIdentity();
          jℂ0001ℤ0001.set(cℤ0000);
          Integer var10003 = jℂ0001ℤ0001;
          upperLimitℤ0001.set(l.sub(cℤ0001, bits, vℤ0003));

          while (var10003.compareTo(upperLimitℤ0001) <= 0)
          {
            sumℂ0001.add(operandF0001.evaluate(jℂ0001ℤ0001, bits, valueℂ0002), bits);
            var10003 = jℂ0001ℤ0001.increment();
          }

          var9.mul(var10001.add(var10002.mul(sumℂ0001, bits, vℂ0009), bits, vℂ0010), bits, result);
        }

        if (cachedResult == null)
        {
          cachedResult = new Complex();
        }

        cachedResult.set(result);
        return result;
      }
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

        RealToComplexFunction var10000 = derivativeCache.get(var5);
        Complex               var8     = result.get(var5);
        var10000.evaluate(v, 1, bits, var8);
        if (var5 >= 2)
        {
          var8.div((int) var6, bits, var8);
        }
      }

      return result;
    }
  }

  public void invalidateCache(Set<Function<?, ?>> var1)
  {
    if (var1.add(this))
    {
      lastV = null;
      if (p != null)
      {
        p.invalidateCache(var1);
      }

      if (q != null)
      {
        q.invalidateCache(var1);
      }

      if (a != null)
      {
        a.invalidateCache(var1);
      }

      if (r != null)
      {
        r.invalidateCache(var1);
      }

      if (operandF0001 != null)
      {
        operandF0001.invalidateCache(var1);
      }
    }
  }

  public void invalidateCache()
  {
    invalidateCache(Collections.newSetFromMap(new IdentityHashMap<>()));
  }

  @SuppressWarnings("unchecked")
  @Override
  public RealToComplexFunction derivative()
  {
    return Function.express(Real.class,
                            Complex.class,
                            RealToComplexFunction.class,
                            "diffafunc",
                            "diff(when(l=1,p(v)/Γ(μ+1),else,(Γ(((l-1)*μ)+1)/Γ((l*μ)+1))*((q(v)*(a(l-1)(v)))+(r(v)*Σj➔(a(j)(v))*(a((l-1)-j)(v)){j=1…l-2}))),v)",
                            context);
  }

  @SuppressWarnings("unchecked")
  @Override
  public RealToComplexFunction integral()
  {
    return Function.express(Real.class,
                            Complex.class,
                            RealToComplexFunction.class,
                            "intafunc",
                            "int(when(l=1,p(v)/Γ(μ+1),else,(Γ(((l-1)*μ)+1)/Γ((l*μ)+1))*((q(v)*(a(l-1)(v)))+(r(v)*Σj➔(a(j)(v))*(a((l-1)-j)(v)){j=1…l-2}))),v)",
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
      derivativeCache = new ArrayList<>();
      if (μ == null)
      {
        throw new AssertionError("μ is null");
      }
      else
      {
        if (a == null)
        {
          a         = new a();
          a.context = context;
        }

        if (operandF0001 == null)
        {
          operandF0001         = new operandF0001();
          operandF0001.context = context;
        }

        a.p                  = p;
        a.q                  = q;
        a.a                  = a;
        a.r                  = r;
        operandF0001.a       = a;
        operandF0001.context = context;
        if (operandF0001.ρ == null)
        {
          operandF0001.ρ = ρ;
        }
        else
        {
          operandF0001.ρ.set(ρ);
        }

        if (operandF0001.λ == null)
        {
          operandF0001.λ = λ;
        }
        else
        {
          operandF0001.λ.set(λ);
        }

        if (operandF0001.μ == null)
        {
          operandF0001.μ = μ;
        }
        else
        {
          operandF0001.μ.set(μ);
        }

        if (operandF0001.ν == null)
        {
          operandF0001.ν = ν;
        }
        else
        {
          operandF0001.ν.set(ν);
        }

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

        operandF0001.a = a;
        a.r            = r;
        a.q            = q;
        a.p            = p;
        isInitialized  = true;
      }
    }
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    cℤ0001.close();
    jℂ0001ℤ0001.close();
    sumℂ0001.close();
    upperLimitℤ0001.close();
    vFℝℂ0001.close();
    valueℂ0002.close();
    vℂ0001.close();
    vℂ0002.close();
    vℂ0003.close();
    vℂ0004.close();
    vℂ0005.close();
    vℂ0006.close();
    vℂ0007.close();
    vℂ0008.close();
    vℂ0009.close();
    vℂ0010.close();
    vℝ0004.close();
    vℝ0005.close();
    vℝ0006.close();
    vℝ0007.close();
    vℝ0008.close();
    vℝ0009.close();
    vℝ0010.close();
    vℝ0011.close();
    vℝ0012.close();
    vℤ0001.close();
    vℤ0002.close();
    vℤ0003.close();
    p.close();
    q.close();
    a.close();
    r.close();
    operandF0001.close();
  }

  @Override
  public String getName()
  {
    return "afunc";
  }

  @Override
  public Context getContext()
  {
    return context;
  }

  @SuppressWarnings("unchecked")
  @Override
  public Expression<Integer, RealToComplexFunction, RealToComplexFunctionSequence> getExpression()
  {
    return expression;
  }

  @Override
  public String toString()
  {
    return "afunc:when(%1$s=1,p(v)/Γ(μ+1),else,(Γ(((%1$s-1)*μ)+1)/Γ((%1$s*μ)+1))*((q(v)*(a(%1$s-1)(v)))+(r(v)*Σj➔(a(j)(%s))*(a((%1$s-1)-j)(%s)){j=1…%1$s-2})))";

  }

  @Override
  public String typeset()
  {
    return "\\\\left\\\\{\\\\begin{array}{ll}\\n\\frac{\\p\\left(v\\right)}{\\Γ\\left(\\left(μ + 1\\right)\\right)} & \\\\text{if } \\left(l = 1\\right)\\\\\\\\\\n\\left(\\frac{\\Γ\\left(\\left(\\left(\\left(l-1\\right) \\cdot μ\\right) + 1\\right)\\right)}{\\Γ\\left(\\left(\\left(l \\cdot μ\\right) + 1\\right)\\right)} \\cdot \\left(\\left(\\q\\left(v\\right) \\cdot \\a\\left(\\left(l-1\\right)\\right)\\left(v\\right)\\right) + \\left(\\r\\left(v\\right) \\cdot \\sum_{j = 1}^{\\left(l-2\\right)}{\\left(\\a\\left(j\\right)\\left(v\\right) \\cdot \\a\\left(\\left(\\left(l-1\\right)-j\\right)\\right)\\left(v\\right)\\right)}\\right)\\right)\\right) & \\\\text{otherwise}\\n\\\\end{array}\\\\right.";
  }
}
