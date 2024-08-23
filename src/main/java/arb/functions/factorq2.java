package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;

public class factorq2 implements
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
    if (!isInitialized)
    {
      initialize();
    }

    return α.get(k).ascendingFactorial(n, bits, result);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (p == null)
    {
      throw new AssertionError("p shan't be null");
    }
    else if (q == null)
    {
      throw new AssertionError("q shan't be null");
    }
    else if (α == null)
    {
      throw new AssertionError("α shan't be null");
    }
    else if (β == null)
    {
      throw new AssertionError("β shan't be null");
    }
    else if (N == null)
    {
      throw new AssertionError("N shan't be null");
    }
    else
    {
      isInitialized = true;
    }
  }

  @Override
  public String toString()
  {
    return "factorq2:k➔α[k]⋰n";
  }

  @Override
  public String typeset()
  {
    return "(α_{k})_{n}";
  }
}
