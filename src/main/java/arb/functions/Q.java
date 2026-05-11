package arb.functions;

import java.util.ArrayList;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.complex.ComplexPolynomialNullaryFunction;

public class Q implements
               ComplexPolynomialNullaryFunction,
               Typesettable,
               AutoCloseable,
               Initializable,
               Named
{
  public boolean                                        isInitialized;
  protected Context                                     context = new Context();
  public Expression                                     expression;
  public final Integer                                  cℤ0000  = new Integer("1");
  public Real                                           λ;
  public Real                                           μ;
  public Real                                           ν;
  public Real                                           ρ;
  public ArrayList<Function<Object, ComplexPolynomial>> derivativeCache;
  public ComplexPolynomial                              vXℂ0007 = new ComplexPolynomial();
  public ComplexPolynomial                              vXℂ0008 = new ComplexPolynomial();
  public ComplexPolynomial                              vXℂ0009 = new ComplexPolynomial();
  public ComplexPolynomial                              vXℂ0010 = new ComplexPolynomial();
  public ComplexPolynomial                              vXℂ0011 = new ComplexPolynomial();

  @Override
  public Class<Object> domainType()
  {
    return Object.class;
  }

  @Override
  public Class<ComplexPolynomial> coDomainType()
  {
    return ComplexPolynomial.class;
  }

  @Override
  public ComplexPolynomial evaluate(Object in, int order, int bits, ComplexPolynomial result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    if (order <= 1)
    {
      return λ.mul(ComplexConstants.ⅈ.mul(vXℂ0007.identity(), bits, vXℂ0008).mul(ρ, bits, vXℂ0009).mul(ν, bits, vXℂ0010).sub(cℤ0000, bits, vXℂ0011),
                   bits,
                   result);
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
        var10000.evaluate(in, 1, bits, var8);
        if (var5 >= 2)
        {
          ((Field) var8).div((int) var6, bits, (Field) var8);
        }
      }

      return result;
    }
  }

  @Override
  public Function integral()
  {
    return ((ComplexPolynomial) evaluate()).integral();
  }

  @Override
  public Function derivative()
  {
    return ((ComplexPolynomial) evaluate()).derivative();
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
      if (ρ == null)
      {
        throw new AssertionError("ρ is null");
      }
      else if (λ == null)
      {
        throw new AssertionError("λ is null");
      }
      else if (ν == null)
      {
        throw new AssertionError("ν is null");
      }
      else
      {
        isInitialized = true;
      }
    }
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    vXℂ0007.close();
    vXℂ0008.close();
    vXℂ0009.close();
    vXℂ0010.close();
    vXℂ0011.close();
  }

  @Override
  public String getName()
  {
    return "Q";
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
    return "Q:λ*((((ⅈ*v)*ρ)*ν)-1)";
  }

  @Override
  public String typeset()
  {
    return "\\left(λ \\cdot \\left(\\left(\\left(\\left(ⅈ \\cdot v\\right) \\cdot ρ\\right) \\cdot ν\\right)-1\\right)\\right)";
  }
}
