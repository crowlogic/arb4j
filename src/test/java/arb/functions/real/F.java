package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealRationalFunction;
import arb.Typesettable;

public class F implements RealRationalNullaryFunction, Typesettable, AutoCloseable, Initializable
{
  public boolean              isInitialized;
  Integer                     cℤ1;
  public Integer              p;
  public Integer              q;
  public Real                 α;
  public Real                 β;
  public Integer              N;
  public Integer              endIndexℤ1;
  public RealRationalFunction sumfℝ1;
  public Integer              n;
  public RealRationalFunction valuefℝ1;
  public factorfℝ1            factorfℝ1 = new factorfℝ1();

  @Override
  public Class<RealRationalFunction> coDomainType()
  {
    return RealRationalFunction.class;
  }

  @Override
  public RealRationalFunction evaluate(Object in, int order, int bits, RealRationalFunction result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    this.sumfℝ1.additiveIdentity();
    this.n.set(this.cℤ1);
    Integer var10000 = this.n;
    this.endIndexℤ1.set(this.N);

    while (var10000.compareTo(this.endIndexℤ1) <= 0)
    {
      this.sumfℝ1.add((RealRationalFunction) this.factorfℝ1.evaluate(this.n, bits, this.valuefℝ1), bits);
      var10000 = this.n.increment();
    }

    return result.set(this.sumfℝ1);
  }

  public F()
  {
    this.cℤ1        = new Integer("0");
    this.endIndexℤ1 = new Integer();
    this.sumfℝ1     = new RealRationalFunction();
    this.n          = new Integer();
    this.valuefℝ1   = new RealRationalFunction();
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
      this.factorfℝ1.p   = this.p;
      this.factorfℝ1.q   = this.q;
      this.factorfℝ1.α   = this.α;
      this.factorfℝ1.β   = this.β;
      this.factorfℝ1.N   = this.N;
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ1.close();
    this.endIndexℤ1.close();
    this.sumfℝ1.close();
    this.n.close();
    this.valuefℝ1.close();
    this.factorfℝ1.close();
  }

  @Override
  public String toString()
  {
    return "F:Σn➔(((neg(z^2))^n)*Πk➔α[k]⋰n{k=1…p})/((n!)*Πk➔β[k]⋰n{k=1…q}){n=0…N}";
  }

  @Override
  public String typeset()
  {
    return "\\add_{n = 0}^{N}{\\frac{((\\neg{(z)^{(2)}})^{(n)} \\cdot \\prod_{k = 1}^{p}{(α_{k})_{n}})}{(n! \\cdot \\prod_{k = 1}^{q}{(β_{k})_{n}})}}";
  }
}
