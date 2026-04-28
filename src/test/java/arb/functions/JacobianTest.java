package arb.functions;

import arb.Complex;
import arb.functions.complex.ComplexFunction;
import junit.framework.TestCase;

/**
 * Tests for the generic {@link Jacobian} class and the
 * {@link Function#jacobian(String[])} default contract.
 *
 * <p>Strategy: a hand-rolled {@link ComplexFunction} {@code F(t; v) = v·t² + 1},
 * whose partial with respect to the parameter v is the closed-form
 * {@code ∂F/∂v = t²}. The implementation exposes a single-element Jacobian
 * whose only partial is itself a hand-rolled {@code ComplexFunction} computing
 * t². Evaluating the Jacobian at a fixed t and checking the result against t²
 * exercises {@link Jacobian#evaluate}, the partial-dispatch loop, and the
 * caller-allocated result-array contract.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class JacobianTest extends
                          TestCase
{
  /**
   * F(t; v) = v·t² + 1, with v held as an instance field.
   */
  static class VTimesTSquared implements
                              ComplexFunction
  {
    Complex v = new Complex();

    VTimesTSquared(double vRe)
    {
      v.re().set("" + vRe, 128);
      v.im().zero();
    }

    @Override
    public Complex evaluate(Complex t, int order, int bits, Complex result)
    {
      Complex tSq = new Complex();
      try
      {
        t.mul(t, bits, tSq);
        v.mul(tSq, bits, result);
        result.add(1, bits, result);
        return result;
      }
      finally
      {
        tSq.close();
      }
    }

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
    public Jacobian<Complex, Complex, ? extends Function<Complex, Complex>> jacobian(String[] variables)
    {
      assert variables.length == 1 && "v".equals(variables[0]) : "only ∂/∂v supported";
      ComplexFunction[] partials = new ComplexFunction[]
      { new TSquared() };
      return new Jacobian<Complex, Complex, ComplexFunction>(this, variables, partials);
    }
  }

  /**
   * G(t) = t².
   */
  static class TSquared implements
                        ComplexFunction
  {
    @Override
    public Complex evaluate(Complex t, int order, int bits, Complex result)
    {
      return t.mul(t, bits, result);
    }

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
  }

  /**
   * F(t; v) = v·t² + 1, with v=3, evaluated at t=2+ⅈ:
   *
   * <pre>
   *   t² = (2+ⅈ)² = 3 + 4ⅈ
   *   F(t) = 3·(3 + 4ⅈ) + 1 = 10 + 12ⅈ
   *   ∂F/∂v at t = t² = 3 + 4ⅈ
   * </pre>
   */
  public void testJacobianOnHandRolledFunction()
  {
    int bits = 128;

    try ( VTimesTSquared f = new VTimesTSquared(3.0); Complex t = new Complex(); Complex direct = new Complex())
    {
      t.re().set("2", bits);
      t.im().set("1", bits);

      f.evaluate(t, 1, bits, direct);
      assertEquals("Re F(t)", 10.0, direct.re().doubleValue(), 1e-30);
      assertEquals("Im F(t)", 12.0, direct.im().doubleValue(), 1e-30);

      Jacobian<Complex, Complex, ? extends Function<Complex, Complex>> J = f.jacobian(new String[]
      { "v" });
      assertNotNull("Jacobian must not be null", J);
      assertEquals("Jacobian variable count", 1, J.variables.length);
      assertEquals("Jacobian variable name", "v", J.variables[0]);

      Complex[] result = new Complex[]
      { new Complex() };
      try
      {
        J.evaluate(t, 1, bits, result);
        Complex partial = result[0];
        assertEquals("Re ∂F/∂v at t", 3.0, partial.re().doubleValue(), 1e-30);
        assertEquals("Im ∂F/∂v at t", 4.0, partial.im().doubleValue(), 1e-30);
      }
      finally
      {
        result[0].close();
      }
    }
  }
}
