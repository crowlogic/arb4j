package arb.functions.real;

import arb.Complex;
import arb.ComplexQuasiPolynomial;
import arb.Initializable;
import arb.Integer;
import arb.Typesettable;
import arb.functions.sequences.Sequence;

public class F implements Sequence<ComplexQuasiPolynomial>, Typesettable, AutoCloseable, Initializable
{
  public boolean isInitialized;
  Integer        cℤ2 = new Integer("2");
  Integer        cℤ1 = new Integer("1");
  public Complex vℂ1 = new Complex();
  public Complex ℂ4  = new Complex();
  public Complex ℂ3  = new Complex();
  public Complex ℂ2  = new Complex();
  public Complex vℂ2 = new Complex();
  public Complex ℂ1  = new Complex();

  @Override
  public Class<ComplexQuasiPolynomial> coDomainType()
  {
    return ComplexQuasiPolynomial.class;
  }

  @Override
  public ComplexQuasiPolynomial evaluate(Integer n, int order, int bits, ComplexQuasiPolynomial result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    // this should not be an evaluation.. instead of constructing a new
    // quasipolynomial set this stuf into the result
    return new ComplexQuasiPolynomial(vℂ1.set(new Complex[]
    { ℂ1.set(cℤ1), ℂ2.set(n), n.neg(ℂ3) }),
                                      vℂ2.set(new Complex[]
                                      { cℤ1.div(cℤ2, bits, ℂ4) }),
                                      ComplexQuasiPolynomial.parse("(ⅈ*y)/2")).evaluate(null, 1, bits, result);
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
    vℂ1.close();
    ℂ4.close();
    ℂ3.close();
    ℂ2.close();
    vℂ2.close();
    ℂ1.close();
  }

  @Override
  public String toString()
  {
    return "n➔pFq([1,n,-n],[1/2],ⅈ*y/2)";
  }

  @Override
  public String typeset()
  {
    return "\\pFq{\\frac{ⅈ \\cdot y}{2}}";
  }
}
