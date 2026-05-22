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
import arb.functions.integer.Sequence;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;

public class operandF0002 implements
                          Sequence<ComplexPolynomial>,
                          Typesettable,
                          AutoCloseable,
                          Initializable,
                          Named
{
  public boolean                                         isInitialized;
  protected Context                                      context;
  public Expression                                      expression;
  private boolean                                        evaluating;
  public Pn                                              Pn;
  public Integer                                         M;
  public ComplexPolynomial                               p0;
  public ComplexPolynomial                               p1;
  public Complex                                         v;
  public Real                                            μ;
  public ArrayList<Function<Integer, ComplexPolynomial>> derivativeCache;
  public ComplexPolynomial                               vXℂ0029 = new ComplexPolynomial();
  public ComplexPolynomial                               vXℂ0030 = new ComplexPolynomial();
  public ComplexPolynomial                               vXℂ0031 = new ComplexPolynomial();
  public Integer                                         vℤ0016  = new Integer();

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
  public ComplexPolynomial evaluate(Integer j, int order, int bits, ComplexPolynomial result)
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
        var10000 = this.evaluate_body(j, order, bits, result);
      }
      finally
      {
        this.evaluating = false;
      }

      return (ComplexPolynomial) var10000;
    }
  }

  private ComplexPolynomial evaluate_body(Integer j, int order, int bits, ComplexPolynomial result)
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
      ComplexPolynomial var9 = ((ComplexPolynomial) this.Pn.evaluate(this.M, order, bits, this.vXℂ0029)).get(this.M.sub(j, bits, this.vℤ0016))
                                                                                                        .mul(this.vXℂ0030.identity().pow(j, bits, this.vXℂ0031),
                                                                                                             bits,
                                                                                                             result);
      var9.setIndependentVariableName("z");
      return var9;
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
        Function var10001 = this.context.lookupFunctionInstance("Pn");
        if (var10001 != null)
        {
          this.Pn = (Pn) var10001;
        }
        else
        {
          this.Pn         = new Pn();
          this.Pn.context = this.context;
        }
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

      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.vXℂ0029.close();
    this.vXℂ0030.close();
    this.vXℂ0031.close();
    this.vℤ0016.close();
    if (this.Pn != null)
    {
      this.Pn.close();
    }
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
    return String.format("j➔(Pn(%1$s)[%1$s-j])*(z^j)", String.valueOf(this.M));
  }

  @Override
  public String typeset()
  {
    return "\\left(\\Pn\\left(M\\right)_{\\left(M-j\\right)} \\cdot {z}^{j}\\right)";
  }
}
