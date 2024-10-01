package arb.functions.polynomials.orthogonal.complex;

import java.util.stream.Stream;

import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.concepts.Concept;
import arb.documentation.references.Reference;
import arb.functions.integer.ComplexSequence;
import arb.functions.real.RealBesselFunctionOfTheFirstKind;
import arb.functions.real.RealFunction;

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
 * <pre>
 * J₍ₙ₊½₎(r) = √(πr)^(2^(ir)) / 2 [e^(iπ(n + ½)) * yₙ(1/r) + e^(-iπ(n + ½)) * yₙ(1/r)]
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexBesselPolynomials extends
                                      ComplexRecurrentlyGeneratedOrthogonalPolynomialSequence implements
                                      Concept
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

  public static RealFunction w    = RealFunction.express("w:x➔exp(2*π*x)");

  final ComplexSequence      Aseq = ComplexSequence.express("A", "2*n+1", context);

  final ComplexSequence      Bseq = ComplexSequence.express("B", "0", context);

  final ComplexSequence      Cseq = ComplexSequence.express("C", "-1", context);

  @Override
  public RealFunction orthogonalityMeasure()
  {
    return w;
  }

  @Override
  public ComplexSequence A()
  {
    return Aseq;
  }

  @Override
  public ComplexSequence B()
  {
    return Bseq;
  }

  @Override
  public ComplexSequence C()
  {
    return Cseq;
  }
}
