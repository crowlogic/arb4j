package arb.functions.polynomials.orthogonal.complex;

import java.util.stream.Stream;

import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.concepts.Concept;
import arb.documentation.references.Reference;
import arb.functions.real.RealBesselFunctionOfTheFirstKind;
import arb.functions.real.RealFunction;
import arb.functions.sequences.ComplexSequence;

/**
 * 
 * Bessel polynomials form an orthogonal system, the weight function being
 * e^(-2*π*x) and the path of integration the unit circle in the complex plane.
 * The weight function and the path are not unique; an arbitrary analytic
 * function may be added to the weight function, the weight function may be
 * multiplied by a nonzero constant, and the unit circle may be replaced by an
 * arbitrary curve around the origin.
 * 
 * These polynomials can express the {@link RealBesselFunctionOfTheFirstKind} of
 * half-integer argument: <br>
 * <br>
 * 
 * J_(n+1/2)(r)=sqrt(π*r)**(2^(i*r))/2[e^(i*π*(n+1/2))*y_n*(1/r)+e^(-i*π*(n+1/2))*y_n*(1/r)]
 *
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexBesselPolynomials extends
                                      ComplexRecurrentlyGeneratedOrthogonalPolynomialSequence implements Concept
{
  @Override
  public Stream<Reference> getReferences()
  {
    return Stream.of(Bibliography.theBesselPolynomials);
  }

  public ComplexBesselPolynomials(int bits)
  {
    super(bits);
    p0.one();
    p1.one().shiftLeft(1).add(1);
  }

  private RealFunction w;

  @Override
  public RealFunction orthogonalityMeasure()
  {
    if (w != null)
    {
      return w;
    }
    return w = RealFunction.express("w", "e^(2*π*x)");
  }

  @Override
  public ComplexSequence A()
  {
    return ComplexSequence.express("A", "2*n+1", context);
  }

  @Override
  public ComplexSequence B()
  {
    return ComplexSequence.express("B", "0", context);
  }

  @Override
  public ComplexSequence C()
  {
    return ComplexSequence.express("C", "-1", context);
  }
}
