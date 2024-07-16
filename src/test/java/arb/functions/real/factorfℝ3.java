package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealRationalFunction;
import arb.Typesettable;
import arb.functions.Function;

public class factorfℝ3 implements Function<Integer, RealRationalFunction>, Typesettable, AutoCloseable, Initializable
{
  public boolean isInitialized;
  public Integer n;
  public Integer p;
  public Integer q;
  public Real    α;
  public Real    β;
  public Integer N;

  @Override
  public Class<RealRationalFunction> coDomainType()
  {
    return RealRationalFunction.class;
  }

  @Override
  public RealRationalFunction evaluate(Integer k, int order, int bits, RealRationalFunction result)
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
    return "factorfℝ3:k➔β[k]⋰n";
  }

  @Override
  public String typeset()
  {
    return "(β_{k})_{n}";
  }
}
