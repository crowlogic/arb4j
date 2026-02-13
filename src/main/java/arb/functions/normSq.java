package arb.functions;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.integer.ComplexSequence;

public class normSq implements
                    ComplexSequence,
                    Typesettable,
                    AutoCloseable,
                    Initializable,
                    Named
{
  public boolean       isInitialized;
  public Context       context = new Context();
  public final Integer cℤ0000  = new Integer("2");
  public final Integer cℤ0001  = new Integer("1");
  public Complex       vℂ0001  = new Complex();
  public Complex       vℂ0002  = new Complex();
  public Complex       vℂ0003  = new Complex();
  public Real          vℝ0034  = new Real();
  public Real          vℝ0035  = new Real();
  public Real          vℝ0036  = new Real();
  public Real          vℝ0037  = new Real();
  public Real          vℝ0038  = new Real();
  public Real          vℝ0039  = new Real();
  public Real          vℝ0040  = new Real();
  public Real          vℝ0041  = new Real();
  public Real          vℝ0042  = new Real();
  public Real          vℝ0043  = new Real();
  public Real          vℝ0044  = new Real();
  public Real          vℝ0045  = new Real();
  public Real          vℝ0046  = new Real();
  public Real          vℝ0047  = new Real();
  public Real          vℝ0048  = new Real();
  public Real          vℝ0049  = new Real();
  public Real          vℝ0050  = new Real();
  public Real          vℝ0051  = new Real();
  public Integer       vℤ0003  = new Integer();
  public Integer       vℤ0004  = new Integer();
  public Real          α;
  public Real          β;
  public Real          γ;

  @Override
  public Class<Integer> domainType()
  {
    return Integer.class;
  }

  @Override
  public Class<Complex> coDomainType()
  {
    return Complex.class;
  }

  @Override
  public Complex evaluate(Integer i, int order, int bits, Complex result)
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

      return cℤ0000.pow(α.add(β, bits, vℝ0034).add(cℤ0001, bits, vℝ0035), bits, vℂ0001)
                   .mul(i.add(α, bits, vℝ0036).add(cℤ0001, bits, vℝ0037).Γ(bits, vℝ0038),
                        bits,
                        vℂ0002)
                   .mul(i.add(β, bits, vℝ0039).add(cℤ0001, bits, vℝ0040).Γ(bits, vℝ0041),
                        bits,
                        vℂ0003)
                   .div(cℤ0000.mul(i, bits, vℤ0003)
                              .add(α, bits, vℝ0042)
                              .add(β, bits, vℝ0043)
                              .add(cℤ0001, bits, vℝ0044)
                              .mul(i.add(cℤ0001, bits, vℤ0004).Γ(bits, vℝ0045), bits, vℝ0046)
                              .mul(i.add(α, bits, vℝ0047)
                                    .add(β, bits, vℝ0048)
                                    .add(cℤ0001, bits, vℝ0049)
                                    .Γ(bits, vℝ0050),
                                   bits,
                                   vℝ0051),
                        bits,
                        result);
    }
  }

  @Override
  public ComplexSequence derivative()
  {
    return Function.express(Integer.class,
                            Complex.class,
                            ComplexSequence.class,
                            "_diffnormSq",
                            "diff((((2^((α+β)+1))*Γ((i+α)+1))*Γ((i+β)+1))/((((((2*i)+α)+β)+1)*Γ(i+1))*Γ(((i+α)+β)+1)),i)",
                            context);
  }

  @Override
  public ComplexSequence integral()
  {
    return Function.express(Integer.class,
                            Complex.class,
                            ComplexSequence.class,
                            "_intnormSq",
                            "int((((2^((α+β)+1))*Γ((i+α)+1))*Γ((i+β)+1))/((((((2*i)+α)+β)+1)*Γ(i+1))*Γ(((i+α)+β)+1)),i)",
                            context);
  }

  @Override
  public void initialize()
  {
    if (isInitialized)
    {
      throw new AssertionError("Already initialized");
    }
    else if (α == null)
    {
      throw new AssertionError("α is null");
    }
    else if (β == null)
    {
      throw new AssertionError("β is null");
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
    vℂ0001.close();
    vℂ0002.close();
    vℂ0003.close();
    vℝ0034.close();
    vℝ0035.close();
    vℝ0036.close();
    vℝ0037.close();
    vℝ0038.close();
    vℝ0039.close();
    vℝ0040.close();
    vℝ0041.close();
    vℝ0042.close();
    vℝ0043.close();
    vℝ0044.close();
    vℝ0045.close();
    vℝ0046.close();
    vℝ0047.close();
    vℝ0048.close();
    vℝ0049.close();
    vℝ0050.close();
    vℝ0051.close();
    vℤ0003.close();
    vℤ0004.close();
  }

  @Override
  public String getName()
  {
    return "normSq";
  }

  @Override
  public Context getContext()
  {
    return context;
  }

  @Override
  public String toString()
  {
    return "normSq:i➔(((2^((α+β)+1))*Γ((i+α)+1))*Γ((i+β)+1))/((((((2*i)+α)+β)+1)*Γ(i+1))*Γ(((i+α)+β)+1))";
  }

  @Override
  public String typeset()
  {
    return "\\frac{\\left(\\left({2}^{(\\left(\\left(α + β\\right) + 1\\right))} \\cdot \\Gamma(\\left(\\left(i + α\\right) + 1\\right))\\right) \\cdot \\Gamma(\\left(\\left(i + β\\right) + 1\\right))\\right)}{\\left(\\left(\\left(\\left(\\left(\\left(2 \\cdot i\\right) + α\\right) + β\\right) + 1\\right) \\cdot \\Gamma(\\left(i + 1\\right))\\right) \\cdot \\Gamma(\\left(\\left(\\left(i + α\\right) + β\\right) + 1\\right))\\right)}";
  }
}
