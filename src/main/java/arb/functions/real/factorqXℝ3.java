package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealQuasiPolynomial;
import arb.Typesettable;
import arb.functions.Function;

public class factorqXℝ3 implements Function<Integer, RealQuasiPolynomial>, Typesettable, AutoCloseable, Initializable
{
  public boolean isInitialized;
  public Integer n;
  public Integer p;
  public Integer q;
  public Real    α;
  public Real    β;
  public Integer N;

  @Override
  public Class<RealQuasiPolynomial> coDomainType()
  {
    return RealQuasiPolynomial.class;
  }

  @Override
  public RealQuasiPolynomial evaluate(Integer k, int order, int bits, RealQuasiPolynomial result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return β.get(k).ascendingFactorial(n, bits, result);
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
    return "factorqXℝ3:k➔β[k]⋰n";
  }

  @Override
  public String typeset()
  {
    return "(β_{k})_{n}";
  }
}
