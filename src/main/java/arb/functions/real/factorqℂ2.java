package arb.functions.real;

import arb.Complex;
import arb.ComplexRationalFunction;
import arb.Initializable;
import arb.Integer;
import arb.Typesettable;
import arb.functions.Function;

public class factorqℂ2 implements
                       Function<Integer, ComplexRationalFunction>,
                       Typesettable,
                       AutoCloseable,
                       Initializable
{
  public boolean isInitialized;
  public Integer n;
  public Integer N;
  public Integer p;
  public Integer q;
  public Complex α;
  public Complex β;

  @Override
  public Class<ComplexRationalFunction> coDomainType()
  {
    return ComplexRationalFunction.class;
  }

  @Override
  public ComplexRationalFunction
         evaluate(Integer k, int order, int bits, ComplexRationalFunction result)
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
    return "factorqℂ2:k➔α[k]⋰n";
  }

  @Override
  public String typeset()
  {
    return "(α_{k})_{n}";
  }
}
