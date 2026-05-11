package arb.functions;

import java.util.*;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.integer.RealToComplexFunctionSequence;

public class a implements
               RealToComplexFunctionSequence,
               Typesettable,
               AutoCloseable,
               Initializable,
               Named
{
  public boolean                                             isInitialized;
  protected Context                                          context;
  public Expression                                          expression;
  private final TreeMap<Integer, RealToComplexFunction>      cache = new TreeMap<>();
  public a                                                   a;
  public ComplexPolynomial                                   r;
  public ComplexPolynomial                                   q;
  public ComplexPolynomial                                   p;
  public Real                                                λ;
  public Real                                                μ;
  public Real                                                ν;
  public Real                                                ρ;
  public ArrayList<Function<Integer, RealToComplexFunction>> derivativeCache;

  @Override
  public Class<Integer> domainType()
  {
    return Integer.class;
  }

  @Override
  public Class<RealToComplexFunction> coDomainType()
  {
    return RealToComplexFunction.class;
  }

  @Override
  public RealToComplexFunction evaluate(Integer l, int order, int bits, RealToComplexFunction result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    if (order <= 1)
    {
      RealToComplexFunction var11 = (RealToComplexFunction) Function.peek(this.cache, l);
      if (var11 != null)
      {
        return var11;
      }
      else
      {
        TreeMap var9  = this.cache;
        Integer var10 = l;
        afunc   var12 = new afunc();
        if (var12.l == null)
        {
          var12.l = new Integer();
        }

        var12.l.set(l);
        var12.ρ = this.ρ;
        var12.λ = this.λ;
        var12.μ = this.μ;
        var12.ν = this.ν;
        var12.p = this.p;
        var12.q = this.q;
        var12.r = this.r;
        var12.initialize();
        Function.poke(var9, var10, var12);
        return var12;
      }
    }
    else
    {
      if (this.derivativeCache == null)
      {
        this.derivativeCache = new ArrayList<>();
      }

      if (this.derivativeCache.size() == 0)
      {
        this.derivativeCache.add(this);
      }

      long var6 = 1L;

      for (int var5 = 0; var5 < order; var5++)
      {
        if (var5 > 0)
        {
          var6 *= var5;
        }

        while (this.derivativeCache.size() <= var5)
        {
          this.derivativeCache.add(this.derivativeCache.get(this.derivativeCache.size() - 1).derivative());
        }

        Function var10000 = this.derivativeCache.get(var5);
        Object   var8     = ((Field) result).get(var5);
        var10000.evaluate(l, 1, bits, var8);
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
      this.cache.clear();
      if (this.p != null)
      {
        this.p.invalidateCache(var1);
      }

      if (this.q != null)
      {
        this.q.invalidateCache(var1);
      }

      if (this.a != null)
      {
        this.a.invalidateCache(var1);
      }

      if (this.r != null)
      {
        this.r.invalidateCache(var1);
      }
    }
  }

  public void invalidateCache()
  {
    this.invalidateCache(Collections.newSetFromMap(new IdentityHashMap<>()));
  }

  @Override
  public RealToComplexFunctionSequence derivative()
  {
    return Function.express(Integer.class,
                            RealToComplexFunction.class,
                            RealToComplexFunctionSequence.class,
                            "diffa",
                            "diff(when(l=1,p(v)/Γ(μ+1),else,(Γ(((l-1)*μ)+1)/Γ((l*μ)+1))*((q(v)*(a(l-1)(v)))+(r(v)*Σj➔(a(j)(v))*(a((l-1)-j)(v)){j=1…l-2}))),l)",
                            this.context);
  }

  @Override
  public RealToComplexFunctionSequence integral()
  {
    return Function.express(Integer.class,
                            RealToComplexFunction.class,
                            RealToComplexFunctionSequence.class,
                            "inta",
                            "int(when(l=1,p(v)/Γ(μ+1),else,(Γ(((l-1)*μ)+1)/Γ((l*μ)+1))*((q(v)*(a(l-1)(v)))+(r(v)*Σj➔(a(j)(v))*(a((l-1)-j)(v)){j=1…l-2}))),l)",
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
      this.derivativeCache = new ArrayList<>();
      this.isInitialized   = true;
    }
  }

  public a()
  {
    this.context = new Context();
  }

  @Override
  public String getName()
  {
    return "a";
  }

  @Override
  public Context getContext()
  {
    return this.context;
  }

  @Override
  public Expression getExpression()
  {
    return this.expression;
  }

  @Override
  public String toString()
  {
    return "a:when(%s=1,p(v)/Γ(μ+1),else,(Γ(((%s-1)*μ)+1)/Γ((%s*μ)+1))*((q(v)*(a(%s-1)(v)))+(r(v)*Σj➔(a(j)(%s))*(a((%s-1)-j)(%s)){j=1…%s-2})))";
  }

  @Override
  public String typeset()
  {
    return "\\\\left\\\\{\\\\begin{array}{ll}\\n\\frac{\\p\\left(v\\right)}{\\Gamma(\\left(μ + 1\\right))} & \\\\text{if } \\left(l = 1\\right)\\\\\\\\\\n\\left(\\frac{\\Gamma(\\left(\\left(\\left(l-1\\right) \\cdot μ\\right) + 1\\right))}{\\Gamma(\\left(\\left(l \\cdot μ\\right) + 1\\right))} \\cdot \\left(\\left(\\q\\left(v\\right) \\cdot \\a\\left(\\left(l-1\\right)\\right)\\left(v\\right)\\right) + \\left(\\r\\left(v\\right) \\cdot \\sum_{j = 1}^{\\left(l-2\\right)}{\\left(\\a\\left(j\\right)\\left(v\\right) \\cdot \\a\\left(\\left(\\left(l-1\\right)-j\\right)\\right)\\left(v\\right)\\right)}\\right)\\right)\\right) & \\\\text{otherwise}\\n\\\\end{array}\\\\right.";
  }
}
