package arb.functions.complex;

import arb.Real;
import arb.algebraic.geometry.*;
import arb.functions.complex.hyperbolic.*;
import arb.functions.real.*;
import arb.operators.Composition;

/**
 * The rational {@link MeromorphicFunction} defined by the quartic equation
 * 
 * <pre>
 * T(t)=tanh(ln(1+t²)))=((1 + t²)² - 1)/((1 + t²)² + 1)
 * </pre>
 * 
 * is the
 * 
 * is the {@link HyperbolicTangent} of the logarithm of one plus the square of
 * its argument. If we let t=x+iy then the following figure shows the
 * {@link AlgebraicVariety}s corresponding to the implicitly defined level
 * curves of -1, 0, and 1 for the {@link Real} and {@link ImaginaryPart}s.
 * 
 * <br>
 * 
 * <img src="doc-files/ReImT.png"/>
 * 
 * <br>
 * 
 * @see <a href="doc-files/X.pdf">Complex Dynamics of The Hyperbolic Tangent of
 *      The Logarithm Of One Minus The Square of The Hardy Z Function</a>
 */
public class TFunction extends
                       Composition<SFunction, WickRotation> implements
                       MeromorphicFunction
{
  @Override
  public String toString()
  {
    return String.format("T(scale=%s)", f.a.toString(5));
  }

  @Override
  public HolomorphicFunction adjoint()
  {
    return new SFunction(f.a);
  }

  public TFunction()
  {
    super(new SFunction(),
          new WickRotation(false));
    f.a.printPrecision = false;
  }

  public TFunction(Real scale)
  {
    this();
    this.f.a = scale;
  }
}
