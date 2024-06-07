package arb.documentation.concepts.stochastic;

import java.util.stream.Stream;

import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.Referral;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.annotations.AlsoKnownAs;
import arb.documentation.concepts.Concept;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@AlsoKnownAs("Structure Function")
@AlsoKnownAs("Variogram")
@AlsoKnownAs("Variance Structure")
public interface VarianceStructureFunction extends
                                           Concept
{

  @Override
  default Stream<Referral> getReferences()
  {
    return Stream.of(Bibliography.correlationTheoryOfStationaryRandomProcesses.referToChapters("23 p.391"));
  }

}
