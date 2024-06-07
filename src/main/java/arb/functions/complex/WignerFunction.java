package arb.functions.complex;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Wψ(x,p)= ∫(ψ^(x+y)*ψ(x-y)*e^(2*i*p*y/ℏ)*d*y){y=-∞..∞}/(π*ℏ)<br>
 * <br>
 * 
 * 
 * where ℏ is the normalizing constant equivalent to the Fourier transform pair
 * or definition of units. The generalization of this is the Wigner–Weyl
 * transform which is fun :-)
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class WignerFunction<F extends ComplexFunction> implements
                           ComplexFunction
{
  public WignerFunction(ComplexFunction ψ)
  {
    this.ψ = ψ;
  }

  ComplexFunction ψ;

  @Override
  public Complex evaluate(Complex t, int order, int bits, Complex res)
  {
    assert false : "TODO";
    return null;
  }

}
