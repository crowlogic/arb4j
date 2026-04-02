package arb.functions;

import java.util.ArrayList;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.integer.Sequence;

public class operandF0001 implements
                          Sequence<Real>,
                          Typesettable,
                          AutoCloseable,
                          Initializable,
                          Named
{
  public boolean   isInitialized;
  public Context   context;
  public ArrayList cache;
  public Integer   j;
  public Real      x;

  @Override
  public Class<Integer> domainType()
  {
    return Integer.class;
  }

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Integer k, int order, int bits, Real result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    Real var10000 = (Real) Function.peek(this.cache, k.getSignedValue());
    return var10000 != null ? var10000 : (Real) Function.poke(this.cache, k.getSignedValue(), result.set(k));
  }

  @Override
  public Sequence derivative()
  {
    return Function.express(Integer.class, Real.class, Sequence.class, "diffnull", "diff(k,k)", this.context);
  }

  @Override
  public Sequence integral()
  {
    return Function.express(Integer.class, Real.class, Sequence.class, "intnull", "int(k,k)", this.context);
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
      this.cache         = new ArrayList();
      this.isInitialized = true;
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
  public String toString()
  {
    return "k➔k";
  }

  @Override
  public String typeset()
  {
    return "k";
  }
}
