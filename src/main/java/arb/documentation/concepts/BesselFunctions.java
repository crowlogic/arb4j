package arb.documentation.concepts;

import java.util.stream.Stream;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.Referral;
import arb.documentation.TheArb4jLibrary;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BesselFunctions implements
                             Concept,
                             Applicable
{

  public static BesselFunctions instance = new BesselFunctions();

  @Override
  public Stream<Concept> applicableTo()
  {
    return Stream.of(PositionRepresentationOfTheFeynmanPropagator.instance);
  }

  @Override
  public Stream<Referral> getReferences()
  {
    assert false : "TODO";
    return null;
  }

}
