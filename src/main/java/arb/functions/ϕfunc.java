package arb.functions;

import arb.Complex;
import arb.ComplexConstants;
import arb.Initializable;
import arb.Integer;
import arb.Real;
import arb.Typesettable;

public class ϕfunc implements
                   RealToComplexFunction,
                   Typesettable,
                   AutoCloseable,
                   Initializable
{
  public boolean       isInitialized;
  public final Integer cℤ0000 = new Integer("0");
  public Complex       vℂ0008 = new Complex();
  public Complex       vℂ0009 = new Complex();
  public Complex       vℂ0010 = new Complex();
  public Real          vℝ0007 = new Real();
  public θ             θ;
  public Real          λ;

  @Override
  public Class<Real> domainType()
  {
    return Real.class;
  }

  @Override
  public Class<Complex> coDomainType()
  {
    return Complex.class;
  }

  @Override
  public Complex evaluate(Real t, int order, int bits, Complex result)
  {
    if (!this.isInitialized)
    {
      this.initialize();
    }

    return ComplexConstants.ⅈ.mul(this.λ, bits, this.vℂ0008)
                             .mul((Real) this.θ.evaluate(t, order, bits, this.vℝ0007),
                                  bits,
                                  this.vℂ0009)
                             .exp(bits, this.vℂ0010)
                             .mul(this.cℤ0000, bits, result);
  }

  public Function derivative()
  {
    return Function.express(Real.class, Complex.class, Function.class, "diff(null,t)");
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
      if (this.θ == null)
      {
        this.θ = new θ();
      }

      this.isInitialized = true;
    }
  }

  @Override
  public void close()
  {
    this.cℤ0000.close();
    this.vℂ0008.close();
    this.vℂ0009.close();
    this.vℂ0010.close();
    this.vℝ0007.close();
    this.θ.close();
  }

  @Override
  public String toString()
  {
    return "t➔(exp((ⅈ*λ)*(θ(t))))*0";
  }

  @Override
  public String typeset()
  {
    return "\\left(\\exp(\\left(\\left(ⅈ \\cdot λ\\right) \\cdot \\θ(t)\\right)) \\cdot 0\\right)";
  }
}
