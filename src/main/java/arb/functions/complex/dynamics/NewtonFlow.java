package arb.functions.complex.dynamics;

import arb.Complex;
import arb.functions.complex.ComplexFunction;

/**
 * The continuous version of the {@link NewtonMap}
 * 
 * @author ©2024 Stephen Crowley
 */
public class NewtonFlow implements
                        ComplexFunction
{
  public ComplexFunction z;
  public ComplexFunction f;

  /**
   * Construct the Newton flow given a function f and its solution function z
   * which solves
   * 
   * z'(t)=-f(z(t))/f'(z(t))
   * 
   * @param f
   * @param z
   */
  NewtonFlow(ComplexFunction f, ComplexFunction z)
  {
    assert f != null : "f cannot be null";
    assert z != null : "z cannot be null";
    this.f = f;
    this.z = z;
  }

  /**
   * @param t
   * @param order
   * @return -f(z(t))/f'(z(t))
   */
  @Override
  public Complex evaluate(Complex t, int order, int bits, Complex res)
  {
    assert order >= 2 : "order must be >=2";
    try ( Complex zt = new Complex(); Complex ft = Complex.newVector(2))
    {
      z.evaluate(t, bits, zt);
      f.evaluate(zt, order, bits, ft);
      return ft.get(0).div(ft.get(1), bits, res).neg();
    }
  }

}
