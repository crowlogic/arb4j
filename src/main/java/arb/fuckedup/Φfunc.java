package arb.fuckedup;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Field;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.exceptions.CompilerException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;

public class Φfunc implements
                   ComplexFunction,
                   Typesettable,
                   AutoCloseable,
                   Initializable,
                   Named
{
  public boolean                               isInitialized;
  protected Context                            context;
  public Expression                            expression;
  private boolean                              evaluating;
  public Φden                                  Φden;
  public Φnum                                  Φnum;
  public Integer                               M;
  public ComplexPolynomial                     p0;
  public ComplexPolynomial                     p1;
  public Complex                               v;
  public Real                                  μ;
  public ArrayList<Function<Complex, Complex>> derivativeCache;
  public ComplexPolynomial                     vXℂ0032 = new ComplexPolynomial();
  public ComplexPolynomial                     vXℂ0033 = new ComplexPolynomial();
  public Complex                               vℂ0004  = new Complex();
  public Complex                               vℂ0005  = new Complex();

  @Override
  public Class<Complex> domainType()
  {
    return Complex.class;
  }

  @Override
  public Class<Complex> coDomainType()
  {
    return Complex.class;
  }

  @Override
  public Complex evaluate(Complex z, int order, int bits, Complex result)
  {
    if (evaluating)
    {
      throw new CompilerException("re-entrant evaluate() call on same instance");
    }
    else
    {
      evaluating = true;

      Object var10000;
      try
      {
        var10000 = evaluate_body(z, order, bits, result);
      }
      finally
      {
        evaluating = false;
      }

      return (Complex) var10000;
    }
  }

  private Complex evaluate_body(Complex z, int order, int bits, Complex result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    if (order <= 1)
    {
      return Φnum.evaluate(M, order, bits, vXℂ0032)
                 .evaluate(z, order, bits, vℂ0004)
                 .div(Φden.evaluate(M, order, bits, vXℂ0033).evaluate(z, order, bits, vℂ0005), bits, result);
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
        var10000.evaluate(z, 1, bits, var8);
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
      if (Φnum != null)
      {
        Φnum.invalidateCache(var1);
      }

      if (Φden != null)
      {
        Φden.invalidateCache(var1);
      }
    }
  }

  public void invalidateCache()
  {
    invalidateCache(Collections.newSetFromMap(new IdentityHashMap<>()));
  }

  @Override
  public ComplexFunction derivative()
  {
    return Function.express(Complex.class, Complex.class, ComplexFunction.class, "diffΦfunc", "diff((Φnum(M)(z))/(Φden(M)(z)),z)", context);
  }

  @Override
  public ComplexFunction integral()
  {
    return Function.express(Complex.class, Complex.class, ComplexFunction.class, "intΦfunc", "int((Φnum(M)(z))/(Φden(M)(z)),z)", context);
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
      if (Φnum == null)
      {
        Function var10001 = context.lookupFunctionInstance("Φnum");
        if (var10001 != null)
        {
          Φnum = (Φnum) var10001;
        }
        else
        {
          Φnum         = new Φnum();
          Φnum.context = context;
        }
      }

      if (Φden == null)
      {
        Function var1 = context.lookupFunctionInstance("Φden");
        if (var1 != null)
        {
          Φden = (Φden) var1;
        }
        else
        {
          Φden         = new Φden();
          Φden.context = context;
        }
      }

      if (Φden.p0 == null)
      {
        Φden.p0 = p0;
      }
      else
      {
        Φden.p0.set(p0);
      }

      if (Φden.p1 == null)
      {
        Φden.p1 = p1;
      }
      else
      {
        Φden.p1.set(p1);
      }

      if (Φden.v == null)
      {
        Φden.v = v;
      }
      else
      {
        Φden.v.set(v);
      }

      if (Φden.μ == null)
      {
        Φden.μ = μ;
      }
      else
      {
        Φden.μ.set(μ);
      }

      if (Φnum.p0 == null)
      {
        Φnum.p0 = p0;
      }
      else
      {
        Φnum.p0.set(p0);
      }

      if (Φnum.p1 == null)
      {
        Φnum.p1 = p1;
      }
      else
      {
        Φnum.p1.set(p1);
      }

      if (Φnum.v == null)
      {
        Φnum.v = v;
      }
      else
      {
        Φnum.v.set(v);
      }

      if (Φnum.μ == null)
      {
        Φnum.μ = μ;
      }
      else
      {
        Φnum.μ.set(μ);
      }

      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    vXℂ0032.close();
    vXℂ0033.close();
    vℂ0004.close();
    vℂ0005.close();
    if (Φnum != null)
    {
      Φnum.close();
    }

    if (Φden != null)
    {
      Φden.close();
    }
  }

  @Override
  public String getName()
  {
    return "Φfunc";
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
    return String.format("Φfunc:z➔(Φnum(%1$s)(z))/(Φden(%1$s)(z))", String.valueOf(M));
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\Φnum\\left(M\\right)\\left(z\\right)}{\\Φden\\left(M\\right)\\left(z\\right)}";
  }
}
