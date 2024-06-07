package arb.documentation.concepts;

import java.util.stream.Stream;

import arb.documentation.Referral;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class PositionRepresentationOfTheFeynmanPropagator implements
                                                          Concept,
                                                          Applicable
{

  public static PositionRepresentationOfTheFeynmanPropagator instance =
                                                                      new PositionRepresentationOfTheFeynmanPropagator();

  @Override
  public Stream<Concept> applicableTo()
  {
    return Stream.of(QuantumFieldTheory.instance);
  }

  @Override
  public Stream<Referral> getReferences()
  {
    // TODO Auto-generated method stub
    return null;
  }

}
