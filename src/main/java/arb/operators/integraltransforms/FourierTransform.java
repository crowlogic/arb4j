package arb.operators.integraltransforms;

import java.io.Closeable;

import arb.*;
import arb.functions.Function;
import arb.functions.RealToComplexFunction;
import arb.functions.real.RealFunction;

/**
 * <pre>
 * This code defines a class called FourierTransform which computes
 * the Fourier transform or inverse Fourier transform of a {@link Real}-valued function. 
 * The Fourier transform is a mathematical operation that transforms a function 
 * from the time domain to the frequency domain, while the inverse Fourier 
 * transform does the opposite.
 * 
 * The FourierTransform class has a generic type parameter F which specifies the
 * type of the function being transformed. The class implements the 
 * {@link RealToComplexFunction} interface, which defines a method evaluate that 
 * takes a {@link Real} number and returns a {@link Complex} number.
 * 
 * The class has two constructors. The first constructor takes four arguments:
 * an instance of the function to be transformed, a boolean flag indicating whether 
 * to compute the Fourier transform or its inverse, and two real numbers a and b
 * which are scale parameters. The second constructor takes only the function to
 * be transformed, and uses default values of a=0 and b=1.
 * 
 * The evaluate method of the {@link FourierTransform} class computes the Fourier
 * transform or inverse Fourier transform of the function at a given real number ω. 
 * It does this by integrating a complex-valued integrand function over a 
 * real-valued interval using numerical integration techniques. The 
 * {@link Integrand} function is defined as f(x) * exp(i * b * (±) ω * x) 
 * where f(x) is the function being transformed, i is the imaginary unit, and b 
 * is a scale parameter. The Fourier transform itself is a complex-valued function 
 * of the real number ω, which is returned by the evaluate method.
 * 
 * The {@link FourierTransform} class also has a method called 
 * {@link #determineIntegrationConstant(Real, Real)} which computes a constant C 
 * that is used in the computation of the Fourier transform. Finally, the class 
 * implements the {@link AutoCloseable} interface, which means that it can be used in a 
 * try-with-resources statement to ensure that resources are properly closed after 
 * use.
 * </pre>
 * 
 * Negative frequencies don't represent physically negative oscillations;
 * instead, they describe the phase relationships between sinusoids in the
 * Fourier domain, which are necessary to fully represent a general function.
 * 
 * @param <F>
 */
public class FourierTransform<F extends RealFunction> implements
                             RealToComplexFunction,
                             AutoCloseable
{

  public Function<Real, Complex> getKernel()
  {
    return (x, order, bits, res) ->
    {
      // todo: fix this, a is left out
      res.re().zero();
      b.mul(x, bits, res.im());
      res.exp(bits);
      if (inverse)
      {
        res.conj();
      }
      return res;
    };
  }

  @Override
  public String toString()
  {
    return String.format("FourierTransform[%s, domain=%s]", f, domain);
  }

  public static int         relativeAccuracyBitsGoal     = 128;
  public final Magnitude    absoluteUncertaintyTolerance = new Magnitude().set(Math.pow(10, -60));
  final FloatInterval       domain                       = new FloatInterval(-50,
                                                                             50);
  Real                      left                         = new Real();
  Real                      right                        = new Real();

  public IntegrationOptions integrationOptions           = new IntegrationOptions();
  Real                      a;
  Real                      b;
  Real                      C;
  boolean                   inverse                      = false;

  /**
   * The Fourier transform is defined by
   * 𝔊(u)=√(|b|/((2π)^(1+a))*∫g(x)*e^(ibu*x)dx=-∞..∞) if inverse=true
   * 
   * @param f
   * @param inverse whether to compute the Fourier transform or its inverse
   * @param a       first scale parameter
   * @param b       second scale parameter
   */
  @SuppressWarnings("resource")
  public FourierTransform(F f,
                          boolean inverse,
                          Real a,
                          Real b)
  {
    super();
    this.f = f;
    left.set(domain.getA());
    right.set(domain.getB());
    this.a       = new Real(a);
    this.b       = new Real(b);
    this.inverse = inverse;
    determineIntegrationConstant(a, b);
  }

  @SuppressWarnings("resource")
  public void determineIntegrationConstant(Real a, Real b)
  {
    try ( Real y = new Real(RealConstants.one); Real x = new Real();)
    {
      x.π(bits).mul(2, bits);
      y.sub(a, bits);

      C = b.abs(new Real()).div(x.pow(y, bits), bits).sqrt(bits);

      if (inverse)
      {
        C.recip(bits);
      }
      assert !C.isZero() && C.isFinite() : "C is zero or not finite, a=" + a + " b=" + b + " C=" + C;
    }
  }

  int bits = 128;

  /**
   * 
   * defaults to scale parameters a=0 b=1 and computing the Fourier transform. See
   * this{@link #FourierTransform(RealFunction, boolean, Real, Real)}
   * 
   * @param f
   */
  @SuppressWarnings("resource")
  public FourierTransform(F f)
  {
    this(f,
         false,
         new Real().zero(),
         new Real().one());
  }

  @SuppressWarnings("resource")
  public FourierTransform(F f,
                          boolean invert)
  {
    this(f,
         invert,
         new Real().zero(),
         new Real().one());
  }

  F f;

  @Override
  public Complex evaluate(Real ω, int order, int prec, Complex res)
  {
    order = Math.max(1, order);
    assert order < 2;
    try ( Integrand integrand = new Integrand(ω))
    {
      return integrand.integrate(left,
                                 right,
                                 relativeAccuracyBitsGoal,
                                 absoluteUncertaintyTolerance,
                                 integrationOptions,
                                 prec,
                                 res)
                      .mul(C, prec, res);
    }
  }

  @Override
  public void close()
  {
    a.close();
    b.close();
    C.close();
  }

  /**
   * <pre>
   * integrand=f(x)*e^(ⅈbux) of the Fourier Transform
   * </pre>
   * 
   * or
   * 
   * <pre>
   * integrand=f(x)*e^(-ⅈbux) of the inverse Fourier Transform
   * </pre>
   */
  public class Integrand implements
                         RealToComplexFunction,
                         AutoCloseable,
                         Closeable
  {
    public Integrand(Real u)
    {
      this.u = u;
    }

    private Real u;

    Real         y = new Real();

    @Override
    public Complex evaluate(Real x, int integrandOrder, int integrandPrec, Complex result)
    {
      result.re().zero();
      b.mul(u, integrandPrec, result.im()).mul(x, integrandPrec);
      result.exp(integrandPrec);
      if (inverse)
      {
        result.conj();
      }
      return result.mul(f.evaluate(x, integrandOrder, integrandPrec, y), integrandPrec);
    }

    @Override
    public void close()
    {
      y.close();

    }
  }


}