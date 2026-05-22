package arb.crap;

import java.util.*;

import arb.*;
import arb.Integer;
import arb.exceptions.CompilerException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.IndexCache;
import arb.functions.integer.ComplexPolynomialSequence;

public class Pn implements
                ComplexPolynomialSequence,
                Typesettable,
                AutoCloseable,
                Initializable,
                Named
{
  public boolean                                         isInitialized;
  protected Context                                      context;
  public Expression                                      expression;
  private IndexCache<ComplexPolynomial>                  cache = new IndexCache();
  private boolean                                        evaluating;
  public final Integer                                   cℤ0000;
  public final Integer                                   cℤ0001;
  public final Integer                                   cℤ0002;
  public Pn                                              Pn;
  public hv                                              hv;
  public αv                                              αv;
  public βv                                              βv;
  public ComplexPolynomial                               p0;
  public ComplexPolynomial                               p1;
  public Complex                                         v;
  public Real                                            μ;
  public ArrayList<Function<Integer, ComplexPolynomial>> derivativeCache;
  public Integer                                         cseℤ0009;
  public Integer                                         cseℤ0010;
  public Integer                                         cseℤ0011;
  public Integer                                         cseℤ0012;
  public ComplexPolynomial                               vXℂ0020;
  public ComplexPolynomial                               vXℂ0021;
  public ComplexPolynomial                               vXℂ0022;
  public ComplexPolynomial                               vXℂ0023;
  public ComplexPolynomial                               vXℂ0024;
  public ComplexPolynomial                               vXℂ0025;
  public Complex                                         vℂ0001;
  public Complex                                         vℂ0002;
  public Complex                                         vℂ0003;
  public Integer                                         vℤ0011;
  public Integer                                         vℤ0012;
  public Integer                                         vℤ0013;
  public Integer                                         vℤ0014;

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
  public ComplexPolynomial evaluate(Integer n, int order, int bits, ComplexPolynomial result)
  {
    if (this.evaluating)
    {
      throw new CompilerException("re-entrant evaluate() call on same instance");
    }
    else
    {
      this.evaluating = true;

      Object var10000;
      try
      {
        var10000 = this.evaluate_body(n, order, bits, result);
      }
      finally
      {
        this.evaluating = false;
      }

      return (ComplexPolynomial) var10000;
    }
  }

  private Object evaluate_body(Integer n, int order, int bits, ComplexPolynomial result)
  {
    if (result == null)
    {
      result = new ComplexPolynomial();
    }

    if (!this.isInitialized)
    {
      this.initialize();
    }

    if (order <= 1)
    {
      ComplexPolynomial var11 = (ComplexPolynomial) Function.peek(this.cache, n);
      if (var11 != null)
      {
        result.set(var11);
        return result;
      }
      else
      {
        IndexCache var9  = this.cache;
        Integer    var10 = n;

        (switch (n.getSignedValue())
        {
        case 0 -> result.set(this.cℤ0000);
        case 1 -> result.set((Complex) this.hv.evaluate(this.cℤ0000, order, bits, this.vℂ0001));
        default -> {
          var11 = this.vXℂ0020.identity().sub((Complex) this.αv.evaluate(n.sub(this.cℤ0001, bits, this.vℤ0011), order, bits, this.vℂ0002), bits, this.vXℂ0021);
          if (this.Pn == this)
          {
            throw new AssertionError("self-alias: this.Pn == this — recursive call must target a separate instance per level (issue #1034)");
          }

          var11 = var11.mul((ComplexPolynomial) this.Pn.evaluate(n.sub(this.cℤ0001, bits, this.vℤ0012), order, bits, this.vXℂ0022), bits, this.vXℂ0023);
          Complex var10001 = (Complex) this.βv.evaluate(n.sub(this.cℤ0001, bits, this.vℤ0013), order, bits, this.vℂ0003);
          if (this.Pn == this)
          {
            throw new AssertionError("self-alias: this.Pn == this — recursive call must target a separate instance per level (issue #1034)");
          }

          yield var11.sub(var10001.mul((ComplexPolynomial) this.Pn.evaluate(n.sub(this.cℤ0002, bits, this.vℤ0014), order, bits, this.vXℂ0024),
                                       bits,
                                       this.vXℂ0025),
                          bits,
                          result);
        }
        }).setIndependentVariableName("z");
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
        var10000.evaluate(n, 1, bits, var8);
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
      if (this.βv != null)
      {
        this.βv.invalidateCache(var1);
      }

      if (this.αv != null)
      {
        this.αv.invalidateCache(var1);
      }

      if (this.hv != null)
      {
        this.hv.invalidateCache(var1);
      }

      if (this.Pn != null)
      {
        this.Pn.invalidateCache(var1);
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
      if (this.Pn == null)
      {
        this.Pn         = new Pn();
        this.Pn.context = this.context;
      }

      if (this.Pn.p0 == null)
      {
        this.Pn.p0 = this.p0;
      }
      else
      {
        this.Pn.p0.set(this.p0);
      }

      if (this.Pn.p1 == null)
      {
        this.Pn.p1 = this.p1;
      }
      else
      {
        this.Pn.p1.set(this.p1);
      }

      if (this.Pn.v == null)
      {
        this.Pn.v = this.v;
      }
      else
      {
        this.Pn.v.set(this.v);
      }

      if (this.Pn.μ == null)
      {
        this.Pn.μ = this.μ;
      }
      else
      {
        this.Pn.μ.set(this.μ);
      }

      if (this.βv == null)
      {
        Function var10002 = this.context.lookupFunctionInstance("βv");
        if (var10002 != null)
        {
          this.βv = (βv) var10002;
        }
        else
        {
          this.βv         = new βv();
          this.βv.context = this.context;
        }
      }

      if (this.αv == null)
      {
        Function var1 = this.context.lookupFunctionInstance("αv");
        if (var1 != null)
        {
          this.αv = (αv) var1;
        }
        else
        {
          this.αv         = new αv();
          this.αv.context = this.context;
        }
      }

      if (this.hv == null)
      {
        Function var2 = this.context.lookupFunctionInstance("hv");
        if (var2 != null)
        {
          this.hv = (hv) var2;
        }
        else
        {
          this.hv         = new hv();
          this.hv.context = this.context;
        }
      }

      if (this.hv.p0 == null)
      {
        this.hv.p0 = this.p0;
      }
      else
      {
        this.hv.p0.set(this.p0);
      }

      if (this.hv.p1 == null)
      {
        this.hv.p1 = this.p1;
      }
      else
      {
        this.hv.p1.set(this.p1);
      }

      if (this.hv.v == null)
      {
        this.hv.v = this.v;
      }
      else
      {
        this.hv.v.set(this.v);
      }

      if (this.hv.μ == null)
      {
        this.hv.μ = this.μ;
      }
      else
      {
        this.hv.μ.set(this.μ);
      }

      if (this.αv.p0 == null)
      {
        this.αv.p0 = this.p0;
      }
      else
      {
        this.αv.p0.set(this.p0);
      }

      if (this.αv.p1 == null)
      {
        this.αv.p1 = this.p1;
      }
      else
      {
        this.αv.p1.set(this.p1);
      }

      if (this.αv.v == null)
      {
        this.αv.v = this.v;
      }
      else
      {
        this.αv.v.set(this.v);
      }

      if (this.αv.μ == null)
      {
        this.αv.μ = this.μ;
      }
      else
      {
        this.αv.μ.set(this.μ);
      }

      if (this.βv.p0 == null)
      {
        this.βv.p0 = this.p0;
      }
      else
      {
        this.βv.p0.set(this.p0);
      }

      if (this.βv.p1 == null)
      {
        this.βv.p1 = this.p1;
      }
      else
      {
        this.βv.p1.set(this.p1);
      }

      if (this.βv.v == null)
      {
        this.βv.v = this.v;
      }
      else
      {
        this.βv.v.set(this.v);
      }

      if (this.βv.μ == null)
      {
        this.βv.μ = this.μ;
      }
      else
      {
        this.βv.μ.set(this.μ);
      }

      this.isInitialized = true;
    }
  }

  public Pn()
  {
    this.context  = new Context();
    this.cℤ0000   = new Integer("0");
    this.cℤ0001   = new Integer("1");
    this.cℤ0002   = new Integer("2");
    this.cseℤ0009 = new Integer();
    this.cseℤ0010 = new Integer();
    this.cseℤ0011 = new Integer();
    this.cseℤ0012 = new Integer();
    this.vXℂ0020  = new ComplexPolynomial();
    this.vXℂ0021  = new ComplexPolynomial();
    this.vXℂ0022  = new ComplexPolynomial();
    this.vXℂ0023  = new ComplexPolynomial();
    this.vXℂ0024  = new ComplexPolynomial();
    this.vXℂ0025  = new ComplexPolynomial();
    this.vℂ0001   = new Complex();
    this.vℂ0002   = new Complex();
    this.vℂ0003   = new Complex();
    this.vℤ0011   = new Integer();
    this.vℤ0012   = new Integer();
    this.vℤ0013   = new Integer();
    this.vℤ0014   = new Integer();
  }

  @Override
  public void close()
  {
    if (this.cℤ0000 != this)
    {
      this.cℤ0000.close();
    }

    if (this.cℤ0001 != this)
    {
      this.cℤ0001.close();
    }

    if (this.cℤ0002 != this)
    {
      this.cℤ0002.close();
    }

    if (this.cseℤ0009 != this)
    {
      this.cseℤ0009.close();
    }

    if (this.cseℤ0010 != this)
    {
      this.cseℤ0010.close();
    }

    if (this.cseℤ0011 != this)
    {
      this.cseℤ0011.close();
    }

    if (this.cseℤ0012 != this)
    {
      this.cseℤ0012.close();
    }

    if (this.vXℂ0020 != this)
    {
      this.vXℂ0020.close();
    }

    if (this.vXℂ0021 != this)
    {
      this.vXℂ0021.close();
    }

    if (this.vXℂ0022 != this)
    {
      this.vXℂ0022.close();
    }

    if (this.vXℂ0023 != this)
    {
      this.vXℂ0023.close();
    }

    if (this.vXℂ0024 != this)
    {
      this.vXℂ0024.close();
    }

    if (this.vXℂ0025 != this)
    {
      this.vXℂ0025.close();
    }

    if (this.vℂ0001 != this)
    {
      this.vℂ0001.close();
    }

    if (this.vℂ0002 != this)
    {
      this.vℂ0002.close();
    }

    if (this.vℂ0003 != this)
    {
      this.vℂ0003.close();
    }

    if (this.vℤ0011 != this)
    {
      this.vℤ0011.close();
    }

    if (this.vℤ0012 != this)
    {
      this.vℤ0012.close();
    }

    if (this.vℤ0013 != this)
    {
      this.vℤ0013.close();
    }

    if (this.vℤ0014 != this)
    {
      this.vℤ0014.close();
    }

    if (this.βv != null)
    {
      AutoCloseable var10020 = (AutoCloseable) this.βv;
      this.βv = null;
      var10020.close();
    }

    if (this.αv != null)
    {
      AutoCloseable var1 = (AutoCloseable) this.αv;
      this.αv = null;
      var1.close();
    }

    if (this.hv != null)
    {
      AutoCloseable var2 = (AutoCloseable) this.hv;
      this.hv = null;
      var2.close();
    }

    if (this.Pn != null)
    {
      AutoCloseable var3 = this.Pn;
      this.Pn = null;
      var3.close();
    }
  }

  @Override
  public String getName()
  {
    return "Pn";
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
    return "Pn:n➔when(n=0,0,n=1,hv(0),else,((z-αv(n-1))*Pn(n-1))-(βv(n-1)*Pn(n-2)))";
  }

  @Override
  public String typeset()
  {
    return "\\\\left\\\\{\\\\begin{array}{ll}\\n0 & \\\\text{if } \\left(n = 0\\right)\\\\\\\\\\n\\hv\\left(0\\right) & \\\\text{if } \\left(n = 1\\right)\\\\\\\\\\n\\left(\\left(\\left(z-\\αv\\left(\\left(n-1\\right)\\right)\\right) \\cdot \\Pn\\left(\\left(n-1\\right)\\right)\\right)-\\left(\\βv\\left(\\left(n-1\\right)\\right) \\cdot \\Pn\\left(\\left(n-2\\right)\\right)\\right)\\right) & \\\\text{otherwise}\\n\\\\end{array}\\\\right.";
  }
}
