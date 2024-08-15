package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;
import arb.functions.rational.RationalNullaryFunction;

public class F implements
               RationalNullaryFunction,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean          isInitialized;
  Integer                 cℤ1;
  public factorq1         factorq1 = new factorq1();
  public Integer          N;
  public Integer          p;
  public Integer          q;
  public Real             α;
  public Real             β;
  public RationalFunction sumq1;
  public Integer          endIndexℤ1;
  public Integer          n;
  public RationalFunction valueq1;

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  @Override
  public RationalFunction evaluate(Object in, int order, int bits, RationalFunction result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    this.sumq1.additiveIdentity();
    this.n.set(this.cℤ1);
    Integer var10000 = this.n;
    this.endIndexℤ1.set(this.N);

    while (var10000.compareTo(this.endIndexℤ1) <= 0)
    {
      this.sumq1.add((RationalFunction) this.factorq1.evaluate(this.n, bits, this.valueq1), bits);
      var10000 = this.n.increment();
    }

    return result.set(this.sumq1);
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

  public F()
  {
    this.cℤ1        = new Integer("0");
    this.sumq1      = new RationalFunction();
    this.endIndexℤ1 = new Integer();
    this.n          = new Integer();
    this.valueq1    = new RationalFunction();
  }

  @Override
  public void close()
  {
    this.cℤ1.close();
    this.sumq1.close();
    this.endIndexℤ1.close();
    this.n.close();
    this.valueq1.close();
    this.factorq1.close();
  }

  @Override
  public String toString()
  {
    return "F:Σn➔(((neg(z^2))^n)*Πk➔α[k]⋰n{k=1…p})/((n!)*Πk➔β[k]⋰n{k=1…q}){n=0…N}";
  }

  @Override
  public String typeset()
  {
    return "\\add_{n = 0}^{N}{\\frac{\\left((\\neg{(z)^{(2)}})^{(n)} \\cdot \\prod_{k = 1}^{p}{(α_{k})_{n}}\\right)}{\\left(n! \\cdot \\prod_{k = 1}^{q}{(β_{k})_{n}}\\right)}}";
  }
}
