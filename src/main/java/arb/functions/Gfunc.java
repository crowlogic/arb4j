package arb.functions;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.complex.ComplexFunction;
import arb.functions.rational.ComplexRationalHypergeometricFunction;

public class Gfunc implements
                   ComplexFunction,
                   Typesettable,
                   AutoCloseable,
                   Initializable,
                   Named
{
  public boolean                               isInitialized;
  public Context                               context             = new Context();
  public final Integer                         cℤ0000              = new Integer("1");
  public final Integer                         cℤ0001              = new Integer("2");
  public final Integer                         cℤ0002              = new Integer("4");
  public ComplexRationalFunction               elementℚℂ0003       = new ComplexRationalFunction();
  public ComplexRationalFunction               elementℚℂ0004       = new ComplexRationalFunction();
  public ComplexRationalHypergeometricFunction hypℚℂF0003          =
                                                          new ComplexRationalHypergeometricFunction();
  public ComplexRationalHypergeometricFunction hypℚℂF0004          =
                                                          new ComplexRationalHypergeometricFunction();
  public ComplexRationalFunction               indeterminateℚℂ0001 = new ComplexRationalFunction();
  public ComplexRationalFunction               indeterminateℚℂ0002 = new ComplexRationalFunction();
  public Complex                               vℂ0005              = new Complex();
  public Complex                               vℂ0006              = new Complex();
  public Complex                               vℂ0007              = new Complex();
  public Complex                               vℂ0008              = new Complex();
  public Complex                               vℂ0009              = new Complex();
  public Complex                               vℂ0010              = new Complex();
  public Complex                               vℂ0011              = new Complex();
  public Complex                               vℂ0012              = new Complex();
  public Complex                               vℂ0013              = new Complex();
  public Complex                               vℂ0014              = new Complex();
  public Complex                               vℂ0015              = new Complex();
  public Complex                               vℂ0016              = new Complex();
  public Complex                               vℂ0017              = new Complex();
  public Complex                               vℂ0018              = new Complex();
  public Complex                               vℂ0019              = new Complex();
  public Complex                               vℂ0020              = new Complex();
  public Complex                               vℂ0021              = new Complex();
  public Complex                               vℂ0022              = new Complex();
  public Complex                               vℂ0023              = new Complex();
  public Complex                               vℂ0024              = new Complex();
  public Complex                               vℂ0025              = new Complex();
  public Complex                               vℂ0026              = new Complex();
  public Complex                               vℂ0027              = new Complex();
  public Complex                               vℂ0028              = new Complex();
  public Complex                               vℂ0029              = new Complex();
  public Real                                  vℝ0001;
  public Real                                  vℝ0002;
  public Real                                  vℝ0003;
  public Integer                               vℤ0001;
  public Integer                               vℤ0002;
  public GfuncArg1408695561                    GfuncArg1408695561;
  public GfuncArg1543043602                    GfuncArg1543043602;
  public Integer                               m;
  public Complex                               vℂ0030              = new Complex();
  public Complex                               vℂ0031              = new Complex();
  public Complex                               vℂ0032              = new Complex();
  public Complex                               vℂ0033              = new Complex();
  public Complex                               vℂ0034              = new Complex();
  public Complex                               vℂ0035              = new Complex();
  public Complex                               vℂ0036              = new Complex();
  public Complex                               vℂ0037              = new Complex();
  public Complex                               vℂ0038              = new Complex();
  public Complex                               vℂ0039              = new Complex();
  public Complex                               vℂ0040              = new Complex();
  public Complex                               vℂ0041              = new Complex();

  @Override
  public Class<Complex> domainType()
  {
    return Complex.class;
  }

  @Override
  public Class<Complex> coDomainType()
  {
    return Complex.class;
  }

  @Override
  public Complex evaluate(Complex y, int order, int bits, Complex result)
  {
    if (order > 1)
    {
      throw new AssertionError("TODO: implement order=" + order + ">1");
    }
    else
    {
      if (!isInitialized)
      {
        initialize();
      }

      return elementℚℂ0003.evaluate(y, order, bits, vℂ0006)
                          .mul(ComplexConstants.ⅈ.mul(RealConstants.π.mul(m, bits, vℝ0001)
                                                                     .add(y, bits, vℂ0007),
                                                      bits,
                                                      vℂ0008)
                                                 .exp(bits, vℂ0009),
                               bits,
                               vℂ0010)
                          .mul(vℂ0011.sub(elementℚℂ0004.evaluate(y, order, bits, vℂ0012)
                                                       .mul(ComplexConstants.ⅈ.mul(cℤ0001.mul(RealConstants.π,
                                                                                              bits,
                                                                                              vℝ0002)
                                                                                         .mul(m,
                                                                                              bits,
                                                                                              vℝ0003)
                                                                                         .sub(y,
                                                                                              bits,
                                                                                              vℂ0013),
                                                                                   bits,
                                                                                   vℂ0014)
                                                                              .exp(bits, vℂ0015),
                                                            bits,
                                                            vℂ0016),
                                          bits,
                                          vℂ0017),
                               bits,
                               vℂ0018)
                          .mul(cℤ0002.mul(m.pow(cℤ0001, bits, vℂ0019), bits, vℂ0020)
                                     .sub(cℤ0000, bits, vℂ0021),
                               bits,
                               vℂ0022)
                          .mul(cℤ0000.neg(vℤ0001).pow(m.neg(vℤ0002), bits, vℂ0023), bits, vℂ0024)
                          .div(cℤ0002.mul(vℂ0019, bits, vℂ0025)
                                     .sub(cℤ0001, bits, vℂ0026)
                                     .mul(y, bits, vℂ0027)
                                     .mul(RealConstants.π, bits, vℂ0028),
                               bits,
                               vℂ0029)
                          .neg(result);
    }
  }

  @Override
  public ComplexFunction derivative()
  {
    return Function.express(Complex.class,
                            Complex.class,
                            ComplexFunction.class,
                            "_diffGfunc",
                            "diff(-(((ⅈ*((pFq([1,m,-m],[1/2];-((1/2)*ⅈ)/y)*exp(ⅈ*((π*m)+y)))-(pFq([1,m,-m],[1/2];((1/2)*ⅈ)/y)*exp(ⅈ*(((2*π)*m)-y)))))*((4*(m^2))-1))*(-1^-m))/((((4*(m^2))-2)*y)*π),y)",
                            context);
  }

  @Override
  public ComplexFunction integral()
  {
    return Function.express(Complex.class,
                            Complex.class,
                            ComplexFunction.class,
                            "_intGfunc",
                            "int(-(((ⅈ*((pFq([1,m,-m],[1/2];-((1/2)*ⅈ)/y)*exp(ⅈ*((π*m)+y)))-(pFq([1,m,-m],[1/2];((1/2)*ⅈ)/y)*exp(ⅈ*(((2*π)*m)-y)))))*((4*(m^2))-1))*(-1^-m))/((((4*(m^2))-2)*y)*π),y)",
                            context);
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
      if (GfuncArg1408695561 == null)
      {
        GfuncArg1408695561 = new GfuncArg1408695561();
      }

      if (GfuncArg1543043602 == null)
      {
        GfuncArg1543043602 = new GfuncArg1543043602();
      }

      indeterminateℚℂ0001.identity();
      hypℚℂF0003.init(vℂ0033.set(new Complex[]
      { vℂ0030.set(cℤ0000), vℂ0031.set(m), m.neg(vℂ0032) }), vℂ0035.set(new Complex[]
      { cℤ0000.div(cℤ0001, 128, vℂ0034) }), GfuncArg1408695561);
      hypℚℂF0003.evaluate(indeterminateℚℂ0001, 1, 128, elementℚℂ0003);
      indeterminateℚℂ0002.identity();
      hypℚℂF0004.init(vℂ0039.set(new Complex[]
      { vℂ0036.set(cℤ0000), vℂ0037.set(m), m.neg(vℂ0038) }), vℂ0041.set(new Complex[]
      { cℤ0000.div(cℤ0001, 128, vℂ0040) }), GfuncArg1543043602);
      hypℚℂF0004.evaluate(indeterminateℚℂ0002, 1, 128, elementℚℂ0004);
      isInitialized = true;
    }
  }

  public Gfunc()
  {
    vℝ0001 = new Real();
    vℝ0002 = new Real();
    vℝ0003 = new Real();
    vℤ0001 = new Integer();
    vℤ0002 = new Integer();
  }

  @Override
  public void close()
  {
    cℤ0000.close();
    cℤ0001.close();
    cℤ0002.close();
    elementℚℂ0003.close();
    elementℚℂ0004.close();
    hypℚℂF0003.close();
    hypℚℂF0004.close();
    indeterminateℚℂ0001.close();
    indeterminateℚℂ0002.close();
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
    vℂ0032.close();
    vℂ0033.close();
    vℂ0034.close();
    vℂ0035.close();
    vℂ0036.close();
    vℂ0037.close();
    vℂ0038.close();
    vℂ0039.close();
    vℂ0040.close();
    vℂ0041.close();
    vℝ0001.close();
    vℝ0002.close();
    vℝ0003.close();
    vℤ0001.close();
    vℤ0002.close();
    GfuncArg1543043602.close();
    GfuncArg1408695561.close();
  }

  @Override
  public String getName()
  {
    return "Gfunc";
  }

  @Override
  public Context getContext()
  {
    return context;
  }

  @Override
  public String toString()
  {
    return "y➔-(((ⅈ*((pFq([1,m,-m],[1/2];-((1/2)*ⅈ)/y)*exp(ⅈ*((π*m)+y)))-(pFq([1,m,-m],[1/2];((1/2)*ⅈ)/y)*exp(ⅈ*(((2*π)*m)-y)))))*((4*(m^2))-1))*(-1^-m))/((((4*(m^2))-2)*y)*π)";
  }

  @Override
  public String typeset()
  {
    return "-\\frac{\\left(\\left(\\left(ⅈ \\cdot \\left(\\left({_3F_1}\\left(\\left[1,m,-m\\right], \\left[\\frac{1}{2}\\right] ; -\\frac{\\left(\\frac{1}{2} \\cdot ⅈ\\right)}{y}\\right) \\cdot \\exp(\\left(ⅈ \\cdot \\left(\\left(\\pi \\cdot m\\right) + y\\right)\\right))\\right)-\\left({_3F_1}\\left(\\left[1,m,-m\\right], \\left[\\frac{1}{2}\\right] ; \\frac{\\left(\\frac{1}{2} \\cdot ⅈ\\right)}{y}\\right) \\cdot \\exp(\\left(ⅈ \\cdot \\left(\\left(\\left(2 \\cdot \\pi\\right) \\cdot m\\right)-y\\right)\\right))\\right)\\right)\\right) \\cdot \\left(\\left(4 \\cdot {m}^{2}\\right)-1\\right)\\right) \\cdot {-1}^{-m}\\right)}{\\left(\\left(\\left(\\left(4 \\cdot {m}^{2}\\right)-2\\right) \\cdot y\\right) \\cdot \\pi\\right)}";
  }
}
