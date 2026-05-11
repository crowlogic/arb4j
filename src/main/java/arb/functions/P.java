package arb.functions;

import arb.ComplexConstants;
import arb.ComplexPolynomial;
import arb.Field;
import arb.Initializable;
import arb.Integer;
import arb.Named;
import arb.Real;
import arb.Typesettable;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import java.util.ArrayList;

public class P implements
               ComplexPolynomialNullaryFunction,
               Typesettable,
               AutoCloseable,
               Initializable,
               Named
{
  public boolean                                        isInitialized;
  protected Context                                     context = new Context();
  public Expression                                     expression;
  public final Integer                                  cℤ0000  = new Integer("2");
  public Real                                           λ;
  public Real                                           μ;
  public Real                                           ν;
  public Real                                           ρ;
  public ArrayList<Function<Object, ComplexPolynomial>> derivativeCache;
  public ComplexPolynomial                              vXℂ0001 = new ComplexPolynomial();
  public ComplexPolynomial                              vXℂ0002 = new ComplexPolynomial();
  public ComplexPolynomial                              vXℂ0003 = new ComplexPolynomial();
  public ComplexPolynomial                              vXℂ0004 = new ComplexPolynomial();
  public ComplexPolynomial                              vXℂ0005 = new ComplexPolynomial();
  public ComplexPolynomial                              vXℂ0006 = new ComplexPolynomial();

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
      return vXℂ0001.identity()
                    .pow(cℤ0000, bits, vXℂ0002)
                    .add(ComplexConstants.ⅈ.mul(vXℂ0003.identity(), bits, vXℂ0004), bits, vXℂ0005)
                    .div(cℤ0000, bits, vXℂ0006)
                    .neg(result);
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
      isInitialized   = true;
    }
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    vXℂ0001.close();
    vXℂ0002.close();
    vXℂ0003.close();
    vXℂ0004.close();
    vXℂ0005.close();
    vXℂ0006.close();
  }

  @Override
  public String getName()
  {
    return "P";
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
    return "P:-((v^2)+(ⅈ*v))/2";
  }

  @Override
  public String typeset()
  {
    return "-(\\frac{\\left({v}^{2} + \\left(ⅈ \\cdot v\\right)\\right)}{2})";
  }
}
