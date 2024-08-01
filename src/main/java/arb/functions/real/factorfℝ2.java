package arb.functions.real;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Typesettable;
import arb.functions.Function;

public class factorfℝ2 implements Function<Integer, RationalFunction>, Typesettable, AutoCloseable, Initializable
{
  public boolean  isInitialized;
  public Integer  n;
  public Integer  p;
  public Integer  q;
  public Fraction α;
  public Fraction β;
  public Integer  N;

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

    return this.α.get(k).ascendingFactorial(this.n, bits, result);
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
    return "factorfℝ2:k➔α[k]⋰n";
  }

  @Override
  public String typeset()
  {
    return "(α_{k})_{n}";
  }
}
