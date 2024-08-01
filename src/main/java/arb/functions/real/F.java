package arb.functions.real;

import arb.Fraction;
import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Typesettable;

public class F implements RationalNullaryFunction, Typesettable, AutoCloseable, Initializable
{
  public boolean          isInitialized;
  Integer                 cℤ1;
  public Integer          p;
  public Integer          q;
  public Fraction         α;
  public Fraction         β;
  public Integer          N;
  public Integer          endIndexℤ1;
  public RationalFunction sumfℝ1;
  public Integer          n;
  public RationalFunction valuefℝ1;
  public factorfℝ1        factorfℝ1 = new factorfℝ1();

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  public static void main( String args[] )
  {
    pFq pfq = new pFq();
    pfq.evaluate(128);
    F f = new F();
    pfq.f.context.injectVariableReferences(f);
    RationalFunction a = f.evaluate(128);
    System.out.println("f=" + a);
  }
  
  @Override
  public RationalFunction evaluate(Object in, int order, int bits, RationalFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    sumfℝ1.additiveIdentity();
    n.set(cℤ1);
    Integer var10000 = n;
    endIndexℤ1.set(N);

    while (var10000.compareTo(endIndexℤ1) <= 0)
    {
      factorfℝ1.evaluate(n, bits, valuefℝ1);
      System.out.format("f[%s]=%s\n", var10000, valuefℝ1 );
      sumfℝ1.add(valuefℝ1, bits);
      var10000 = n.increment();
    }

    return result.set(sumfℝ1);
  }

  public F()
  {
    cℤ1        = new Integer("0");
    endIndexℤ1 = new Integer();
    sumfℝ1     = new RationalFunction();
    n          = new Integer();
    valuefℝ1   = new RationalFunction();
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
      factorfℝ1.p   = p;
      factorfℝ1.q   = q;
      factorfℝ1.α   = α;
      factorfℝ1.β   = β;
      factorfℝ1.N   = N;
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ1.close();
    endIndexℤ1.close();
    sumfℝ1.close();
    n.close();
    valuefℝ1.close();
    factorfℝ1.close();
  }

  @Override
  public String toString()
  {
    return "F:Σn➔((((1/2)-(z/2))^n)*Πk➔α[k]⋰n{k=1…p})/((n!)*Πk➔β[k]⋰n{k=1…q}){n=0…N}";
  }

  @Override
  public String typeset()
  {
    return "\\add_{n = 0}^{N}{\\frac{\\left((\\left(\\frac{1}{2}-\\frac{z}{2}\\right))^{(n)} \\cdot \\prod_{k = 1}^{p}{(α_{k})_{n}}\\right)}{\\left(n! \\cdot \\prod_{k = 1}^{q}{(β_{k})_{n}}\\right)}}";
  }
}
