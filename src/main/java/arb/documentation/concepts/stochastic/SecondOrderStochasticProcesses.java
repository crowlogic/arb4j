package arb.documentation.concepts.stochastic;

import java.util.stream.Stream;

import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.Referral;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface SecondOrderStochasticProcesses extends
                                              StochasticProcess
{

  @Override
  default Stream<Referral> getReferences()
  {
    return Stream.of(Bibliography.stochasticProcessesInferenceTheory.referToChapters("8.2"));
  }

}
