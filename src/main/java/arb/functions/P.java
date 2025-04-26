package arb.functions;

import arb.*;
import arb.Integer;
import arb.functions.polynomials.orthogonal.real.ShiftedJacobiPolynomials;
import arb.functions.real.RealNullaryFunction;

public class P implements
               RealNullaryFunction,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean                  isInitialized;
  public final Real               cℝ0000  = new Real("0.75",
                                                     128);
  public final Integer            cℤ0000  = new Integer("3");
  public RealPolynomial           vXℝ0001 = new RealPolynomial();
  public ShiftedJacobiPolynomials P;

  @Override
  public Class<Object> domainType()
  {
    return Object.class;
  }

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }

  @Override
  public Real evaluate(Object in, int order, int bits, Real result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    return (Real) ((RealPolynomial) this.P.evaluate(this.cℤ0000, order, bits, this.vXℝ0001)).evaluate(this.cℝ0000,
                                                                                                      order,
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
    this.cℝ0000.close();
    this.cℤ0000.close();
    this.vXℝ0001.close();
    this.P.close();
  }

  @Override
  public String toString()
  {
    return "P(3)(0_75):InlineFunctionNode[functionNode=P(3), arg=0.75]";
  }

  @Override
  public String typeset()
  {
    return "\\left(0.75\\right)";
  }
}
