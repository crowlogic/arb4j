package arb.functions;

import arb.*;
import arb.Integer;
import arb.functions.complex.ComplexFunction;
import arb.functions.rational.ComplexRationalHypergeometricFunction;
import arb.functions.rational.ComplexRationalNullaryFunction;

public class wtf implements
                 ComplexFunction,
                 Typesettable,
                 AutoCloseable,
                 Initializable
{
  public boolean                               isInitialized;
  public final Integer                         cℤ0000        = new Integer("1");
  public final Integer                         cℤ0001        = new Integer("2");
  public final Integer                         cℤ0002        = new Integer("4");
  public ComplexRationalFunction               elementℚℂ0001 = new ComplexRationalFunction();
  public ComplexRationalFunction               elementℚℂ0002 = new ComplexRationalFunction();
  public ComplexRationalHypergeometricFunction hypℚℂF0001    = new ComplexRationalHypergeometricFunction();
  public ComplexRationalHypergeometricFunction hypℚℂF0002    = new ComplexRationalHypergeometricFunction();
  public Fraction                              vf0001        = new Fraction();
  public Complex                               vℂ0001        = new Complex();
  public Complex                               vℂ0002        = new Complex();
  public Complex                               vℂ0003        = new Complex();
  public Complex                               vℂ0004        = new Complex();
  public Complex                               vℂ0005        = new Complex();
  public Complex                               vℂ0006        = new Complex();
  public Complex                               vℂ0007        = new Complex();
  public Complex                               vℂ0008        = new Complex();
  public Complex                               vℂ0009        = new Complex();
  public Complex                               vℂ0010        = new Complex();
  public Complex                               vℂ0011        = new Complex();
  public Complex                               vℂ0012        = new Complex();
  public Complex                               vℂ0013        = new Complex();
  public Complex                               vℂ0014        = new Complex();
  public Complex                               vℂ0015        = new Complex();
  public Complex                               vℂ0016        = new Complex();
  public Complex                               vℂ0017        = new Complex();
  public Complex                               vℂ0018        = new Complex();
  public Complex                               vℂ0019        = new Complex();
  public Real                                  vℝ0001;
  public Real                                  vℝ0002;
  public Real                                  vℝ0003;
  public Integer                               vℤ0001;
  public Integer                               vℤ0002;
  public Integer                               vℤ0003;
  public Integer                               vℤ0004;
  public Integer                               vℤ0005;
  public Integer                               vℤ0006;
  public Integer                               vℤ0007;
  public Integer                               m;
  public Complex                               vℂ0020        = new Complex();
  public Complex                               vℂ0021        = new Complex();
  public Complex                               vℂ0022        = new Complex();
  public Complex                               vℂ0023        = new Complex();
  public Complex                               vℂ0024        = new Complex();
  public Complex                               vℂ0025        = new Complex();
  public Complex                               vℂ0026        = new Complex();
  public Complex                               vℂ0027        = new Complex();
  public Complex                               vℂ0028        = new Complex();
  public Complex                               vℂ0029        = new Complex();
  public Complex                               vℂ0030        = new Complex();
  public Complex                               vℂ0031        = new Complex();

  public static void main(String args[])
  {
    // COMPARE AGAINST LAST WORKING VERSION A FEW DAYS AGO
    wtf wtf = new wtf();
    wtf.m = new Integer().set(4);
    System.out.println(wtf.eval(2.3, new Complex()));
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
    return elementℚℂ0001.evaluate(y, order, bits, vℂ0002)
                        .mul(ⅈ.mul(π.mul(m, bits, vℝ0001).add(y, bits, vℂ0003), bits, vℂ0004).exp(bits, vℂ0005),
                             bits,
                             vℂ0006)
                        .mul(vℂ0007.sub(elementℚℂ0002.evaluate(y, order, bits, vℂ0008)
                                                     .mul(ⅈ.mul(cℤ0001.mul(π, bits, vℝ0002)
                                                                      .mul(m, bits, vℝ0003)
                                                                      .sub(y, bits, vℂ0009),
                                                                bits,
                                                                vℂ0010)
                                                           .exp(bits, vℂ0011),
                                                          bits,
                                                          vℂ0012),
                                        bits,
                                        vℂ0013),
                             bits,
                             vℂ0014)
                        .mul(cℤ0002.mul(m.pow(cℤ0001, bits, vℤ0001), bits, vℤ0002).sub(1, bits, vℤ0003), bits, vℂ0015)
                        .mul(cℤ0000.neg(vℤ0004).pow(m.neg(vℤ0005), bits, vf0001), bits, vℂ0016)
                        .div(cℤ0002.mul(vℤ0001, bits, vℤ0006)
                                   .sub(cℤ0001, bits, vℤ0007)
                                   .mul(y, bits, vℂ0017)
                                   .mul(π, bits, vℂ0018),
                             bits,
                             vℂ0019)
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
      throw new AssertionError("m is null");
    }
    else
    {
      hypℚℂF0001.init(vℂ0023.set(vℂ0020.set(1), vℂ0021.set(m), m.neg(vℂ0022)),
                      vℂ0025.set(cℤ0000.div(cℤ0001, 128, vℂ0024)),
                      ComplexRationalNullaryFunction.parse("-(1/2*ⅈ)/y"))
                .evaluate(null, 1, 128, elementℚℂ0001);
      hypℚℂF0002.init(vℂ0029.set(vℂ0026.set(1), vℂ0027.set(m), m.neg(vℂ0028)),
                      vℂ0031.set(RealConstants.half),
                      ComplexRationalNullaryFunction.parse("(1/2*ⅈ)/y"))
                .evaluate(null, 1, 128, elementℚℂ0002);
      isInitialized = true;
    }
  }

  public wtf()
  {
    vℝ0001 = new Real();
    vℝ0002 = new Real();
    vℝ0003 = new Real();
    vℤ0001 = new Integer();
    vℤ0002 = new Integer();
    vℤ0003 = new Integer();
    vℤ0004 = new Integer();
    vℤ0005 = new Integer();
    vℤ0006 = new Integer();
    vℤ0007 = new Integer();
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    cℤ0001.close();
    cℤ0002.close();
    elementℚℂ0001.close();
    elementℚℂ0002.close();
    hypℚℂF0001.close();
    hypℚℂF0002.close();
    vf0001.close();
    vℂ0001.close();
    vℂ0002.close();
    vℂ0003.close();
    vℂ0004.close();
    vℂ0005.close();
    vℂ0006.close();
    vℂ0007.close();
    vℂ0008.close();
    vℂ0009.close();
    vℂ0010.close();
    vℂ0011.close();
    vℂ0012.close();
    vℂ0013.close();
    vℂ0014.close();
    vℂ0015.close();
    vℂ0016.close();
    vℂ0017.close();
    vℂ0018.close();
    vℂ0019.close();
    vℂ0020.close();
    vℂ0021.close();
    vℂ0022.close();
    vℂ0023.close();
    vℂ0024.close();
    vℂ0025.close();
    vℂ0026.close();
    vℂ0027.close();
    vℂ0028.close();
    vℂ0029.close();
    vℂ0030.close();
    vℂ0031.close();
    vℝ0001.close();
    vℝ0002.close();
    vℝ0003.close();
    vℤ0001.close();
    vℤ0002.close();
    vℤ0003.close();
    vℤ0004.close();
    vℤ0005.close();
    vℤ0006.close();
    vℤ0007.close();
  }

  @Override
  public String toString()
  {
    return "y➔-(ⅈ*(pFq([1,m,-m],[1/2];-(1/2*ⅈ)/y)*exp(ⅈ*π*m+y))-(pFq([1,m,-m],[1/2];(1/2*ⅈ)/y)*exp(ⅈ*(2*π*m)-y))*(4*m^2)-1*-1^-m)/((4*m^2)-2*y*π)";
  }

  @Override
  public String typeset()
  {
    return "-\\frac{ⅈ \\cdot \\left({_3F_1}\\left(\\left[1,m,-m\\right], \\left[\\frac{1}{2}\\right] ; -\\frac{\\frac{1}{2} \\cdot ⅈ}{y}\\right) \\cdot \\exp(ⅈ \\cdot \\pi \\cdot m + y)-{_3F_1}\\left(\\left[1,m,-m\\right], \\left[\\frac{1}{2}\\right] ; \\frac{\\frac{1}{2} \\cdot ⅈ}{y}\\right) \\cdot \\exp(ⅈ \\cdot \\left(2 \\cdot \\pi \\cdot m-y\\right))\\right) \\cdot \\left(4 \\cdot {m}^{2}-1\\right) \\cdot {-1}^{-m}}{\\left(4 \\cdot {m}^{2}-2\\right) \\cdot y \\cdot \\pi}";
  }
}
