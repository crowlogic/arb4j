package arb;

import arb.functions.polynomials.RealPolynomialNullaryFunction;
import arb.functions.polynomials.orthogonal.real.ShiftedJacobiPolynomials;

public class integralℝ0001 implements
                           RealPolynomialNullaryFunction,
                           Typesettable,
                           AutoCloseable,
                           Initializable
{
  public boolean                  isInitialized;
  public final Integer            cℤ0000  = new Integer("3");
  public final Integer            cℤ0001  = new Integer("2");
  public final Integer            cℤ0002  = new Integer("1");
  public RealPolynomial           vXℝ0001 = new RealPolynomial();
  public RealPolynomial           vXℝ0002 = new RealPolynomial();
  public Integer                  vℤ0001  = new Integer();
  public ShiftedJacobiPolynomials P;

  @Override
  public Class<Object> domainType()
  {
    return Object.class;
  }

  @Override
  public Class<RealPolynomial> coDomainType()
  {
    return RealPolynomial.class;
  }

  @Override
  public RealPolynomial evaluate(Object in, int order, int bits, RealPolynomial result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    return P.evaluate(cℤ0000, order, bits, vXℝ0001)
            .pow(cℤ0001.add(cℤ0002, bits, vℤ0001), bits, vXℝ0002)
            .div(vℤ0001, bits, result);
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
    cℤ0000.close();
    cℤ0001.close();
    cℤ0002.close();
    vXℝ0001.close();
    vXℝ0002.close();
    vℤ0001.close();
    P.close();
  }

  @Override
  public String toString()
  {
    return "(P(3)^(2+1))/(2+1)";
  }

  @Override
  public String typeset()
  {
    return "\\frac{{\\P(3)}^{(2 + 1)}}{2 + 1}";
  }
}
