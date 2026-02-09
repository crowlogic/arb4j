package arb.functions;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.complex.ComplexFunction;
import arb.functions.integer.ComplexFunctionSequence;
import arb.utensils.Utensils;

public class G implements
               ComplexFunctionSequence,
               Typesettable,
               AutoCloseable,
               Initializable,
               Named
{
  public boolean        isInitialized;
  public Context        context = new Context();
  public GArg224591451  GArg224591451;
  public GArg1715248762 GArg1715248762;

  public static void main(String args[])
  {
    G               g     = new G();
    int             k     = 3;
    Gfunc x     = (Gfunc) g.evaluate(k, 128);
    double          point = 2.3;
    Complex         y     = x.eval(point, new Complex());
    System.out.format("G(%s)(%s)=%s\n", k, point, y);
    System.out.println(Utensils.yamlString(g));
    System.out.println(Utensils.yamlString(x));

  }

  @Override
  public Class<Integer> domainType()
  {
    return Integer.class;
  }

  @Override
  public Class<ComplexFunction> coDomainType()
  {
    return ComplexFunction.class;
  }

  @Override
  public ComplexFunction evaluate(Integer m, int order, int bits, ComplexFunction result)
  {
    if (order > 1)
    {
      throw new AssertionError("TODO: implement order=" + order + ">1");
    }
    else
    {
      if (!this.isInitialized)
      {
        this.initialize();
      }

      Gfunc var10000 = new Gfunc();
      if (var10000.m == null)
      {
        var10000.m = new Integer();
      }

      var10000.m.set(m);
      var10000.initialize();
      return var10000;
    }
  }

  @Override
  public ComplexFunctionSequence derivative()
  {
    return Function.express(Integer.class,
                            ComplexFunction.class,
                            ComplexFunctionSequence.class,
                            "_diffG",
                            "diff(-(((ⅈ*((pFq([1,m,-m],[1/2];-((1/2)*ⅈ)/y)*exp(ⅈ*((π*m)+y)))-(pFq([1,m,-m],[1/2];((1/2)*ⅈ)/y)*exp(ⅈ*(((2*π)*m)-y)))))*((4*(m^2))-1))*(-1^-m))/((((4*(m^2))-2)*y)*π),m)",
                            this.context);
  }

  @Override
  public ComplexFunctionSequence integral()
  {
    return Function.express(Integer.class,
                            ComplexFunction.class,
                            ComplexFunctionSequence.class,
                            "_intG",
                            "int(-(((ⅈ*((pFq([1,m,-m],[1/2];-((1/2)*ⅈ)/y)*exp(ⅈ*((π*m)+y)))-(pFq([1,m,-m],[1/2];((1/2)*ⅈ)/y)*exp(ⅈ*(((2*π)*m)-y)))))*((4*(m^2))-1))*(-1^-m))/((((4*(m^2))-2)*y)*π),m)",
                            this.context);
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
      if (this.GArg224591451 == null)
      {
        this.GArg224591451 = new GArg224591451();
      }

      if (this.GArg1715248762 == null)
      {
        this.GArg1715248762 = new GArg1715248762();
      }

      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
  }

  @Override
  public String getName()
  {
    return "G";
  }

  @Override
  public Context getContext()
  {
    return this.context;
  }

  @Override
  public String toString()
  {
    return "G:m➔-(((ⅈ*((pFq([1,m,-m],[1/2];-((1/2)*ⅈ)/y)*exp(ⅈ*((π*m)+y)))-(pFq([1,m,-m],[1/2];((1/2)*ⅈ)/y)*exp(ⅈ*(((2*π)*m)-y)))))*((4*(m^2))-1))*(-1^-m))/((((4*(m^2))-2)*y)*π)";
  }

  @Override
  public String typeset()
  {
    return "-\\frac{\\left(\\left(\\left(ⅈ \\cdot \\left(\\left({_3F_1}\\left(\\left[1,m,-m\\right], \\left[\\frac{1}{2}\\right] ; -\\frac{\\left(\\frac{1}{2} \\cdot ⅈ\\right)}{y}\\right) \\cdot \\exp(\\left(ⅈ \\cdot \\left(\\left(\\pi \\cdot m\\right) + y\\right)\\right))\\right)-\\left({_3F_1}\\left(\\left[1,m,-m\\right], \\left[\\frac{1}{2}\\right] ; \\frac{\\left(\\frac{1}{2} \\cdot ⅈ\\right)}{y}\\right) \\cdot \\exp(\\left(ⅈ \\cdot \\left(\\left(\\left(2 \\cdot \\pi\\right) \\cdot m\\right)-y\\right)\\right))\\right)\\right)\\right) \\cdot \\left(\\left(4 \\cdot {m}^{2}\\right)-1\\right)\\right) \\cdot {-1}^{-m}\\right)}{\\left(\\left(\\left(\\left(4 \\cdot {m}^{2}\\right)-2\\right) \\cdot y\\right) \\cdot \\pi\\right)}";
  }
}
