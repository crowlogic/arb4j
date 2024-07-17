package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.RealConstants;
import arb.RealRationalFunction;
import arb.Typesettable;

public class W implements RealRationalNullaryFunction, Typesettable, AutoCloseable, Initializable
{
  public boolean              isInitialized;
  Integer                     cℤ2 = new Integer("2");
  Integer                     cℤ1 = new Integer("1");
  public Real                 ℝ1  = new Real();
  public Real                 ℝ2  = new Real();
  public RealRationalFunction fℝ4 = new RealRationalFunction();
  public RealRationalFunction fℝ3 = new RealRationalFunction();
  public RealRationalFunction fℝ6 = new RealRationalFunction();
  public RealRationalFunction fℝ5 = new RealRationalFunction();
  public RealRationalFunction fℝ2 = new RealRationalFunction();
  public RealRationalFunction fℝ1 = new RealRationalFunction();

  @Override
  public Class<RealRationalFunction> coDomainType()
  {
    return RealRationalFunction.class;
  }

  public static void main(String[] args)
  {
    W r = new W();
   // Larg arg = new Larg();
    //var initialValue = arg.evaluate(128);
    RealRationalFunction x = r.evaluate( 128, new RealRationalFunction() );
    System.out.println("x=" + x);
  //  System.out.format("initialValue=%s\n", initialValue);
    System.out.println("f(2.3)=" + x.eval(2.3) );
  }
  
  @Override
  public RealRationalFunction evaluate(Object in, int order, int bits, RealRationalFunction result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    cℤ1.div(cℤ2, bits, ℝ1)
       .sub(cℤ2.div(fℝ1.identity(), bits, fℝ2), bits, fℝ3)
       .mul(cℤ1.div(cℤ2, bits, ℝ2).sub(cℤ2.div(fℝ4.identity(), bits, fℝ5), bits, fℝ6), bits, result);

    return result;
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
    cℤ2.close();
    cℤ1.close();
    ℝ1.close();
    ℝ2.close();
    fℝ4.close();
    fℝ3.close();
    fℝ6.close();
    fℝ5.close();
    fℝ2.close();
    fℝ1.close();
  }

  @Override
  public String toString()
  {
    return "W:n➔(1/2-2/x)*(1/2-2/x)";
  }

  @Override
  public String typeset()
  {
    return "((\\frac{1}{2}-\\frac{2}{x}) \\cdot (\\frac{1}{2}-\\frac{2}{x}))";
  }
}
