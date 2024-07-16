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
    if (!this.isInitialized)
    {
      this.initialize();
    }

    return new RealRationalHypergeometricFunction(this.vℝ1.set(new Real[]
    { this.cℤ1.neg(this.ℝ1), this.cℝ2, this.ℝ2.set(this.cℤ3) }),
                                                  this.vℝ2.set(new Real[]
                                                  { this.ℝ3.set(this.cℤ1), this.ℝ4.set(this.cℤ4) }),
                                                  RealRationalNullaryFunction.parse("½-(x/2)")).evaluate(null,
                                                                                                         1,
                                                                                                         bits,
                                                                                                         result);
  }

  @Override
  public void initialize()
  {
    if (this.isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else
    {
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ1.close();
    this.cℤ4.close();
    this.cℤ3.close();
    this.cℝ2.close();
    this.ℝ1.close();
    this.ℝ2.close();
    this.ℝ3.close();
    this.ℝ4.close();
    this.vℝ2.close();
    this.vℝ1.close();
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
