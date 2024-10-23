package arb.functions.real;

import arb.*;
import arb.Integer;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.polynomials.ComplexPolynomialHypergeometricFunction;

public class y implements
               ComplexFunction,
               Typesettable,
               AutoCloseable,
               Initializable
{
  public boolean                                 isInitialized;
  public final Integer                           cℤ2     = new Integer("2");
  public final Integer                           cℤ1     = new Integer("1");
  public final Integer                           cℤ3     = new Integer("4");
  public Integer                                 m;
  public ComplexPolynomialHypergeometricFunction hypXℂF1 = new ComplexPolynomialHypergeometricFunction();
  public ComplexPolynomialHypergeometricFunction hypXℂF2 = new ComplexPolynomialHypergeometricFunction();
  public Complex                                 iℂ19    = new Complex();
  public Complex                                 iℂ18    = new Complex();
  public Complex                                 iℂ21;
  public Real                                    iℝ1;
  public Complex                                 iℂ6;
  public Complex                                 iℂ5;
  public Complex                                 iℂ8;
  public Real                                    iℝ3;
  public ComplexPolynomial                       elementXℂ2;
  public Complex                                 iℂ7;
  public Real                                    iℝ2;
  public ComplexPolynomial                       elementXℂ1;
  public Complex                                 iℂ2;
  public Complex                                 iℂ20;
  public Complex                                 iℂ1;
  public Complex                                 iℂ4;
  public Complex                                 iℂ3;
  public Complex                                 iℂ9;
  public Complex                                 iℂ13;
  public Complex                                 iℂ12;
  public Complex                                 iℂ11;
  public Integer                                 iℤ2;
  public Complex                                 iℂ10;
  public Integer                                 iℤ1;
  public Complex                                 iℂ17;
  public Complex                                 iℂ16;
  public Complex                                 iℂ15;
  public Complex                                 iℂ14;
  public Integer                                 iℤ8;
  public Integer                                 iℤ7;
  public Integer                                 iℤ4;
  public Integer                                 iℤ3;
  public Integer                                 iℤ6;
  public Integer                                 iℤ5;
  public Complex                                 iℂ24    = new Complex();
  public Complex                                 iℂ23    = new Complex();
  public Complex                                 iℂ22    = new Complex();
  public Complex                                 iℂ28;
  public Complex                                 iℂ27;
  public Complex                                 iℂ26;
  public Complex                                 iℂ25;
  public Complex                                 vℂ1;
  public Complex                                 vℂ3;
  public Complex                                 vℂ2;
  public Complex                                 iℂ29;
  public Complex                                 vℂ4;

  public static void main(String args[])
  {
    var     y = new y();
    y.m = Integer.named("m").set(3);
    Complex z = y.eval(2.3, new Complex());
    System.out.format("%s(2.3)=%s\n", y, z);
  }

  @Override
  public Class<Complex> coDomainType()
  {
    return Complex.class;
  }

  @Override
  public Complex evaluate(Complex y, int order, int bits, Complex result)
  {
    if (!isInitialized)
    {
      initialize();
    }

    Complex ⅈ = ComplexConstants.ⅈ;
    Real    π = RealConstants.π;
    return elementXℂ1.evaluate(y, order, bits, iℂ2)
                     .mul(ⅈ.mul(π.mul(m, bits, iℝ1).add(y, bits, iℂ3), bits, iℂ4).exp(bits, iℂ5), bits, iℂ6)
                     .mul(iℂ7.sub(elementXℂ2.evaluate(y, order, bits, iℂ8)
                                            .mul(ⅈ.mul(cℤ2.mul(π, bits, iℝ2).mul(m, bits, iℝ3).sub(y, bits, iℂ9),
                                                       bits,
                                                       iℂ10)
                                                  .exp(bits, iℂ11),
                                                 bits,
                                                 iℂ12),
                                  bits,
                                  iℂ13),
                          bits,
                          iℂ14)
                     .mul(cℤ3.mul(m.pow(cℤ2, bits, iℤ1), bits, iℤ2).sub(cℤ1, bits, iℤ3), bits, iℂ15)
                     .mul(cℤ1.neg(iℤ4).pow(m.neg(iℤ5), bits, iℤ6), bits, iℂ16)
                     .div(cℤ3.mul(m.pow(cℤ2, bits, iℤ7), bits, iℤ8)
                             .mul(y, bits, iℂ17)
                             .sub(cℤ2.mul(y, bits, iℂ18), bits, iℂ19)
                             .mul(π, bits, iℂ20),
                          bits,
                          iℂ21)
                     .neg(result);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (m == null)
    {
      throw new AssertionError("y--I*(pFq(［1,m,-m］,［1⁄2］,-((1⁄2)*I)⁄y)*exp(I*(π*m+y))-pFq(［1,m,-m］,［1⁄2］,((1⁄2)*I)⁄y)*exp(I*(2*π*m-y)))*(4*m^2-1)*(-1)^(-m)⁄((4*m^2*y-2*y)*π).m is null");
    }
    else
    {
      hypXℂF1.init(vℂ1.set(new Complex[]
      { iℂ22.set(cℤ1), iℂ23.set(m), m.neg(iℂ24) }), vℂ2.set(new Complex[]
      { cℤ1.div(cℤ2, 128, iℂ25) }), ComplexPolynomialNullaryFunction.parse("-(1/2*ⅈ)/y"));
      hypXℂF1.evaluate(null, 1, 128, elementXℂ1);
      hypXℂF2.init(vℂ3.set(new Complex[]
      { iℂ26.set(cℤ1), iℂ27.set(m), m.neg(iℂ28) }), vℂ4.set(new Complex[]
      { cℤ1.div(cℤ2, 128, iℂ29) }), ComplexPolynomialNullaryFunction.parse("(1/2*ⅈ)/y"));
      hypXℂF2.evaluate(null, 1, 128, elementXℂ2);
      isInitialized = true;
    }
  }

  public y()
  {
    iℂ21       = new Complex();
    iℂ28       = new Complex();
    iℂ27       = new Complex();
    iℂ26       = new Complex();
    iℂ25       = new Complex();
    iℝ1        = new Real();
    iℂ6        = new Complex();
    iℂ5        = new Complex();
    iℂ8        = new Complex();
    iℝ3        = new Real();
    elementXℂ2 = new ComplexPolynomial();
    iℂ7        = new Complex();
    iℝ2        = new Real();
    elementXℂ1 = new ComplexPolynomial();
    iℂ2        = new Complex();
    iℂ20       = new Complex();
    iℂ1        = new Complex();
    iℂ4        = new Complex();
    iℂ3        = new Complex();
    vℂ1        = new Complex();
    vℂ3        = new Complex();
    vℂ2        = new Complex();
    iℂ9        = new Complex();
    iℂ29       = new Complex();
    vℂ4        = new Complex();
    iℂ13       = new Complex();
    iℂ12       = new Complex();
    iℂ11       = new Complex();
    iℤ2        = new Integer();
    iℂ10       = new Complex();
    iℤ1        = new Integer();
    iℂ17       = new Complex();
    iℂ16       = new Complex();
    iℂ15       = new Complex();
    iℂ14       = new Complex();
    iℤ8        = new Integer();
    iℤ7        = new Integer();
    iℤ4        = new Integer();
    iℤ3        = new Integer();
    iℤ6        = new Integer();
    iℤ5        = new Integer();
  }

  @Override
  public void close()
  {
    cℤ2.close();
    cℤ1.close();
    cℤ3.close();
    hypXℂF1.close();
    hypXℂF2.close();
    iℂ19.close();
    iℂ18.close();
    iℂ24.close();
    iℂ23.close();
    iℂ22.close();
    iℂ21.close();
    iℂ28.close();
    iℂ27.close();
    iℂ26.close();
    iℂ25.close();
    iℝ1.close();
    iℂ6.close();
    iℂ5.close();
    iℂ8.close();
    iℝ3.close();
    elementXℂ2.close();
    iℂ7.close();
    iℝ2.close();
    elementXℂ1.close();
    iℂ2.close();
    iℂ20.close();
    iℂ1.close();
    iℂ4.close();
    iℂ3.close();
    vℂ1.close();
    vℂ3.close();
    vℂ2.close();
    iℂ9.close();
    iℂ29.close();
    vℂ4.close();
    iℂ13.close();
    iℂ12.close();
    iℂ11.close();
    iℤ2.close();
    iℂ10.close();
    iℤ1.close();
    iℂ17.close();
    iℂ16.close();
    iℂ15.close();
    iℂ14.close();
    iℤ8.close();
    iℤ7.close();
    iℤ4.close();
    iℤ3.close();
    iℤ6.close();
    iℤ5.close();
  }

  @Override
  public String toString()
  {
    return "y➔-ⅈ*(pFq([1,m,-m],[1/2],-((1/2)*ⅈ)/y)*exp(ⅈ*(π*m+y))-pFq([1,m,-m],[1/2],((1/2)*ⅈ)/y)*exp(ⅈ*(2*π*m-y)))*(4*m^2-1)*(-1)^(-m)/((4*m^2*y-2*y)*π)";
  }

  @Override
  public String typeset()
  {
    return "-\\frac{ⅈ \\cdot \\left({_3F_1}\\left(\\left[1,m,-m\\right], \\left[\\frac{1}{2}\\right] ; -\\frac{\\frac{1}{2} \\cdot ⅈ}{y}\\right) \\cdot \\exp(ⅈ \\cdot \\pi \\cdot m + y)-{_3F_1}\\left(\\left[1,m,-m\\right], \\left[\\frac{1}{2}\\right] ; \\frac{\\frac{1}{2} \\cdot ⅈ}{y}\\right) \\cdot \\exp(ⅈ \\cdot \\left(2 \\cdot \\pi \\cdot m-y\\right))\\right) \\cdot \\left(4 \\cdot {m}^{2}-1\\right) \\cdot {(-1)}^{(-m)}}{\\left(4 \\cdot {m}^{2} \\cdot y-2 \\cdot y\\right) \\cdot \\pi}";
  }
}
