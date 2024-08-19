package arb.functions.real;

import arb.Complex;
import arb.ComplexRationalFunction;
import arb.Initializable;
import arb.Integer;
import arb.Typesettable;
import arb.functions.rational.ComplexRationalNullaryFunction;

public class F implements
               ComplexRationalNullaryFunction,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean                 isInitialized;
  Integer                        cℤ1;
  public factorqℂ1               factorqℂ1 = new factorqℂ1();
  public Integer                 N;
  public Integer                 p;
  public Integer                 q;
  public Complex                 α;
  public Complex                 β;
  public ComplexRationalFunction sumqℂ1;
  public Integer                 endIndexℤ1;
  public ComplexRationalFunction valueqℂ1;
  public Integer                 n;

  @Override
  public Class<ComplexRationalFunction> coDomainType()
  {
    return ComplexRationalFunction.class;
  }

  @Override
  public ComplexRationalFunction
         evaluate(Object in, int order, int bits, ComplexRationalFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    sumqℂ1.additiveIdentity();
    n.set(cℤ1);
    Integer var10000 = n;
    endIndexℤ1.set(N);

    while (var10000.compareTo(endIndexℤ1) <= 0)
    {
      factorqℂ1.evaluate(n, bits, valueqℂ1);
      System.out.format("factor1[%s]=%s\n", n, valueqℂ1);
      sumqℂ1.add(valueqℂ1, bits);
      var10000 = n.increment();
    }

    return result.set(sumqℂ1);
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

  public F()
  {
    cℤ1        = new Integer("0");
    sumqℂ1     = new ComplexRationalFunction();
    endIndexℤ1 = new Integer();
    valueqℂ1   = new ComplexRationalFunction();
    n          = new Integer();
  }

  @Override
  public void close()
  {
    cℤ1.close();
    sumqℂ1.close();
    endIndexℤ1.close();
    valueqℂ1.close();
    n.close();
    factorqℂ1.close();
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
