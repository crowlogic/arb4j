package arb.documentation.concepts.stochastic;

import java.util.stream.Stream;

import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.Referral;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.concepts.Concept;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface LevelCrossings extends
                                Concept
{

  @Override
  default Stream<Referral> getReferences()
  {
    return Stream.of(Bibliography.stationaryAndRelatedStochasticProcesses.referToChapters("10"));
  }

}
