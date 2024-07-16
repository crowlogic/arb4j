package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.RealRationalFunction;
import arb.Typesettable;
import arb.functions.sequences.Sequence;

public class R implements Sequence<RealRationalFunction>, Typesettable, AutoCloseable, Initializable
{
  public boolean              isInitialized;
  Integer                     cℤ2 = new Integer("1");
  Integer                     cℤ1 = new Integer("2");
  public Real                 v;
  public Real                 vℝ2 = new Real();
  public Real                 vℝ1 = new Real();
  public Real                 ℝ1  = new Real();
  public Real                 ℝ2  = new Real();
  public Real                 ℝ3  = new Real();
  public Real                 ℝ4  = new Real();
  public RealRationalFunction fℝ4 = new RealRationalFunction();
  public RealRationalFunction fℝ3 = new RealRationalFunction();
  public RealRationalFunction fℝ5 = new RealRationalFunction();
  public Real                 ℝ5  = new Real();
  public Real                 ℝ6  = new Real();
  public Real                 ℝ7  = new Real();
  public RealRationalFunction fℝ2 = new RealRationalFunction();
  public RealRationalFunction fℝ1 = new RealRationalFunction();
  public Real                 ℝ8  = new Real();

  @Override
  public Class<RealRationalFunction> coDomainType()
  {
    return RealRationalFunction.class;
  }

  @Override
  public RealRationalFunction evaluate(Integer n, int order, int bits, RealRationalFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    Real numéraire = vℝ1.set(RealConstants.half.sub(n.div(cℤ1, bits, ℝ1), bits, ℝ2), n.div(cℤ1, bits, ℝ3).neg(ℝ4));
    Real divisor   = vℝ2.set(v, n.neg(ℝ5), cℤ2.sub(v, bits, ℝ6).sub(n, bits, ℝ7));
    var  arg       = RealRationalNullaryFunction.parse("-z^2");
    System.out.println("arg=" + arg.syntaxTextTree() );
    try ( var f = new RealRationalHypergeometricFunction(numéraire,
                                                         divisor,
                                                         arg))
    {
      RealRationalFunction rhs = v.ascendingFactorial(n, bits, ℝ8)
                                  .div(fℝ2.identity().div(cℤ1, bits, fℝ3).pow(n, bits, fℝ4), bits, fℝ5);
      f.evaluate(null, 1, bits, fℝ1);
      System.out.format("numer=%s\ndenom=%s\n", numéraire, divisor);
      System.out.println("lhs=" + fℝ1 );
      System.out.println("rhs=" + rhs );
      return fℝ1.mul(rhs, bits, result);
    }
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (v == null)
    {
      throw new AssertionError("v shan't be null");
    }
    else
    {
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ2.close();
    cℤ1.close();
    vℝ2.close();
    vℝ1.close();
    ℝ1.close();
    ℝ2.close();
    ℝ3.close();
    ℝ4.close();
    fℝ4.close();
    fℝ3.close();
    fℝ5.close();
    ℝ5.close();
    ℝ6.close();
    ℝ7.close();
    fℝ2.close();
    fℝ1.close();
    ℝ8.close();
  }

  @Override
  public String toString()
  {
    return "n➔pFq([½-n/2,-n/2],[v,-n,1-v-n],-z²)*(v₍ₙ₎/(z/2)^n)";
  }

  @Override
  public String typeset()
  {
    return "(\\pFq{-(z)^{(2)}} \\cdot \\frac{(v)_{n}}{(\\frac{z}{2})^{(n)}})";
  }
}
