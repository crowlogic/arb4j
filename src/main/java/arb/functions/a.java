package arb.functions;

import java.util.*;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.real.RealFunction;

public class a implements
               ComplexPolynomialSequence,
               Typesettable,
               AutoCloseable,
               Initializable,
               Named
{

  public static void main(String args[])
  {
    a   a       = new a();
    int bits    = 128;
    var context = a.context;
    context.registerVariables(Real.named("μ").set("0.1", 128),
                              Real.named("ν").set("0.1", 128),
                              Real.named("ρ").set("-0.75", 128),
                              Real.named("λ").set("0.5", 128))
           .disableLommelPolynomials();
    var P = ComplexPolynomialNullaryFunction.express("P:v->-(v^2+I*v)/2", context);
    var Q = ComplexPolynomialNullaryFunction.express("Q:v->λ*(I*v*ρ*ν-1)", context);
    var R = ComplexPolynomialNullaryFunction.express("R:v->(λ^2*ν^2)/2", context);
    var p = P.evaluate(bits).setName("p");
    var q = Q.evaluate(bits).setName("q");
    var r = R.evaluate(bits).setName("r");
    context.registerFunction("p", p);
    context.registerFunction("q", q);
    context.registerFunction("r", r);

    context.injectReferences(a);

    var a1 = a.apply(1);
    System.out.println( "a1=" + a1 );
  }

  public boolean                                         isInitialized;
  protected Context                                      context;
  public Expression                                      expression;
  private final TreeMap<Integer, ComplexPolynomial>      cache = new TreeMap<>();
  public a                                               a;
  public ComplexPolynomial                               p;
  public ComplexPolynomial                               q;
  public ComplexPolynomial                               r;
  public Real                                            μ;
  public ArrayList<Function<Integer, ComplexPolynomial>> derivativeCache;
  public Integer                                         cseℤ0001;

  @Override
  public Class<Integer> domainType()
  {
    return Integer.class;
  }

  @Override
  public Class<ComplexPolynomial> coDomainType()
  {
    return ComplexPolynomial.class;
  }

  @Override
  public ComplexPolynomial evaluate(Integer k, int order, int bits, ComplexPolynomial result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    if (order <= 1)
    {
      ComplexPolynomial var11 = (ComplexPolynomial) Function.peek(this.cache, k);
      if (var11 != null)
      {
        result.set(var11);
        return result;
      }
      else
      {
        TreeMap var9  = this.cache;
        Integer var10 = k;
        switch (this.k.getSignedValue())
        {
        case 1:
          this.p.div(this.μ.add(this.cℤ0000, bits, this.vℝ0001).Γ(bits, this.vℝ0002), bits, result);
          break;
        default:
          Real var12 = this.k.sub(this.cℤ0000, bits, this.vℤ0001)
                             .mul(this.μ, bits, this.vℝ0003)
                             .add(this.cℤ0000, bits, this.vℝ0004)
                             .Γ(bits, this.vℝ0005)
                             .div(this.k.mul(this.μ, bits, this.vℝ0006).add(this.cℤ0000, bits, this.vℝ0007).Γ(bits, this.vℝ0008), bits, this.vℝ0009);
          ComplexPolynomial var10001 = this.q.mul(
                                                  (Complex) ((ComplexPolynomial) this.a.evaluate(this.k.sub(this.cℤ0000, bits, this.vℤ0002),
                                                                                                 order,
                                                                                                 bits,
                                                                                                 this.vXℂ0007)).evaluate(k, order, bits, this.vℂ0001),
                                                  bits,
                                                  this.vXℂ0008);
          ComplexPolynomial var10002 = this.r;
          if (this.operandF0001.v == null)
          {
            this.operandF0001.v = new Integer();
          }

          this.operandF0001.v.set(k);
          if (this.operandF0001.k == null)
          {
            this.operandF0001.k = new Integer();
          }

          this.operandF0001.k.set(this.k);
          this.sumXℂ0001.additiveIdentity();
          this.jXℂ0001ℤ0001.set(this.cℤ0000);
          Integer var10003 = this.jXℂ0001ℤ0001;
          this.upperLimitℤ0001.set(this.k.sub(this.cℤ0001, bits, this.vℤ0003));

          while (var10003.compareTo(this.upperLimitℤ0001) <= 0)
          {
            this.sumXℂ0001.add((ComplexPolynomial) this.operandF0001.evaluate(this.jXℂ0001ℤ0001, bits, this.valueXℂ0001), bits);
            var10003 = this.jXℂ0001ℤ0001.increment();
          }

          var12.mul(var10001.add(var10002.mul(this.sumXℂ0001, bits, this.vXℂ0009), bits, this.vXℂ0010), bits, result);
        }

        ComplexPolynomial var7 = new ComplexPolynomial();
        var7.set(result);
        Function.poke(var9, var10, var7);
        return result;
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
        var10000.evaluate(k, 1, bits, var8);
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
      if (this.a != null)
      {
        this.a.invalidateCache(var1);
      }
    }
  }

  public void invalidateCache()
  {
    this.invalidateCache(Collections.newSetFromMap(new IdentityHashMap<>()));
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
    this.context  = new Context();
    this.cseℤ0001 = new Integer();
  }

  @Override
  public void close()
  {
    this.cseℤ0001.close();
    this.a.close();
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
    return "a:when(%s=1,p/Γ(μ+1),else,(Γ(((%s-1)*μ)+1)/Γ((%s*μ)+1))*((q*(a(%s-1)(v)))+(r*Σj➔(a(j)(%s))*(a((%s-1)-j)(%s)){j=1…%s-2})))";
  }

  @Override
  public String typeset()
  {
    return "\\\\left\\\\{\\\\begin{array}{ll}\\n\\frac{p}{\\Gamma(\\left(μ + 1\\right))} & \\\\text{if } \\left(k = 1\\right)\\\\\\\\\\n\\left(\\frac{\\Gamma(\\left(\\left(\\left(k-1\\right) \\cdot μ\\right) + 1\\right))}{\\Gamma(\\left(\\left(k \\cdot μ\\right) + 1\\right))} \\cdot \\left(\\left(q \\cdot \\a\\left(\\left(k-1\\right)\\right)\\left(v\\right)\\right) + \\left(r \\cdot \\sum_{j = 1}^{\\left(k-2\\right)}{\\left(\\a\\left(j\\right)\\left(v\\right) \\cdot \\a\\left(\\left(\\left(k-1\\right)-j\\right)\\right)\\left(v\\right)\\right)}\\right)\\right)\\right) & \\\\text{otherwise}\\n\\\\end{array}\\\\right.";
  }
}
