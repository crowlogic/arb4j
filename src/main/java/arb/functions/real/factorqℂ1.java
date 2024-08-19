package arb.functions.real;

import arb.Complex;
import arb.ComplexRationalFunction;
import arb.Initializable;
import arb.Integer;
import arb.Typesettable;
import arb.functions.Function;

public class factorqℂ1 implements
                       Function<Integer, ComplexRationalFunction>,
                       Typesettable,
                       AutoCloseable,
                       Initializable
{
  public boolean                 isInitialized;
  Integer                        cℤ2;
  Integer                        cℤ1;
  public factorqℂ2               factorqℂ2 = new factorqℂ2();
  public factorqℂ3               factorqℂ3 = new factorqℂ3();
  public Integer                 N;
  public Integer                 p;
  public Integer                 q;
  public Complex                 α;
  public Complex                 β;
  public ComplexRationalFunction qℂ6;
  public ComplexRationalFunction qℂ5;
  public Integer                 endIndexℤ3;
  public Integer                 endIndexℤ2;
  public ComplexRationalFunction qℂ2;
  public ComplexRationalFunction qℂ1;
  public ComplexRationalFunction valueqℂ2;
  public ComplexRationalFunction qℂ4;
  public ComplexRationalFunction valueqℂ3;
  public ComplexRationalFunction qℂ3;
  public Integer                 ℤ1;
  public Integer                 k;
  public ComplexRationalFunction prodqℂ1;
  public ComplexRationalFunction prodqℂ2;

  @Override
  public Class<ComplexRationalFunction> coDomainType()
  {
    return ComplexRationalFunction.class;
  }

  @Override
  public ComplexRationalFunction
         evaluate(Integer n, int order, int bits, ComplexRationalFunction result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    ComplexRationalFunction var10000 = this.qℂ1.identity()
                                               .pow(this.cℤ2, bits, this.qℂ2)
                                               .neg(bits, this.qℂ3)
                                               .pow(n, bits, this.qℂ4);
    this.factorqℂ2.n = n;
    this.prodqℂ1.multiplicativeIdentity();
    this.k.set(this.cℤ1);
    Integer var10001 = this.k;
    this.endIndexℤ2.set(this.p);

    while (var10001.compareTo(this.endIndexℤ2) <= 0)
    {
      this.prodqℂ1.mul((ComplexRationalFunction) this.factorqℂ2.evaluate(this.k,
                                                                         bits,
                                                                         this.valueqℂ2),
                       bits);
      var10001 = this.k.increment();
    }

    var10000         = var10000.mul(this.prodqℂ1, bits, this.qℂ5);
    var10001         = n.factorial(bits, this.ℤ1);
    this.factorqℂ3.n = n;
    this.prodqℂ2.multiplicativeIdentity();
    this.k.set(this.cℤ1);
    Integer var10002 = this.k;
    this.endIndexℤ3.set(this.q);

    while (var10002.compareTo(this.endIndexℤ3) <= 0)
    {
      this.prodqℂ2.mul((ComplexRationalFunction) this.factorqℂ3.evaluate(this.k,
                                                                         bits,
                                                                         this.valueqℂ3),
                       bits);
      var10002 = this.k.increment();
    }

    return var10000.div(var10001.mul(this.prodqℂ2, bits, this.qℂ6), bits, result);
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

  public factorqℂ1()
  {
    this.cℤ2        = new Integer("2");
    this.cℤ1        = new Integer("1");
    this.qℂ6        = new ComplexRationalFunction();
    this.qℂ5        = new ComplexRationalFunction();
    this.endIndexℤ3 = new Integer();
    this.endIndexℤ2 = new Integer();
    this.qℂ2        = new ComplexRationalFunction();
    this.qℂ1        = new ComplexRationalFunction();
    this.valueqℂ2   = new ComplexRationalFunction();
    this.qℂ4        = new ComplexRationalFunction();
    this.valueqℂ3   = new ComplexRationalFunction();
    this.qℂ3        = new ComplexRationalFunction();
    this.ℤ1         = new Integer();
    this.k          = new Integer();
    this.prodqℂ1    = new ComplexRationalFunction();
    this.prodqℂ2    = new ComplexRationalFunction();
  }

  @Override
  public void close()
  {
    this.cℤ2.close();
    this.cℤ1.close();
    this.qℂ6.close();
    this.qℂ5.close();
    this.endIndexℤ3.close();
    this.endIndexℤ2.close();
    this.qℂ2.close();
    this.qℂ1.close();
    this.valueqℂ2.close();
    this.qℂ4.close();
    this.valueqℂ3.close();
    this.qℂ3.close();
    this.ℤ1.close();
    this.k.close();
    this.prodqℂ1.close();
    this.prodqℂ2.close();
    this.factorqℂ2.close();
    this.factorqℂ3.close();
  }

  @Override
  public String toString()
  {
    return "factorqℂ1:n➔(((neg(z^2))^n)*Πk➔α[k]⋰n{k=1…p})/((n!)*Πk➔β[k]⋰n{k=1…q})";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left((\\neg{(z)^{(2)}})^{(n)} \\cdot \\prod_{k = 1}^{p}{(α_{k})_{n}}\\right)}{\\left(n! \\cdot \\prod_{k = 1}^{q}{(β_{k})_{n}}\\right)}";
  }
}
