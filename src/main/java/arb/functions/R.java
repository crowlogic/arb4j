package arb.functions;

import java.util.ArrayList;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.complex.ComplexPolynomialNullaryFunction;

public class R implements
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
  public Real                                           vℝ0001  = new Real();
  public Real                                           vℝ0002  = new Real();
  public Real                                           vℝ0003  = new Real();

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
    if (!this.isInitialized)
    {
      this.initialize();
    }

    if (order <= 1)
    {
      return this.λ.pow(this.cℤ0000, bits, this.vℝ0001).mul(this.ν.pow(this.cℤ0000, bits, this.vℝ0002), bits, this.vℝ0003).div(this.cℤ0000, bits, result);
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
    return ((ComplexPolynomial) this.evaluate()).integral();
  }

  @Override
  public Function derivative()
  {
    return ((ComplexPolynomial) this.evaluate()).derivative();
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
      if (this.λ == null)
      {
        throw new AssertionError("λ is null");
      }
      else if (this.ν == null)
      {
        throw new AssertionError("ν is null");
      }
      else
      {
        this.isInitialized = true;
      }
    }
  }

  @Override
  public void close()
  {
    this.cℤ0000.close();
    this.vℝ0001.close();
    this.vℝ0002.close();
    this.vℝ0003.close();
  }

  @Override
  public String getName()
  {
    return "R";
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
    return "R:((λ^2)*(ν^2))/2";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left({λ}^{2} \\cdot {ν}^{2}\\right)}{2}";
  }
}
