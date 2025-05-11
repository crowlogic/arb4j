package arb.documentation.concepts.linearoperators.spectraltheory;

import java.util.stream.Stream;

import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.Referral;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.concepts.Applicable;
import arb.documentation.concepts.BesselFunctions;
import arb.documentation.concepts.Concept;
import arb.documentation.concepts.stochastic.StochasticProcess;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class EvolutionarySpectralRepresentations extends
                                                 SpectralRepresentations<StochasticProcess>
                                                 implements
                                                 Applicable
{

  @Override
  public Stream<Referral> getReferences()
  {
    return Stream.of(Bibliography.correlationTheoryOfStationaryRandomProcesses.referToChapters("22.3"));
  }

  @Override
  public Stream<Concept> applicableTo()
  {
    return Stream.of(BesselFunctions.instance);
  }

}
