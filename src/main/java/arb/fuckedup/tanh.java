package arb.fuckedup;

import java.util.ArrayList;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.real.RealNullaryFunction;

public class tanh implements
                  RealNullaryFunction,
                  Typesettable,
                  AutoCloseable,
                  Initializable,
                  Named
{
  public boolean                           isInitialized;
  protected Context                        context = new Context();
  public Expression                        expression;
  public final Integer                     cℤ0000  = new Integer("1");
  public ArrayList<Function<Object, Real>> derivativeCache;

  @Override
  public Class<Object> domainType()
  {
    return Object.class;
  }

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Object in, int order, int bits, Real result)
  {
    if (order <= 1)
    {
      return this.cℤ0000.tanh(bits, result);
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

  @Override
  public void close()
  {
    this.cℤ0000.close();
  }

  @Override
  public String getName()
  {
    return null;
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
    return "tanh(1)";
  }

  @Override
  public String typeset()
  {
    return "\\tanh\\left(1\\right)";
  }
}
