package arb.functions.real;

import arb.Initializable;
import arb.Integer;
import arb.RealPolynomial;
import arb.Typesettable;
import arb.functions.polynomials.RealPolynomialNullaryFunction;
import arb.functions.polynomials.orthogonal.real.JacobiPolynomials.DerivativeSequence;
import arb.functions.polynomials.orthogonal.real.ShiftedJacobiPolynomials;

public class Snippet implements
                     RealPolynomialNullaryFunction,
                     Typesettable,
                     AutoCloseable,
                     Initializable
{
  public static void main( String args[] )
  {
    var main = new Snippet();
    main.P = new ShiftedJacobiPolynomials();
    main.diffP = main.P.derivative();
                  
    var x = main.evaluate();
    System.out.println("x=" + x );
    
  }
  public boolean                  isInitialized;
  public final Integer            cℤ0000           = new Integer("3");
  public final Integer            cℤ0001           = new Integer("2");
  public final Integer            cℤ0002           = new Integer("1");
  public final Integer            cℤ0003           = new Integer("0");
  public RealPolynomial           lowerValueXℝ0001 = new RealPolynomial();
  public RealPolynomial           upperValueXℝ0001 = new RealPolynomial();
  public RealPolynomial           vXℝ0006          = new RealPolynomial();
  public RealPolynomial           vXℝ0007          = new RealPolynomial();
  public RealPolynomial           vXℝ0008          = new RealPolynomial();
  public RealPolynomial           vXℝ0009          = new RealPolynomial();
  public RealPolynomial           vXℝ0010          = new RealPolynomial();
  public RealPolynomial           vXℝ0011          = new RealPolynomial();
  public Integer                  vℤ0002           = new Integer();
  public integralXℝ0001           integralXℝ0001;
  public DerivativeSequence       diffP;
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

    return ((RealPolynomial) P.evaluate(cℤ0000,
                                        order,
                                        bits,
                                        vXℝ0006)).pow(cℤ0001.add(cℤ0002, bits, vℤ0002), bits, vXℝ0007)
                                                 .div(vℤ0002, bits, vXℝ0008)
                                                 .div(((RealPolynomial) diffP.evaluate(cℤ0000,
                                                                                       order,
                                                                                       bits,
                                                                                       vXℝ0009)).mul(cℤ0003,
                                                                                                     bits,
                                                                                                     vXℝ0010),
                                                      bits,
                                                      vXℝ0011);
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
      if (integralXℝ0001 == null)
      {
        integralXℝ0001 = new integralXℝ0001();
      }

      integralXℝ0001.diffP = diffP;
      integralXℝ0001.P     = P;
      isInitialized        = true;
    }
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    cℤ0001.close();
    cℤ0002.close();
    cℤ0003.close();
    lowerValueXℝ0001.close();
    upperValueXℝ0001.close();
    vXℝ0006.close();
    vXℝ0007.close();
    vXℝ0008.close();
    vXℝ0009.close();
    vXℝ0010.close();
    vXℝ0011.close();
    vℤ0002.close();
    P.close();
    diffP.close();
    integralXℝ0001.close();
  }

  @Override
  public String toString()
  {
    return "((P(3)^(2+1))/(2+1))/(diffP(3)*0)";
  }

  @Override
  public String typeset()
  {
    return "\\int {\\P(3)}^{2} \\mathd x";
  }
}
