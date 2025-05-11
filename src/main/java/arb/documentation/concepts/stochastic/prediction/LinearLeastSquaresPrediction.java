package arb.documentation.concepts.stochastic.prediction;

import java.util.stream.Stream;

import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.Referral;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.annotations.AppliesTo;
import arb.documentation.concepts.Concept;
import arb.documentation.concepts.stochastic.StochasticProcess;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@AppliesTo(StochasticProcess.class)
public interface LinearLeastSquaresPrediction extends
                                              Concept
{

  @Override
  default Stream<Referral> getReferences()
  {
    return Stream.of(Bibliography.stationaryAndRelatedStochasticProcesses.referToChapters("5.7"));
  }

}
