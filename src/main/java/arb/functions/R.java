package arb.functions;

import arb.Initializable;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.Typesettable;
import arb.functions.rational.LommelPolynomial;
import arb.functions.rational.RationalFunctionSequence;

public class R implements
               RationalFunctionSequence,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public static void main( String args[] )
  {
    R r = new R();
    RationalFunction r3 = r.evaluate(3, 128);
    System.out.println("r3=" + r3 );
  }
  public boolean          isInitialized;
  public final Integer    cℤ2       = new Integer("2");
  public final Integer    cℤ1       = new Integer("1");
  public LommelPolynomial rXR1      = new LommelPolynomial();
  public RationalFunction iℚ1       = new RationalFunction();
  public RationalFunction elementℚ1 = new RationalFunction();
  public Real             iℝ1       = new Real();

  @Override
  public Class<RationalFunction> coDomainType()
  {
    return RationalFunction.class;
  }

  @Override
  public RationalFunction evaluate(Integer n, int order, int bits, RationalFunction result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    this.iℚ1.identity();
    this.rXR1.n.set(n);
    return (RationalFunction) this.rXR1.evaluate(null, order, bits, result);
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
      this.rXR1.v.set(this.cℤ1.div(this.cℤ2, 128, this.iℝ1));
      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ2.close();
    this.cℤ1.close();
    this.rXR1.close();
    this.iℚ1.close();
    this.elementℚ1.close();
    this.iℝ1.close();
  }

  @Override
  public String toString()
  {
    return "n➔R(n,1⁄2;z)";
  }

  @Override
  public String typeset()
  {
    return "R_{\\frac{1}{2}, n}(z)";
  }
}
