package arb.documentation.concepts;

import java.util.stream.Stream;

import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.Referral;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.annotations.AppliesTo;
import arb.space.topological.HilbertSpace;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@AppliesTo(HilbertSpace.class)
public class ResolutionOfTheIdentity implements
                                     Concept
{

  public Stream<Referral> getReferences()
  {
    return Stream.of(Bibliography.functionalAnalysisYosida.referToChapters("XI.5"),
                     Bibliography.stochasticProcessesInferenceTheory.referToChapters("V.5.2. Theorem 7 p.261"));
  }

}
