package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;

public class factorq3 implements
                      Function<Integer, RationalFunction>,
                      Typesettable,
                      AutoCloseable,
                      Initializable
{
  public boolean isInitialized;
  public Integer n;
  public Integer N;
  public Integer p;
  public Integer q;
  public Real    α;
  public Real    β;

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  @Override
  public RationalFunction evaluate(Integer k, int order, int bits, RationalFunction result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    return this.β.get(k).ascendingFactorial(this.n, bits, result);
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (this.p == null)
    {
      throw new AssertionError("p shan't be null");
    }
    else if (this.q == null)
    {
      throw new AssertionError("q shan't be null");
    }
    else if (this.α == null)
    {
      throw new AssertionError("α shan't be null");
    }
    else if (this.β == null)
    {
      throw new AssertionError("β shan't be null");
    }
    else if (this.N == null)
    {
      throw new AssertionError("N shan't be null");
    }
    else
    {
      this.isInitialized = true;
    }
  }

  @Override
  public String toString()
  {
    return "factorq3:k➔β[k]⋰n";
  }

  @Override
  public String typeset()
  {
    return "(β_{k})_{n}";
  }
}
