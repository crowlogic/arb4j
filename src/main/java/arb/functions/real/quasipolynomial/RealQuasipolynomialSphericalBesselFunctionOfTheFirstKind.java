package arb.functions.real.quasipolynomial;

import java.util.stream.Stream;

import arb.Integer;
import arb.RealQuasiPolynomial;
import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.concepts.Concept;
import arb.documentation.references.Reference;
import arb.expressions.Context;
import arb.functions.polynomials.RealLommelPolynomials;
import arb.functions.real.RealBesselFunctionOfTheFirstKind;
import arb.functions.sequences.RealQuasiPolynomialSequence;

/**
 * the spherical Bessel functions jₙ(x) of the first kind are
 * 
 * <pre>
 * j_ν(z):z➔√(π/(2*z))*J(ν+½,z)
 * 
 * jₙ(x) = (sin(x)Rₙ,½(x) - cos(x)Rₙ₋₁,³/₂(x))/x
 * </pre>
 * 
 * where R is the {@link RealLommelPolynomials} and J is the
 * {@link RealBesselFunctionOfTheFirstKind}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealQuasipolynomialSphericalBesselFunctionOfTheFirstKind implements
                                                                      AutoCloseable,
                                                                      RealQuasiPolynomialSequence,
                                                                      Concept
{

  public Integer                     ν       = new Integer().setName("v");

  Context                            context = new Context(ν);

  public RealQuasiPolynomialSequence j       = RealQuasiPolynomialSequence.express("z➔√(π/(2*z))*J(ν+½,z)", context);

  @Override
  public void close()
  {
    ν.close();
  }

  @Override
  public Stream<? extends Reference> getReferences()
  {
    return Stream.of(Bibliography.specialFunctionsOfMathematicalPhysics.referToChapters("3.3 p.72"));
  }

  @Override
  public RealQuasiPolynomial evaluate(Integer t, int order, int bits, RealQuasiPolynomial res)
  {
    {
      if (t.getSignedValue() == 0)
      {
        return ν.getSignedValue() == 0 ? res.one() : res.zero();
      }
      else
      {
        return j.evaluate(t, order, bits, res);
      }

    }
  }
}
