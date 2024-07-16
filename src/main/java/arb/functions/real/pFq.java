package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealRationalFunction;
import arb.Typesettable;

public class pFq implements RealRationalNullaryFunction, Typesettable, AutoCloseable, Initializable
{
  public boolean isInitialized;
  Integer        cℤ1 = new Integer("2");
  Integer        cℤ4 = new Integer("4");
  Integer        cℤ3 = new Integer("1");
  Real           cℝ2 = new Real("3.5",
                                128);
  public Real    ℝ1  = new Real();
  public Real    ℝ2  = new Real();
  public Real    ℝ3  = new Real();
  public Real    ℝ4  = new Real();
  public Real    vℝ2 = new Real();
  public Real    vℝ1 = new Real();

  @Override
  public Class<RealRationalFunction> coDomainType()
  {
    return RealRationalFunction.class;
  }

  @Override
  public RealRationalFunction evaluate(Object in, int order, int bits, RealRationalFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    Real[] numerator   = new Real[]
    { cℤ1.neg(ℝ1), cℝ2, ℝ2.set(cℤ3) };

    Real[] denominator = new Real[]
    { ℝ3.set(cℤ1), ℝ4.set(cℤ4) };

    var    arg         = RealRationalNullaryFunction.parse("½-(x/2)");

    System.out.println("arg=" + arg);

    var                         f    = arg.instantiate();
    RealRationalNullaryFunction f2   = f;
    RealRationalFunction        val2 = f2.evaluate(128);
    System.out.println("f=" + f);
    System.out.println("f()=" + val2);

    
    try ( Real vNumer = vℝ1.set(numerator); Real vDenom = vℝ2.set(denominator);
          var h = new RealRationalHypergeometricFunction(vNumer,
                                                         vDenom,
                                                         arg))
    {
      System.out.format("vNumer=%s\nvDenom=%s\n", vNumer, vDenom );
      return h.evaluate(null, 1, bits, result);
    }
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else
    {
      isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    cℤ1.close();
    cℤ4.close();
    cℤ3.close();
    cℝ2.close();
    ℝ1.close();
    ℝ2.close();
    ℝ3.close();
    ℝ4.close();
    vℝ2.close();
    vℝ1.close();
  }

  @Override
  public String toString()
  {
    return "pFq([-2,3.5,1],[2,4],½-x/2)";
  }

  @Override
  public String typeset()
  {
    return "\\pFq{(\\frac{1}{2}-\\frac{x}{2})}";
  }
}
