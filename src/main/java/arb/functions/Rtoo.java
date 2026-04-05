package arb.functions;

import java.util.ArrayList;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.rational.ComplexRationalFunctionSequence;
import arb.functions.rational.ComplexRationalHypergeometricFunction;

public class Rtoo implements
                  ComplexRationalFunctionSequence,
                  Typesettable,
                  AutoCloseable,
                  Initializable,
                  Named
{
  public boolean                               isInitialized;
  public Context                               context       = new Context();
  public ArrayList<ComplexRationalFunction>    cache;
  public final Integer                         cℤ0000        = new Integer("2");
  public final Integer                         cℤ0001        = new Integer("1");
  public ComplexRationalFunction               elementℚℂ0002 = new ComplexRationalFunction();
  public ComplexRationalHypergeometricFunction hypℚℂF0002    = new ComplexRationalHypergeometricFunction();
  public Fraction                              vq0004        = new Fraction();
  public Fraction                              vq0005        = new Fraction();
  public Fraction                              vq0006        = new Fraction();
  public Complex                               vℂ0008        = new Complex();
  public Complex                               vℂ0009        = new Complex();
  public Complex                               vℂ0010        = new Complex();
  public Complex                               vℂ0011        = new Complex();
  public Complex                               vℂ0012        = new Complex();
  public Complex                               vℂ0013        = new Complex();
  public Complex                               vℂ0014        = new Complex();
  public ComplexRationalFunction               vℚℂ0010       = new ComplexRationalFunction();
  public ComplexRationalFunction               vℚℂ0011       = new ComplexRationalFunction();
  public ComplexRationalFunction               vℚℂ0012       = new ComplexRationalFunction();
  public ComplexRationalFunction               vℚℂ0013       = new ComplexRationalFunction();
  public ComplexRationalFunction               vℚℂ0014       = new ComplexRationalFunction();
  public Real                                  vℝ0003        = new Real();
  public Real                                  vℝ0004        = new Real();
  public Integer                               vℤ0001        = new Integer();
  public RtooArg                               RtooArg;
  public Real                                  v;

  @Override
  public Class<Integer> domainType()
  {
    return Integer.class;
  }

  @Override
  public Class<ComplexRationalFunction> coDomainType()
  {
    return ComplexRationalFunction.class;
  }

  @Override
  public ComplexRationalFunction evaluate(Integer n, int order, int bits, ComplexRationalFunction result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    ComplexRationalFunction var10000 = (ComplexRationalFunction) Function.peek(this.cache, n.getSignedValue());
    if (var10000 != null)
    {
      result.set(var10000);
      return result;
    }
    else
    {
      ArrayList<ComplexRationalFunction> var6     = this.cache;
      int                                var10001 = n.getSignedValue();
      ComplexRationalFunction            var10002 = this.v.ascendingFactorial(n, bits, this.vℝ0003)
                                                          .mul(this.vℚℂ0010.identity()
                                                                           .div(this.cℤ0000, bits, this.vℚℂ0011)
                                                                           .pow(n.neg(this.vℤ0001), bits, this.vℚℂ0012),
                                                               bits,
                                                               this.vℚℂ0013);
      this.hypℚℂF0002.init(this.vℂ0010.set(new Complex[]
      { this.cℤ0001.div(this.cℤ0000, bits, this.vq0004).sub(n.div(this.cℤ0000, bits, this.vq0005), bits, this.vℂ0008),
        n.div(this.cℤ0000, bits, this.vq0006).neg(this.vℂ0009) }), this.vℂ0014.set(new Complex[]
      { this.vℂ0011.set(this.v), n.neg(this.vℂ0012), this.cℤ0001.sub(this.v, bits, this.vℝ0004).sub(n, bits, this.vℂ0013) }), this.RtooArg);
      this.hypℚℂF0002.evaluate(null, 1, bits, this.elementℚℂ0002);
      var10002.mul(this.vℚℂ0014.set(this.elementℚℂ0002), bits, result);
      ComplexRationalFunction var5 = new ComplexRationalFunction();
      var5.set(result);
      Function.poke(var6, var10001, var5);
      return result;
    }
  }

  @Override
  public ComplexRationalFunctionSequence derivative()
  {
    return Function.express(Integer.class,
                            ComplexRationalFunction.class,
                            ComplexRationalFunctionSequence.class,
                            "diffRtoo",
                            "diff(((v⋰n)*((z/2)^-n))*pFq([(1/2)-(n/2),-n/2],[v,-n,(1-v)-n];-z^2),n)",
                            this.context);
  }

  @Override
  public ComplexRationalFunctionSequence integral()
  {
    return Function.express(Integer.class,
                            ComplexRationalFunction.class,
                            ComplexRationalFunctionSequence.class,
                            "intRtoo",
                            "int(((v⋰n)*((z/2)^-n))*pFq([(1/2)-(n/2),-n/2],[v,-n,(1-v)-n];-z^2),n)",
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
      this.cache = new ArrayList<>();
      if (this.v == null)
      {
        throw new AssertionError("v is null");
      }
      else
      {
        if (this.RtooArg == null)
        {
          this.RtooArg = new RtooArg();
        }

        this.RtooArg.context = this.context;
        if (this.RtooArg == null)
        {
          this.RtooArg.v = this.v;
        }
        else
        {
          this.RtooArg.v.set(this.v);
        }

        this.isInitialized = true;
      }
    }
  }

  @Override
  public void close()
  {
    this.cℤ0000.close();
    this.cℤ0001.close();
    this.elementℚℂ0002.close();
    this.hypℚℂF0002.close();
    this.vq0004.close();
    this.vq0005.close();
    this.vq0006.close();
    this.vℂ0008.close();
    this.vℂ0009.close();
    this.vℂ0010.close();
    this.vℂ0011.close();
    this.vℂ0012.close();
    this.vℂ0013.close();
    this.vℂ0014.close();
    this.vℚℂ0010.close();
    this.vℚℂ0011.close();
    this.vℚℂ0012.close();
    this.vℚℂ0013.close();
    this.vℚℂ0014.close();
    this.vℝ0003.close();
    this.vℝ0004.close();
    this.vℤ0001.close();
    this.RtooArg.close();
  }

  @Override
  public String getName()
  {
    return "Rtoo";
  }

  @Override
  public Context getContext()
  {
    return this.context;
  }

  @Override
  public String toString()
  {
    return "Rtoo:n➔((v⋰n)*((z/2)^-n))*pFq([(1/2)-(n/2),-n/2],[v,-n,(1-v)-n];-z^2)";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\left((v)_{n} \\cdot {(\\frac{z}{2})}^{-(n)}\\right) \\cdot {_2F_3}\\left(\\left[\\left(\\frac{1}{2}-\\frac{n}{2}\\right),-(\\frac{n}{2})\\right], \\left[v,-(n),\\left(\\left(1-v\\right)-n\\right)\\right] ; -({z}^{2})\\right)\\right)";
  }
}
